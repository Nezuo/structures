local DoublyLinkedListNode = require(script.Parent.DoublyLinkedListNode)
local toString = require(script.Parent.toString)
local typeOf = require(script.Parent.typeOf)

local DoublyLinkedList = {}
DoublyLinkedList.__index = DoublyLinkedList
DoublyLinkedList.__type = "DoublyLinkedList"

local function createDoublyLinkedList()
	local self = setmetatable({}, DoublyLinkedList)

	self.head = nil
	self.size = 0
	self.tail = nil

	return self
end

function DoublyLinkedList:__tostring()
	local values = table.create(self.size)

	local currentNode = self.head
	while currentNode ~= nil do
		table.insert(values, toString(currentNode.value))

		currentNode = currentNode.next
	end

	return "DoublyLinkedList {" .. table.concat(values, ", ") .. "}"
end

function DoublyLinkedList:values()
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

function DoublyLinkedList:prepend(value)
	if value == nil then
		return
	end

	self.size += 1

	local node = DoublyLinkedListNode.new(value, self.head)

	if self.head ~= nil then
		self.head.previous = node
	end

	self.head = node

	if self.tail == nil then
		self.tail = node
	end
end

function DoublyLinkedList:append(value)
	if value == nil then
		return
	end

	self.size += 1

	local node = DoublyLinkedListNode.new(value)

	if self.head == nil then
		self.head = node
		self.tail = node
	else
		self.tail.next = node
		node.previous = self.tail
		self.tail = node
	end
end

function DoublyLinkedList:remove(value)
	if self.head == nil then
		return false
	end

	local currentNode = self.head
	local deletedNode

	while currentNode ~= nil do
		if currentNode.value == value then
			self.size -= 1

			deletedNode = currentNode

			if deletedNode == self.head then
				self.head = deletedNode.next

				if self.head ~= nil then
					self.head.previous = nil
				end

				if deletedNode == self.tail then
					self.tail = nil
				end
			elseif deletedNode == self.tail then
				self.tail = deletedNode.previous
				self.tail.next = nil
			else
				local previousNode = deletedNode.previous
				local nextNode = deletedNode.next

				previousNode.next = nextNode
				nextNode.previous = previousNode
			end
		end

		currentNode = currentNode.next
	end

	return deletedNode ~= nil
end

function DoublyLinkedList:removeHead()
	if self.head == nil then
		return nil
	end

	self.size -= 1

	local deletedHead = self.head

	if self.head.next ~= nil then
		self.head = self.head.next
		self.head.previous = nil
	else
		self.head = nil
		self.tail = nil
	end

	return deletedHead.value
end

function DoublyLinkedList:removeTail()
	if self.tail == nil then
		return nil
	end

	self.size -= 1

	if self.head == self.tail then
		local deletedTail = self.tail
		self.head = nil
		self.tail = nil

		return deletedTail ~= nil and deletedTail.value or nil
	end

	local deletedTail = self.tail

	self.tail = self.tail.previous
	self.tail.next = nil

	return deletedTail.value
end

function DoublyLinkedList:has(value)
	if self.head == nil or value == nil then
		return false
	end

	if typeOf(value) == "DoublyLinkedListNode" then
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

function DoublyLinkedList:isEmpty()
	return self.size == 0
end

return createDoublyLinkedList
