class PublishersController < ApplicationController
  before_action :find_publisher, only: [:edit, :update, :destroy]

  def index
    @publishers = Publisher.order(name: :asc)
  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)

    if @publisher.save
      redirect_to publishers_path, success: 'The publisher has been created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @publisher.update(publisher_params)
      redirect_to publishers_path, success: 'The publisher has been updated.'
    else
      render :edit
    end
  end

  def destroy
    @publisher.destroy
    redirect_to publishers_path, success: 'The publisher has been deleted.'
  end

  private

  def find_publisher
    @publisher = Publisher.find(params[:id])
  end

  def publisher_params
    params.require(:publisher).permit(:name)
  end
end
