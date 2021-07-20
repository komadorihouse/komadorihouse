class WorksController < ApplicationController
  def index
    @work = Work.find(7)
    @info = "News"
    ＠ip = request.remote_ip
  end

  def new
    @work = Work.find(2)
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
    @work = Work.find(7)
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
    @work = Work.find(1)
    @info = "Profile"
  end

  def contact
    @work = Work.find(1)
    @info = "Contact"
  end
  
  def link
    @work = Work.find(1)
    @info = "Link"
  end

  private

  def work_params
    params.require(:work).permit(:title,:image,:description,:youtube,:created_year,:artist_id,:type_id)
  end

  
end
