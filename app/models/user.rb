class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :last_name, :first_name, :patronymic_name, :date_of_birth
  # attr_accessible :title, :body

  def full_name
    "#{last_name} #{first_name} #{patronymic_name}".strip
  end

  # as per the task, email is not a required field and should not be validated
  def email_required?
    false
  end

end
