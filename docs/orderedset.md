# OrderedSet
An `OrderedSet` stores a collection of values. A value in the `OrderedSet` **may only occur once**; it is unique in the `OrderedSet`'s collection. The `OrderedSet` is different to the [`Set`](set.md) data structure because you can iterate over its elements in insertion order.

---

## Constructor

### [OrderedSet](orderedset.md) OrderedSet([Array](https://developer.roblox.com/en-us/articles/Table)<[any]()\><u>[?](https://developer.roblox.com/en-us/articles/Nil)</u> *`values`*)
Constructs a new `OrderedSet`  object with the optional default values.

```lua
local myOrderedSet = OrderedSet({"a", "b", "c"})
```

---

## Properties

### [number](https://developer.roblox.com/en-us/articles/Numbers) size
Returns the number of values in the `OrderedSet` object.

---

## Methods

### [boolean](https://developer.roblox.com/en-us/articles/Boolean) add([any]() *`value`*)
Adds `value` to the `OrderedSet` object. Returns false if `value` already exists in the `OrderedSet` object, otherwise it returns true.

### [void]() clear()
Removes all values from the `OrderedSet` object.

### [boolean](https://developer.roblox.com/en-us/articles/Boolean) has([any]() *`value`*)
Returns a boolean asserting whether `value` is present within the `OrderedSet` object.

### [boolean](https://developer.roblox.com/en-us/articles/Boolean) remove([any]() *`value`*)
Removes `value` from the `OrderedSet` object. Returns true if `value` existed in the `OrderedSet` object and was removed, otherwise it returns false.

---

## Iteration methods

### values()
Returns an iterator that contains the *value* for each element in the `OrderedSet` object, in insertion order.

## Examples

### Using the OrderedSet object
```lua
local myOrderedSet = OrderedSet()

myOrderedSet:add(1) -- true, OrderedSet {1}
myOrderedSet:add(5) -- true, OrderedSet {1, 5}
myOrderedSet:add(5) -- false, OrderedSet {1, 5}
myOrderedSet:add("some text") -- true, OrderedSet {1, 5, "some text"}

myOrderedSet:has(1) -- true

myOrderedSet:remove(1) -- true
myOrderedSet:remove(1) -- false

myOrderedSet.size -- 2

myOrderedSet:clear()

myOrderedSet:has("some text") -- false
myOrderedSet.size -- 0
```

### Iterating the OrderedSet object
```lua
local myOrderedSet = OrderedSet({"a", "b", "c"})

for value in myOrderedSet:values() do
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
| O(1)       | O(1)       | O(1)          | O(n)         |

### Space Complexity
O(n)