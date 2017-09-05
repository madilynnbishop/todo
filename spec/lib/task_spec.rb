require "spec_helper"
describe Task do
  !let(:task) { Task.create!(title: 'title') }

  it "is a new task" do
  end

  it "has a title" do
    expect(task.title).to eq('title')
  end

  it "has one list" do
    list= List.new
    list2= List.new
    list.tasks << task
    expect(task.list).to be list
  end


  it "it saves a new task" do
    expect(task).to exist
  end

  it "it to be not completed" do
    expect(task.completed).to eq(false)
  end

  it "it can be marked completed" do
    task.update_attribute(:completed, true)
    expect(task.completed).to eq(true)
  end

  it "is a valid task" do
    expect(task).to be_valid
  end

end
