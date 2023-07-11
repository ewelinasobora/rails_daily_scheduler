# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :events, dependent: :delete_all

  validates :email, format: { with: /\A[A-Z0-9._%a-z-]+@e-dot\.uk|.pl\z/, message: 'must be a e-dot account' }
end
