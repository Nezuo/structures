# Map

A `Map` stores key-value pairs. Any non-nil value may be used as either a key or value.

---

## Constructor

### [Map](map.md) Map([Table](https://developer.roblox.com/en-us/articles/Table)<[any](), [any]()\><u>[?](https://developer.roblox.com/en-us/articles/Nil)</u> *`entries`*)
Constructs a new `Map` object with the optional default entries.

```lua
local myMap = Map({["a"] = 1, ["b"] = 2, ["c"] = 3})
```

---

## Properties

### [number](https://developer.roblox.com/en-us/articles/Numbers) size

Returns the number of entries in the `Map` object.

---

## Methods

### [void]() clear()

Removes all entries from the `Map` object.

### [any]() get([any]() *`key`*)

Returns the value associated to the `key`, or `nil` if there is none.

### [boolean](https://developer.roblox.com/en-us/articles/Boolean) has([any]() *`key`*)

Returns a boolean asserting whether a value has been associated to the `key` in the `Map` object or not.

### [boolean](https://developer.roblox.com/en-us/articles/Boolean) remove([any]() *`key`*)

Removes the `key` from the `Map` object. Returns true if `key` existed in the `Map` object and was removed, otherwise it returns false.

### [void]() set([any]() *`key`*, [any]() *`value`*)

Sets the `value` for the `key` in the `Map` object.

---

## Iteration methods

### entries()

Returns an iterator that contains a table of [*key*, *value*] for each entry in the `Map` object, in an undefined order.

### keys()

Returns an iterator that contains the *key* for each entry in the `Map` object, in a undefined order.

### values()

Returns an iterator that contains the *value* for each entry in the `Map` object, in a undefined order.

## Examples

### Using the Map object

```lua
local myMap = Map()

myMap:set("a", 1) -- Map {["a"] = 1}
myMap:set("a", 2) -- Map {["a"] = 2}
myMap:set("b", 3) -- Map {["a"] = 2, ["b"] = 3}

myMap:has("a") -- true

myMap:remove("b") -- true
myMap:remove("b") -- false

myMap:has("b") -- false

myMap.size -- 1

myMap:clear()

myMap.size -- 0

myMap:set("a", true)
myMap:get("a") -- true
myMap:remove("a")
myMap:get("a") -- nil
```

### Iterating the Map object

```lua
local myMap = Map({["a"] = 1, ["b"] = 2, ["c"] = 3})

for key, value in myMap:entries() do
    print(key, value)
end

-- a, 1
-- b, 2
-- c, 3

for key in myMap:keys() do
    print(key)
end

-- a
-- b
-- c

for value in myMap:values() do
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
| O(1)       | O(1)       | O(1)          | O(1)         |

### Space Complexity

O(n)