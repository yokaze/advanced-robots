require("utility")

pre_fast = {
	{
		"construction-robotics",
		"logistic-robotics",
	},
	{
		utility.get_tiered_roboport_name("fast", 1),
		"production-science-pack",
	},
	{
		utility.get_tiered_roboport_name("fast", 2),
		"utility-science-pack",
	},
}

pre_wide = {
	{
		"construction-robotics",
		"logistic-robotics",
	},
	{
		utility.get_tiered_roboport_name("wide", 1),
		"production-science-pack",
	},
	{
		utility.get_tiered_roboport_name("wide", 2),
		"utility-science-pack",
	},
}

-- Fast roboports MK1-3 --
for i = 1, 3 do
	name = utility.get_tiered_roboport_name("fast", i)
	prev = utility.get_tiered_roboport_name("fast", i - 1)

	tech = table.deepcopy(data.raw["technology"]["construction-robotics"])
	tech.name = name
	if i == 1 then
		tech.prerequisites = {
			"construction-robotics",
			"logistic-robotics",
		}
	else
		tech.prerequisites = pre_fast[i]
	end
	tech.effects = { { recipe = name, type = "unlock-recipe" } }
	tech.icons =
		util.technology_icon_constant_movement_speed(data.raw["technology"]["worker-robots-speed-1"].icons[1].icon)

	tech_cost = string.format("research-speed-%d", i + 3)
	tech.unit = table.deepcopy(data.raw["technology"][tech_cost].unit)

	data:extend({ tech })
end

-- Wide roboports MK1-3 --
for i = 1, 3 do
	name = utility.get_tiered_roboport_name("wide", i)
	prev = utility.get_tiered_roboport_name("wide", i - 1)

	tech = table.deepcopy(data.raw["technology"]["construction-robotics"])
	tech.name = name
	if i == 1 then
		tech.prerequisites = {
			"construction-robotics",
			"logistic-robotics",
		}
	else
		tech.prerequisites = pre_wide[i]
	end
	tech.effects = { { recipe = name, type = "unlock-recipe" } }
	tech.icons = util.technology_icon_constant_range(data.raw["technology"]["worker-robots-speed-1"].icons[1].icon)

	tech_cost = string.format("research-speed-%d", i + 3)
	tech.unit = table.deepcopy(data.raw["technology"][tech_cost].unit)

	data:extend({ tech })
end
