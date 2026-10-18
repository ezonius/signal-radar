# Signal Radar

A [Factorio](https://www.factorio.com/) 2.1 mod that adds the **Signal Radar**: a compact **1x1** radar (the vanilla radar is 3x3) stripped of all map charting and nearby-sector revealing. It exists purely as a **circuit-network readout point** — it keeps full circuit-wire connectivity but never reveals sectors or performs scans.

## Details

- 1x1 footprint, 100 health, 10 kW power usage, vanilla radar graphics and sounds, not a military target.
- Uses the lamp's circuit connector position (fits the 1x1 body) with default circuit wire reach.
- Item is in the circuit-network subgroup.

## Recipes

All three are unlocked together with the vanilla **radar** technology:

| Recipe | Result |
|---|---|
| Signal radar | 5 electronic circuits + 5 iron gear wheels + 10 iron plates → 1 signal radar |
| Radar from signal radar | 1 signal radar → 1 radar |
| Signal radar from radar | 1 radar → 1 signal radar |

The two conversion recipes are hand-crafting only (`advanced-crafting`) and cost nothing but the entity itself, so switching between radar types is free.

## Compatibility

- Requires `base >= 2.0.0`; no other dependencies, no settings.

## License

MIT — see [LICENSE](LICENSE).
