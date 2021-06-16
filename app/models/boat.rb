class Boat < ActiveRecord::Base
  has_many :boat_attachments, dependent: :destroy
  has_many :boat_options, dependent: :destroy

  # def self.search(search)
  # where('name like :rent or content like :pat', :pat => "%#{search}%")
  # end

  def rents
    self.class.where(rent: true)
  end
end
