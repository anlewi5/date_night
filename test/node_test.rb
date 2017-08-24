gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/node'

class TestNode < Minitest::Test

  def setup
    @node = Node.new(47, "movie", 0)
  end

  def test_node_class_exists
    assert_instance_of Node, @node
  end

  def test_insert_right_adds_new_movie_to_right
    assert_equal 1, @node.insert_right(98, "Animals United")
  end

  def test_insert_left_adds_new_movie_to_left
    assert_equal 1, @node.insert_left(38, "Charlie's Country")
  end

  def test_insert_adds_new_movie
    assert_equal 1, @node.insert(98, "Animals United")
    assert_equal 1, @node.insert(38, "Charlie's Country")
    assert_equal 2, @node.insert(16, "Johnny English")
  end

  def test_include_checks_if_score_exits
    @node.insert(98, "Animals United")

    assert @node.include?(98)
  end

  def test_depth_of_checks_score_depth
    @node.insert(98, "Animals United")

    assert_equal 1, @node.depth_of(98)
  end

  def test_make_hash_makes_movie_and_score_hash
    assert_equal ({"movie"=>47}), @node.make_hash
  end

  def test_min_finds_min_score
    @node.insert(98, "Animals United")

    assert_equal ({"movie" => 47}), @node.min
  end

  def test_max_finds_max_score
    @node.insert(98, "Animals United")

    assert_equal ({"Animals United"=>98}), @node.max
  end

  def test_sort_left_sorts_left_side
    @node.insert(38, "Charlie's Country")

    assert_equal [{"Charlie's Country"=>38}], @node.sort_left
  end

  def test_sort_right_sorts_right_side
    @node.insert(98, "Animals United")

    assert_equal [{"Animals United"=>98}], @node.sort_right
  end

  def test_total_nodes_returns_count_of_nodes
    @node.insert(98, "Animals United")

    assert_equal 2, @node.total_nodes
  end

  def test_health_reports_tree_health_array
    @node.insert(98, "Animals United")

    assert_equal [98, 1, 1], @node.health(1)
  end

end
