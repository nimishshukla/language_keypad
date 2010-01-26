module LanguageKeypadHelper
  def show_key_pad(name,language = "hindi")
    result = "<div>"
    result+= "<script type='text/javascript'> \n"
    result+= "function #{name}_getValue(x) \n"
    result+= "{ \n"
    result+= "var y=document.getElementById('#{name}').value; \n"
    result+= "document.getElementById('#{name}').value= y + x; \n"
    result+= "} \n"
    result+= "</script> \n"
    result+= make_key_pad(name,language)
    result+= "</div>"
    return result
  end

  def make_key_pad(name,language)
    pad = ""
    pad += "<div class='base-layer'>"
    prepare_key_pad(language).each_pair do |key,row|
      pad += "<div class='table-row'>"
      row.each_pair do |key, value|
        pad += "<div class='left-layer11'>"
        pad += "<p id='#{key}' class='text' onclick='#{name}_getValue(\"#{value.to_s}\")'>#{key}</p>"
        pad += "</div>"
      end
      pad += "</div>"
      pad += "<div class='space-line'></div>"
    end
    pad += "</div>"
    return pad
  end

  def prepare_key_pad(language)
    config = YAML.load_file("#{RAILS_ROOT}/config/key_pads/#{language}.yml")
    config["hindi"]
  end
end