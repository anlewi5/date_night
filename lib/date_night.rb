#   def depth_of(score)
#     #return depth or nil if doesn't exist
#   end
#
#   def include?(score)
#     #return boolean, true if score is there
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

class BinarySearchTree

  def load(file)
    root = Node.new(first_line_score_and_movie)
    #iterate through list adding new nodes to root
  end

  def insert(score, movie)
    if @score < score
      insert_right(score, movie_title)
    elsif @score > score
      insert_left(score, movie_title)
    else
      "that score already exists"
      #clarify with instructors what this should be
    end
    return depth_of(score)
  end

  def insert_left(score, movie_title)
    if left.nil?
      @left = Node.new(score, movie_title)
    else
      @left.insert(score, movie_title)
    end
  end

  def insert_right(score, movie_title)
    if right.nil?
      @right = Node.new(score, movie_title)
    else
      @right.insert(score, movie_title)
    end
  end

end

class Node

  attr_reader :score, :movie_title
  attr_accessor :left, :right

  def initialize(score, movie)
    @score = score
    @movie = movie
    @left = nil
    @right = nil
  end

end
