#   def depth_of(score)
#     #return depth or nil if doesn't exist
#   end
#
#   def max
#     #return highest movie and score: {movie_title, score}
#   end
#
#   def min
#     #return lowest movie and score: {movie_title, score}
#   end
#
#   def sort
#     #[{movie_title, score}, {movie_title, score}, {movie_title, score}, etc]
#   end
#
#   def load(movies_txt)
#     #number of movies added (ignore/don't add score repeats)
#   end
#
# end

require 'pry'

class BinarySearchTree

  # def load(file)
  #   @root = Node.new(first_line_score_and_movie)
  #   #iterate through list adding new nodes to root
  #   #return number of movies added (ignore/don't add score repeats)
  # end

  def insert(score, movie)
    if @root.nil?
      @root = Node.new(score, movie)
      return 0
    else
      @root.insert(score, movie)
    end
  end

  def include?(score)
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
    if @root.nil? || (@root.right.nil? && @root.left.nil?)
      return nil
    elsif @root.score == score
      return 0
    else
      @root.depth_of(score)
    end
  end

end

class Node
  attr_reader :score, :movie_title
  attr_accessor :left, :right, :depth_counter

  #depth_counter at -2 for now because adding left and right nodes to the root add two
  def initialize(score, movie, depth_counter = (-2))
    @score = score
    @movie = movie
    @left = nil
    @right = nil
    @depth_counter = depth_counter
  end

  def insert(score, movie_title)
    if @score < score
      insert_right(score, movie_title)
    elsif @score > score
      insert_left(score, movie_title)
    end
  end

  def insert_left(score, movie_title)
    if left.nil?
      @left = Node.new(score, movie_title, @depth_counter += 1)
      @left.depth_counter += 1
      return @left.depth_counter
    else
      @left.insert(score, movie_title)
    end
  end

  def insert_right(score, movie_title)
    if @right.nil?
      @right = Node.new(score, movie_title, @depth_counter += 1)
      @right.depth_counter += 1
      return @right.depth_counter
    else
      @right.insert(score, movie_title)
    end
  end

  def include?(score)
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
