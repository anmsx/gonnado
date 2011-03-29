class Twit

  def Twit.search(term)
    search = Twitter::Search.new
    search.containing(term).result_type("recent").per_page(5)
  end
end
