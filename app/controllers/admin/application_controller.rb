module Admin
  class ApplicationController < ApplicationController
    before_action :authenticate_manager!
  end
end