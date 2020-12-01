return function()
    local Queue = require(script.Parent.Queue)
    local typeOf = require(script.parent.typeOf)

    local queue

    beforeEach(function()
        queue = Queue()
    end)
    
    it("should be correct type", function()
        expect(typeOf(queue)).to.equal("Queue")
    end)

    it("should return correct string", function()
        expect(tostring(queue)).to.equal("Queue {}")

        queue:enqueue("a")
        queue:enqueue("b")
        queue:enqueue("c")

        expect(tostring(queue)).to.equal("Queue {a, b, c}")
    end)

    it("should give correct size", function()
        queue:enqueue("a")
        queue:enqueue("b")
        queue:enqueue("c")

        expect(queue.size).to.equal(3)
        expect(queue:isEmpty()).to.equal(false)

        queue:enqueue("d")

        expect(queue.size).to.equal(4)
        expect(queue:isEmpty()).to.equal(false)

        queue:dequeue()

        expect(queue.size).to.equal(3)
        expect(queue:isEmpty()).to.equal(false)

        queue:dequeue()
        queue:dequeue()
        queue:dequeue()

        expect(queue.size).to.equal(0)
        expect(queue:isEmpty()).to.equal(true)

        queue:dequeue()

        expect(queue.size).to.equal(0)
        expect(queue:isEmpty()).to.equal(true)
    end)

    it("should not add nil", function()
        queue:enqueue(nil)

        expect(queue:isEmpty()).to.equal(true)
    end)
    
    it("should follow FIFO", function()
        queue:enqueue("a")
        queue:enqueue("b")
        queue:enqueue("c")

        expect(queue:dequeue()).to.equal("a")
        expect(queue:dequeue()).to.equal("b")
        expect(queue:dequeue()).to.equal("c")
        expect(queue:dequeue()).never.to.be.ok()
    end)

    it("should return first value or nil", function()
        queue:enqueue("a")
        queue:enqueue("b")
        queue:enqueue("c")

        expect(queue:peek()).to.equal("a")

        expect(queue:dequeue()).to.equal("a")
        expect(queue:dequeue()).to.equal("b")
        expect(queue:dequeue()).to.equal("c")

        expect(queue:peek()).never.to.be.ok()
    end)

    it("should iterate through elements", function()
        queue:enqueue("a")
        queue:enqueue("b")
        queue:enqueue("c")

        local function iteratedElementsInOrder(elements)
            local index = 0

            for value in queue:elements() do
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