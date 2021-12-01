class GenresController < ApplicationController
  before_action :require_login

  def index
    @genre = Genre.new
  end
end
