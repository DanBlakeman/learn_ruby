class XmlDocument

  def initialize(indent=false)
    @indent = indent
  end

  def hello(hsh={})
    if block_given?
      return %Q[<hello>\n#{yield}</hello>\n] if @indent
      return %Q[<hello>#{yield}</hello>]
    end
    return %Q[<hello/>] if hsh.empty?
    #%Q[<hello name='#{hsh[:name]}'/>]
    hsh.inject("<hello ") {|sum, (k,v)| sum + "#{k}='#{v}'"} + "/>"
  end

  def send(tag_name)
    "<#{tag_name}/>"
  end

  # def self.factory(tag_name)

  # end

  def goodbye(hsh={})
    if block_given?
      return %Q[  <goodbye>\n#{yield}  </goodbye>\n] if @indent
      return %Q[<goodbye>#{yield}</goodbye>]
    end
    return %Q[<goodbye/>] if hsh.empty?
    %Q[<goodbye name='#{hsh[:name]}'/>]
  end

  def come_back(hsh={})
    if block_given?
      return %Q[    <come_back>\n#{yield}    </come_back>\n] if @indent
      return %Q[<come_back>#{yield}</come_back>]
    end
    return %Q[<come_back/>] if hsh.empty?
    %Q[<come_back name='#{hsh[:name]}'/>]
  end

  def ok_fine(hsh={})
    if block_given?
      return %Q[      <ok_fine>\n#{yield}</ok_fine>\n] if @indent
      return %Q[<ok_fine>#{yield}</ok_fine>]
    end
    return %Q[<ok_fine/>] if hsh.empty?
    #%Q[<ok_fine name='#{hsh[:name]}'/>]
    return hsh.inject("      <ok_fine ") {|sum, (k,v)| sum + "#{k}='#{v}'"} + "/>\n" if @indent
    hsh.inject("<ok_fine ") {|sum, (k,v)| sum + "#{k}='#{v}'"} + "/>"
  end

end