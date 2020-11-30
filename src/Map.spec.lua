return function()
    local Map = require(script.Parent.Map)
    local typeOf = require(script.parent.typeOf)

    local map

    beforeEach(function()
        map = Map()
    end)

    it("should be correct type", function()
        expect(typeOf(map)).to.equal("Map")
    end)

    it("should have default values", function()
        local myMap = Map {a = 1, b = 2, c = 3}

        expect(myMap:has("a")).to.equal(true)
        expect(myMap:has("b")).to.equal(true)
        expect(myMap:has("c")).to.equal(true)
    end)

    it("should give correct size", function()
        map:set("a", 1)
        map:set("b", 2)
        map:set("c", 3)

        expect(map.size).to.equal(3)

        map:set("d", 4)

        expect(map.size).to.equal(4)

        map:remove("d")

        expect(map.size).to.equal(3)

        map:clear()

        expect(map.size).to.equal(0)
    end)

    it("should give correct size when setting existing key", function()
        map:set("a", false)

        expect(map.size).to.equal(1)

        map:set("a", true)
        
        expect(map.size).to.equal(1)
    end)

    it("should overwrite existing value", function()
        map:set("a", false)

        expect(map:get("a")).to.equal(false)

        map:set("a", true)
        
        expect(map:get("a")).to.equal(true)
    end)

    it("should remove value if present", function()
        expect(map:remove("a")).to.equal(false)

        map:set("a", true)

        expect(map:remove("a")).to.equal(true)
    end)

    it("should throw when setting nil", function()
        expect(function()
            map:set(nil, true)
        end).to.throw("Map key cannot be nil.")
    end)

    it("should have set keys", function()
        expect(map:has("a")).to.equal(false)

        map:set("a", true)

        expect(map:has("a")).to.equal(true)

        map:remove("a")

        expect(map:has("a")).to.equal(false)

        map:set("a", true)

        expect(map:has("a")).to.equal(true)

        map:clear()

        expect(map:has("a")).to.equal(false)
    end)

    it("should iterate through entries", function()
        map:set("a", 1)
        map:set("b", 2)
        map:set("c", 3)

        local function iteratedEntries(entries)
            for key, value in map:entries() do
                local entryValue = entries[key]
                
                if entryValue ~= value then
                    return false
                elseif entryValue ~= nil then
                    entries[key] = nil
                end
            end

            return next(entries) == nil
        end

        expect(iteratedEntries({a = 1, b = 2, c = 3})).to.equal(true)
    end)

    it("should iterate through keys", function()
        map:set("a", 1)
        map:set("b", 2)
        map:set("c", 3)

        local function iteratedKeys(keys)
            for key in map:keys() do
                local index = table.find(keys, key)

                if index ~= nil then
                    table.remove(keys, index)
                else
                    return false
                end
            end

            return #keys == 0
        end

        expect(iteratedKeys({"a", "b", "c"})).to.equal(true)
    end)

    it("should iterate through values", function()
        map:set("a", 1)
        map:set("b", 2)
        map:set("c", 3)

        local function iteratedValues(values)
            for value in map:values() do
                local index = table.find(values, value)

                if index ~= nil then
                    table.remove(values, index)
                else
                    return false
                end
            end

            return #values == 0
        end

        expect(iteratedValues({1, 2, 3})).to.equal(true)
    end)
end