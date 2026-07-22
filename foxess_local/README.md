# FoxESS Local — Home Assistant App

Runs the local FoxESS Smart WiLAN → MQTT bridge directly on your Home Assistant
machine. It reads your inverter over the LAN (no FoxCloud) and publishes ~23
sensors via MQTT Discovery, so a **FoxESS** device appears automatically in Home
Assistant. Broker credentials are pulled from the Home Assistant MQTT service —
you don't configure them here.

> **Note:** Home Assistant 2026.2 renamed **Add-ons** to **Apps** in the UI.
> Paths below use **Apps**; on older Home Assistant look under **Add-ons**.
> Packaging is unchanged (`foxess_local/`, `config.yaml`, slug).

## Install

Prefer the one-click button and steps in the [repository README](../README.md).
Summary:

1. Add this repository in Home Assistant:
   - **2026.2+:** **Settings → Apps → App store → ⋮ → Repositories**
   - **Older:** **Settings → Add-ons → Add-on Store → ⋮ → Repositories**
2. Open **FoxESS Local**, click **Install** (pulls a pre-built GHCR image).
3. On the **Configuration** tab, set `fox_host` to **your** inverter's IP
   address (it ships blank on purpose — the app won't start until you set it).
   Leave the rest at defaults.
4. **Start** the app. Enable **Start on boot** and **Watchdog**.

## Verify

- **Log** tab should show: `FoxESS device : …`, `MQTT broker : …`, then periodic
  activity with no errors.
- **Settings → Devices & Services → MQTT** now lists a device
  **FoxESS AIO-H1-11.4-US** with ~23 sensors (battery SoC/power/voltage/…,
  solar, grid, inverter).

## Options

| Option             | Default              | Meaning                                             |
| ------------------ | -------------------- | --------------------------------------------------- |
| `fox_host`         | _(blank — required)_ | Your inverter/gateway IP address; you must set this |
| `interval`         | `15`                 | Publish interval in seconds                         |
| `topic_prefix`     | `fox`                | MQTT topic prefix for state topics                  |
| `discovery_prefix` | `homeassistant`      | HA discovery prefix (leave as-is)                   |

## Energy dashboard

The solar and battery energy sensors use `state_class: total_increasing`, so
add them under **Settings → Dashboards → Energy**. (Grid/load instantaneous
power needs a CT meter on some installs — solar and battery come straight from
the inverter.)

## Notes

- Requires the **Mosquitto broker** app and the **MQTT** integration.
- The app only _reads_ the inverter; it never writes. Writes remain a
  separate, opt-in Python API on a trusted host.
- Prefer a static DHCP reservation for the inverter so `fox_host` stays valid.
