# frozen_string_literal: true

module Admin
  class MembersController < ApplicationController
    def index
      @members = Admin::Member.all
    end
  end
end
