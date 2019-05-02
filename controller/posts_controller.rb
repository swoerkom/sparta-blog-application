class PostController < Sinatra::Base ##Sinatra is a module, base is a class inside

  #Set the root of the parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..') ##___FILE___ gives name of current file - says to join on a .. which takes back to root
  #Sets the view directory correctly - forms a path to where the views are
  set :views, Proc.new {File.join(root, "views")}
  configure :development do
    register Sinatra::Reloader
  end

  $posts = [{ #$ makes a global variable
      id: 0,
      title: "Post 1",
      body: "This is the first post"
    },
    {
      id: 1,
      title: "Post 2",
      body: "This is the second post"
    },
    {
      id: 2,
      title: "Post 3",
      body: "This is the third post"
    }]


    puts File.join(root, "views")
    puts "--------------------"

  #7 RESTful routes
  get "/" do
    @title = "This is the title of the blog" #@ creates an instance variable
    @posts = $posts #Display all posts on index page
    erb :'posts/index' #Calls posts/index.erb file
  end

  post "/" do
    new_post = {
      id: $posts.length,
      title: params[:title],
      body: params[:body]
    }

    $posts.push(new_post)
    redirect "/"

  end

  get "/new" do
    "NEW POST"
    erb :'posts/new'
  end

  get "/:id/:edit" do
    id = params[:id].to_i
    @post = $posts[id]

    erb :'posts/edit'
  end

  delete "/:id" do
    id = params[:id]
    "Delete: #{id}"
  end

  put "/:id" do
    id = params[:id]
    "Update: #{id}"
  end

  get "/:id" do
    id = params[:id].to_i
    @post = $posts[id]
    erb :'posts/shows'

  end
end
