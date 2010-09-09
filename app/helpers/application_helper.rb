# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def graph(type,opts = {})
    Gchart.send(type, {:size => '500x200', :bg => "FFFFFF", :format => "image_tag"}.merge(opts))
  end

end
