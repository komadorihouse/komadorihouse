class WorksController < ApplicationController
  before_action :contact_form, :description

  def index
    @work = "1z0jPhBvysuBn4MmX73UWNTo0THdb6Tml"
    @info = "News"
    @blogslist = Blog.page(params[:index]).per(30).order('created_at DESC')
    @blogs = Blog.page(params[:contents]).per(6).order('created_at DESC')
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
    google_url_change
    if @workbox.save
    else
      render :new
    end
  end

  def edit
    @workbox = Work.find(params[:id])
  end

  def update
    @workbox = Work.find(params[:id])
    @upwork = params[:work]
    params_url_change
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
    @workslist = Work.page(params[:index]).per(20).order('created_year DESC')
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
    @workslist = Work.page(params[:list]).per(20).order('created_year DESC')
  end

  def show_mail
    judge_ip
    @mails = Contact.page(params[:mail]).per(25).order('created_at DESC')
  end

  private

  def work_params
    params.require(:work).permit(:title,:image,:image2,:image3,:image4,:image5,:image6,:image7,:image8,:image9,:image10,:description,:youtube,:created_year,:artist_id,:type_id)
  end

  def url_change(image_url)
    image_url.slice!("https://drive.google.com/file/d/")
    image_url.slice!("/view?usp=sharing")
  end

  def params_url_change
    url_change(@upwork[:image])
    url_change(@upwork[:image2])
    url_change(@upwork[:image3])
    url_change(@upwork[:image4])
    url_change(@upwork[:image5])
    url_change(@upwork[:image6])
    url_change(@upwork[:image7])
    url_change(@upwork[:image8])
    url_change(@upwork[:image9])
    url_change(@upwork[:image10])
    @upwork[:youtube].slice!("https://www.youtube.com/watch?v=")
  end
  
  def google_url_change
    url_change(@workbox.image)
    url_change(@workbox.image2)
    url_change(@workbox.image3)
    url_change(@workbox.image4)
    url_change(@workbox.image5)
    url_change(@workbox.image6)
    url_change(@workbox.image7)
    url_change(@workbox.image8)
    url_change(@workbox.image9)
    url_change(@workbox.image10)
    @workbox.youtube.slice!("https://www.youtube.com/watch?v=")
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