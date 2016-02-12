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
    return unless image
    add_single_image(image, model)
  end

  def self.update_single_image(image, model)
    return unless image
    delete_single_image(model)
    add_single_image(image, model)
  end

  def self.add_single_image(image, model)
    @image = Image.new
    @image.image = image
    @image.imageable = model
    @image.save
  end

  def self.delete_single_image(model)
    return unless model.image
    model.image.destroy
  end
end