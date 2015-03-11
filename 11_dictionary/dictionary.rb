class Dictionary

  attr_accessor :entries

  def initialize(hsh = {})
    @entries = hsh
  end

  def add(hsh)
    hsh.is_a?(Hash) ? @entries.merge!(hsh) : @entries[hsh] = nil
  end

  def keywords
    @entries.keys.sort
  end

  def include?(key)
    entries.has_key?(key)
  end

  def find(key)
    @entries.select{|k,v| k.include?(key)}
  end

  def printable
    keywords.inject("") {|sum, k| sum + "[#{k}] \"#{@entries[k]}\"\n" }.chomp
  end

end



