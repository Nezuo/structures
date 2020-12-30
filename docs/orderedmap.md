# OrderedMap
An `OrderedMap` stores key-value pairs. Any non-nil value may be used as either a key or value. The `OrderedMap` is different to the [`Map`](map.md) data structure because its entries are iterated over in insertion order.

---

## Constructor

### [OrderedMap](orderedmap.md) OrderedMap([Table](https://developer.roblox.com/en-us/articles/Table)<[any](), [any]()\><u>[?](https://developer.roblox.com/en-us/articles/Nil)</u> *`entries`*)
Constructs a new `OrderedMap` object with the optional default entries.

```lua
local myOrderedMap = OrderedMap({["a"] = 1, ["b"] = 2, ["c"] = 3})
```

---

## Properties

### [number](https://developer.roblox.com/en-us/articles/Numbers) size
Returns the number of entries in the `OrderedMap` object.

---

## Methods

### [void]() clear()
Removes all entries from the `OrderedMap` object.

### [any]() get([any]() *`key`*)
Returns the value associated to the `key`, or `nil` if there is none.

### [boolean](https://developer.roblox.com/en-us/articles/Boolean) has([any]() *`key`*)
Returns a boolean asserting whether a value has been associated to the `key` in the `OrderedMap` object or not.

### [boolean](https://developer.roblox.com/en-us/articles/Boolean) remove([any]() *`key`*)
Removes the `key` from the `OrderedMap` object. Returns true if `key` existed in the `OrderedMap` object and was removed, otherwise it returns false.

### [void]() set([any]() *`key`*, [any]() *`value`*)
Sets the `value` for the `key` in the `OrderedMap` object.

---

## Iteration methods

### entries()
Returns an iterator that contains a table of [*key*, *value*] for each entry in the `OrderedMap` object, in insertion order.

### keys()
Returns an iterator that contains the *key* for each entry in the `OrderedMap` object, in insertion order.

### values()
Returns an iterator that contains the *value* for each entry in the `OrderedMap` object, in insertion order.

## Examples

### Using the OrderedMap object
```lua
local myOrderedMap = OrderedMap()

myOrderedMap:set("a", 1) -- OrderedMap {["a"] = 1}
myOrderedMap:set("a", 2) -- OrderedMap {["a"] = 2}
myOrderedMap:set("b", 3) -- OrderedMap {["a"] = 2, ["b"] = 3}

myOrderedMap:has("a") -- true

myOrderedMap:remove("b") -- true
myOrderedMap:remove("b") -- false

myOrderedMap:has("b") -- false

myOrderedMap.size -- 1

myOrderedMap:clear()

myOrderedMap.size -- 0

myOrderedMap:set("a", true)
myOrderedMap:get("a") -- true
myOrderedMap:remove("a")
myOrderedMap:get("a") -- nil
```

### Iterating the OrderedMap object
```lua
local myOrderedMap = OrderedMap({["a"] = 1, ["b"] = 2, ["c"] = 3})

for key, value in myOrderedMap:entries() do
    print(key, value)
end

-- a, 1
-- b, 2
-- c, 3

for key in myOrderedMap:keys() do
    print(key)
end

-- a
-- b
-- c

for value in myOrderedMap:values() do
    print(value)
end

-- 1
-- 2
-- 3
```

## Complexities

### Time Complexity
| **Access** | **Search** | **Insertion** | **Deletion** |
|------------|------------|---------------|--------------|
| O(1)       | O(1)       | O(1)          | O(n)         |

### Space Complexity
O(n)