# == Schema Information
#
# Table name: user
#
#  name                                    :string           not null
#  password                                :string           not null
#  email                                   :string           not null
#  created_at                              :datetime         not null
#  updated_at                              :datetime         not null
#  reset_password_token                    :string
#  encrypted_password                      :string
#  reset_password_sent_at                  :datetime
#  remember_created_at                     :datetime

# Indexes
#
#  index_users_on_email                     (email) UNIQUE
#  index_users_on_reset_password_token      (reset_password_token) UNIQUE

class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable
    #has_paper_trail ignore: [:encrypted_password, :reset_password_token, :updated_at], meta: nil
  
end
