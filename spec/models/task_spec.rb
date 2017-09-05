require "spec_helper"
describe Task do
  !let(:task) { Task.create!(title: 'title') }

  it "has a title" do
    expect(task.title).to eq('title')
  end

  it "has one list" do
    list= List.new
    list2= List.new
    list.tasks << task
    expect(task.list).to be list
  end

  it "to be not completed" do
    expect(task).to_not be_completed
  end

  it "it can be marked completed" do
    task.update_attribute(:completed, true)
    expect(task).to be_completed
  end

  describe "validations" do
    it "requires a title" do
      new_task = Task.new
      new_task.valid?
      expect(new_task.errors[:title]).to include("must be present")
    end
  end

end
