class WorksController < ApplicationController
  def index
    @work = "1z0jPhBvysuBn4MmX73UWNTo0THdb6Tml"
    @info = "News"
    @ip = client_ip
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
    @workbox = Work.find(params[:id])
  end

  def update
  end

  def works
    @info = "Works"
    @workslist = Work.page(params[:index]).per(10).order('created_year DESC')
    @works = Work.page(params[:contents]).per(5).order('created_year DESC')
    @work = "1z0jPhBvysuBn4MmX73UWNTo0THdb6Tml"
    list = @workslist
    
    if request.xhr?
      render json:{ works: list }
    end
  end

  def show
    @workslist = Work.page(params[:index]).per(10).order('created_year DESC')
    @work = Work.find(params[:id])
    @creater = Creater.find(@work.artist_id).name
    @info = @work.title
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

  private

  def work_params
    params.require(:work).permit(:title,:image,:description,:youtube,:created_year,:artist_id,:type_id)
  end

  def client_ip
    request.ip
  end

  def judge_ip
    if client_ip == "::1"
    elsif client_ip == "110.135.160.94"
    else
      redirect_to root_path
    end
  end

  
end
