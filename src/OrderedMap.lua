local toString = require(script.Parent.toString)

local OrderedMap = {}
OrderedMap.__index = OrderedMap
OrderedMap.__type = "OrderedMap"

function createOrderedMap(entries)
	local self = setmetatable({}, OrderedMap)

	self.size = 0

	self._keyList = {}
	self._entries = {}

	if entries ~= nil then
		for key, value in pairs(entries) do
			self:set(key, value)
		end
	end

	return self
end

function OrderedMap:__tostring()
	local entries = table.create(self.size)
	for key, value in self:entries() do
		table.insert(entries, "[" .. toString(key) .. "] = " .. toString(value))
	end

	return "OrderedMap {" .. table.concat(entries, ", ") .. "}"
end

function OrderedMap:entries()
	local control = 0

	local function iterate(state)
		control += 1

		local key = state[control]

		return key, self._entries[key]
	end

	return iterate, self._keyList
end

function OrderedMap:keys()
	local control = 0

	local function iterate(state)
		control += 1

		return state[control]
	end

	return iterate, self._keyList
end

function OrderedMap:values()
	local control = 0

	local function iterator(state)
		control += 1

		local key = state[control]

		return self._entries[key]
	end

	return iterator, self._keyList
end

function OrderedMap:get(key)
	return self._entries[key]
end

function OrderedMap:set(key, value)
	if key == nil then
		error("OrderedMap key cannot be nil.")
	end

	if not self:has(key) then
		table.insert(self._keyList, key)
		self.size += 1
	end

	self._entries[key] = value
end

function OrderedMap:remove(key)
	if self:has(key) then
		table.remove(self._keyList, table.find(self._keyList, key))
		self._entries[key] = nil
		self.size -= 1

		return true
	end

	return false
end

function OrderedMap:has(key)
	return self._entries[key] ~= nil
end

function OrderedMap:clear()
	self._entries = {}
	self._keyList = {}
	self.size = 0
end

return createOrderedMap
