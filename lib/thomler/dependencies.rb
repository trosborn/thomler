class Object
  def self.const_missing c
    return nil if @calling_const_missing
    return nil if Thomler.const_defined? c

    @calling_const_missing = true
    require Thomler.to_underscore(c.to_s)
    klass = Object.const_get(c)
    @calling_const_missing = false

    klass
  end
end
