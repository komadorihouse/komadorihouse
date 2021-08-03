class WorksController < ApplicationController
  def index
    @work = "1z0jPhBvysuBn4MmX73UWNTo0THdb6Tml"
    @info = "News"
  end

  def new
    judge_ip
    @work = "1z0jPhBvysuBn4MmX73UWNTo0THdb6Tml"
    @workbox = Work.new
  end

  def create
    @workbox = Work.new(work_params)
    @workbox.image.slice!("https://drive.google.com/file/d/")
    @workbox.image.slice!("/view?usp=sharing")
    @workbox.youtube.slice!("https://www.youtube.com/watch?v=")
    if @workbox.save
    else
      render :new
    end
  end

  def edit
    @work = Work.find(params[:id]).image
    @workbox = Work.find(params[:id])
  end

  def update
    @workbox = Work.find(params[:id])
    @workbox.image.slice!("https://drive.google.com/file/d/")
    @workbox.image.slice!("/view?usp=sharing")
    if @workbox.update(work_params)
      redirect_to work_path(@workbox.id)
    else
      render :edit
    end
  end

  def works
    @type = Type.all
    @creaters = Creater.all
    @info = "Works"
    @workslist = Work.page(params[:index]).per(10).order('created_year DESC')
    @works = Work.page(params[:contents]).per(20).order('created_year DESC')
    @work = "1z0jPhBvysuBn4MmX73UWNTo0THdb6Tml"
    @body_info = "All Works"
    if request.xhr?
      if params.has_key?(:index)
        render "lists"
      elsif params.has_key?(:contents)
        render "contents"
      else
        render "creater"
      end
    end
  end

  def creater
    @type = Type.all
    @creaters = Creater.all
    @info = Creater.find(params[:id]).name
    @works = Work.where(artist_id: params[:id]).page(params[:contents]).per(20).order('created_year DESC')
    @body_info = "#{@info} Works"
    if params.has_key?(:contents)
      render 'contents'
    else
      render 'creater'
    end
  end

  def types
    if params[:id].to_i == 0
      @info = "All Works"
      @works = Work.page(params[:contents]).per(20).order('created_year DESC')
    else
      @info = Type.find(params[:id]).name
      @works = Work.where(type_id: params[:id]).page(params[:contents]).per(20).order('created_year DESC')
    end
    @body_info = "#{@info}"
    render 'creater'
  end

  def show
    @workslist = Work.page(params[:index]).per(10).order('created_year DESC')
    @item = Work.find(params[:id])
    @work = Work.find(params[:id]).image
    @creater = Creater.find(@item.artist_id).name
    @info = @item.title
  end

  def profile
    @work = "1z0jPhBvysuBn4MmX73UWNTo0THdb6Tml"
    @info = "Profile"
  end

  def contact
    @work = "1z0jPhBvysuBn4MmX73UWNTo0THdb6Tml"
    @info = "Contact"
  end
  
  def link
    @work = "1z0jPhBvysuBn4MmX73UWNTo0THdb6Tml"
    @info = "Link"
  end

  def list
    @work = "1z0jPhBvysuBn4MmX73UWNTo0THdb6Tml"
    @workslist = Work.page(params[:list]).per(25).order('created_year DESC')
  end

  private

  def work_params
    params.require(:work).permit(:title,:image,:description,:youtube,:created_year,:artist_id,:type_id)
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

  
end