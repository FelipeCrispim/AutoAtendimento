#include "mqtt_publisher.h"
#include <string.h>

MQTT_Publisher::MQTT_Publisher() : mosquittopp(CLIENT_ID)
{
    mosqpp::lib_init();
    if(!connect(BROKER_ADDRESS, MQTT_PORT, DEFAULT_KEEP_ALIVE)){
        qDebug() << "Sucesso ao se conectar";
    }
    else{
        qDebug() << "Erro ao se conectar";
    }
    loop_start();

}

MQTT_Publisher::~MQTT_Publisher()
{
    loop_stop();
    mosqpp::lib_cleanup();
}

bool MQTT_Publisher::send_message(const char *_message)
{
    int ret = publish(NULL, MQTT_TOPIC, strlen(_message), _message, false, false);
    if(!ret){
        qDebug() << "Sucesso ao enviar a mensagem";
    }
    else{
        qDebug() << "Erro ao enviar a mensagem";
    }
    return ( ret == MOSQ_ERR_SUCCESS );
}



