return function()
	local List = require(script.Parent.List)
	local typeOf = require(script.parent.typeOf)

	local list

	beforeEach(function()
		list = List()
	end)

	it("should be correct type", function()
		expect(typeOf(list)).to.equal("List")
	end)

	it("should return correct string", function()
		expect(tostring(list)).to.equal("List {}")

		list:push(true)
		list:push(false)
		list:push("a")

		expect(tostring(list)).to.equal("List {true, false, \"a\"}")
	end)

	it("should have default values", function()
		local myList = List({ "a", "b", "c" })

		expect(myList:get(1)).to.equal("a")
		expect(myList:get(2)).to.equal("b")
		expect(myList:get(3)).to.equal("c")
	end)

	it("should give correct size", function()
		list:push("a")
		list:push("a")
		list:push("a")

		expect(list.size).to.equal(3)

		list:push("b")

		expect(list.size).to.equal(4)

		list:pop()

		expect(list.size).to.equal(3)

		list:clear()

		expect(list.size).to.equal(0)
	end)

	it("should remove value if present", function()
		list:push("b")

		expect(list:remove("a")).to.equal(false)
		expect(list.size).to.equal(1)

		list:push("a")

		expect(list:remove("a")).to.equal(true)
		expect(list.size).to.equal(1)
		expect(list:indexOf("a")).never.to.be.ok()
	end)

	it("should not add nil", function()
		list:push(nil)

		expect(list.size).to.equal(0)
	end)

	it("should return last value or nil", function()
		list:push("a")
		list:push("b")
		list:push("c")

		expect(list:pop()).to.equal("c")
		expect(list:pop()).to.equal("b")
		expect(list:pop()).to.equal("a")
		expect(list:pop()).never.to.be.ok()
	end)

	it("should have pushed values", function()
		expect(list:indexOf("a")).never.to.be.ok()

		list:push("a")

		expect(list:indexOf("a")).to.equal(1)

		list:remove("a")

		expect(list:indexOf("a")).to.equal(nil)
	end)

	it("should return correct index", function()
		list:push("a")
		list:push("b")
		list:push("b")
		list:push("b")
		list:push("a")

		expect(list:indexOf("a")).to.equal(1)
		expect(list:indexOf("a", 1)).to.equal(1)
		expect(list:indexOf("a", 2)).to.equal(5)
	end)

	it("should set values correctly", function()
		list:push("a")
		list:push("b")
		list:push("c")
		list:push("d")
		list:push("e")

		list:set(3, "x")

		expect(list.size).to.equal(5)
		expect(list:get(3)).to.equal("x")

		list:set(6, "y")

		expect(list.size).to.equal(6)
		expect(list:get(6)).to.equal("y")
	end)

	it("should throw when setting a non integer index", function()
		expect(function()
			list:set(1.5, true)
		end).to.throw("Index must be an integer.")
	end)

	it("should throw when setting index out of range", function()
		list:push("a")
		list:push("b")
		list:push("c")

		expect(function()
			list:set(0, true)
		end).to.throw("Index is out of range.")

		expect(function()
			list:set(5, true)
		end).to.throw("Index is out of range.")
	end)

	it("should splice all values", function()
		list:push("a")
		list:push("b")
		list:push("c")

		list:splice(1, 3)

		expect(list.size).to.equal(0)
	end)

	it("should splice some values", function()
		list:push("a")
		list:push("b")
		list:push("c")

		list:splice(2, 1)

		expect(list.size).to.equal(2)
		expect(list:get(1)).to.equal("a")
		expect(list:get(2)).to.equal("c")
		expect(list:get(3)).never.to.be.ok()
	end)

	it("should replace all values", function()
		list:push("a")
		list:push("b")
		list:push("c")

		list:splice(1, 3, "x", "y", "z")

		expect(list.size).to.equal(3)
		expect(list:get(1)).to.equal("x")
		expect(list:get(2)).to.equal("y")
		expect(list:get(3)).to.equal("z")
	end)

	it("should replace some values", function()
		list:push("a")
		list:push("b")
		list:push("c")

		list:splice(2, 1, "x")

		expect(list.size).to.equal(3)
		expect(list:get(1)).to.equal("a")
		expect(list:get(2)).to.equal("x")
		expect(list:get(3)).to.equal("c")
	end)

	it("should replace and remove some values", function()
		list:push("a")
		list:push("b")
		list:push("c")
		list:push("d")
		list:push("e")

		list:splice(2, 3, "x", "y")

		expect(list.size).to.equal(4)
		expect(list:get(1)).to.equal("a")
		expect(list:get(2)).to.equal("x")
		expect(list:get(3)).to.equal("y")
		expect(list:get(4)).to.equal("e")
		expect(list:get(5)).never.to.be.ok()
	end)

	it("should throw when splicing out of range", function()
		list:push("a")
		list:push("b")
		list:push("c")

		expect(function()
			list:splice(4)
		end).to.throw("Start index is out of range.")

		expect(function()
			list:splice(3, 2)
		end).to.throw("Delete count is out of range.")
	end)

	it("should iterate through values in order", function()
		list:push("a")
		list:push("b")
		list:push("c")
		list:push("d")
		list:splice(2)

		local function iteratedValuesInOrder(values)
			local index = 0

			for value in list:values() do
				index += 1

				if values[index] ~= value then
					return false
				end
			end

			return index == #values
		end

		expect(iteratedValuesInOrder({ "a", "c", "d" })).to.equal(true)
	end)

	it("should iterate through entries in order", function()
		list:push("a")
		list:push("b")
		list:push("c")
		list:push("d")
		list:splice(2)

		local function iteratedEntriesInOrder(values)
			local index = 0

			for entryIndex, value in list:entries() do
				index += 1

				if values[index] ~= value or entryIndex ~= index then
					return false
				end
			end

			return index == #values
		end

		expect(iteratedEntriesInOrder({ "a", "c", "d" })).to.equal(true)
	end)
end
