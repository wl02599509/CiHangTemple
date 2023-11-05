# frozen_string_literal: true

module Admin
  class MembersController < ApplicationController
    include Pagy::Backend

    def index
      @pagy, @members = pagy(Admin::Member.all, items: 10)
    end
  end
end
