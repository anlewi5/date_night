# example from online
# each takes data and a pointer to the next node
# class Node
#   attr_accessor :val, :next
#
#   def initialize(val, next_node)
#       @val = val
#       @next = next_node
#   end
# end
#
# class LinkedList
#
#   def initialize(val)
#     @head = Node.new(val, nil)
#   end
#
#   def add(val)
#     current = @head
#     while current.next != nil
#       current = current.next
#     end
#     current.next = Node.new(val, nil)
#   end
#
#   def delete(val)
#     current.next = @head
#     if current.val = val
#       @head = current.next
#     else
#       while (current.next != nil) && (current.next.val != val)
#         current = current.next
#       end
#       unless current.next == nil
#         current.next = current.next.next
#       end
#     end
#   end
#
#   def return_list
#     elements = []
#     current = @head
#     while current.next != nil
#       elements << current
#       current = current.next
#     end
#     elements << current
#   end
# end


class BinarySearchTree

  def initialize

  end

  def insert(score, movie_title)
    #return depth of new node (integer)
  end

  def include?(score)
    #return boolean, true if score is there
  end

  def depth_of(score)
    #return depth of tree where score is (integer)
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

class MovieNode

  def initialize(score, movie_title)
    @score = score
    @movie_title = movie_title
    @left = EmptyNode.new
    @right = EmptyNode.new
  end

end

class EmptyNode

  def to_a
    []
  end

  def include?(*)
    false
  end

end
