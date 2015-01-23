#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "Downloader.hpp"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Downloader::registerQmlTypes();
    //Downloader * downloader = new Downloader(&app);
    //downloader->load(QUrl("https://www.google.com.br/images/srpr/logo11w.png"));
    //engine.rootContext()->setContextProperty("_downloader", downloader);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    return app.exec();
}
