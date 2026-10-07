module PapersHelper
  # "A. Rossi, <strong>Your Name</strong>, B. Bianchi": your name, from config/site.yml, in bold.
  def paper_authors(paper)
    safe_join(paper.authors.map { |author| author == site.name ? tag.strong(author) : author }, ", ")
  end
end
