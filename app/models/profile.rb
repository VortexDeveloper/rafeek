class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :city, optional: true
  belongs_to :state, optional: true
  belongs_to :country, optional: true

  has_attached_file(
    :avatar,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png"
  )

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def avatar_url
    if user.provider.nil?
      avatar_url
    else
      image
    end
  end

  #private
  def user
    User.where(id: user_id).first
  end
end
