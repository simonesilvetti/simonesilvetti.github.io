class Project < MarkdownFile
  def technologies
    Array(metadata["technologies"])
  end

  def github
    https_url("github")
  end
end
