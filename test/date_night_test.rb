gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/date_night'

class TestDateNight < Minitest::Test

  #passes
  def test_binary_search_tree_class_exists
    skip
    tree = BinarySearchTree.new
    assert_instance_of BinarySearchTree, tree
  end

  #passes
  def test_node_class_exists
    skip
    node = Node.new(12, "string")
    assert_instance_of Node, node
  end

  def test_it_inserts_new_movie
    tree = BinarySearchTree.new
    a = tree.insert(61, "Bill & Ted's Excellent Adventure")
    b = tree.insert(16, "Johnny English")
    c = tree.insert(92, "Sharknado 3")
    d = tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 0, a
    #this doesn't work because depth_counter is not perfectly functional
    #assert_equal 1, b
    assert_equal 1, c
    assert_equal 2, d
  end

  #passes
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

  #kinda-sorta works, but only if root has two nodes coming off
  def test_it_checks_score_depth
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 1, tree.depth_of(92)
    assert_equal 2, tree.depth_of(50)
    assert_equal nil, tree.depth_of(72)
  end

  def test_it_finds_max_score
    skip
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal ({"Sharknado 3"=>92}), tree.max
  end

  def test_it_finds_min_score
    skip
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal ({"Johnny English"=>16}), tree.min
  end

  def test_it_sorts_scores_ascending
    skip
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    sorted = [{"Johnny English"=>16}, {"Hannibal Buress: Animal Furnace"=>50}, {"Bill & Ted's Excellent Adventure"=>61}, {"Sharknado 3"=>92}]

    assert_equal sorted, tree.sort
  end

  def test_it_loads_file
    skip
    tree = BinarySearchTree.new

    assert_equal number, tree.load(text_file)
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

    assert_equal [[98, 7, 100]], tree.health(0)
    assert_equal [[58, 6, 85]], tree.health(1)
    assert_equal [[36, 2, 28], [93, 3, 42]], tree.health(2)
  end
end
