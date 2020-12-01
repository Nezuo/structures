# Set

A `Set` stores a collection of values. A value in the `Set` **may only occur once**; it is unique in the `Set`'s collection.

---

## Constructor

### [Set](set.md) Set([Array](https://developer.roblox.com/en-us/articles/Table)<[any]()\><u>[?](https://developer.roblox.com/en-us/articles/Nil)</u> *`values`*)
Constructs a new `Set`  object with the optional default values.

```lua
local mySet = Set({"a", "b", "c"})
```

---

## Properties

### [number](https://developer.roblox.com/en-us/articles/Numbers) size

Returns the number of values in the `Set` object.

---

## Methods

### [boolean](https://developer.roblox.com/en-us/articles/Boolean) add([any]() *`value`*)

Adds `value` to the `Set` object. Returns false if `value` already exists in the `Set` object, otherwise it returns true.

### [void]() clear()

Removes all values from the `Set` object.

### [boolean](https://developer.roblox.com/en-us/articles/Boolean) has([any]() *`value`*)

Returns a boolean asserting whether `value` is present within the `Set` object.

### [boolean](https://developer.roblox.com/en-us/articles/Boolean) remove([any]() *`value`*)

Removes `value` from the `Set` object. Returns true if `value` exists in the `Set` object and was removed, otherwise it returns false.

---

## Iteration methods

### values()

Returns an iterator that contains an array of [*value*] for each value in the `Set` object, in an undefined order.

## Examples

### Using the Set object

```lua
local mySet = Set()

mySet:add(1) -- true, Set {1}
mySet:add(5) -- true, Set {1, 5}
mySet:add(5) -- false, Set {1, 5}
mySet:add("some text") -- true, Set {1, 5, "some text"}

mySet:has(1) -- true

mySet:remove(1) -- true
mySet:remove(1) -- false

mySet.size -- 2

mySet:clear()

mySet:has("some text") -- false
mySet.size -- 0
```

### Iterating the Set object

```lua
local mySet = Set({"a", "b", "c"})

for value in mySet:values() do
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
| O(1)       | O(1)       | O(1)          | O(1)         |

### Space Complexity

O(n)