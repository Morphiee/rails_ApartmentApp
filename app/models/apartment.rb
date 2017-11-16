class Apartment < ApplicationRecord
    belongs_to :user
    validates :address, :city, :state, :country, :postal, :building_man, :phone, :hours, presence: true
    validates :state, length: { is: 2 }
    validates :postal, length: { is: 5 }
    validates :phone, length: { minimum: 10 }
    has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
    validates_attachment :image, presence: true,
        content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
        size: { in: 0..10.megabytes }
    resourcify
end
