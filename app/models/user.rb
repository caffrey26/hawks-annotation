
class User < ActiveRecord::Base
  has_many :project_users, :foreign_key => :user_id
  has_many :projects, through: :project_users, :foreign_key => :user_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :password, :email
  validates_uniqueness_of:email
end
