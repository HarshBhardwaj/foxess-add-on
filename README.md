# FoxESS Local — Home Assistant Add-on

Runs the local FoxESS Smart WiLAN → MQTT bridge directly on your Home Assistant
machine. It reads your inverter over the LAN (no FoxCloud) and publishes ~21
sensors via MQTT Discovery, so a **FoxESS** device appears automatically in Home
Assistant. Broker credentials are pulled from the Home Assistant MQTT service —
you don't configure them here.

## Install (local add-on)

1. Copy the `foxess_local` folder into the `addons/` share on your Home
   Assistant host. Get there with the **Samba share** add-on
   (`\\homeassistant\addons`) or the **Advanced SSH & Web Terminal** add-on
   (`/addons/foxess_local/…`).
2. In Home Assistant: **Settings → Add-ons → Add-on Store**, open the top-right
   menu (⋮) and choose **Check for updates** / reload. A **Local add-ons**
   section now shows **FoxESS Local**.
3. Open it, click **Install** (it builds the image — takes a minute).
4. Go to the **Configuration** tab and set `fox_host` to **your** inverter's IP
   address (it ships blank on purpose — the add-on won't start until you set it).
   Leave the rest at defaults.
5. **Start** the add-on. Enable **Start on boot** and **Watchdog**.

## Verify

- **Log** tab should show: `FoxESS device : …`, `MQTT broker : …`, then periodic
  activity with no errors.
- **Settings → Devices & Services → MQTT** now lists a device
  **FoxESS AIO-H1-11.4-US** with ~23 sensors (battery SoC/power/voltage/…,
  solar, grid, inverter).

## Options

| Option | Default | Meaning |
|--------|---------|---------|
| `fox_host` | *(blank — required)* | Your inverter/gateway IP address; you must set this |
| `interval` | `15` | Publish interval in seconds |
| `topic_prefix` | `fox` | MQTT topic prefix for state topics |
| `discovery_prefix` | `homeassistant` | HA discovery prefix (leave as-is) |

## Energy dashboard

The solar energy sensors use `state_class: total_increasing`, so add
**Solar Energy Total** under **Settings → Dashboards → Energy → Solar
Production**. (Grid/load instantaneous power needs a CT meter, which this
inverter install doesn't have — solar and battery come straight from the
inverter.)

## Notes

- Requires the **Mosquitto broker** add-on and the **MQTT** integration (you
  already have both).
- The add-on only *reads* the inverter; it never writes. Writes remain a
  separate, opt-in Python API on a trusted host.
- Prefer a static DHCP reservation for the inverter so `fox_host` stays valid.
