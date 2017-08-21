gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/node'

class TestNode < Minitest::Test

  #passes
  def test_node_class_exists
    node = Node.new(12, "string", 0)
    assert_instance_of Node, node
  end

end
