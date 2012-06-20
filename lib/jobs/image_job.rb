# Struct.new generates a new class with an "id" property
# that we can inherit from
class ImageJob < Struct.new(:id)
  def perform
    if image = Image.find(id)
      image.regenerate_styles!
    end
  end
end
