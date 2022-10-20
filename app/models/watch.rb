class Watch < ApplicationRecord

  generate_public_uid

  def to_param
    public_uid
  end

  belongs_to :project
end
