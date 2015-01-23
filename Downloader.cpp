#include "Downloader.hpp"
#include <QDebug>
#include <QNetworkRequest>

Downloader::Downloader(QObject *parent) : QObject(parent)
{
    m_loading = false;
    m_manager = new QNetworkAccessManager(this);
    connect(m_manager, &QNetworkAccessManager::finished,
            this, &Downloader::finished);
}

Downloader::~Downloader()
{

}

void Downloader::load(const QUrl &url)
{
    m_manager->get(QNetworkRequest(url));
    this->setLoading(true);
}

void Downloader::finished(QNetworkReply *reply)
{
    this->setLoading(false);

    QByteArray data = reply->readAll();
    emit this->dataReady(data);
    reply->deleteLater();
}
bool Downloader::loading() const
{
    return m_loading;
}

void Downloader::setLoading(bool loading)
{
    if(loading != m_loading) {
        m_loading = loading;
        emit this->loadingChanged(m_loading);
    }
}



