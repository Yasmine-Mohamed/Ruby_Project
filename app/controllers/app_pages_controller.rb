class AppPagesController < ApplicationController
  def index
    @courses = Course.all
  end
end
