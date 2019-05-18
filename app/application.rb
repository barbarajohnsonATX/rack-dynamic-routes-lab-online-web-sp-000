class Application
   @@items = ["Apples","Carrots","Pears"]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      
      name = req.path.split("/items/").last 
      item = @@items.find {|i| i.name == name }
      resp.write #{item.name}\n"
      resp.write #{item.price}\n"
      resp.status = 200
    else
      resp.write "Route not found"
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