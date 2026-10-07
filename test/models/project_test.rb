require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  test "reads projects from their own folder" do
    project = Project.find("sample-project")

    assert_equal "Sample project", project.title
    assert_equal [ "Ruby" ], project.technologies
    assert_equal "https://github.com/example/sample", project.github
  end

  test "ignores a github link that is not https" do
    project = Project.new(slug: "x", text: "---\ntitle: X\ndate: 2026-01-01\ngithub: \"javascript:alert(1)\"\n---\n")

    assert_nil project.github
  end
end
