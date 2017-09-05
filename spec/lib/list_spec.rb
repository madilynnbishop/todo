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

  #write a test to test validations
  # list.valid

  it "it saves a new list" do
    expect(list).to exist
  end

  it "is a valid list" do
    expect(list).to be_valid
  end
  #write a test to make sure everything saves


end
