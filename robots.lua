utility = require("utility")

circuits = {
	"electronic-circuit",
	"advanced-circuit",
	"processing-unit",
}

function get_fast_tiered_spec(tier)
	return {
		speed = 2 ^ tier,
		cargo = tier,
		battery = (2 ^ tier) ^ 0.8,
		efficiency = (2 ^ tier) ^ 0.2,
	}
end

function get_heavy_tiered_spec(tier)
	return {
		speed = tier,
		cargo = 2 ^ tier,
		battery = tier ^ 0.8,
		efficiency = tier ^ 0.2,
	}
end

function register(base_entity, base_item, name, spec, ingredients)
	local entity = table.deepcopy(base_entity)
	entity.name = name
	entity.minable.result = name
	entity.speed = entity.speed * spec.speed
	entity.max_payload_size = entity.max_payload_size * spec.cargo

	entity.max_energy = utility.multiply_unit_value(entity.max_energy, spec.battery)
	entity.energy_per_move = utility.multiply_unit_value(entity.energy_per_move, 1 / spec.efficiency)

	local item = table.deepcopy(base_item)
	item.name = name
	item.place_result = name

	local recipe = {
		type = "recipe",
		name = name,
		enabled = false,
		energy_required = 1,
		ingredients = table.deepcopy(ingredients),
		results = { { type = "item", name = name, amount = 1 } },
	}
	if utility.any(ingredients, function(x)
		return x.type == "fluid"
	end) then
		recipe.category = "crafting-with-fluid"
	end

	data:extend({ entity, item, recipe })
end

-- Fast construction robot MK1-3 --
for i = 1, 3 do
	name = utility.get_tiered_robot_name("construction", "fast", i)
	prev = utility.get_tiered_robot_name("construction", "fast", i - 1)

	ingredients = {
		{ type = "item", name = prev, amount = 2 },
		{ type = "item", name = circuits[i], amount = 2 },
		{ type = "item", name = "low-density-structure", amount = 2 },
	}
	if i == 3 then
		table.insert(ingredients, {
			type = "fluid",
			name = "lubricant",
			amount = 10,
		})
	end

	register(
		data.raw["construction-robot"]["construction-robot"],
		data.raw["item"]["construction-robot"],
		name,
		get_fast_tiered_spec(i),
		ingredients
	)
end

-- Heavy construction robot MK1-3 --
for i = 1, 3 do
	name = utility.get_tiered_robot_name("construction", "heavy", i)
	prev = utility.get_tiered_robot_name("construction", "heavy", i - 1)

	ingredients = {
		{ type = "item", name = prev, amount = 2 },
		{ type = "item", name = circuits[i], amount = 2 },
		{ type = "item", name = "low-density-structure", amount = 2 },
	}
	if i == 3 then
		table.insert(ingredients, {
			type = "fluid",
			name = "lubricant",
			amount = 10,
		})
	end

	register(
		data.raw["construction-robot"]["construction-robot"],
		data.raw["item"]["construction-robot"],
		name,
		get_heavy_tiered_spec(i),
		ingredients
	)
end

-- Fast logistic robot MK1-3 --
for i = 1, 3 do
	name = utility.get_tiered_robot_name("logistic", "fast", i)
	prev = utility.get_tiered_robot_name("logistic", "fast", i - 1)

	ingredients = {
		{ type = "item", name = prev, amount = 2 },
		{ type = "item", name = circuits[i], amount = 2 },
		{ type = "item", name = "low-density-structure", amount = 2 },
	}
	if i == 3 then
		table.insert(ingredients, {
			type = "fluid",
			name = "lubricant",
			amount = 10,
		})
	end

	register(
		data.raw["logistic-robot"]["logistic-robot"],
		data.raw["item"]["logistic-robot"],
		name,
		get_fast_tiered_spec(i),
		ingredients
	)
end

-- Heavy logistic robot MK1-3 --
for i = 1, 3 do
	tmpl = "yokaze-heavy-logistic-robot-mk%d"
	name = utility.get_tiered_robot_name("logistic", "heavy", i)
	prev = utility.get_tiered_robot_name("logistic", "heavy", i - 1)

	ingredients = {
		{ type = "item", name = prev, amount = 2 },
		{ type = "item", name = circuits[i], amount = 2 },
		{ type = "item", name = "low-density-structure", amount = 2 },
	}
	if i == 3 then
		table.insert(ingredients, {
			type = "fluid",
			name = "lubricant",
			amount = 10,
		})
	end

	register(
		data.raw["logistic-robot"]["logistic-robot"],
		data.raw["item"]["logistic-robot"],
		name,
		get_heavy_tiered_spec(i),
		ingredients
	)
end
