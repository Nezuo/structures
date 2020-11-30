local Queue = {}
Queue.__index = Queue
Queue.__type = "Queue"

local function createQueue()
    local self = setmetatable({}, Queue)
    
    self.size = 0
    self._elements = {}

    return self
end

function Queue:__tostring()
    return "Queue {" .. table.concat(self._elements, ", ") .. "}"
end

function Queue:elements()
    local control = 0

    local function iterator(state)
        control += 1

        return state[control]
    end

    return iterator, self._elements
end

function Queue:enqueue(element)
    if element ~= nil then
        table.insert(self._elements, element)

        self.size += 1
    end
end

function Queue:dequeue() -- TODO: If we used a doubly linked list, dequeue could be O(1) instead of O(n)
    local element = table.remove(self._elements, 1)

    if element ~= nil then
        self.size -= 1

        return element
    end
end

function Queue:isEmpty()
    return self.size == 0
end

function Queue:peek()
    return self._elements[1]
end

return createQueue