class Picture < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, styles: { :medium => "800x800#", :thumb => "250x250#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
