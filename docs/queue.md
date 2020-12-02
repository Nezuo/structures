# Queue

A `Queue` is an ordered list of elements where an element is insertion takes place at the end of the list and where removal takes place at the front of the list, folllowing the first-in, first-out (FIFO) principle.

---

## Constructor

### [Queue](queue.md) Queue()
Constructs a new `Queue` object.

```lua
local myQueue = Queue()
```

---

## Properties

### [number](https://developer.roblox.com/en-us/articles/Numbers) size

Returns the number of elements in the `Queue` object.

---

## Methods

### [any]() dequeue()

Removes the element at the front of the `Queue` object and returns its value if it exists, otherwise it returns `nil`.

### [void]() enqueue([any]() *`element`*)

Inserts `element` at the end of the `Queue` object.

### [boolean](https://developer.roblox.com/en-us/articles/Boolean) isEmpty()

Returns a boolean asserting whether the `Queue` object is empty or not.

### [any]() peek()

Returns the element at the front of the `Queue` object if it exists, otherwise it returns `nil`.

---

## Iteration methods

### elements()

Returns an iterator that contains the *value* for each element in the `Queue` object, in insertion order.

## Examples

### Using the Queue object

```lua
local myQueue = Queue()

myQueue:isEmpty() -- true

myQueue:enqueue("a") -- Queue {"a"}
myQueue:enqueue("a") -- Queue {"a", "a"}
myQueue:enqueue("b") -- Queue {"a", "a", "b"}

myQueue.size -- 3

myQueue:isEmpty() -- false

myQueue:peek() -- "a"

myQueue:dequeue() -- "a", Queue {"a", "b"}
myQueue:dequeue() -- "a", Queue {"b"}

myQueue:peek() -- "b"

myQueue:dequeue() -- "b", Queue {}

myQueue.size -- 0
```

### Iterating the Queue object

```lua
local myQueue = Queue()

myQueue:enqueue("a")
myQueue:enqueue("b")
myQueue:enqueue("c")

for value in myQueue:elements() do
    print(key, value)
end

-- a
-- b
-- c
```

## Complexities

### Time Complexity

| **Access** | **Search** | **Insertion** | **Deletion** |
|------------|------------|---------------|--------------|
| O(1)       | O(n)       | O(1)          | O(1)         |

### Space Complexity

O(n)