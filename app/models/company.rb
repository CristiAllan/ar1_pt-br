class Company < ApplicationRecord


  def update_status
    with_lock do
      self.status = 'active'
      save!
    end
  end
end
