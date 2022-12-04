#Files that are used by Rack end with .ru instead of .rb
#because they're normally loaded with a command called rackup. 
#It's a way to indicate to other developers that this is our server definition file.

require 'rack'
require 'pry'

class App
  def call(env)
    path = env["PATH_INFO"]

    if path == "/"
      [200, { "Content-Type" => "text/html" }, ["<h2>Hello <em>World</em>!</h2>"]]
    elsif path == "/potato"
      [200, { "Content-Type" => "text/html" }, ["<p>Boil 'em, mash 'em, stick 'em in a stew</p>"]]
    else
      [404, { "Content-Type" => "text/html" }, ["Page not found"]]
    end
  end
end

run App.new