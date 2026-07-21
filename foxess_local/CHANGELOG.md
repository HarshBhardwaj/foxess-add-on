# Changelog

## 0.1.5

- Bundle foxess-local 0.2.0. Adds battery charge/discharge power and cumulative
  battery charge/discharge energy (kWh) sensors for the Energy dashboard.
- Add real net grid import/export from model 65004 (`Grid Power`, `Grid Import
Power`, `Grid Export Power`) plus `AC Input/Output Energy Total` as a grid
  energy proxy where no external meter is installed.
- Sentinel "not available" registers now publish as `null` (HA shows
  "unavailable") instead of nonsense values.
- The old model-701 "grid" sensors moved to the `fox/ac` group (inverter AC
  terminal); a few `sensor.foxess_*_grid_*` entities become `*_ac_*`.

## 0.1.4

- Publish pre-built multi-arch (aarch64/amd64) images to GHCR via GitHub Actions
  and reference them from `config.yaml` (`image:`), so Home Assistant installs
  and updates by pulling the image instead of building on-device.

## 0.1.3

- Restructure the repo as a Home Assistant add-on repository.

## 0.1.2

- Add Battery Charge Total and Battery Discharge Total sensors (for the Home
  Assistant Energy dashboard battery section).

## 0.1.1

- Add `build.yaml` and a default base image so the add-on always builds.
- `fox_host` now ships blank and is required (set it on the Configuration tab).

## 0.1.0

- Initial release: local FoxESS Smart WiLAN -> MQTT bridge with Home Assistant
  MQTT Discovery, no FoxCloud.
