# Advanced Robots
Advanced Robots adds three tiers of fast and heavy robots, along with three tiers of wide area roboports.

- Fast construction robot MK1-3
- Heavy construction robot MK1-3
- Fast logistic robot MK1-3
- Heavy logistic robot MK1-3
- Wide roboport MK1-3

## Robots

### Spec

| Name | Cargo | Speed | Energy | Performance |
| ---- | ----: | ----: | ----: | ----: |
| Construction robot | 1 | 1x  | 1.00x | 1.00x |
| Fast construction robot MK1  | 1 | 2x | 1.74x | 1.14x |
| Fast construction robot MK2  | 2 | 4x | 3.03x | 2.64x |
| Fast construction robot MK3  | 3 | 8x | 5.28x | 4.55x |
| Heavy construction robot MK1 | 2 | 1x | 1.00x | 2.00x |
| Heavy construction robot MK2 | 4 | 2x | 1.74x | 4.59x |
| Heavy construction robot MK3 | 8 | 3x | 2.41x | 9.97x |

| Name | Cargo | Speed | Energy | Performance |
| ---- | ----: | ----: | ----: | ----: |
| Logistic robot | 1 | 1x | 1.00x | 1.00x | 1.00x |
| Fast logistic robot MK1 | 1 | 2x | 1.74x | 1.14x |
| Fast logistic robot MK2 | 2 | 4x | 3.03x | 2.64x |
| Fast logistic robot MK3 | 3 | 8x | 5.28x | 4.55x |
| Heavy logistic robot MK1 | 2 | 1x | 1.00x | 2.00x |
| Heavy logistic robot MK2 | 4 | 2x | 1.74x | 4.59x |
| Heavy logistic robot MK3 | 8 | 3x | 2.41x | 9.97x |

Performance shows how many items a robot can handle per a same amount of energy.

### Recipe

- Fast construction robot MK1
    - 2 Construction robots
    - 2 Electoronic circuits
    - 2 Low density structures
- Fast construction robot MK2
    - 2 Fast construction robots MK1
    - 2 Advanced circuits
    - 2 Low density structures
- Fast construction robot MK3
    - 2 Fast construction robots MK2
    - 2 Processing units
    - 2 Low density structures
    - 10 Lubricant
- Heavy construction robot MK1
    - 2 Construction robots
    - 2 Electoronic circuits
    - 2 Low density structures
- Heavy construction robot MK2
    - 2 Heavy construction robots MK1
    - 2 Advanced circuits
    - 2 Low density structures
- Heavy construction robot MK3
    - 2 Heavy construction robots MK2
    - 2 Processing units
    - 2 Low density structures
    - 10 Lubricant

Recipes for the logistic robots are similar.

## Roboports

### Spec

| Name | Range | Radar | Charge | Idle |
| ---- | ----: | ----: | ----: | ----: |
| Roboport | 1x | 2 x 2 | 4 x 500kW | 50kW |
| Wide roboport MK1 | 2x | 4 x 4 | 6 x 1.0MW | 200kW |
| Wide roboport MK2 | 4x | 7 x 7 | 8 x 2.0MW | 800kW |
| Wide roboport MK3 | 8x | 14 x 14 | 12 x 4.0MW | 3.2MW |

Wide roboports need a large amount of energy on idle, because they implement radar functionality in 2.0.

### Recipe

- Wide roboport MK1
    - 1 Roboport
    - 50 Copper cables
    - 50 Electronic circuits
- Wide roboport MK2
    - 1 Wide roboport MK1
    - 50 Advanced circuits
    - 50 Engine units
- Wide roboport MK3
    - 1 Wide roboport MK2
    - 50 Processing units
    - 50 Electric engine units
