return function()
    local Set = require(script.Parent.Set)

    local set

    beforeEach(function()
        set = Set.new()
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
end