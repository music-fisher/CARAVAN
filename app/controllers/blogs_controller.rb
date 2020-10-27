class BlogsController < ApplicationController
  def index
   @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog=Blog.new
  end
  def create
    blog = Blog.new(blog_params)
    # blog_params = {title: "aaaa",category:"bbb",body: "cccc"}
    # blog = {id: 1, title: "aaaa",category:"bbb",body: "cccc"}
    blog.save
    # 以下を修正
    redirect_to blog_path(blog.id)
  end
  def edit
    @blog=Blog.find(params[:id])
  end

 def update
   blog = Blog.find(params[:id])
  # {id: 1, title: "aaaa",category:"bbb",body: "cccc"}
   
   
   blog.update(blog_params)
  # {title: "bbb",category:"bssssssbb",body: "ccdddddcc"}
   
   
  # blog == {id: 1, title: "bbb",category:"bssssssbb",body: "ccdddddcc"}
   redirect_to blog_path(blog)
 end

  # ストロングパラメータ
private
  def blog_params
    params.require(:blog).permit(:title,:category,:body)
    # create時
    # params == {sample: "aaa", blog: {title: "aaaa",category:"bbb",body: "cccc"}, ....}
    # update時
    # params == {sample: "aaa", blog: {title: "bbb",category:"bssssssbb",body: "ccdddddcc"}, ....}
  end
end



