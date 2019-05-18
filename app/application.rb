class Application
   @@items = ["Apples","Carrots","Pears"]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      
      #song_title = req.path.split("/songs/").last #turn /songs/Sorry into Sorry
      #song = @@songs.find{|s| s.title == song_title}
      
      @@items.each do |item|
        resp.write "#{item}\n"
      end
     
     
    else
      resp.write "Route Not Found"
      resp.status = 404

    end

    resp.finish
  end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
end