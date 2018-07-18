#ifndef CLIENT_H
#define CLIENT_H

#include <QObject>
#include <QTcpSocket>
#include <QAbstractSocket>
#include <QDebug>
#include <QByteArray>
class client : public QObject
{
    Q_OBJECT

public:

    explicit client(QObject *parent = nullptr);
    void doConnect(const QByteArray &value);
    QByteArray getDate() const;

    void setDate(const QByteArray &value);

signals:

public slots:
    void connected();
    void disconnected();
    void bytesWritten(qint64 bytes);
    void readyRead();

private:
    QTcpSocket *socket;
    QByteArray date;
};

#endif // CLIENT_H
