local toString = require(script.Parent.toString)

local OrderedSet = {}
OrderedSet.__index = OrderedSet
OrderedSet.__type = "OrderedSet"

local function createOrderedSet(values)
	local self = setmetatable({}, OrderedSet)

	self.size = 0

	self._values = {}
	self._valueList = {}

	if values ~= nil then
		for _, value in ipairs(values) do
			self:add(value)
		end
	end

	return self
end

function OrderedSet:__tostring()
	local values = table.create(self.size)
	for value in self:values() do
		table.insert(values, toString(value))
	end

	return "OrderedSet {" .. table.concat(values, ", ") .. "}"
end

function OrderedSet:values()
	local control = 0

	local function iterator(state)
		control += 1

		return state[control]
	end

	return iterator, self._valueList
end

function OrderedSet:add(value)
	if value ~= nil and not self:has(value) then
		table.insert(self._valueList, value)
		self._values[value] = true
		self.size += 1

		return true
	end

	return false
end

function OrderedSet:remove(value)
	if self:has(value) then
		table.remove(self._valueList, table.find(self._valueList, value))
		self._values[value] = nil
		self.size -= 1

		return true
	end

	return false
end

function OrderedSet:has(value)
	return self._values[value] == true
end

function OrderedSet:clear()
	self._values = {}
	self._valueList = {}
	self.size = 0
end

return createOrderedSet
