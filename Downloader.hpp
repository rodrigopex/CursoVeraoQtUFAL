#ifndef DOWNLOADER_H
#define DOWNLOADER_H

#include <QObject>
#include <QUrl>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QVariant>
#include <QQmlComponent>

class Downloader : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool loading READ loading NOTIFY loadingChanged)
public:
    explicit Downloader(QObject *parent = 0);
    ~Downloader();
    bool loading() const;
    void setLoading(bool loading);
    static void registerQmlTypes() {
        qmlRegisterType<Downloader>("Curso.Verao", 1, 5, "Downloader");
    }

signals:
    void dataReady(QVariant data);
    void loadingChanged(bool loading);

public slots:
    void load(const QUrl &url);

private slots:
    void finished(QNetworkReply * reply);

private:
    QNetworkAccessManager *m_manager;
    bool m_loading;
};

#endif // DOWNLOADER_H
