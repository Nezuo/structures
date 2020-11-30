return function()
    local Stack = require(script.Parent.Stack)
    local typeOf = require(script.parent.typeOf)

    local stack

    beforeEach(function()
        stack = Stack()
    end)
    
    it("should be correct type", function()
        expect(typeOf(stack)).to.equal("Stack")
    end)

    it("should return correct string", function()
        stack:push("a")
        stack:push("b")
        stack:push("c")

        expect(tostring(stack)).to.equal("Stack {a, b, c}")
    end)

    it("should give correct size", function()
        stack:push("a")
        stack:push("b")
        stack:push("c")

        expect(stack.size).to.equal(3)
        expect(stack:isEmpty()).to.equal(false)

        stack:push("d")

        expect(stack.size).to.equal(4)
        expect(stack:isEmpty()).to.equal(false)

        stack:pop()

        expect(stack.size).to.equal(3)
        expect(stack:isEmpty()).to.equal(false)

        stack:pop()
        stack:pop()
        stack:pop()

        expect(stack.size).to.equal(0)
        expect(stack:isEmpty()).to.equal(true)

        stack:pop()

        expect(stack.size).to.equal(0)
        expect(stack:isEmpty()).to.equal(true)
    end)

    it("should not add nil", function()
        stack:push(nil)

        expect(stack:isEmpty()).to.equal(true)
    end)
    
    it("should follow LIFO", function()
        stack:push("a")
        stack:push("b")
        stack:push("c")

        expect(stack:pop()).to.equal("c")
        expect(stack:pop()).to.equal("b")
        expect(stack:pop()).to.equal("a")
        expect(stack:pop()).never.to.be.ok()
    end)

    it("should return last value or nil", function()
        stack:push("a")
        stack:push("b")
        stack:push("c")

        expect(stack:peek()).to.equal("c")

        stack:pop()
        expect(stack:peek()).to.equal("b")

        stack:pop()
        expect(stack:peek()).to.equal("a")

        stack:pop()
        expect(stack:peek()).never.to.be.ok()
    end)

    it("should iterate through elements", function()
        stack:push("a")
        stack:push("b")
        stack:push("c")

        local function iteratedElementsInOrder(elements)
            local index = 0

            for value in stack:elements() do
                index += 1

                if elements[index] ~= value then
                    return false
                end
            end

            return index == #elements
        end

        expect(iteratedElementsInOrder({"a", "b", "c"})).to.equal(true)
    end)
end