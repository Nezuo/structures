return function()
    local DoublyLinkedList = require(script.Parent.DoublyLinkedList)
    local typeOf = require(script.parent.typeOf)

    local doublyLinkedList

    beforeEach(function()
        doublyLinkedList = DoublyLinkedList()
    end)

    it("should be correct type", function()
        expect(typeOf(doublyLinkedList)).to.equal("DoublyLinkedList")
    end)

    it("should return correct string", function()
        expect(tostring(doublyLinkedList)).to.equal("DoublyLinkedList {}")

        doublyLinkedList:append("a")
        doublyLinkedList:append("b")
        doublyLinkedList:append("c")

        expect(tostring(doublyLinkedList)).to.equal("DoublyLinkedList {a, b, c}")
    end)

    it("should give correct size", function()
        doublyLinkedList:append("a")
        doublyLinkedList:append("b")
        doublyLinkedList:append("c")

        expect(doublyLinkedList.size).to.equal(3)
        expect(doublyLinkedList:isEmpty()).to.equal(false)

        doublyLinkedList:append("d")

        expect(doublyLinkedList.size).to.equal(4)
        expect(doublyLinkedList:isEmpty()).to.equal(false)

        doublyLinkedList:removeTail()

        expect(doublyLinkedList.size).to.equal(3)
        expect(doublyLinkedList:isEmpty()).to.equal(false)

        doublyLinkedList:removeTail()
        doublyLinkedList:removeTail()
        doublyLinkedList:removeTail()

        expect(doublyLinkedList.size).to.equal(0)
        expect(doublyLinkedList:isEmpty()).to.equal(true)

        doublyLinkedList:removeTail()

        expect(doublyLinkedList.size).to.equal(0)
        expect(doublyLinkedList:isEmpty()).to.equal(true)
    end)

    it("should append values", function()
        doublyLinkedList:append("a")
        expect(doublyLinkedList.tail.value).to.equal("a")
        doublyLinkedList:append("b")
        expect(doublyLinkedList.tail.value).to.equal("b")
        doublyLinkedList:append("c")
        expect(doublyLinkedList.tail.value).to.equal("c")
    end)

    it("should prepend values", function()
        doublyLinkedList:prepend("a")
        expect(doublyLinkedList.head.value).to.equal("a")
        doublyLinkedList:prepend("b")
        expect(doublyLinkedList.head.value).to.equal("b")
        doublyLinkedList:prepend("c")
        expect(doublyLinkedList.head.value).to.equal("c")
    end)

    it("should not add nil", function()
        doublyLinkedList:prepend(nil)
        doublyLinkedList:append(nil)

        expect(doublyLinkedList:isEmpty()).to.equal(true)
    end)

    it("should remove values", function()
        doublyLinkedList:append("a")
        doublyLinkedList:append("a")
        doublyLinkedList:append("a")

        expect(doublyLinkedList:remove(nil)).to.equal(false)
        expect(doublyLinkedList:remove("non existent")).to.equal(false)
        expect(doublyLinkedList:remove("a")).to.equal(true)
        expect(doublyLinkedList:isEmpty()).to.equal(true)
        expect(doublyLinkedList.head).never.to.be.ok()
        expect(doublyLinkedList.tail).never.to.be.ok()

        expect(doublyLinkedList:remove()).to.equal(false)

        doublyLinkedList:append("a")
        doublyLinkedList:append("b")
        doublyLinkedList:append("a")
        doublyLinkedList:append("b")
        doublyLinkedList:append("a")

        expect(doublyLinkedList:remove("a")).to.equal(true)
        expect(doublyLinkedList.size).to.equal(2)
        expect(doublyLinkedList.head.value).to.equal("b")
        expect(doublyLinkedList.tail.value).to.equal("b")
    end)

    it("should remove tail", function()
        doublyLinkedList:append("a")
        doublyLinkedList:append("b")
        doublyLinkedList:append("c")

        expect(doublyLinkedList:removeTail()).to.equal("c")
        expect(doublyLinkedList:removeTail()).to.equal("b")
        expect(doublyLinkedList:removeTail()).to.equal("a")
        expect(doublyLinkedList:removeTail()).never.to.be.ok()

        doublyLinkedList:append("a")

        expect(doublyLinkedList:removeTail()).to.equal("a")
        expect(doublyLinkedList:isEmpty()).to.equal(true)
        expect(doublyLinkedList.head).never.to.be.ok()
        expect(doublyLinkedList.tail).never.to.be.ok()

        expect(doublyLinkedList:removeTail()).never.to.be.ok()
    end)

    it("should remove head", function()
        doublyLinkedList:append("a")
        doublyLinkedList:append("b")
        doublyLinkedList:append("c")

        expect(doublyLinkedList:removeHead()).to.equal("a")
        expect(doublyLinkedList:removeHead()).to.equal("b")
        expect(doublyLinkedList:removeHead()).to.equal("c")
        expect(doublyLinkedList:removeHead()).never.to.be.ok()

        doublyLinkedList:append("a")

        expect(doublyLinkedList:removeHead()).to.equal("a")
        expect(doublyLinkedList:isEmpty()).to.equal(true)
        expect(doublyLinkedList.head).never.to.be.ok()
        expect(doublyLinkedList.tail).never.to.be.ok()

        expect(doublyLinkedList:removeHead()).never.to.be.ok()
    end)

    it("should have added values", function()
        expect(doublyLinkedList:has("a")).to.equal(false)

        doublyLinkedList:append("a")

        expect(doublyLinkedList:has("a")).to.equal(true)

        doublyLinkedList:append("b")

        expect(doublyLinkedList:has("b")).to.equal(true)

        doublyLinkedList:remove("a")

        expect(doublyLinkedList:has("a")).to.equal(false)
        expect(doublyLinkedList:has("b")).to.equal(true)
    end)

    it("should have head", function()
        expect(doublyLinkedList:has(nil)).to.equal(false)
    end)

    it("should have nil", function()
        doublyLinkedList:append("a")

        expect(doublyLinkedList:has(doublyLinkedList.head)).to.equal(true)
    end)

    it("should iterate through values", function()
        doublyLinkedList:append("a")
        doublyLinkedList:append("b")
        doublyLinkedList:append("c")

        local function iteratedValuesInOrder(values)
            local index = 0

            for value in doublyLinkedList:values() do
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