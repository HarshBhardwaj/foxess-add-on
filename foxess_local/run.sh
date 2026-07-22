#!/usr/bin/with-contenv bashio
# FoxESS Local app entrypoint.
# Reads device settings from the app options and the MQTT broker details
# straight from the Home Assistant MQTT service (Mosquitto broker app).

set -e

FOX_HOST="$(bashio::config 'fox_host')"
INTERVAL="$(bashio::config 'interval')"
PREFIX="$(bashio::config 'topic_prefix')"
DISCOVERY="$(bashio::config 'discovery_prefix')"

if bashio::var.is_empty "${FOX_HOST}"; then
    bashio::exit.nok "Set 'fox_host' to your inverter's IP address on the Configuration tab, then start the app."
fi

if ! bashio::services.available "mqtt"; then
    bashio::exit.nok "No MQTT service is available. Install/enable the Mosquitto broker app and the MQTT integration first."
fi

MQTT_HOST="$(bashio::services mqtt 'host')"
MQTT_PORT="$(bashio::services mqtt 'port')"
MQTT_USER="$(bashio::services mqtt 'username')"
MQTT_PASS="$(bashio::services mqtt 'password')"

bashio::log.info "FoxESS device : ${FOX_HOST}"
bashio::log.info "MQTT broker   : ${MQTT_HOST}:${MQTT_PORT} (user ${MQTT_USER})"
bashio::log.info "Publishing every ${INTERVAL}s under '${PREFIX}/' (discovery '${DISCOVERY}/')"

exec fox mqtt "${FOX_HOST}" \
    --broker "${MQTT_HOST}" \
    --port "${MQTT_PORT}" \
    --username "${MQTT_USER}" \
    --password "${MQTT_PASS}" \
    --prefix "${PREFIX}" \
    --discovery-prefix "${DISCOVERY}" \
    --interval "${INTERVAL}"
