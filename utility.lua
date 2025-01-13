function any(arr, pred)
	for _, value in ipairs(arr) do
		if pred(value) then
			return true
		end
	end
	return false
end

function multiply_unit_value(unit_value, ratio)
	local value = string.match(unit_value, "([%d%.]+)")
	return string.gsub(unit_value, value, tonumber(value) * ratio)
end

return {
	any = any,
	multiply_unit_value = multiply_unit_value,
}
