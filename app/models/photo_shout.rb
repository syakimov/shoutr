class PhotoShout < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment :image,
    content_type: { content_type: ['image/jpeg', 'image/png', 'image/gif'] },
    size: { in: 0..10.megabytes },
    presence: true
end
