module ProsHelper
  def pro_select
    Pro.all.map {|pro| [pro.user.name, pro.id]}
  end
end