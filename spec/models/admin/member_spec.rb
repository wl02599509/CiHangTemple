# frozen_string_literal: true

require 'rails_helper'
require 'taiwanese_id_validator/twid_generator'

RSpec.describe Admin::Member do
  subject { member }

  let(:member) { create(:admin_member) }

  describe 'validations' do
    describe 'name' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to allow_value('John Doe').for(:name) }
      it { is_expected.not_to allow_value('').for(:name) }
    end

    describe 'address' do
      it { is_expected.to validate_presence_of(:address) }
      it { is_expected.to allow_value('123 Main Street').for(:address) }
      it { is_expected.not_to allow_value('').for(:address) }
    end

    describe 'birth_date' do
      it { is_expected.to validate_presence_of(:birth_date) }
      it { is_expected.to allow_value('1990-01-01').for(:birth_date) }
      it { is_expected.not_to allow_value('').for(:birth_date) }
    end

    describe 'email' do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to allow_value('john.doe@example.com').for(:email) }
      it { is_expected.not_to allow_value('').for(:email) }
      it { is_expected.not_to allow_value('invalid').for(:email) }
    end

    describe 'phone' do
      it { is_expected.to validate_presence_of(:phone) }
      it { is_expected.to allow_value('0912345678').for(:phone) }
      it { is_expected.not_to allow_value('').for(:phone) }
      it { is_expected.not_to allow_value('invalid').for(:phone) }
    end

    describe 'id_card_number' do
      # taiwanese_id_validator 沒有處理到 nil 的狀況，已發 PR：https://github.com/wayne5540/taiwanese_id_validator/pull/3
      # it { is_expected.to validate_presence_of(:id_card_number) }
      it { is_expected.to allow_value('A123456789').for(:id_card_number) }
      it { is_expected.not_to allow_value('').for(:id_card_number) }
      it { is_expected.not_to allow_value('invalid').for(:id_card_number) }
    end

    describe 'password_confirmation' do
      it { is_expected.to validate_presence_of(:password_confirmation) }
      it { is_expected.to allow_value(member.password).for(:password_confirmation) }
      it { is_expected.not_to allow_value('').for(:password_confirmation) }
    end
  end
end
