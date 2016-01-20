
require 'pry-byebug'
Node = Struct.new(:name, :value, :next)

class LinkedList 

  attr_accessor :head, :last
  attr_reader :length

  def initialize(first_node = nil)
    @head = first_node
    @last = first_node
    @length = 0
  end

  def add_first_node(name, value)
    @head = Node.new(name, value, nil)
    @last = @head
  end

  def add_node(name, value)

    if @head.nil?
      add_first_node(name, value)
    else
      new_node = Node.new(name, value)
      @last.next = new_node
      @last = new_node
    end
    @length += 1
    #puts "Added node with value: #{data}"
  end

  def remove_node(index)
    counter = 0
    current_node = @head
    prev_node = nil

    while counter < index
      prev_node = current_node
      current_node = current_node.next
      counter += 1
    end

    # now perform the removal (cutting out current_node)
    next_node = current_node.next
    current_node.next = nil       # clear the pointer
    prev_node.next = next_node
    @length -= 1
    #puts "Removed node at index #{index} with value: #{current_node.data}"
  end

  def find_node(index)
    counter = 0
    current_node = @head

    while counter < index
      current_node = current_node.next
      counter += 1
    end

    #puts "Found node at index #{index} with value: #{current_node.data}"
    current_node
  end

  def print_list
    counter = 0
    current_node = @head
    loop do
      puts "Node at index #{counter}: #{current_node.value}"
      break if current_node.next.nil?
      current_node = current_node.next
      counter += 1
    end
  end


	def get_last
    current_node = @head
		until current_node.next.nil?
      current_node = current_node.next
		end
    current_node
	end

	# def length
	# 	counter = 1
	# 	current_node = @head
	# 	while !current_node.next.nil?
	# 		current_node = current_node.next
	# 		counter += 1
	# 	end
	# 	counter
	# end
end


#make a new Stack instance
# stack.push(current_node)
#new_list.push(current_node)


# link = LinkedList.new
# link.add_node("first")
# link.add_node("second")
# link.add_node("third")
# puts link.length
# # print "Printing list: #{link.print_list}"
# print "Reverse: #{link.reverse}"
# # print "Printing list: #{link.print_list}"
# # print link.length
