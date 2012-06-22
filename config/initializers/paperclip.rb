Paperclip.interpolates(:parent_type) do |attachment, style|
  type = attachment.instance.parent_type

  type ? type.to_s.downcase : :image
end
