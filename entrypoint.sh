#!/bin/sh
set -e

TTYD_ARGS="-W -s 3 -t titleFixed=/bin/sh -t rendererType=webgl -t disableLeaveAlert=true"

if [ -n "$TTYD_USERNAME" ] && [ -n "$TTYD_PASSWORD" ]; then
    TTYD_ARGS="-c ${TTYD_USERNAME}:${TTYD_PASSWORD} $TTYD_ARGS"
fi

if [ -n "$TTYD_PREFIX" ]; then
    TTYD_ARGS="-b ${TTYD_PREFIX} $TTYD_ARGS"
fi

exec ttyd $TTYD_ARGS /bin/sh -i -l
