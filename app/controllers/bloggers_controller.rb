class BloggersController < ApplicationController

  def index
    @bloggers = Blogger.all
  end

  def show
    @blogger = Blogger.find(params[:id])
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(blogger_params)
    if @blogger.valid?
      @blogger.save
      redirect_to @blogger
    else
      render :new
    end
  end

  def edit
    @blogger = Blogger.find(params[:id])
  end

  def update
    @blogger = Blogger.find(params[:id])
    @blogger.update(blogger_params)
    if @blogger.valid?
      @blogger.save
      redirect_to @blogger
    else
      render :edit
    end
  end

  def destroy
    @blogger = Blogger.find(params[:id])
    @blogger.destroy
    flash[:notice] = "Blogger deleted."
    redirect_to bloggers_path
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end

end
