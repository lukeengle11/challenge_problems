from typing import Optional


class Node:
    def __init__(self, value: int):
        self.value = value
        self.next = None

    def __str__(self) -> str:
        return f"Node({self.value})"


class LinkedList:
    def __init__(self):
        self.head = None
        self.tail = None
        self.size = 0

    def add(self, value: int) -> None:
        new_node = Node(value)
        if not self.head:
            self.head = new_node
            self.tail = new_node
        else:
            self.tail.next = new_node
            self.tail = new_node
        self.size += 1
    
    def delete(self, value: int) -> None:
        """ Deletes the first instance of the value in the linked list """
        node = self.head
        previous_node = None
        if self.is_empty():
            return
        # process the head before entering the while loop
        if node.value == value:
            self.head = node.next
            if not self.head or not self.head.next:
                self.tail = None
            self.size -= 1
            return
        # Look for the first instance of the value
        while node:
            if node.value == value:
                if not node.next:
                    self.tail = previous_node
                previous_node.next = node.next
                self.size -= 1
                break
            previous_node = node
            node = node.next

    def search(self, value: str) -> Optional[Node]:
        node = self.head
        return_node = None
        while node:
            if node.value == value:
                return_node = node
                break
            node = node.next
        
        return return_node

    def length(self) -> int:
        return self.size

    def is_empty(self) -> bool:
        if not self.head:
            return True
        return False

    def __str__(self) -> str:
        node = self.head
        return_str = ""
        while node:
            return_str += f"{node.value} -> "
            node = node.next
        return return_str
    
    def __repr__(self) -> str:
        return self.__str__()


ll = LinkedList()
ll.add(1)
ll.add(5)
ll.add(7)
print(ll)
ll.delete(1)
print(ll)
print(ll.search(8))
print(ll.length())
