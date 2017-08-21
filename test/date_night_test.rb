gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/date_night'

class TestDateNight < Minitest::Test

  def test_binary_search_tree_class_exists
    tree = BinarySearchTree.new
    assert_instance_of BinarySearchTree, tree
  end

  def test_node_class_exists
    node = Node.new(12, 18)
    assert_instance_of Node, node
  end

  def test_it_inserts_new_movie
    skip
    tree = BinarySearchTree.new
    assert_equal tree, 123
    a = tree.insert(61, "Bill & Ted's Excellent Adventure")
    b = tree.insert(16, "Johnny English")
    c = tree.insert(92, "Sharknado 3")
    d = tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equals 0, a
    assert_equals 1, b
    assert_equals 1, c
    assert_equals 2, d
  end

  def test_it_checks_if_score_exits
    skip
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert tree.include?(16)
    refute tree.include?(72)
  end

  def test_it_checks_score_depth
    skip
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert tree.depth_of(92)
    assert tree.depth_of(50)
    assert_equals nil, tree.depth_of(72)
  end

  def test_it_finds_max_score
    skip
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equals ({"Sharknado 3"=>92}), tree.max
  end

  def test_it_finds_min_score
    skip
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equals ({"Johnny English"=>16}), tree.min
  end

  def test_it_sorts_scores_ascending
    skip
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    sorted = [{"Johnny English"=>16}, {"Hannibal Buress: Animal Furnace"=>50}, {"Bill & Ted's Excellent Adventure"=>61}, {"Sharknado 3"=>92}]

    assert_equals sorted, tree.sort
  end

  def test_it_loads_file
    skip
    tree = BinarySearchTree.new

    assert_equals number, tree.load(text_file)
  end

  def test_it_reports_health
    skip
    tree = BinarySearchTree.new
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")

    assert_equals [[98, 7, 100]], tree.health(0)
    assert_equals [[58, 6, 85]], tree.health(1)
    assert_equals [[36, 2, 28], [93, 3, 42]], tree.health(2)
  end
end
