local LinkedList = require(script.Parent.LinkedList)
local toString = require(script.Parent.toString)

local Queue = {}
Queue.__index = Queue
Queue.__type = "Queue"

local function createQueue()
    local self = setmetatable({}, Queue)
    
    self._linkedList = LinkedList()
    self.size = 0

    return self
end

function Queue:__tostring()
    local values = table.create(self.size)
    for value in self._linkedList:values() do
        table.insert(values, toString(value))
    end

    return "Queue {" .. table.concat(values, ", ") .. "}"
end

function Queue:elements()
    return self._linkedList:values()
end

function Queue:enqueue(element)
    if element ~= nil then
        self._linkedList:append(element)
        self.size += 1
    end
end

function Queue:dequeue()
    local removedValue = self._linkedList:removeHead()

    if removedValue ~= nil then
        self.size -= 1
    end

    return removedValue
end

function Queue:isEmpty()
    return self.size == 0
end

function Queue:peek()
    local head = self._linkedList.head

    if head ~= nil then
        return head.value
    end
end

return createQueue