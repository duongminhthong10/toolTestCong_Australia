#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSql>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>
#include "config.h"

class database : public QObject
{
    Q_OBJECT
public:
    explicit database(QObject *parent = nullptr);
    ~database(){};
    Q_INVOKABLE void connectDB();
    void closeDB();

    Q_INVOKABLE QString findPort(QString table, QString location);
private:
    QSqlDatabase db;
};

#endif // DATABASE_H
