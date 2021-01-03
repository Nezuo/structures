local toString = require(script.Parent.toString)

local function isInteger(number)
	return number % 1 == 0
end

local function isInRange(number, range)
	return number >= 1 and number <= range
end

local List = {}
List.__index = List
List.__type = "List"

local function createList(values)
	local self = setmetatable({}, List)

	self.size = 0
	self._values = {}

	if values ~= nil then
		for _, value in ipairs(values) do
			self:push(value)
		end
	end

	return self
end

function List:__tostring()
	local values = table.create(self.size)
	for value in self:values() do
		table.insert(values, toString(value))
	end

	return "List {" .. table.concat(values, ", ") .. "}"
end

function List:entries()
	return ipairs(self._values)
end

function List:values()
	local control = 0

	local function iterator(state)
		control += 1

		return state[control]
	end

	return iterator, self._values
end

function List:push(value)
	if value ~= nil then
		self._values[self.size + 1] = value
		self.size += 1
	end
end

function List:pop()
	if self.size > 0 then
		local removedValue = self._values[self.size]

		self._values[self.size] = nil
		self.size -= 1

		return removedValue
	end
end

function List:indexOf(value, start)
	start = start or 1

	for index = start, self.size do
		if value == self._values[index] then
			return index
		end
	end
end

function List:get(index)
	return self._values[index]
end

function List:set(index, value)
	if not isInteger(index) then
		error("Index must be an integer.")
	end

	if not isInRange(index, self.size + 1) then
		error("Index is out of range.")
	end

	self._values[index] = value

	if index == self.size + 1 then
		self.size += 1
	end
end

function List:remove(value)
	local index = self:indexOf(value)

	if index ~= nil then
		table.remove(self._values, index)
		self.size -= 1

		return true
	end

	return false
end

function List:splice(start, deleteCount, ...)
	deleteCount = deleteCount or 1

	if start > self.size then
		error("Start index is out of range.")
	end

	if start + deleteCount - 1 > self.size then
		error("Delete count is out of range.")
	end

	local items = { ... }

	for i = 1, deleteCount do
		local index = start + i - 1

		if items[i] ~= nil then
			self._values[index] = items[i]
		else
			table.remove(self._values, index)
			self.size -= 1
		end
	end
end

function List:clear()
	self.size = 0
	self._values = {}
end

return createList
