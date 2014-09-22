class UserMailer < ActionMailer::Base
  default from: "adamcarterdev@gmail.com"
  
  def welcome(user)
    @user = user
    mail(:to => user.email, :subject => "welcome, dear human")
  end
    
    def task(user)
      @user = user
      mail(:to => user.email, :subject => "You have been assigned a task")
    end
    
    def update_task(user)
      @user = user
      mail(:to => user.email, :subject => "A Task has been updated")   
  end
end