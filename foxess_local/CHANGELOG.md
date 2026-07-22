# Changelog

## 0.1.7

- Align user-facing docs with Home Assistant 2026.2: **Add-ons** → **Apps**
  (including the Info-tab README, install steps, and log messages).
- Fix the one-click install badge alt text; keep the official repository
  redirect URL. Manual install now documents **Settings → Apps → App store**
  for 2026.2+ and the legacy **Add-ons** path for older installs.
- Requirements: Home Assistant OS only (Supervised has been unsupported since
  2025.12). Repository display name simplified to **FoxESS Local**.

## 0.1.6

- Fix Grid Import/Export and Load reading 0. Grid and load now come from model
  65031 (Fox Hub G2 "HubInfo") read at the gateway address, where the whole-home
  meter values live — verified against the device (959 W import matching
  FoxCloud). Previously these were read from model 65004 at the inverter address,
  where they are zeroed, which caused the Energy dashboard to attribute all house
  consumption to the battery.
- Grid Import/Export Energy now use the Hub's real cumulative counters (import
  3660.5 kWh / export 316.5 kWh on the reference unit) instead of the
  unavailable revenue-meter registers; adds Grid Import/Export Energy Today.
- Grid power sign verified: negative = import, positive = export.
- Bundles foxess-local 0.3.0.

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

- Restructure the repo as a Home Assistant app repository.

## 0.1.2

- Add Battery Charge Total and Battery Discharge Total sensors (for the Home
  Assistant Energy dashboard battery section).

## 0.1.1

- Add `build.yaml` and a default base image so the app always builds.
- `fox_host` now ships blank and is required (set it on the Configuration tab).

## 0.1.0

- Initial release: local FoxESS Smart WiLAN -> MQTT bridge with Home Assistant
  MQTT Discovery, no FoxCloud.
