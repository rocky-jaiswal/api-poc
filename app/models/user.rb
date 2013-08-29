class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :recoverable, :rememberable, 
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation
end
