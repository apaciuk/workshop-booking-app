# frozen_string_literal: true

module Admin
  class Current < ActiveSupport::CurrentAttributes
    attribute :user
    resets { Time.zone = nil }
  end
end
