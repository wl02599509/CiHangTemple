# frozen_string_literal: true

module Admin
  class MemberTableColumnComponent < ViewComponent::Base
    erb_template <<~ERB
      <div class='table-header py-2 items-center text-center'>
        <div class='table-cols name'><%= @member.name %></div>
        <div class='table-cols id-card-number'><%= @member.id_card_number %></div>
        <div class='table-cols birth-date'><%= @member.birth_date.strftime('%Y-%m-%d') %></div>
        <div class='table-cols phone'><%= @member.phone %></div>
        <div class='table-cols email'><%= @member.email %></div>
        <div class='table-cols address'><%= @member.address %></div>
        <div class='table-cols actions flex'>
          <%= link_to t('.edit_member'),
              edit_admin_member_path(@member),
              class: 'py-2 px-2 hover:bg-orange-300 hover:rounded'
          %>
          <%= button_to t('.delete_member'),
              admin_member_path(@member),
              method: :delete,
              class: 'py-2 px-2 hover:bg-red-500 hover:text-white hover:rounded',
              form: {
                data: { turbo_confirm: t('.are_you_sure_to_delete?') }
              }
          %>
        </div>
      </div>
    ERB

    def initialize(member)
      @member = member
    end
  end
end
