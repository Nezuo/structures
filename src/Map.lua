local Map = {}
Map.__index = Map

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
    local entries = {}
    for key, value in self:entries() do
        local useQuotes = type(key) ~= "number"
        local open = useQuotes and "[\"" or "["
        local close = useQuotes and "\"] = " or "] = "

        table.insert(entries, open .. tostring(key) .. close .. tostring(value))
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
    if not self:has(key) then
        self._entries[key] = value
        self.size += 1
    end
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