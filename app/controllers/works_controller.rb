class WorksController < ApplicationController
  def index
    @info = "News"
  end

  def works
    @info = "Works"
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
  
end
