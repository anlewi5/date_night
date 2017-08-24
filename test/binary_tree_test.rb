gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_tree'

class TestDateNight < Minitest::Test

  attr_reader :tree

  def setup
    @tree = BinarySearchTree.new
  end

  def test_binary_search_tree_class_exists
    assert_instance_of BinarySearchTree, tree
  end

  def test_insert_adds_new_movie
    tree_one = tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree_two = tree.insert(16, "Johnny English")
    tree_three = tree.insert(92, "Sharknado 3")
    tree_four = tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 0, tree_one
    assert_equal 1, tree_two
    assert_equal 1, tree_three
    assert_equal 2, tree_four
  end

  def test_include_checks_if_score_exits
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert tree.include?(16)
    refute tree.include?(72)
  end

  def test_depth_of_checks_score_depth
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 1, tree.depth_of(92)
    assert_equal 2, tree.depth_of(50)
    assert_nil tree.depth_of(72)
  end

  def test_max_finds_max_score
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal ({"Sharknado 3"=>92}), tree.max
  end

  def test_min_finds_min_score
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal ({"Johnny English"=>16}), tree.min
  end

  def test_sort_sorts_scores_ascending
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    sorted_scores = [{"Johnny English"=>16}, {"Hannibal Buress: Animal Furnace"=>50}, {"Bill & Ted's Excellent Adventure"=>61}, {"Sharknado 3"=>92}]

    assert_equal sorted_scores, tree.sort
  end

  def test_load_loads_file_into_tree
    assert_equal 99, tree.load("movies.txt")
  end

  def test_total_nodes_returns_count_of_nodes_in_tree
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")

    assert_equal 7, tree.total_nodes

  end

  def test_health_reports_tree_health
    skip
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")

    assert_equal [[98, 7, 100]], tree.health(0)
    assert_equal [[58, 6, 85]], tree.health(1)
    assert_equal [[36, 2, 28], [93, 3, 42]], tree.health(2)
  end
end
