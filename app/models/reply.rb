class Reply < ApplicationRecord
  belongs_to :contact


  # ========================


  def self.ransackable_attributes(auth_object = nil)
    ["contact_id", "content", "created_at", "id", "id_value", "updated_at"]
  end



  def self.ransackable_associations(auth_object = nil)
    ["contact"]
  end


  # =========================
end
