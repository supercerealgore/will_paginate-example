get '/' do
  @input = params["search"]
  @posts = Post.paginate(:page => params[:page], :per_page => 5, :conditions => ['title ilike ? OR description ilike ?', "%#{@input}%", "%#{@input}%"])
  erb :index
end