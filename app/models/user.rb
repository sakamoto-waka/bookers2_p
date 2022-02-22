class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:name]

  has_one_attached :profile_image
  has_many :books, dependent: :destroy

  def get_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/bookers2_p_images/no-image-icon.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    else
      profile_image
    end
  end

end
