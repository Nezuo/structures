return function()
    local LinkedListNode = require(script.Parent.LinkedListNode)
    local typeOf = require(script.parent.typeOf)

    local linkedListNode

    beforeEach(function()
        linkedListNode = LinkedListNode.new("value")
    end)

    it("should be correct type", function()
        expect(typeOf(linkedListNode)).to.equal("LinkedListNode")
    end)

    it("should return correct string", function()
        expect(tostring(linkedListNode)).to.equal("value")
    end)
end