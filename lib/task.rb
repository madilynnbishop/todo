class Task
  attr_accessor :title

  def initialize
    @title= "title"
  end

  def exist?
      task.include?(title)
    end
end
