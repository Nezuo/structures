local LinkedListNode = {}
LinkedListNode.__index = LinkedListNode
LinkedListNode.__type = "LinkedListNode"

function LinkedListNode.new(value, next)
	local self = setmetatable({}, LinkedListNode)

	self.value = value
	self.next = next

	return self
end

function LinkedListNode:__tostring()
	return tostring(self.value)
end

return LinkedListNode
