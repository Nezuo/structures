local Set = {}
Set.__index = Set

-- TODO: Finding type of structure

local function createSet(values)
    local self = setmetatable({}, Set)
    
    self.size = 0

    self._values = {}

    if values ~= nil then
        for _, value in ipairs(values) do
            self:add(value)
        end
    end

    return self
end

function Set:__tostring()
    local values = {}
    for value in self:values() do
        table.insert(values, value)
    end

    return "Set {" .. table.concat(values, ", ") .. "}"
end

function Set:values()
    local function iterate(state, control)
        local value = next(state, control)

        return value
    end

    return iterate, self._values
end

function Set:add(value)
    if value ~= nil and not self:has(value) then
        self._values[value] = true
        self.size += 1

        return true
    end

    return false
end

function Set:remove(value)
    if self:has(value) then
        self.size -= 1

        self._values[value] = nil

        return true
    end

    return false
end

function Set:has(value)
    return self._values[value] == true
end

function Set:clear()
    self._values = {}
    self.size = 0
end

return createSet