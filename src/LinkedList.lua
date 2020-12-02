local LinkedListNode = require(script.Parent.LinkedListNode)
local toString = require(script.Parent.toString)
local typeOf = require(script.Parent.typeOf)

local LinkedList = {}
LinkedList.__index = LinkedList
LinkedList.__type = "LinkedList"

local function createLinkedList()
    local self = setmetatable({}, LinkedList)
    
    self.head = nil
    self.size = 0
    self.tail = nil
    
    return self
end

function LinkedList:__tostring()
    local values = table.create(self.size)
    
    local currentNode = self.head
    while currentNode ~= nil do
        table.insert(values, toString(currentNode.value))

        currentNode = currentNode.next
    end

    return "LinkedList {" .. table.concat(values, ", ") .. "}"
end

function LinkedList:values()
    local node = nil

    local function iterator()
        if node == nil then
            node = self.head
        else
            node = node.next
        end

        if node ~= nil then
            return node.value
        end
    end

    return iterator
end

function LinkedList:prepend(value)
    if value == nil then
        return
    end

    self.size += 1

    local node = LinkedListNode.new(value, self.head)

    self.head = node

    if self.tail == nil then
        self.tail = node
    end
end

function LinkedList:append(value)
    if value == nil then
        return
    end

    self.size += 1

    local node = LinkedListNode.new(value)

    if self.head == nil then
        self.head = node
        self.tail = node
    else
        self.tail.next = node
        self.tail = node
    end
end

function LinkedList:remove(value)
    if self.head == nil then
        return false
    end

    local deletedNode

    while self.head ~= nil and self.head.value == value do
        self.size -= 1
        deletedNode = self.head
        self.head = self.head.next
    end

    local currentNode = self.head

    if currentNode ~= nil then
        while currentNode.next ~= nil do
            if currentNode.next.value == value then
                self.size -= 1
                deletedNode = currentNode.next
                currentNode.next = currentNode.next.next
            else
                currentNode = currentNode.next
            end
        end
    end

    if self.tail.value == value then
        self.tail = currentNode
    end

    return deletedNode ~= nil
end

function LinkedList:removeHead()
    if self.head == nil then
        return nil
    end

    self.size -= 1

    local deletedHead = self.head

    if self.head.next ~= nil then
        self.head = self.head.next
    else
        self.head = nil
        self.tail = nil
    end

    return deletedHead.value
end

function LinkedList:removeTail()
    local deletedTail = self.tail

    if self.head == self.tail then
        self.head = nil
        self.size = 0
        self.tail = nil

        return deletedTail ~= nil and deletedTail.value or nil
    end

    local currentNode = self.head

    while currentNode.next ~= nil do
        if currentNode.next.next == nil then
            self.size -= 1
            currentNode.next = nil
        else
            currentNode = currentNode.next
        end
    end

    self.tail = currentNode
    
    return deletedTail.value
end

function LinkedList:has(value)
    if self.head == nil or value == nil then
        return false
    end

    if typeOf(value) == "LinkedListNode" then
        value = value.value
    end

    local currentNode = self.head

    while currentNode ~= nil do
        if value == currentNode.value then
            return true
        end

        currentNode = currentNode.next
    end

    return false
end

function LinkedList:isEmpty()
    return self.size == 0
end

return createLinkedList