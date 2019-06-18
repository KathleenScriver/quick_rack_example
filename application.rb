class Application
  @@items = ["cats", "dogs", "fish"]
  def call(env)
    response = Rack::Response.new
    request = Rack::Request.new(env)

    if request.path.match(/items/)
      @@items.each do |item|
        response.write "#{item}\n"
      end
    elsif request.path.match(/search/)
      search_term = request.params["q"]

      if @@items.include?(search_term)
        response.write "#{search_term} is one of our items!"
        response.status = 200
      else
        response.write "Coundn't find #{search_term}."
        response.status = 203
      end

    else
      response.write "Path Not Found"
      response.status = 404
    end

    response.finish
  end
end
