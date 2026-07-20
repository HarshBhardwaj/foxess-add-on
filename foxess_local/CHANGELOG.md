# Changelog

## 0.1.3
- Publish pre-built multi-arch images to GHCR via GitHub Actions; Home Assistant
  now installs/updates instantly without building on-device.

## 0.1.2
- Add Battery Charge Total and Battery Discharge Total sensors (for the Home
  Assistant Energy dashboard battery section).

## 0.1.1
- Add `build.yaml` and a default base image so the add-on always builds.
- `fox_host` now ships blank and is required (set it on the Configuration tab).

## 0.1.0
- Initial release: local FoxESS Smart WiLAN -> MQTT bridge with Home Assistant
  MQTT Discovery, no FoxCloud.
