class Paper < MarkdownFile
  def authors
    Array(metadata["authors"])
  end

  # Conference, journal or "arXiv preprint"
  def venue
    metadata["venue"]
  end

  def pages
    metadata["pages"]
  end

  def url
    https_url("url")
  end

  # Free version of the paper (arXiv, institutional repository)
  def preprint
    https_url("preprint")
  end
end
