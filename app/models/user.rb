# == Schema Information
#
# Table name: user
#
#  name                                    :string           not null
#  password                                :string           not null
#  email                                   :string           not null

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
