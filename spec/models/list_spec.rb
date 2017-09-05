require "spec_helper"
describe List do
  let!(:list) {List.create(title: 'title')}
  subject { list }

  it "it is a new list" do
  end

  it "it has a title" do
    expect(list.title).to eq('title')
  end

  it "destroys tasks when list deleted" do
    task1=Task.new(:title=> "title")
    task2=Task.new(:title=>"task2")
    tasks=[task1,task2]
    list.tasks << tasks
    list.destroy
    expect(list.tasks).to be_empty
  end

  describe "validations" do
    it "requires a title" do
      new_list = List.new
      new_list.valid?
      expect(new_list.errors[:title]).to include("must be present")
    end
  end



end
