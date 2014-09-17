class EmailsController < ApplicationController
  
  def new  
  end
  
  def create 
    
    Pony.options = {
      :to => params[:email][:email],
      :body => params[:email][:body],
      :via => :smtp,
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => 'taskinc.taskmanager@gmail.com',
        :password             => 'ocsbudai',
        :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
        :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
      }
    }
    
    Pony.mail(:from => 'taskinc.taskmanager@gmail.com')
    
    redirect_to tasks_path, :notice => "Your email has been sent."
  end
  
  
end
