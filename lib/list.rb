class List
  attr_accessor :title
def initialize(title)
  @title=title
end
end

def exist?
    list.include?(title)
  end
end
