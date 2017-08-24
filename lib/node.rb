class Node
  attr_reader :score, :movie
  attr_accessor :left, :right, :depth_counter

  def initialize(score, movie, depth_counter)
    @score = score
    @movie = movie
    @depth_counter = depth_counter
  end

  def insert(score, movie)
    if @score < score
      insert_right(score, movie)
    elsif @score > score
      insert_left(score, movie)
    end
  end

  def insert_left(score, movie)
    if @left.nil?
      @left = Node.new(score, movie, depth_counter + 1)
      @left.depth_counter
    else
      @left.insert(score, movie)
    end
  end

  def insert_right(score, movie)
    if @right.nil?
      @right = Node.new(score, movie, depth_counter + 1)
      @right.depth_counter
    else
      @right.insert(score, movie)
    end
  end

  def include?(score)
    if @score == score
      true
    elsif @right.nil? && @left.nil?
      false
    elsif @right.nil? || @score > score
      @left.include?(score)
    elsif @left.nil? || @score < score
      @right.include?(score)
    end
  end

  def depth_of(score)
    if @score == score
      @depth_counter
    elsif @right.nil? && @left.nil?
      nil
    elsif @right.nil? || @score >= score
      @left.depth_of(score)
    elsif @left.nil? || @score <= score
      @right.depth_of(score)
    end
  end

  def make_hash
    {@movie=>@score}
  end

  def min
    if @left.nil?
      make_hash
    else
      @left.min
    end
  end

  def max
    if @right.nil?
      make_hash
    else
      @right.min
    end
  end

  def sort_left
    if @left.nil? && @right.nil?
      [make_hash]
    elsif @left.nil?
      [make_hash] + @right.sort_left
    else
      @left.sort_left
    end
  end

  def sort_right
      @right.sort_left
  end

  def total_nodes
    if @left.nil? && @right.nil?
      1
    elsif @left.nil?
      return (1 + @right.total_nodes)
    elsif @right.nil?
      return (1 + @left.total_nodes)
    else
      return (1 + @left.total_nodes + @right.total_nodes)
    end
  end

  def health(depth)
    if @depth_counter == depth
      [@score, total_nodes, total_nodes]
    elsif @left.nil? && @right.nil?
      nil
    elsif @left.nil?
      @right.health(depth)
    elsif @right.nil?
      @left.health(depth)
    else
      [@left.health(depth), @right.health(depth)]
    end
  end
end
