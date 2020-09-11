class Application

  @@items = ["Apples","Carrots","Pears"]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    end
  elsif req.path.match(/cart/)
    empty_cart
  end
    else
      resp.write "Path Not Found"
    end

    resp.finish
  end
end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end

  def empty_cart
    if @@items.empty?
      return "Your cart is empty"
    else
      @@items
    end
  end
end
