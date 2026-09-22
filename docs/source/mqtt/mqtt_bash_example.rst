.. warning::
    This page has been migrated to varssos-mkdocs (docs/mqtt/mqtt_bash_example.md). This copy is outdated and no longer maintained.

MQTT bash script example
========================

.. code-block:: bash

    #!/bin/bash

    HOST=192.168.0.X
    PORT=1883
    USER="USEEER"
    PASS="ZXCVB..."

    BASE_TIME=`date +%s`

    TOPIC="floor0"
    MESSAGE="19.0"

    echo "$BASE_TIME"
    echo "$USER"
    echo "$TOPIC"
    echo "$MESSAGE"
    echo "$BASE_TIME"

    #mosquitto_pub -h $HOST -p $PORT -u $USER -P $PASS -t $TOPIC -m $MESSAGE -q 2 -d --insecure --capath /etc/ssl/certs/
    mosquitto_pub -h $HOST -p $PORT -u $USER -P $PASS -t $TOPIC -m $MESSAGE
