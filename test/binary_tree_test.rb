gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_tree'

class TestDateNight < Minitest::Test

#change BinarySearchTree in tests
  attr_reader :tree

  def setup
    @tree = BinarySearchTree.new
  end

  #passes
  def test_binary_search_tree_class_exists
    skip
    assert_instance_of BinarySearchTree, tree
  end

#don't say it; please clarify (test_methodname_whatdoesitdo?)
  def test_insert_adds_new_movie
    #name variables better
    a = tree.insert(61, "Bill & Ted's Excellent Adventure")
    b = tree.insert(16, "Johnny English")
    c = tree.insert(92, "Sharknado 3")
    d = tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 0, a
    assert_equal 1, b
    assert_equal 1, c
    assert_equal 2, d
  end

  #passes
  def test_include_checks_if_score_exits
    skip
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert tree.include?(16)
    refute tree.include?(72)
  end

  def test_depth_of_checks_score_depth
    skip
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 1, tree.depth_of(92)
    assert_equal 2, tree.depth_of(50)
    assert_equal nil, tree.depth_of(72)
  end

  def test_max_finds_max_score
    skip
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal ({"Sharknado 3"=>92}), tree.max
  end

  def test_min_finds_min_score
    skip
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal ({"Johnny English"=>16}), tree.min
  end

  def test_sort_sorts_scores_ascending
    skip
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    sorted = [{"Johnny English"=>16}, {"Hannibal Buress: Animal Furnace"=>50}, {"Bill & Ted's Excellent Adventure"=>61}, {"Sharknado 3"=>92}]

    assert_equal sorted, tree.sort
  end

  def test_load_loads_file_into_tree
    skip

    assert_equal number, tree.load(text_file)
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
