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

#loads and puts file for now
  def load(text_file)
    file = File.open(text_file)
    file_lines = file.read.split("\n")
    puts file_lines
  #   @root = Node.new(first_line_score_and_movie)
  #   #iterate through list adding new nodes to root
  #   #return number of movies added (ignore/don't add score repeats)
  end

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
      true
    elsif @root.nil? || (@root.right.nil? && @root.left.nil?)
      false
    else
      @root.include?(score)
    end
  end

  def depth_of(score)
    if @root.nil? || (@root.right.nil? && @root.left.nil?)
      nil
    elsif @root.score == score
      0
    else
      @root.depth_of(score)
    end
  end

  def min
    if @root.nil?
      nil
    else
      @root.min
    end
  end

  def max
    if @root.nil?
      nil
    else
      @root.max
    end
  end

  def sort
    if @root.nil?
      nil
    else
      @root.sort_left + [@root.make_hash] + @root.sort_right
    end
    # => [{movie, score}, {movie, score}, {movie, score}, etc]
  end
end
