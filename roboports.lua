utility = require("utility")

circuits = {
	"electronic-circuit",
	"advanced-circuit",
	"processing-unit",
}

if mods["aai-industry"] then
	parts = {
		"copper-cable",
		"electric-motor",
		"electric-engine-unit",
	}
else
	parts = {
		"copper-cable",
		"engine-unit",
		"electric-engine-unit",
	}
end

parallels = { 6, 8, 12 }

function register(base_entity, base_item, name, spec, ingredients)
	local entity = table.deepcopy(base_entity)
	entity.name = name
	entity.construction_radius = entity.construction_radius * spec.range
	entity.logistics_radius = entity.logistics_radius * spec.range
	entity.minable.result = name

	entity.energy_source.buffer_capacity =
		utility.multiply_unit_value(entity.energy_source.buffer_capacity, spec.battery)
	entity.energy_source.input_flow_limit =
		utility.multiply_unit_value(entity.energy_source.input_flow_limit, spec.battery)
	entity.energy_usage = utility.multiply_unit_value(entity.energy_usage, spec.usage)
	width = entity.charging_offsets[1][1]
	height = entity.charging_offsets[1][2]

	entity.charging_energy = utility.multiply_unit_value(entity.charging_energy, spec.charge)
	if spec.parallel ~= 4 then
		offsets = {}
		for i = 1, spec.parallel do
			rad = (2 * math.pi * i) / spec.parallel
			table.insert(offsets, { math.cos(rad) * width, math.sin(rad) * height })
		end
		entity.charging_offsets = offsets
	end

	local item = table.deepcopy(base_item)
	item.name = name
	item.place_result = name

	local recipe = {
		type = "recipe",
		name = name,
		enabled = false,
		energy_required = 10,
		ingredients = table.deepcopy(ingredients),
		results = { { type = "item", name = name, amount = 1 } },
	}

	data:extend({ entity, item, recipe })
end

-- Wide roboport MK1-3 --
for i = 1, 3 do
	name = utility.get_tiered_roboport_name(i)
	prev = utility.get_tiered_roboport_name(i - 1)
	spec = {
		range = 2 ^ i,
		charge = 2 ^ i,
		parallel = parallels[i],
		battery = (2 ^ i) * parallels[i] / 4,
		usage = 4 ^ i,
	}
	ingredients = {
		{ type = "item", name = prev, amount = 1 },
		{ type = "item", name = circuits[i], amount = 50 },
		{ type = "item", name = parts[i], amount = 50 },
	}

	register(data.raw["roboport"]["roboport"], data.raw["item"]["roboport"], name, spec, ingredients)
end
