# The Home Assistant supervisor passes BUILD_FROM (from build.yaml). A valid
# default is set so the image never fails to build with a blank base image;
# the supervisor overrides it with the correct per-architecture base.
ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
FROM ${BUILD_FROM}

# Home Assistant base images are Alpine-based.
RUN apk add --no-cache python3 py3-pip

# Install the bundled foxess-local wheel with the MQTT extra (pure-Python deps,
# so this works on every architecture without compilation).
COPY foxess_local-0.2.0-py3-none-any.whl /tmp/
RUN pip3 install --no-cache-dir --break-system-packages \
        "/tmp/foxess_local-0.2.0-py3-none-any.whl[mqtt]" \
    && rm -f /tmp/*.whl

COPY run.sh /
RUN chmod a+x /run.sh

CMD ["/run.sh"]
