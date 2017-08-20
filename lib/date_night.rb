class BinarySearchTree

  def initialize
    @score = 0
    @movie_title = ''
  end

  def insert(score, movie_title)
    if @score > score
      insert_right(score)
    elsif @score < score
      insert_left(score)
    else
      "that score already exists"
      #clarify with instructors what this should be
    end
    return depth_of(score)
  end

  def insert_left(score, movie_title)
    if left
      left.insert(score, movie_title)
    else
      self.left = Node.new(score, movie_title)
    end
  end

  def insert_right(score, movie_title)
    if right
      right.insert(score, movie_title)
    else
      self.right = Node.new(score, movie_title)
    end
  end

  def depth_of(score)
    #return depth or nil if doesn't exist
  end

  def include?(score)
    #return boolean, true if score is there
  end

  def max
    #return highest movie and score: {movie_title, score}
  end

  def min
    #return lowest movie and score: {movie_title, score}
  end

  def sort
    #[{movie_title, score}, {movie_title, score}, {movie_title, score}, etc]
  end

  def load(movies_txt)
    #number of movies added (ignore/don't add score repeats)
  end

end

class Node

  attr_reader :score, :movie_title, :depth
  attr_accessor :left, :right

  def initialize(score, movie_title)
    @score = score
    @movie_title = movie_title
    @left = Node.new(score, movie_title)
    @right = Node.new(score, movie_title)
    @depth = 0
  end

end



# class Node
#
#   def initialize(score, movie_title)
#     @score = score
#     @movie_title = movie_title
#     @left = EmptyNode.new
#     @right = EmptyNode.new
#     @depth = 0
#   end
#
#   def include?
#     case score
#     when score > base_score
#       then left.include?(score)
#     when score < base_score
#       then right.include?(score)
#     when score == base_score
#       then true # the current node is equal to the value
#     end
#   end
#
#   def insert_left(score)
#     if left
#       left.insert(score)
#     else
#       self.left = Node.new(score)
#     end
#   end
#
#   def insert_right(score)
#     if right
#       right.insert(score)
#     else
#       self.right = Node.new(score)
#     end
#   end
#
# end
#
# class EmptyNode
#
#   def to_hash
#     {}
#   end
#
#   def include?(*)
#     false
#   end
#
#   def insert(*)
#     false
#   end
#
# end
