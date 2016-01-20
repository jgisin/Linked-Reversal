require_relative './linkedlist.rb'



def reverse

end






list = LinkedList.new(Node.new("2", 2, nil))
list.add_node("4", 4)
list.add_node("6", 6)
list.add_node("8", 8)
list.add_node("10", 10)
list.add_node("12", 12)
list.add_node("14", 14)
list.print_list
list.reverse
list.print_list


