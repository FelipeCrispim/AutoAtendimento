#include "client.h"

client::client(QObject *parent) : QObject(parent)
{
}


void client::doConnect(const QByteArray &value)
{
    date = value;
    socket = new QTcpSocket(this);
    connect(socket, SIGNAL(connected()), this, SLOT(connected()));
    connect(socket, SIGNAL(disconnected()), this, SLOT(disconnected()));
    connect(socket, SIGNAL(readyRead()), this, SLOT(readyRead()));
    connect(socket, SIGNAL(bytesWritten(qint64)), this, SLOT(bytesWritten(qint64)));

    qDebug() << "Connecting...";
    socket->connectToHost("192.168.0.16", 1234);

    if(!socket->waitForConnected(5000)){
        qDebug() << "Error: " << socket->errorString();
    }
}


// basicamente segue o seguinte fluxo é conectado, é enviado, recebido e desconectado
void client::connected()
{
    qDebug() << "Connected!";
  // QByteArray message = getDate().toLatin1();
    //QString::fromUtf8(const QByteArray &getDate());
    //QByteArray ba("hello");
    socket->write(date);
    socket->waitForBytesWritten();

}

void client::disconnected()
{
    qDebug() << "Disconnected!";
}

void client::bytesWritten(qint64 bytes)
{
    qDebug() << "we wrote: " << bytes;
}

void client::readyRead()
{
    qDebug() << "Reading....";
    QByteArray Data =  socket->readAll();
    qDebug() << Data;
    if(Data == "ok"){
        qDebug() << "fechando conexão";
        socket->close();
    }
    else{
        qDebug() << "Mantendo conexão";
    }
}

void client::setDate(const QByteArray &value)
{
    date = value;
}

QByteArray client::getDate() const
{
    return date;
}
