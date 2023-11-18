# frozen_string_literal: true

module Admin
  class MembersController < ApplicationController
    include Pagy::Backend

    PERMITTED_ATTR = %i[name id_card_number email
                        phone address birth_date
                        password password_confirmation].freeze

    def index
      @pagy, @members = pagy(Admin::Member.all, items: 10)
    end

    def new
      @member = Admin::Member.new
    end

    def create
      @member = Admin::Member.new(member_params)
      member = @member.save

      redirect_to admin_members_path if member

      render :new
    end

    private

    def member_params
      params[:admin_member].permit(PERMITTED_ATTR)
    end
  end
end
