class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}

  has_attached_file :avatar, :command_path => "/usr/local/bin/",
                    :style => {:small => "50x50>"}

  validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 3.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/bmp']
end
