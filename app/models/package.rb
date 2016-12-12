class Package < ApplicationRecord
  has_attached_file(
    :avatar,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png"
  )

  enum active: [:inactive, :active]

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
