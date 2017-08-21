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
#   def health
#     we'll get there
#   end

require 'pry'
require_relative './node.rb'

class BinarySearchTree

  #look up smart vs. dumb nodes

  # def load(file)
  #   @root = Node.new(first_line_score_and_movie)
  #   #iterate through list adding new nodes to root
  #   #return number of movies added (ignore/don't add score repeats)
  # end

  def insert(score, movie)
    if @root.nil?
      @root = Node.new(score, movie, 0)
      return @root.depth_counter
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

  def sort
    @sorted_scores = []
    #[{movie, score}, {movie, score}, {movie, score}, etc]
  end
end
