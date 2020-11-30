return function()
    local Set = require(script.Parent.Set)

    local set

    beforeEach(function()
        set = Set()
    end)
    
    it("should have default values", function()
        local mySet = Set {"a", "b", "c"}

        expect(mySet:has("a")).to.equal(true)
        expect(mySet:has("b")).to.equal(true)
        expect(mySet:has("c")).to.equal(true)
    end)

    it("should give correct size", function()
        set:add("a")
        set:add("b")
        set:add("c")

        expect(set.size).to.equal(3)

        set:add("d")

        expect(set.size).to.equal(4)

        set:remove("d")

        expect(set.size).to.equal(3)

        set:clear()

        expect(set.size).to.equal(0)
    end)

    it("should give correct size when adding existing value", function()
        set:add("a")

        expect(set.size).to.equal(1)

        set:add("a")
        
        expect(set.size).to.equal(1)
    end)

    it("should add value if not present", function()
        expect(set:add("a")).to.equal(true)
        expect(set:add("a")).to.equal(false)
    end)

    it("should remove value if present", function()
        expect(set:remove("a")).to.equal(false)

        set:add("a")

        expect(set:remove("a")).to.equal(true)
    end)

    it("should not add nil", function()
        expect(set:add(nil)).to.equal(false)
        expect(set:has(nil)).to.equal(false)
    end)

    it("should have added values", function()
        expect(set:has("a")).to.equal(false)

        set:add("a")

        expect(set:has("a")).to.equal(true)

        set:remove("a")

        expect(set:has("a")).to.equal(false)

        set:add("a")

        expect(set:has("a")).to.equal(true)

        set:clear()

        expect(set:has("a")).to.equal(false)
    end)

    it("should iterate through values", function()
        set:add("a")
        set:add("b")
        set:add("c")

        local function iteratedValues(values)
            for value in set:values() do
                local index = table.find(values, value)

                if index ~= nil then
                    table.remove(values, index)
                else
                    return false
                end
            end

            return #values == 0
        end

        expect(iteratedValues({"a", "b", "c"})).to.equal(true)
    end)
end