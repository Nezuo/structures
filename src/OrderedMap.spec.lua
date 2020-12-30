return function()
	local OrderedMap = require(script.Parent.OrderedMap)
	local typeOf = require(script.parent.typeOf)

	local orderedMap

	beforeEach(function()
		orderedMap = OrderedMap()
	end)

	it("should be correct type", function()
        expect(typeOf(orderedMap)).to.equal("OrderedMap")
    end)

	it("should return correct string", function()
        expect(tostring(orderedMap)).to.equal("OrderedMap {}")

        orderedMap:set(1, true)
        orderedMap:set("1", false)
        orderedMap:set("\"a\"", "b")
        orderedMap:set(true, "c")

        expect(tostring(orderedMap)).to.equal("OrderedMap {[1] = true, [\"1\"] = false, [\"\"a\"\"] = \"b\", [true] = \"c\"}")
    end)

	it("should have default values", function()
        local myOrderedMap = OrderedMap({ a = 1, b = 2, c = 3 })

        expect(myOrderedMap:has("a")).to.equal(true)
        expect(myOrderedMap:has("b")).to.equal(true)
        expect(myOrderedMap:has("c")).to.equal(true)
    end)

	it("should give correct size", function()
        orderedMap:set("a", 1)
        orderedMap:set("b", 2)
        orderedMap:set("c", 3)

        expect(orderedMap.size).to.equal(3)

        orderedMap:set("d", 4)

        expect(orderedMap.size).to.equal(4)

        orderedMap:remove("d")

        expect(orderedMap.size).to.equal(3)

        orderedMap:clear()

        expect(orderedMap.size).to.equal(0)
    end)

	it("should give correct size when setting existing key", function()
        orderedMap:set("a", false)

        expect(orderedMap.size).to.equal(1)

        orderedMap:set("a", true)

        expect(orderedMap.size).to.equal(1)
    end)

	it("should overwrite existing value", function()
        orderedMap:set("a", false)

        expect(orderedMap:get("a")).to.equal(false)

        orderedMap:set("a", true)

        expect(orderedMap:get("a")).to.equal(true)
    end)

	it("should remove value if present", function()
        expect(orderedMap:remove("a")).to.equal(false)

        orderedMap:set("a", true)

        expect(orderedMap:remove("a")).to.equal(true)
    end)

	it("should throw when setting nil", function()
        expect(function()
            orderedMap:set(nil, true)
        end).to.throw("OrderedMap key cannot be nil.")
    end)

	it("should have set keys", function()
        expect(orderedMap:has("a")).to.equal(false)

        orderedMap:set("a", true)

        expect(orderedMap:has("a")).to.equal(true)

        orderedMap:remove("a")

        expect(orderedMap:has("a")).to.equal(false)

        orderedMap:set("a", true)

        expect(orderedMap:has("a")).to.equal(true)

        orderedMap:clear()

        expect(orderedMap:has("a")).to.equal(false)
    end)

	it("should iterate through entries in insertion order", function()
        orderedMap:set("a", 1)
        orderedMap:set("b", 2)
        orderedMap:set("c", 3)

        local function iteratedEntriesInOrder(keys, values)
            local index = 0

            for key, value in orderedMap:entries() do
                index += 1

                if keys[index] ~= key or values[index] ~= value then
                    return false
                end
            end

            return index == #keys and index == #values
		end

        expect(iteratedEntriesInOrder({"a", "b", "c"}, {1, 2, 3})).to.equal(true)
    end)

	it("should iterate through keys in insertion order", function()
        orderedMap:set("a", 1)
        orderedMap:set("b", 2)
        orderedMap:set("c", 3)

		local function iteratedKeysInOrder(keys)
			local index = 0

            for key in orderedMap:keys() do
                index += 1

                if keys[index] ~= key then
                    return false
                end
            end

            return index == #keys
        end

        expect(iteratedKeysInOrder({ "a", "b", "c" })).to.equal(true)
    end)

	it("should iterate through values in insertion order", function()
        orderedMap:set("a", 1)
        orderedMap:set("b", 2)
        orderedMap:set("c", 3)

        local function iteratedValuesInOrder(values)
			local index = 0

            for value in orderedMap:values() do
                index += 1

                if values[index] ~= value then
                    return false
                end
            end

            return index == #values
        end

        expect(iteratedValuesInOrder({ 1, 2, 3 })).to.equal(true)
    end)
end
