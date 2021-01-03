# DoublyLinkedList
A `DoublyLinkedList` is a linear collection of nodes that point to the next and previous node in the collection.

---

## Constructor

### [DoublyLinkedList](doublylinkedlist.md) DoublyLinkedList()
Constructs a new `DoublyLinkedList` object.

```lua
local myDoublyLinkedList = DoublyLinkedList()
```

---

## Properties

### [any]() head
Returns the [DoublyLinkedListNode](doublylinkedlistnode.md) at the head of the `DoublyLinkedList` object.

### [number](https://developer.roblox.com/en-us/articles/Numbers) size
Returns the number of elements in the `DoublyLinkedList` object.

### [any]() tail
Returns the [DoublyLinkedListNode](doublylinkedlistnode.md) at the tail of the `DoublyLinkedList` object.

---

## Methods

### [void]() append([any]() *`value`*)
Appends `value` to the end of the `DoublyLinkedList` object.

### [boolean](https://developer.roblox.com/en-us/articles/Boolean) has([any]() *`value`*)
Returns a boolean asserting whether the `DoublyLinkedList` object has `value` or not.

### [boolean](https://developer.roblox.com/en-us/articles/Boolean) isEmpty()
Returns a boolean asserting whether the `DoublyLinkedList` object is empty or not.

### [void]() prepend([any]() *`value`*)
Prepends `value` to the beginning of the `DoublyLinkedList` object.

### [boolean](https://developer.roblox.com/en-us/articles/Boolean) remove([any]() *`value`*)
Removes all occurences of `value` in the `DoublyLinkedList` object. Returns true if it removed any values, otherwise it returns false.

### [any]() removeHead()
Removes the head from the `DoublyLinkedList` and returns it if it has one, otherwise it returns nil.

### [any]() removeTail()
Removes the tail from the `DoublyLinkedList` and returns it if it has one, otherwise it returns nil.

!!! note
    This operation has a time complexity of O(1) where as the [LinkedList](linkedlist.md) implementation has a time complexity of O(n).

---

## Iteration methods

### values()
Returns an iterator that contains the *value* for each [DoublyLinkedListNode](doublylinkedlistnode.md) in the `DoublyLinkedList` object, in insertion order.

## Examples

### Using the DoublyLinkedList object
```lua
local myDoublyLinkedList = DoublyLinkedList()

myDoublyLinkedList:isEmpty() -- true

myDoublyLinkedList:append("a") -- DoublyLinkedList {"a"}
myDoublyLinkedList:append("b") -- DoublyLinkedList {"a", "b"}
myDoublyLinkedList:prepend("c") -- DoublyLinkedList {"c", "a", "b"}

myDoublyLinkedList.size -- 3

myDoublyLinkedList:isEmpty() -- false

myDoublyLinkedList:has("a") -- true

myDoublyLinkedList:append("a") -- DoublyLinkedList {"c", "a", "b", "a"}

myDoublyLinkedList:remove("a") -- true, DoublyLinkedList {"c", "b"}
myDoublyLinkedList:remove("d") -- false, DoublyLinkedList {"c", "b"}

myDoublyLinkedList:has("a") -- false

myDoublyLinkedList:append("a") -- DoublyLinkedList {"c", "b", "a"}

myDoublyLinkedList:removeTail() -- "a", DoublyLinkedList {"c", "b"}
myDoublyLinkedList:removeHead() -- "c", DoublyLinkedList {"b"}
myDoublyLinkedList:removeHead() -- "b", DoublyLinkedList {}

myDoublyLinkedList.size -- 0
```

### Iterating the DoublyLinkedList object
```lua
local myDoublyLinkedList = DoublyLinkedList()

myDoublyLinkedList:append("a")
myDoublyLinkedList:append("b")
myDoublyLinkedList:append("c")

for value in myDoublyLinkedList:values() do
    print(value)
end

-- a
-- b
-- c
```

## Complexities

### Time Complexity
| **Access** | **Search** | **Insertion** | **Deletion** |
|------------|------------|---------------|--------------|
| O(n)       | O(n)       | O(1)          | O(n)         |

### Space Complexity
O(n)