#   def depth_of(score)
#     #return depth or nil if doesn't exist
#   end
#
#   def max
#     #return highest movie and score: {movie, score}
#   end
#
#   def min
#     #return lowest movie and score: {movie, score}
#   end
#
#   def sort
#     #[{movie, score}, {movie, score}, {movie, score}, etc]
#   end
#
#   def load(movies_txt)
#     #number of movies added (ignore/don't add score repeats)
#   end
#
# end

require 'pry'

class BinarySearchTree

  #look up smart vs. dumb nodes

  # def load(file)
  #   @root = Node.new(first_line_score_and_movie)
  #   #iterate through list adding new nodes to root
  #   #return number of movies added (ignore/don't add score repeats)
  # end

  def insert(score, movie)
    binding.pry
    if @root.nil?
      @root = Node.new(score, movie, 0)
      return @root.depth_counter
    else
      @root.insert(score, movie)
    end
  end

  def include?(score)
    binding.pry
    if @root.score == score
      return true
    elsif @root.nil? || (@root.right.nil? && @root.left.nil?)
      return false
    elsif @root.right.nil? || @root.score > score
      @root.left.include?(score)
    elsif @root.left.nil? || @root.score < score
      @root.right.include?(score)
    end
  end

  def depth_of(score)
    binding.pry
    if @root.nil? || (@root.right.nil? && @root.left.nil?)
      return nil
    elsif @root.score == score
      return 0
    else
      @root.depth_of(score)
    end
  end

end

#make new file
#make new test file foe node class
class Node
  attr_reader :score, :movie
  attr_accessor :left, :right, :depth_counter

  def initialize(score, movie, depth_counter)
    binding.pry
    @score = score
    @movie = movie
    @left = nil
    @right = nil
    @depth_counter = depth_counter
  end

  def insert(score, movie)
    binding.pry
    if @score < score
      insert_right(score, movie)
    elsif @score > score
      insert_left(score, movie)
    end
  end

  def insert_left(score, movie)
    binding.pry
    if left.nil?
      @left = Node.new(score, movie, depth_counter + 1)
      return @left.depth_counter
    else
      @left.insert(score, movie)
    end
  end

  def insert_right(score, movie)
    binding.pry
    if @right.nil?
      @right = Node.new(score, movie, depth_counter + 1)
      return @right.depth_counter
    else
      @right.insert(score, movie)
    end
  end

  def include?(score)
    binding.pry
    if @score == score
      return true
    elsif @right.nil? && @left.nil?
      return false
    elsif @right.right.nil? || @right.score > score
      @left.include?(score)
    elsif @left.left.nil? || @left.score < score
      @right.include?(score)
    end
  end

  def depth_of(score)
    binding.pry
    if @score == score
      return @depth_counter
    elsif @right.nil? && @left.nil?
      return nil
    elsif @right.nil? || @score >= score
      @left.depth_of(score)
    elsif @left.nil? || @score <= score
      @right.depth_of(score)
    end
  end
end
