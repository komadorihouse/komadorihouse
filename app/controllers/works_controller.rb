class WorksController < ApplicationController
  def index
    @info = "News"
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.image.slice!("https://drive.google.com/file/d/")
    @work.image.slice!("/view?usp=sharing")
    @work.youtube.slice!("https://www.youtube.com/watch?v=")
    if @work.save
    else
      render :new
    end
  end

  def works
    @info = "Works"
    @works = Work.all.order(created_year: 'DESC')
  end

  def show
    @work = Work.find(params[:id])
    @creater = Creater.find(@work.artist_id).name
    @info = @work.title
  end

  def profile
    @info = "Profile"
  end

  def contact
    @info = "Contact"
  end
  
  def link
    @info = "Link"
  end

  private

  def work_params
    params.require(:work).permit(:title,:image,:description,:youtube,:created_year,:artist_id,:type_id)
  end

end
