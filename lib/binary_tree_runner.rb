require_relative './binary_tree.rb'
require_relative './node.rb'

tree = BinarySearchTree.new

puts tree.load("/Users/annalewis/turing/1module/projects/date_night/movies/movies.txt")
