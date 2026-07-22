# FoxESS Local — Home Assistant App Repository

Fully local FoxESS Smart WiLAN → MQTT bridge for Home Assistant. Reads your
inverter over the LAN (no FoxCloud, no account, no internet) and publishes ~23
sensors via MQTT Discovery, so a **FoxESS** device appears automatically in
Home Assistant — battery, solar, grid, and inverter, ready for the Energy
dashboard.

> **Note:** Home Assistant 2026.2 (Feb 2026) renamed **Add-ons** to **Apps** in
> the UI. This README uses the current **Apps** wording; on older Home Assistant
> the same screens still appear under **Add-ons**.

## One-click install

[![Open your Home Assistant instance and add the FoxESS Local repository.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FHarshBhardwaj%2Ffoxess-add-on)

1. Click the button above and confirm **Add** in the dialog.
2. The store now lists **FoxESS Local** under this repository — open it and click
   **Install**.
3. On the **Configuration** tab, set `fox_host` to your inverter's IP address
   (it ships blank on purpose) and **Save**.
4. **Start** the app, and enable **Start on boot** + **Watchdog**.

If the button doesn't open your instance, add the repository manually — paste
`https://github.com/HarshBhardwaj/foxess-add-on` under **Repositories**:

- **Home Assistant 2026.2 and newer:** **Settings → Apps → App store → ⋮
  (top-right) → Repositories**.
- **Older Home Assistant:** **Settings → Add-ons → Add-on Store → ⋮ →
  Repositories**.

Then continue from step 2 above.

## Requirements

- Home Assistant OS (apps require the Supervisor; Home Assistant Container
  does not include it).
- The **Mosquitto broker** app and the **MQTT** integration (the app pulls
  the broker credentials from Home Assistant automatically — no config needed).
- Your FoxESS device reachable on the LAN (a static DHCP reservation is
  recommended so its IP stays stable).

## What you get

A single Home Assistant device (**FoxESS `<model>`**, keyed by inverter serial)
with ~23 sensors: battery SoC / power / voltage / current / temperature / health
/ energy (available + lifetime charge & discharge), solar power + daily/total
energy, grid power / frequency / voltage / current / power factor, and inverter
temperature / state. The solar and battery energy sensors use
`state_class: total_increasing`, so they drop straight into the **Energy
dashboard**.

See [`foxess_local/README.md`](foxess_local/README.md) for full details and
options.

## Notes

- The app only **reads** the inverter — it never writes.
- Grid/load instantaneous power needs a CT meter (not fitted on all installs);
  solar and battery come straight from the inverter.
- Treat the device as an untrusted IoT endpoint: dedicated VLAN, firewalled,
  never exposed to the internet.

## License

MIT
