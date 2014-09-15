class PagesController < ApplicationController
   skip_before_filter :authorize, :only => [:new, :create]
  def home
  end
  
  
end
