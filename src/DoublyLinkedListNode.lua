local DoublyLinkedListNode = {}
DoublyLinkedListNode.__index = DoublyLinkedListNode
DoublyLinkedListNode.__type = "DoublyLinkedListNode"

function DoublyLinkedListNode.new(value, next, previous)
	local self = setmetatable({}, DoublyLinkedListNode)

	self.value = value
	self.next = next
	self.previous = previous

	return self
end

function DoublyLinkedListNode:__tostring()
	return tostring(self.value)
end

return DoublyLinkedListNode
