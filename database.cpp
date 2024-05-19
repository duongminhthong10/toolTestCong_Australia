#include "database.h"
#include <QFile>

database::database(QObject *parent)
    : QObject{parent}
{

}

void database::connectDB()
{
    db=QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("D:/ToolTestPortAustralia/database/database.db");
    if(db.open())
    {
        qDebug() << "da connect db";
    }
    else
    {
        qDebug() << "Failed";
        return;
    }
}

void database::closeDB()
{
    db.close();
}

QString database::findPort(QString table, QString location)
{
    QString out = "";
    char find = '0';
    QVector<int> dsCong;
    QSqlQuery query;
    qDebug() << table << location;
    query.prepare("SELECT * FROM " + table + " WHERE location = (:location)");
    query.bindValue(":location", location);
    if (!query.exec())
    {
        qDebug() << "error query";
        qDebug() << query.lastError().text();
        return "";
    }

    else
    {
        while(query.next())
        {
            int cong = query.value("sttCong").toInt();
            qDebug() << cong;
            dsCong.push_back(cong);
        }

        for (int i = 0; i < sobit; i++) {
            find = '0';
            for (int j = 0; j < dsCong.size(); j++)
            {
                if (i == dsCong[j]) {
                    find = '1';
                    break;
                }
            }
            out.append(find);
        }
    }
    return out;
}
