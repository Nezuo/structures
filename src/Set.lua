local Set = {}
Set.__index = Set

-- TODO: tostring?
-- TODO: Unit test, unit test, unit test
-- TODO: Add typings!!!

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

function Set:values()
    return next, self._values
end

function Set:add(value)
    if not self:has(value) then
        self._values[value] = true
        self.size += 1
    end
end

function Set:clear()
    self._values = {}
    self.size = 0
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

return createSet