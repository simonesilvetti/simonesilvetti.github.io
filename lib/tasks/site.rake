# Builds the whole site as static HTML files in out/, ready for GitHub Pages:
#
#   RAILS_ENV=production SECRET_KEY_BASE_DUMMY=1 bin/rails site:build
#
# Every page is requested from the Rails app, exactly like a browser would,
# and saved as out/<path>/index.html. Then everything in public/ is copied,
# including the compiled CSS, fonts and images in public/assets.
namespace :site do
  desc "Build the static site into out/"
  task build: [ "assets:precompile", :environment ] do
    Rails.logger.level = :warn
    routes = Rails.application.routes.url_helpers
    output = Rails.root.join("out")
    FileUtils.rm_rf(output)

    paths = [ routes.root_path, routes.about_path, routes.posts_path, routes.projects_path, routes.papers_path ] +
      Post.all.map { routes.post_path(it) } +
      Project.all.map { routes.project_path(it) } +
      Paper.all.map { routes.paper_path(it) }

    browser = ActionDispatch::Integration::Session.new(Rails.application)
    browser.https!

    paths.each do |path|
      browser.get(path)
      raise "#{path} answered #{browser.response.status}" unless browser.response.ok?

      file = output.join(path.delete_prefix("/"), "index.html")
      FileUtils.mkdir_p(file.dirname)
      File.write(file, browser.response.body)
      puts "  #{path}"
    end

    FileUtils.cp_r(Rails.public_path.children, output)
    puts "Built #{paths.size} pages in out/"
  ensure
    # Without this, development would keep serving the precompiled CSS
    # instead of the one rebuilt live by the Tailwind watcher.
    Rake::Task["assets:clobber"].invoke
  end
end
