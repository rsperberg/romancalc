class Romanum
    PROPERTIES = [:m, :d, :c, :l, :x, :v, :i, :roman, :cm, :cd, :xc, :xl, :ix, :iv, :arabic, :mstore]
    PROPERTIES.each do |prop|
        attr_accessor prop
    end  # do
    def initialize(properties = {})
        properties.each do |key, value|
            if PROPERTIES.member? key.to_sym
                self.send("#{key}=", value)
            end  # if
        end  # do
    end  # def
end  # class