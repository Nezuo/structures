# Stack
A `Stack` is an ordered list of elements where insertion and removal take place at the end of the list, folllowing the last-in, first-out (LIFO) principle.

---

## Constructor

### [Stack](stack.md) Stack()
Constructs a new `Stack` object.

```lua
local myStack = Stack()
```

---

## Properties

### [number](https://developer.roblox.com/en-us/articles/Numbers) size
Returns the number of elements in the `Stack` object.

---

## Methods

### [boolean](https://developer.roblox.com/en-us/articles/Boolean) isEmpty()
Returns a boolean asserting whether the `Stack` object is empty or not.

### [any]() peek()
Returns the element at the end of the `Stack` object if it exists, otherwise it returns `nil`.

### [any]() pop()
Removes the element at the end of the `Stack` object and returns its value if it exists, otherwise it returns `nil`.

### [void]() push([any]() *`element`*)
Inserts `element` at the end of the `Stack` object.

---

## Iteration methods

### elements()
Returns an iterator that contains the *value* for each element in the `Stack` object, in insertion order.

## Examples

### Using the Stack object
```lua
local myStack = Stack()

myStack:isEmpty() -- true

myStack:push("a") -- Stack {"a"}
myStack:push("a") -- Stack {"a", "a"}
myStack:push("b") -- Stack {"a", "a", "b"}

myStack.size -- 3

myStack:isEmpty() -- false

myStack:peek() -- "b"

myStack:pop() -- "b", Stack {"a", "a"}
myStack:pop() -- "a", Stack {"a"}

myStack:peek() -- "a"

myStack:pop() -- "a", Stack {}

myStack.size -- 0

myStack:pop() -- nil
```

### Iterating the Stack object

```lua
local myStack = Stack()

myStack:push("a")
myStack:push("b")
myStack:push("c")

for value in myStack:elements() do
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