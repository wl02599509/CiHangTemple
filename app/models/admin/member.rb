# frozen_string_literal: true

module Admin
  class Member < ApplicationRecord
    require 'taiwanese_id_validator/twid_generator'

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

    EMAIL_REGEX = /\A\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+\z/
    PHONE_REGEX = /\A09\d{8}\z/

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    validates :name, presence: true
    validates :address, presence: true
    validates :birth_date, presence: true
    validates :email, presence: true,
                      format: { with: EMAIL_REGEX, message: I18n.t('.invalid_email') }
    validates :phone, presence: true,
                      format: { with: PHONE_REGEX, message: I18n.t('.invalid_phone') },
                      length: { is: 10, message: I18n.t('.invalid_phone') }
    validates :id_card_number, presence: true,
                               taiwanese_id: { allow_nil: false,
                                               allow_old: true,
                                               message: I18n.t('.invalid_id_card_number') }
    validates :password_confirmation, presence: true
  end
end
