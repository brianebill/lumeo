class ImageJob < Struct.new(:id)
  def perform
    # Note: this will throw an exception if an Image w/ this 'id' 
    # does not exist
    image = Image.find(id)
    image.regenerate_styles!
  end
end