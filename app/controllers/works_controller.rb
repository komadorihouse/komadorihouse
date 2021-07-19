class WorksController < ApplicationController
  def index
    @work = Work.find(7)
    @info = "News"
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

  def works
    @info = "Works"
    @works = Work.page(params[:page]).per(5)
    @work = Work.find(7)
  end

  def show
    @works = Work.all.order(created_year: 'DESC')
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
