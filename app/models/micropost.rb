class Micropost < ApplicationRecord
  has_many :microposts, dependent: :destroy
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :picture_size

  def replies
    Micropost.where("micropost_id = ?", self.id)
  end

  private

  # アップロードされた画像のサイズをバリデーションする
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "5MBより小さなファイルを指定してください")
    end
  end

end
