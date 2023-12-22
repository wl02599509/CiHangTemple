# frozen_string_literal: true

module Admin
  module MembersHelper
    def invalid_msg(model, attr)
      model.errors[attr].uniq.first
    end
  end
end
