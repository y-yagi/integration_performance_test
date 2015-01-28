require 'test_helper'

class DocumentsControllerTest < ActionController::TestCase
  test "index" do
    get :index
    assert_equal 200, response.status
  end
end

Minitest.run_one_method(DocumentsControllerTest, 'test_index')

# ruby -Ilib:test test/controllers/documents_stackprof_index_test.rb
result = RubyProf.profile do
  Minitest.run_one_method(DocumentsControllerTest, 'test_index')
end

File.open('graphs/including_minitest/index_controller_callstack.html', 'w') do |file|
  RubyProf::CallStackPrinter.new(result).print(file)
end

File.open('graphs/including_minitest/index_controller_html_graph.html', 'w') do |file|
  RubyProf::GraphHtmlPrinter.new(result).print(file)
end
