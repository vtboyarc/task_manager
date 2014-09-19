class Task < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  attr_accessible :description, :due_date, :name, :priority, :project_id, :tag_id, :user_id, :completed
  

  has_and_belongs_to_many :users

  has_and_belongs_to_many :tags
  belongs_to :project
  has_many :comments
  
  
  validates :name, :description, :project_id, :tag_id, :user_id, presence: true
  
  def email_owner(current_user)
    Pony.mail({
              :to => "#{self.user.email}",
              :via => :smtp,
              :subject => "#{current_user.name}" + " has assigned you a task.",
              :body => "Your task is " + "#{self.name}" + ".",
              :via_options => {
                :address              => 'smtp.gmail.com',
                :port                 => '587',
                :enable_starttls_auto => true,
                :user_name            => 'taskinc.taskmanager@gmail.com',
                :password             => 'ocsbudai',
                :authentication       => :plain, 
                :domain               => "localhost.localdomain" 
      
                }
              })
  end
      
end