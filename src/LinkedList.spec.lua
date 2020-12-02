return function()
    local LinkedList = require(script.Parent.LinkedList)
    local typeOf = require(script.parent.typeOf)

    local linkedList

    beforeEach(function()
        linkedList = LinkedList()
    end)

    it("should be correct type", function()
        expect(typeOf(linkedList)).to.equal("LinkedList")
    end)

    it("should return correct string", function()
        expect(tostring(linkedList)).to.equal("LinkedList {}")

        linkedList:append("a")
        linkedList:append("b")
        linkedList:append("c")

        expect(tostring(linkedList)).to.equal("LinkedList {\"a\", \"b\", \"c\"}")
    end)

    it("should give correct size", function()
        linkedList:append("a")
        linkedList:append("b")
        linkedList:append("c")

        expect(linkedList.size).to.equal(3)
        expect(linkedList:isEmpty()).to.equal(false)

        linkedList:append("d")

        expect(linkedList.size).to.equal(4)
        expect(linkedList:isEmpty()).to.equal(false)

        linkedList:removeTail()

        expect(linkedList.size).to.equal(3)
        expect(linkedList:isEmpty()).to.equal(false)

        linkedList:removeTail()
        linkedList:removeTail()
        linkedList:removeTail()

        expect(linkedList.size).to.equal(0)
        expect(linkedList:isEmpty()).to.equal(true)

        linkedList:removeTail()

        expect(linkedList.size).to.equal(0)
        expect(linkedList:isEmpty()).to.equal(true)
    end)

    it("should append values", function()
        linkedList:append("a")
        expect(linkedList.tail.value).to.equal("a")
        linkedList:append("b")
        expect(linkedList.tail.value).to.equal("b")
        linkedList:append("c")
        expect(linkedList.tail.value).to.equal("c")
    end)

    it("should prepend values", function()
        linkedList:prepend("a")
        expect(linkedList.head.value).to.equal("a")
        linkedList:prepend("b")
        expect(linkedList.head.value).to.equal("b")
        linkedList:prepend("c")
        expect(linkedList.head.value).to.equal("c")
    end)

    it("should not add nil", function()
        linkedList:prepend(nil)
        linkedList:append(nil)

        expect(linkedList:isEmpty()).to.equal(true)
    end)

    it("should remove values", function()
        linkedList:append("a")
        linkedList:append("a")
        linkedList:append("a")

        expect(linkedList:remove(nil)).to.equal(false)
        expect(linkedList:remove("non existent")).to.equal(false)
        expect(linkedList:remove("a")).to.equal(true)
        expect(linkedList:isEmpty()).to.equal(true)
        expect(linkedList.head).never.to.be.ok()
        expect(linkedList.tail).never.to.be.ok()

        expect(linkedList:remove()).to.equal(false)

        linkedList:append("a")
        linkedList:append("b")
        linkedList:append("a")
        linkedList:append("b")
        linkedList:append("a")

        expect(linkedList:remove("a")).to.equal(true)
        expect(linkedList.size).to.equal(2)
        expect(linkedList.head.value).to.equal("b")
        expect(linkedList.tail.value).to.equal("b")
    end)

    it("should remove tail", function()
        linkedList:append("a")
        linkedList:append("b")
        linkedList:append("c")

        expect(linkedList:removeTail()).to.equal("c")
        expect(linkedList:removeTail()).to.equal("b")
        expect(linkedList:removeTail()).to.equal("a")
        expect(linkedList:removeTail()).never.to.be.ok()

        linkedList:append("a")

        expect(linkedList:removeTail()).to.equal("a")
        expect(linkedList:isEmpty()).to.equal(true)
        expect(linkedList.head).never.to.be.ok()
        expect(linkedList.tail).never.to.be.ok()

        expect(linkedList:removeTail()).never.to.be.ok()
    end)

    it("should remove head", function()
        linkedList:append("a")
        linkedList:append("b")
        linkedList:append("c")

        expect(linkedList:removeHead()).to.equal("a")
        expect(linkedList:removeHead()).to.equal("b")
        expect(linkedList:removeHead()).to.equal("c")
        expect(linkedList:removeHead()).never.to.be.ok()

        linkedList:append("a")

        expect(linkedList:removeHead()).to.equal("a")
        expect(linkedList:isEmpty()).to.equal(true)
        expect(linkedList.head).never.to.be.ok()
        expect(linkedList.tail).never.to.be.ok()

        expect(linkedList:removeHead()).never.to.be.ok()
    end)

    it("should have added values", function()
        expect(linkedList:has("a")).to.equal(false)

        linkedList:append("a")

        expect(linkedList:has("a")).to.equal(true)

        linkedList:append("b")

        expect(linkedList:has("b")).to.equal(true)

        linkedList:remove("a")

        expect(linkedList:has("a")).to.equal(false)
        expect(linkedList:has("b")).to.equal(true)
    end)

    it("should have head", function()
        expect(linkedList:has(nil)).to.equal(false)
    end)

    it("should have nil", function()
        linkedList:append("a")

        expect(linkedList:has(linkedList.head)).to.equal(true)
    end)

    it("should iterate through values", function()
        linkedList:append("a")
        linkedList:append("b")
        linkedList:append("c")

        local function iteratedValuesInOrder(values)
            local index = 0

            for value in linkedList:values() do
                index += 1

                if values[index] ~= value then
                    return false
                end
            end

            return index == #values
        end

        expect(iteratedValuesInOrder({"a", "b", "c"})).to.equal(true)
    end)
end