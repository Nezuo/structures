return function()
	local DoublyLinkedListNode = require(script.Parent.DoublyLinkedListNode)
	local typeOf = require(script.parent.typeOf)

	local doublyLinkedListNode

	beforeEach(function()
		doublyLinkedListNode = DoublyLinkedListNode.new()
	end)

	it("should be correct type", function()
        expect(typeOf(doublyLinkedListNode)).to.equal("DoublyLinkedListNode")
    end)

	it("should return correct string", function()
        expect(tostring(doublyLinkedListNode)).to.equal("nil")

        doublyLinkedListNode.value = "value"

        expect(tostring(doublyLinkedListNode)).to.equal("value")
    end)
end
