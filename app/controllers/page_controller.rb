class PageController < ApplicationController
  def home
  	@doctors = Doctor.all
  end

  def about
  end

  def terms
  end

  def faqs
  end

end
