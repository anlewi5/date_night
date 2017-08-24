require 'pry'
require_relative './node.rb'

class BinarySearchTree

  #look up smart vs. dumb nodes

  def load(text_file)
    absolute_path = File.absolute_path(text_file)
    file = File.open(absolute_path)
    movie_count = 0
    file.each do |line|
      movie_count += 1
      line_array = line.chomp.split(", ")
      insert(line_array[0].to_i, line_array[1])
    end
    movie_count
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
  end

  def total_nodes
    if @root.nil?
      0
    else
      return @root.total_nodes
    end
  end

  def percent_tree(health_array)
    if health_array.nil?
      nil
    else
      health_array.map do |node|
        node[2] = 100 * (node[2]/total_nodes)
      end
    end
    health_array
  end

  def health(depth)
    if @root.nil?
      nil
    else
      @root.health(depth).percent_tree
    end
  end
end
