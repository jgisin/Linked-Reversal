require_relative './linkedlist.rb'
require 'pry-byebug'

def reverse
  #For case of linked list length 0 or 1
  return nil if @head.nil?
  return @head if @head.next.nil?
  #Placeholder for next item in list
  next_node = nil
  #Current Node, changed with each iteration of loop
  current_node = @head.next
  #New pointer of current_node.next
  previous_node = @head

  until current_node.next.nil? do
    #Store next item in list
    next_node = current_node.next
    #New pointer for current node next to previous node
    current_node.next = previous_node
    #Set previous for next iteration to current
    previous_node = current_node
    #Set current node to next node to move through list
    current_node = next_node
  end

  #Remove last node.next pointer
  @head.next = nil
  #Set final pointer
  current_node.next = previous_node
  #Reset head to end of list
  @head = current_node

end

def merge(left, right)
  # return head2 if head1.nil?
  # return head1 if head2.nil?

  # if head1.value <= head2.value
  #   result = head1
  #   result.next = sort(head1.next, head2)
  # else
  #   result = head2
  #   result.next = sort(head1, head2.next)
  # end
  # result
left_node = left
right_node = right

duphead = Node.new(nil, nil)
current_node = duphead

  until left_node.nil? || right_node.nil?
    if left_node.nil?
      current_node.next = Node.new(right_node.value, nil)
      right_node = right_node.next
      current_node = current_node.next
    elsif right_node.nil?
      current_node.next = Node.new(left_node.value, nil)
      left_node = left_node.next
      current_node = current_node.next
    else
      if left_node.value < right_node.value
        current_node.next = Node.new(left_node.value, nil)
        left_node = left_node.next
        current_node = current_node.next
      elsif left_node.value == right_node.value
        current_node.next = Node.new(left_node.value, nil)
        current_node.next.next = Node.new(right_node.value, nil)
        current_node = current_node.next.next
        left_node = left_node.next
        right_node = right_node.next
      else
        current_node.next = Node.new(right_node.value, nil)
        right_node = right_node.next
        current_node = current_node.next 
      end
    end   
  end
    duphead.next    
end

def sort(head)
  return head if head.nil? || head.next.nil?


  # node_a = head
  # node_b = head.next

  # until node_b.nil?
  #   head = head.next
  #   node_b = (node_b.next)
  # end

  # node_b = head.next
  # head.next = nil

  # return merge(sort(node_a), sort(node_b))
  #Get length of list
  current_node = head
  node_left = head
  node_right = nil
  length = 0
  until current_node.next.nil?
    length += 1
    current_node = current_node.next
  end

  # #Find Middle Node
  # middle_node = head
  # (length/2).times do 
  #   middle_node = middle_node.next
  # end
  mid_count = length/2
  counter = 0

  until current_node.nil?
    counter += 1
    next_node = current_node.next

    if counter == mid_count
      current_node.next = nil
      node_right = next_node
    end
    current_node = next_node
  end

    list_left = sort(node_left)
    list_right = sort(node_right)

  merge(list_left, list_right)

end


def MergeLists(list1, list2) 
  if list1.nil?
    return list2 
  elsif list2.nil?
    return list1 
  end

  if list1.value < list2.value 
    list1.next = MergeLists(list1.next, list2)
    return list1
  else 
    list2.next = MergeLists(list2.next, list1)
    return list2
  end
end

# list = LinkedList.new(Node.new("2", 2, nil))
# list.add_node("4", 4)
# list.add_node("6", 6)
# list.add_node("8", 8)
# list.add_node("10", 10)
# list.add_node("12", 12)
# list.add_node("14", 14)
# # list.print_list
# # list.reverse
# # list.print_list

# list1 = LinkedList.new(Node.new("1", 1, nil))
# list.add_node("3", 3)
# list.add_node("5", 5)
# list.add_node("7", 7)
# list.add_node("9", 9)
# list.add_node("11", 11)
# list.add_node("13", 13)
# binding.pry
# puts MergeLists(list1.head, list.head)

list2 = LinkedList.new(Node.new("3", 3, nil))
list2.add_node("1", 1)
list2.add_node("5", 5)
list2.add_node("2", 2)
list2.add_node("9", 9)
list2.add_node("4", 4)
list2.add_node("6", 6)
sort(list2.head)

