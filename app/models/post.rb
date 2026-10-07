class Post < MarkdownFile
  def tags
    Array(metadata["tags"])
  end
end
