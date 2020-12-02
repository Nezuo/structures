local toString = require(script.Parent.toString)

local Stack = {}
Stack.__index = Stack
Stack.__type = "Stack"

local function createStack()
    local self = setmetatable({}, Stack)
    
    self.size = 0
    self._elements = {}

    return self
end

function Stack:__tostring()
    local elements = table.create(self.size)
    for element in self:elements() do
        table.insert(elements, toString(element))
    end

    return "Stack {" .. table.concat(elements, ", ") .. "}"
end

function Stack:elements()
    local control = 0

    local function iterator(state)
        control += 1

        return state[control]
    end

    return iterator, self._elements
end

function Stack:push(element)
    if element ~= nil then
        table.insert(self._elements, element)

        self.size += 1
    end
end

function Stack:pop()
    local element = table.remove(self._elements)

    if element ~= nil then
        self.size -= 1

        return element
    end
end

function Stack:isEmpty()
    return self.size == 0
end

function Stack:peek()
    return self._elements[self.size]
end

return createStack