local toString = require(script.Parent.toString)

local Map = {}
Map.__index = Map
Map.__type = "Map"

function createMap(entries)
	local self = setmetatable({}, Map)

	self.size = 0

	self._entries = {}

	if entries ~= nil then
		for key, value in pairs(entries) do
			self:set(key, value)
		end
	end

	return self
end

function Map:__tostring()
	local entries = table.create(self.size)
	for key, value in self:entries() do
		table.insert(entries, "[" .. toString(key) .. "] = " .. toString(value))
	end

	return "Map {" .. table.concat(entries, ", ") .. "}"
end

function Map:entries()
	return next, self._entries
end

function Map:keys()
	local function iterate(state, control)
		local key = next(state, control)

		return key
	end

	return iterate, self._entries
end

function Map:values()
	local control = nil

	local function iterate(state)
		local key, value = next(state, control)

		control = key

		return value
	end

	return iterate, self._entries
end

function Map:get(key)
	return self._entries[key]
end

function Map:set(key, value)
	if key == nil then
		error("Map key cannot be nil.")
	end

	if not self:has(key) then
		self.size += 1
	end

	self._entries[key] = value
end

function Map:remove(key)
	if self:has(key) then
		self._entries[key] = nil
		self.size -= 1

		return true
	end

	return false
end

function Map:has(key)
	return self._entries[key] ~= nil
end

function Map:clear()
	self._entries = {}
	self.size = 0
end

return createMap
