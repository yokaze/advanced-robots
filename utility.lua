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

function get_tiered_roboport_name(tier)
	if tier == 0 then
		return "roboport"
	else
		return string.format("yokaze-wide-roboport-mk%d", tier)
	end
end

-- category: construction or logistic
-- sub: fast or heavy
function get_tiered_robot_name(category, sub, tier)
	if tier == 0 then
		if category == "construction" then
			return "construction-robot"
		else
			return "logistic-robot"
		end
	else
		local tmpl = "yokaze-%s-%s-robot-mk%d"
		return string.format(tmpl, sub, category, tier)
	end
end

function get_tiered_robot_research_name(category, sub, tier)
	if tier == 0 then
		if category == "construction" then
			return "construction-robotics"
		else
			return "logistic-robotics"
		end
	else
		return get_tiered_robot_name(category, sub, tier)
	end
end

return {
	any = any,
	get_tiered_roboport_name = get_tiered_roboport_name,
	get_tiered_robot_name = get_tiered_robot_name,
	get_tiered_robot_research_name = get_tiered_robot_research_name,
	multiply_unit_value = multiply_unit_value,
}
