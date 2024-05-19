#ifndef TCPCLIENT_H
#define TCPCLIENT_H

#include <QObject>
#include <QTcpSocket>
#include <config.h>

class TcpClient : public QObject
{
    Q_OBJECT
public:
    explicit TcpClient(QObject *parent = nullptr);
    ~TcpClient() {
        delete [] client;
    }
    Q_INVOKABLE void sendAll(QString msg);
    Q_INVOKABLE void sendAllDetails(QVector<QString> msg);
//    Q_INVOKABLE void sendOnly();
    Q_INVOKABLE void sendOnly(int ip, QString mess);
    Q_INVOKABLE void exit();
    Q_INVOKABLE void sendUartToServer(QString msg);

signals:

private slots:
    void connectToServer();
    void onlyConnectServer(int id);
    void onlyExit(int id);
private:
    QTcpSocket *client;
    QTcpSocket clientSendUart;
};

#endif // TCPCLIENT_H
