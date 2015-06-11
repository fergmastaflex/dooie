require 'spec_helper'

describe "TodoFinder" do

  subject { ::Dooie::TodoFinder.new }

  describe 'files_with_todos' do
    it 'should find files that contain TODO comments' do
      expect(subject.files_with_todos.count).to eq(2)
    end
  end

  describe 'create_todos' do
    it 'should create file containing todo items' do
      subject.create_todos
      expect(File.exist?('dooie/todo_items.txt')).to be_true
    end
  end
end