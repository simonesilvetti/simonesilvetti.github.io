# A standalone page, such as About: no date, it is never listed.
class Page < MarkdownFile
  private
    def date_required?
      false
    end
end
