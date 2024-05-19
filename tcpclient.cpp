#include "tcpclient.h"
#include <QHostAddress>
#include <QNetworkInterface>
#include <QThread>

TcpClient::TcpClient(QObject *parent) : QObject(parent)
{
    client = new QTcpSocket[numEsp32];
}

void TcpClient::sendAll(QString msg)
{
    connectToServer();
    QThread::msleep(100);
    qDebug() << "send all====";
    for (int i = 0; i < numEsp32 ; i++)
    {
        (client + i)->write(msg.toUtf8());
    }
    exit();
}

void TcpClient::sendAllDetails(QVector<QString> msg)
{
    connectToServer();
    QThread::msleep(100);
    for (int i = 0; i < numEsp32 ; i++)
    {
        (client + i)->write("DKTC_" + msg[i].toUtf8());
    }
    exit();
}

void TcpClient::sendOnly(int ip, QString mess)
{
    qDebug() << "mess: " << "DKTC_" + mess.toUtf8();
    onlyConnectServer(ip);
    (client + ip)->write("DKTC_" + mess.toUtf8());
    onlyExit(ip);
}

void TcpClient::exit()
{
    for (int i = 0; i < numEsp32 ; i++)
    {
        (client + i)->close();
    }
}

void TcpClient::sendUartToServer(QString msg)
{
    clientSendUart.connectToHost("192.168.1.8", 12345);
    clientSendUart.write(msg.toUtf8());
    clientSendUart.close();
}

void TcpClient::connectToServer()
{
    for (int i = 0; i < numEsp32 ; i++)
    {
        (client + i)->connectToHost(host + QString::number(ipHost + i), 8888);
    }
}

void TcpClient::onlyConnectServer(int id)
{
    (client + id)->connectToHost(host + QString::number(ipHost + id), 8888);
}

void TcpClient::onlyExit(int id)
{
    (client + id)->close();
}
