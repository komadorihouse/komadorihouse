class BlogsController < ApplicationController
  before_action :judge_ip
  before_action :contact_form

  def new
    @info = "Post a blog"
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    image_src
    if @blog.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @blogslist = Blog.page(params[:index]).per(30).order('created_at DESC')
    @blog = Blog.find(params[:id])
    @info = "Komadori Blog"
    @description = @blog.title
    if @blog.image_1..present?
      @work = @blog.image_1
    else
      @work = "1z0jPhBvysuBn4MmX73UWNTo0THdb6Tml"
    end
  end

  def edit
    @info = "Edit blog"
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    image_src
    if @blog.update(blog_params)
      redirect_to root_path
    else
      render :edit
    end  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to root_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :text_1, :image_1, :text_2, :image_2, :text_3, :image_3)
  end

  def image_src
    @blog.image_1.slice!("https://drive.google.com/file/d/")
    @blog.image_1.slice!("/view?usp=sharing")
    @blog.image_2.slice!("https://drive.google.com/file/d/")
    @blog.image_2.slice!("/view?usp=sharing")
    @blog.image_3.slice!("https://drive.google.com/file/d/")
    @blog.image_3.slice!("/view?usp=sharing")
  end

  def client_ip
    request.ip
  end

  def judge_ip
    if client_ip == "::1"
    elsif client_ip == ENV["IP_ADDRESS"]
    else
      redirect_to root_path
    end
  end

  def contact_form
    @contact = Contact.new
    @ip = request.ip
  end

end
