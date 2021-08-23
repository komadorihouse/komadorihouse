class WorksController < ApplicationController
  before_action :contact_form, :description

  def index
    @work = "1z0jPhBvysuBn4MmX73UWNTo0THdb6Tml"
    @info = "News"
    @blogslist = Blog.page(params[:index]).per(30).order('created_at DESC')
    @blogs = Blog.page(params[:contents]).per(10).order('created_at DESC')
    @switch = judge_ip_switch
    if request.xhr?
      if params.has_key?(:index)
        render "blog_lists"
      elsif params.has_key?(:contents)
        render "blog_contents"
      end
    end
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

  def destroy
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to action: :list
  end

  def works
    @type = Type.all
    @creaters = Creater.all
    @info = "Works"
    @workslist = Work.page(params[:index]).per(20).order('created_year DESC')
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
    if params[:id] == "3"
      @kinari = true
    else
      @kinari = false
    end
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

  def creater_type
  end

  def show
    @workslist = Work.page(params[:index]).per(10).order('created_year DESC')
    @item = Work.find(params[:id])
    @work = Work.find(params[:id]).image
    @creater = Creater.find(@item.artist_id).name
    @info = @item.title
    if request.xhr?
      if params.has_key?(:index)
        render "lists"
      end
    end
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
    judge_ip
    @work = "1z0jPhBvysuBn4MmX73UWNTo0THdb6Tml"
    @workslist = Work.page(params[:list]).per(25).order('created_year DESC')
  end

  def show_mail
    judge_ip
    @mails = Contact.page(params[:mail]).per(25).order('created_at DESC')
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

  def judge_ip_switch
    if client_ip == "::1"
      true
    elsif client_ip == ENV["IP_ADDRESS"]
      true
    else
      false
    end
  end

  def contact_form
    @contact = Contact.new
    @ip = request.ip
  end

  def description
    @description = "コマドリハウスとは創作活動を行うアーティストグループです。もともとは、コマドリアニメーションを制作するグループから始まりました。人の活動は全てが表現活動であり、社会的な行動だと言えます。どんな人でもアーティストでありうると私たちは考えています。現在、コマドリハウスではアニメーションのみならず、日常生活で生まれるイラスト、デザイン、WEBアプリケーション制作、彫刻、絵画など様々な制作活動を行っています。"
  end
end