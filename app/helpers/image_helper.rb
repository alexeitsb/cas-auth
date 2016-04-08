module ImageHelper
  def img_trash(title = nil)
    image_tag "trash.png", style: "height: 22px;", title: title
  end
end
