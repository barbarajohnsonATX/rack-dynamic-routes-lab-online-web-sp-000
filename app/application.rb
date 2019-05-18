require 'pry'
class Application
   @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      name = req.path.split("/items/").last 
      # find object in @@items
      item =  @@items.find {|i| i.name == name }
      if item 
        resp.write "#{item.price}\n"
        resp.status = 200
      else 
        resp.write "Item not found\n"
        resp.status = 400
      end 
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