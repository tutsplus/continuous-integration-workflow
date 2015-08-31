class AuthorsController < ApplicationController
  before_action :find_author, only: [:edit, :update, :destroy]

  def index
    @authors = Author.order(last_name: :asc, first_name: :asc)
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to authors_path, success: 'The author has been created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @author.update(author_params)
      redirect_to authors_path, success: 'The author has been updated.'
    else
      render :edit
    end
  end

  def destroy
    @author.destroy
    redirect_to authors_path, success: 'The author has been deleted.'
  end

  private

  def find_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end

end
