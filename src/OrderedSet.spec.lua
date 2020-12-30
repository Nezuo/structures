return function()
	local OrderedSet = require(script.Parent.OrderedSet)
	local typeOf = require(script.parent.typeOf)

	local orderedSet

	beforeEach(function()
		orderedSet = OrderedSet()
	end)

	it("should be correct type", function()
		expect(typeOf(orderedSet)).to.equal("OrderedSet")
	end)

	it("should return correct string", function()
		expect(tostring(orderedSet)).to.equal("OrderedSet {}")

		orderedSet:add(true)
		orderedSet:add(false)
		orderedSet:add("a")

		expect(tostring(orderedSet)).to.equal("OrderedSet {true, false, \"a\"}")
	end)

	it("should have default values", function()
		local myOrderedSet = OrderedSet({ "a", "b", "c" })

		expect(myOrderedSet:has("a")).to.equal(true)
		expect(myOrderedSet:has("b")).to.equal(true)
		expect(myOrderedSet:has("c")).to.equal(true)
	end)

	it("should give correct size", function()
		orderedSet:add("a")
		orderedSet:add("b")
		orderedSet:add("c")

		expect(orderedSet.size).to.equal(3)

		orderedSet:add("d")

		expect(orderedSet.size).to.equal(4)

		orderedSet:remove("d")

		expect(orderedSet.size).to.equal(3)

		orderedSet:clear()

		expect(orderedSet.size).to.equal(0)
	end)

	it("should give correct size when adding existing value", function()
		orderedSet:add("a")

		expect(orderedSet.size).to.equal(1)

		orderedSet:add("a")

		expect(orderedSet.size).to.equal(1)
	end)

	it("should add value if not present", function()
		expect(orderedSet:add("a")).to.equal(true)
		expect(orderedSet:add("a")).to.equal(false)
	end)

	it("should remove value if present", function()
		expect(orderedSet:remove("a")).to.equal(false)

		orderedSet:add("a")

		expect(orderedSet:remove("a")).to.equal(true)
	end)

	it("should not add nil", function()
		expect(orderedSet:add(nil)).to.equal(false)
		expect(orderedSet:has(nil)).to.equal(false)
	end)

	it("should have added values", function()
		expect(orderedSet:has("a")).to.equal(false)

		orderedSet:add("a")

		expect(orderedSet:has("a")).to.equal(true)

		orderedSet:remove("a")

		expect(orderedSet:has("a")).to.equal(false)

		orderedSet:add("a")

		expect(orderedSet:has("a")).to.equal(true)

		orderedSet:clear()

		expect(orderedSet:has("a")).to.equal(false)
	end)

	it("should iterate through values in order", function()
		orderedSet:add("a")
		orderedSet:add("b")
		orderedSet:add("c")
		orderedSet:add("d")
		orderedSet:remove("b")

		local function iteratedValuesInOrder(values)
            local index = 0

            for value in orderedSet:values() do
                index += 1

                if values[index] ~= value then
                    return false
                end
            end

            return index == #values
        end

        expect(iteratedValuesInOrder({ "a", "c", "d" })).to.equal(true)
	end)
end
