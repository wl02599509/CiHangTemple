# frozen_string_literal: true

module Admin
  class MembersController < ApplicationController
    include Pagy::Backend

    before_action :find_member, only: %i[edit update]

    PERMITTED_ATTR = %i[name id_card_number email
                        phone address birth_date
                        password password_confirmation].freeze

    def index
      @pagy, @members = pagy(Admin::Member.order(id: :asc), items: 10)
    end

    def new
      @member = Admin::Member.new
    end

    def edit; end

    def create
      @member = Admin::Member.new(member_params)
      member = @member.save

      return redirect_to admin_members_path if member

      render :new
    end

    def update
      if @member.update(member_params)
        respond_to do |format|
          format.html { redirect_to admin_members_path, notice: t('.update.success') }
          format.turbo_stream
        end
      else
        render action: :update_failed
      end
    end

    private

    def member_params
      params[:admin_member].permit(PERMITTED_ATTR)
    end

    def find_member
      @member = Admin::Member.find_by(id: params[:id])
    end
  end
end
