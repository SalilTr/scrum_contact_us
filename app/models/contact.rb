class Contact < ApplicationRecord
      has_many :replies
  enum contact_type: [:suggestion, :feedback, :ask_a_query]

  # =============================
  def self.ransackable_associations(auth_object = nil)
    ["replies"]
  end


    def self.ransackable_attributes(auth_object = nil)
    ["contact_type", "created_at", "description", "email", "firstname", "id", "id_value", "lastname", "updated_at"]
  end

  # ===========================
end
