# LinkedList
A `LinkedList` is a linear collection of nodes that point to the next node in the collection.

---

## Constructor

### [LinkedList](linkedlist.md) LinkedList()
Constructs a new `LinkedList` object.

```lua
local myLinkedList = LinkedList()
```

---

## Properties

### [any]() head
Returns the [LinkedListNode](linkedlistnode.md) at the head of the `LinkedList` object.

### [number](https://developer.roblox.com/en-us/articles/Numbers) size
Returns the number of elements in the `LinkedList` object.

### [any]() tail
Returns the [LinkedListNode](linkedlistnode.md) at the tail of the `LinkedList` object.

---

## Methods

### [void]() append([any]() *`value`*)
Appends `value` to the end of the `LinkedList` object.

### [boolean](https://developer.roblox.com/en-us/articles/Boolean) has([any]() *`value`*)
Returns a boolean asserting whether the `LinkedList` object has `value` or not.

### [boolean](https://developer.roblox.com/en-us/articles/Boolean) isEmpty()
Returns a boolean asserting whether the `LinkedList` object is empty or not.

### [void]() prepend([any]() *`value`*)
Prepends `value` to the beginning of the `LinkedList` object.

### [boolean](https://developer.roblox.com/en-us/articles/Boolean) remove([any]() *`value`*)
Removes all occurences of `value` in the `LinkedList` object. Returns true if it removed any values, otherwise it returns false.

### [any]() removeHead()
Removes the head from the `LinkedList` and returns it if it has one, otherwise it returns nil.

### [any]() removeTail()
Removes the tail from the `LinkedList` and returns it if it has one, otherwise it returns nil.

---

## Iteration methods

### values()
Returns an iterator that contains the *value* for each [LinkedListNode](linkedlistnode.md) in the `LinkedList` object, in insertion order.

## Examples

### Using the LinkedList object
```lua
local myLinkedList = LinkedList()

myLinkedList:isEmpty() -- true

myLinkedList:append("a") -- LinkedList {"a"}
myLinkedList:append("b") -- LinkedList {"a", "b"}
myLinkedList:prepend("c") -- LinkedList {"c", "a", "b"}

myLinkedList.size -- 3

myLinkedList:isEmpty() -- false

myLinkedList:has("a") -- true

myLinkedList:append("a") -- LinkedList {"c", "a", "b", "a"}

myLinkedList:remove("a") -- true, LinkedList {"c", "b"}
myLinkedList:remove("d") -- false, LinkedList {"c", "b"}

myLinkedList:has("a") -- false

myLinkedList:append("a") -- LinkedList {"c", "b", "a"}

myLinkedList:removeTail() -- "a", LinkedList {"c", "b"}
myLinkedList:removeHead() -- "c", LinkedList {"b"}
myLinkedList:removeHead() -- "b", LinkedList {}

myLinkedList.size -- 0
```

### Iterating the LinkedList object
```lua
local myLinkedList = LinkedList()

myLinkedList:append("a")
myLinkedList:append("b")
myLinkedList:append("c")

for value in myLinkedList:values() do
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