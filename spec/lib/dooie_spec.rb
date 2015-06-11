require 'spec_helper'

describe "TodoFinder" do

  subject { ::Dooie::TodoFinder.new }

  let(:todo_items) { subject.find_todo_items }
  let(:line) { '@bar = "this is just a test" ## TODO: Again, just a test.' }
  let(:clean_line) { 'Again, just a test.' }

  describe 'create_todo_file' do
    it 'should create file containing todo items' do
      subject.create_todo_file(todo_items)
      expect(Dir['**/todo_items.txt'].count).to eq(1)
    end
  end

  describe 'extract_and_format_todos' do
    it 'should cleanse a line and prepare it for the todo file' do
      expect(subject.extract_and_format_todos(line)).to eq(clean_line)

    end
  end

  describe 'files_with_todos' do
    it 'should find files that contain TODO comments' do
      expect(subject.find_todo_items.count).to eq(3)
    end
  end

  describe 'find_todo_items' do
    it 'should return an array of todo items to parse' do
      expect(subject.find_todo_items.count).to eq(3)
    end
  end
end