class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  after_validation :lat_changed?

  private

  def lat_changed?
    if (self.address_changed?)
      if !(self.latitude_changed?)
          self.errors.add(:address, "is not valid")
          return false
      end
    end
    return true
  end

end
