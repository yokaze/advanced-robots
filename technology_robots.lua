-- https://github.com/wube/factorio-data/blob/master/core/lualib/util.lua

require("utility")

base_count = {
	["worker-robots-speed-2"] = 100,
	["worker-robots-speed-4"] = 250,
	["worker-robots-speed-6"] = 1000,
	["worker-robots-storage-1"] = 200,
	["worker-robots-storage-2"] = 300,
	["worker-robots-storage-3"] = 450,
}

-- Fast/Heavy construction robot MK1-3 --
for _, sub in ipairs({ "fast", "heavy" }) do
	for i = 1, 3 do
		name = utility.get_tiered_robot_research_name("construction", sub, i)
		prev = utility.get_tiered_robot_research_name("construction", sub, i - 1)
		tech = table.deepcopy(data.raw["technology"]["construction-robotics"])

		if sub == "fast" then
			tech_direct = string.format("worker-robots-speed-%d", i * 2)
			tech_cross = string.format("worker-robots-storage-%d", i - 1)
			cost = 4
			tech.icons = util.technology_icon_constant_movement_speed(tech.icon)
		else
			tech_direct = string.format("worker-robots-storage-%d", i)
			tech_cross = string.format("worker-robots-speed-%d", (i - 1) * 2)
			cost = 4
			tech.icons = util.technology_icon_constant_capacity(tech.icon)
		end

		tech.name = name
		tech.prerequisites = {
			prev,
			tech_direct,
		}
		if i == 1 then
			table.insert(tech.prerequisites, "low-density-structure")
		elseif i >= 2 then
			table.insert(tech.prerequisites, tech_cross)
		end

		tech.effects = { { recipe = name, type = "unlock-recipe" } }
		tech.unit = {
			count = base_count[tech_direct] * cost,
			ingredients = table.deepcopy(data.raw["technology"][tech_direct].unit.ingredients),
			time = data.raw["technology"][tech_direct].unit.time,
		}

		data:extend({ tech })
	end
end

-- Fast/Heavy logistic robot MK1-3 --
for _, sub in ipairs({ "fast", "heavy" }) do
	for i = 1, 3 do
		name = utility.get_tiered_robot_research_name("logistic", sub, i)
		prev = utility.get_tiered_robot_research_name("logistic", sub, i - 1)
		tech = table.deepcopy(data.raw["technology"]["logistic-robotics"])

		if sub == "fast" then
			tech_direct = string.format("worker-robots-speed-%d", i * 2)
			tech_cross = string.format("worker-robots-storage-%d", i - 1)
			cost = 4
			tech.icons = util.technology_icon_constant_movement_speed(tech.icon)
		else
			tech_direct = string.format("worker-robots-storage-%d", i)
			tech_cross = string.format("worker-robots-speed-%d", (i - 1) * 2)
			cost = 4
			tech.icons = util.technology_icon_constant_capacity(tech.icon)
		end

		tech.name = name
		tech.prerequisites = {
			prev,
			tech_direct,
		}
		if i == 1 then
			table.insert(tech.prerequisites, "low-density-structure")
		elseif i >= 2 then
			table.insert(tech.prerequisites, tech_cross)
		end

		tech.effects = { { recipe = name, type = "unlock-recipe" } }
		tech.unit = {
			count = base_count[tech_direct] * cost,
			ingredients = table.deepcopy(data.raw["technology"][tech_direct].unit.ingredients),
			time = data.raw["technology"][tech_direct].unit.time,
		}

		data:extend({ tech })
	end
end
