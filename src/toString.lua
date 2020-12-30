local function toString(value)
	if typeof(value) == "string" then
		return "\"" .. value .. "\""
	else
		return tostring(value)
	end
end

return toString
