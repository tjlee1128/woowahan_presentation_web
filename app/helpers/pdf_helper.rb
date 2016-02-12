module PdfHelper
  def self.create_single_pdf(pdf, id)
    return unless pdf
    add_single_pdf(pdf, id)
  end

  def self.update_single_pdf(pdf, id)
    return unless pdf
    delete_single_pdf(id)
    add_single_pdf(pdf, id)
  end

  def self.add_single_pdf(pdf, id)
    @pdf = Pdf.new
    @pdf.pdf = pdf
    @pdf.presentation_id = id
    @pdf.save
  end

  def self.delete_single_pdf(id)
    Pdf.find_by(presentation_id: id).destroy
  end

  def self.convert(document, model)
  	pdf_path = "#{Rails.root}/public#{document.pdf.url(:original, timestamp: false)}"
  	pdf = Grim.reap(pdf_path)

  	presentation_path = "#{Rails.root}/public/system/presetations"

  	file_name = File.basename(document.pdf.original_filename, File.extname(document.pdf.original_filename))
  	
  	pdf.each_with_index do |page, index|
  	  image_path = presentation_path + file_name + index.to_s + '.jpg'
      page.save(image_path)

      file = File.open(image_path)
      image = Image.new
      image.image = file
      image.imageable = model
      file.close
      image.save!
    end
  end
end
