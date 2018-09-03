#ifndef MQTT_PUBLISHER_H
#define MQTT_PUBLISHER_H

#include <mosquittopp.h>
#include <bits/stdc++.h>

#define MAX_PAYLOAD 80
#define MQTT_PORT 1883
#define DEFAULT_KEEP_ALIVE 60
#define BROKER_ADDRESS "192.168.0.52"

#define CLIENT_ID "ANDROID"
#define MQTT_TOPIC "testTopic"

class MQTT_Publisher : public mosqpp::mosquittopp
{
public:
    MQTT_Publisher();
    ~MQTT_Publisher();
    bool send_message(const char * _message);
};

#endif // MQTT_PUBLISHER_H
