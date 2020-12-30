local function typeOf(value)
	local valueType = typeof(value)

	if valueType == "table" then
		local metatable = getmetatable(value)

		if metatable ~= nil and metatable.__type ~= nil then
			return metatable.__type
		end
	end

	return valueType
end

return typeOf
