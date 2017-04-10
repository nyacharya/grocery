class Product < ActiveRecord::Base
  has_many :order_items
  mount_uploader :image, ImageUploader
  default_scope { where(active: true) }


  # include ActiveModel::AttributeMethods

  # attr_accessor :avialable_quantity, :status, :active

  # private
  #   def reset_attribute(attribute)
  #     send("#{attribute}=", false)
  #   end
 
  #   def attribute_any?(attribute)
  #     send(attribute) < 1
  #   end

  #   def redefine_attribute(attribute)
  #     send("#{attribute}=", "Out of Stock")
  #   end
  # before_commit :product_available
  # validate :product_check

  # def product_available
  # 	if product.avialable_quantity < 1
  # 	  product.update_attributes(active: false)
  # 	end
  # end

  # def product_check
  # 	if !product.active?
  #     errors.add(:product, "is not valid or is not active.")
  #   end
  # end
end
