require "dooie/version"

module Dooie
  class TodoFinder

    TODO_PATTERNS = [/#+(\s)*TODO(\:)*/i]
    TODO_FILE_HEADER = "Here are your TODO items \n"

    def initialize
      @todo_items = find_todo_items
      @todo_file = File.new('todo_items.txt', 'w')
    end

    def run
      create_todo_file(@todo_items)
    end

    def create_todo_file(todo_items)
      todo_items.each do |item|
        @todo_file.write(item)
      end
    end

    def extract_and_format_todos(line)
      clean_line = line.scan(/#.*/).first
      TODO_PATTERNS.each do |pattern|
        clean_line.gsub!(pattern,'').strip!
      end
      clean_line
    end

    def find_todo_items
      todo_items = []

      files_with_todos.each do |file|
        text = File.read(file)
        text.each_line do |line| 
          next unless TODO_PATTERNS.any?{ |pattern| line =~ pattern }
          todo_items << "[] #{extract_and_format_todos(line)} \n"
        end
      end

      todo_items
    end

    def files_with_todos
      files_with_todos = []

      Dir['**/*.rb'].each do |file|
        text = File.read(file)
        files_with_todos << file if TODO_PATTERNS.any?{ |pattern| text =~ pattern }
      end

      files_with_todos
    end
  end
end
