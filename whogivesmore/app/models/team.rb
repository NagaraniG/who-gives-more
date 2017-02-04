class Team < ApplicationRecord
  # has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  has_many :donations
  has_many :competition_teams
  has_many :competitions ,through: :competition_teams
  has_many :user_teams
  has_many :users, through: :user_teams

  validates :name ,:presence =>true,
                    :uniqueness => true

  has_one :picture ,as: :imageable, :dependent => :destroy #
  accepts_nested_attributes_for :picture,:allow_destroy => true
  # accepts_nested_attributes_for :competition_teams
   #accepts_nested_attributes_for :competitions
end
