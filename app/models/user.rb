class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :similarities, dependent: :destroy


  validates :first_name, :last_name, presence: true     

  after_create :send_admin_mail
  
  def send_admin_mail
    NotificationsMailer.send_new_user_message(self).deliver
  end  

end
