class AuthorsController < ApplicationController
  def index
    @authors = Author.order(last_name: :asc, first_name: :asc)
  end
end
