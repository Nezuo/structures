# List
A `List` is a collection of values in a numerical order, where the same value may occur more than once.

---

## Constructor

### [List](list.md) List([Array](https://developer.roblox.com/en-us/articles/Table)<[any]()\><u>[?](https://developer.roblox.com/en-us/articles/Nil)</u> *`values`*)
Constructs a new `List`  object with the optional default values.

```lua
local myList = List({"a", "b", "c"})
```

---

## Properties

### [number](https://developer.roblox.com/en-us/articles/Numbers) size
Returns the number of values in the `List` object.

---

## Methods

### [void]() clear()
Removes all values from the `List` object.

### [any]() get([number](https://developer.roblox.com/en-us/articles/Numbers) *`index`*)
Returns the value at the given `index`, or `nil` if there is none.

### [number](https://developer.roblox.com/en-us/articles/Numbers)<u>[?](https://developer.roblox.com/en-us/articles/Nil)</u> indexOf([any]() *`value`*, [number](https://developer.roblox.com/en-us/articles/Numbers)<u>[?](https://developer.roblox.com/en-us/articles/Nil)</u> *`start`*)
Returns the first index at which the value can be found, or `nil` if it is not present. The search will start at the given `start` index if it exists, otherwise it will start at index 1.

### [any]() pop()
Removes the values at the end of the `List` object and returns it if it exists, otherwise it returns `nil`.

### [void]() push([any]() *`element`*)
Inserts `value` at the end of the `List` object.

### [boolean](https://developer.roblox.com/en-us/articles/Boolean) remove([any]() *`value`*)
Removes the first occurrence of `value`, returns true if it removed a value, otherwise false.

### [void]() set([number](https://developer.roblox.com/en-us/articles/Numbers) *`index`*, [any]() *`value`*)
Sets the value at `index` to the new `value`.

### [void]() splice([number](https://developer.roblox.com/en-us/articles/Numbers) *`start`*, [number](https://developer.roblox.com/en-us/articles/Numbers)<u>[?](https://developer.roblox.com/en-us/articles/Nil)</u> *`deleteCount`*, ...[any]()<u>[?](https://developer.roblox.com/en-us/articles/Nil)</u> *`items`*)
Changes the values of an array by removing or replacing existing values and/or adding new values in their place. The change starts at the `start` index and continues for `deleteCount`. If `deleteCount` is not specified, it default to 1. You can provide a list of items that will replace the values starting at the `start` index.

---

## Iteration methods

### entries()
Returns an iterator that contains a table of [*index*, *value*] for each index in the `List` object, in order.

### values()
Returns an iterator that contains the *value* for each index in the `List` object, in order.

## Examples

### Using the List object
```lua
local myList = List()

myList:push("a") -- List {"a"}
myList:push("b") -- List {"a", "b"}
myList:push("c") -- List {"a", "b", "c"}

myList.size -- 3

myList:get(2) -- "b"

myList:indexOf("a") -- 1

myList:remove("a") -- true, List {"b", "c"}
myList:remove("d") -- false, List {"b", "c"}

myList:pop() -- "c", List {"b"}

myList:set(1, "a")
myList:get(1) -- "a"

myList:push("a") -- List {"a"}
myList:push("b") -- List {"a", "b"}
myList:push("c") -- List {"a", "b", "c"}

myList:splice(2, 1, "x") -- List {"a", "x", "c"}
myList:splice(2, 1) -- List {"a", "c"}

myList:clear()

myList.size -- 0
```

### Iterating the List object
```lua
local myList = List()

myList:push("a")
myList:push("b")
myList:push("c")

for index, value in myList:entries() do
    print(index, value)
end

-- 1, a
-- 2, b
-- 3, c

for value in myList:values() do
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
| O(1)       | O(n)       | O(n)          | O(n)         |

### Space Complexity
O(n)