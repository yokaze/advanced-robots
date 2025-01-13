require("utility")

pre = {
	{
		"construction-robotics",
		"logistic-robotics",
	},
	{
		utility.get_tiered_roboport_name(1),
		"production-science-pack",
	},
	{
		utility.get_tiered_roboport_name(2),
		"utility-science-pack",
	},
}

-- Wide roboports MK1-3 --
for i = 1, 3 do
	name = utility.get_tiered_roboport_name(i)
	prev = utility.get_tiered_roboport_name(i - 1)

	tech = table.deepcopy(data.raw["technology"]["construction-robotics"])
	tech.name = name
	if i == 1 then
		tech.prerequisites = {
			"construction-robotics",
			"logistic-robotics",
		}
	else
		tech.prerequisites = pre[i]
	end
	tech.effects = { { recipe = name, type = "unlock-recipe" } }
	tech.icon = table.deepcopy(data.raw["technology"]["robotics"].icon)

	tech_cost = string.format("research-speed-%d", i + 3)
	tech.unit = table.deepcopy(data.raw["technology"][tech_cost].unit)

	data:extend({ tech })
end
