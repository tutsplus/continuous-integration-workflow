class PublishersController < ApplicationController
  def index
    @publishers = Publisher.order(name: :asc)
  end
end
