class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable#, :confirmable
  # include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  validates :first_name,:last_name ,:presence =>true
  has_many :donations
  has_many :account_informations

  has_many :user_teams
  has_many :teams, through: :user_teams

 

  has_many :user_competitions
  has_many :competitions, through: :user_competitions

  has_many :user_baskets
  has_many :baskets, through: :user_baskets


  has_one :picture ,as: :imageable, :dependent => :destroy #
  accepts_nested_attributes_for :picture,:allow_destroy => true
  #it will genereate auth_token is unique and format is should hesdecimal
  def generate_auth_token
    token = SecureRandom.hex
    self.update_columns(auth_token: token)
    token
  end
  # it update the existing auth_token as a nil
  # def invalidate_auth_token
  #   self.update_columns(auth_token: nil)
  # end

end
