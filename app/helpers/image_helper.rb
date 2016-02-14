module ImageHelper
  def self.create_multiple_images(images, model)
    return unless images
    add_multiple_images(images, model)
  end

  def self.update_multiple_images(images, model)
    return unless images
    delete_multiple_images(model)
    add_multiple_images(images, model)
  end

  def self.add_multiple_images(images, model)
    images.each do |image|
      @image = Image.new
      @image.image = image
      @image.imageable = model
      @image.save
    end
  end

  def self.delete_multiple_images(model)
    model.images.destroy_all
  end

  def self.create_single_image(image, model)
    add_single_image(image, model)
  end

  def self.update_single_image(image, model)
    delete_single_image(model)
    add_single_image(image, model)
  end

  def self.add_single_image(image, model)
    if image.present?
      @image = Image.new
      @image.image = image
      @image.imageable = model
      @image.save
    else
      puts model
      default_image_path = "#{Rails.root}/public/system/images/ic_account_box.png"
      file = File.open(default_image_path)
      image = Image.new
      image.image = file
      image.imageable = model
      file.close
      image.save!
    end
  end

  def self.delete_single_image(model)
    model.image.destroy
  end
end