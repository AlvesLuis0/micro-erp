module Status
  extend ActiveSupport::Concern

  included do
    enum :status,
      {
        active: "active",
        inactive: "inactive",
        deleted: "deleted"
      },
      validate: true,
      default: :active
  end
end
