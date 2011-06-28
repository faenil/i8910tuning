TEMPLATE = app
TARGET = i8910tuning
QT += core \
    gui \
    declarative \
    xml \
    xmlpatterns \
    script
HEADERS += QtAppLauncher.h \
    i8910tuning.h
SOURCES += QtAppLauncher.cpp \
    main.cpp \
    i8910tuning.cpp
FORMS += i8910tuning.ui
RESOURCES += i8910tuning.qrc

symbian:TARGET.UID3 = 0xE8927856
symbian:TARGET.CAPABILITY = ALL -TCB
symbian:LIBS += -leuser \
    -lcentralrepository \
    -lcone \
    -leikcore \
    -lavkon \
    -lapgrfx \
    -laknicon \
    -lapparc \
    -lhal


codecs.sources = data\codecs\*
codecs.path = E:\data\SymbianTuning\codecs
noisesuppr.sources = data\noisesuppr\*
noisesuppr.path = E:\data\SymbianTuning\noisesuppr
fwid.sources = data\FWID\C6\*
fwid.path = E:\data\SymbianTuning\FWID\C6
fwid2.sources = data\FWID\vivaz\*
fwid2.path = E:\data\SymbianTuning\FWID\vivaz
fwid3.sources = data\FWID\N8\*
fwid3.path = E:\data\SymbianTuning\FWID\N8
fwid4.sources = data\FWID\5800\*
fwid4.path = E:\data\SymbianTuning\FWID\5800
ua.sources = data\ua\*
ua.path = E:\data\SymbianTuning\UA

DEPLOYMENT += codecs noisesuppr fwid fwid2 fwid3 fwid4 ua

OTHER_FILES += \
    qrc/Ids.qml \
    qrc/Switch.qml \
    qrc/Root.qml \
    qrc/Page.qml \
    qrc/MyTest2.qml \
    qrc/Menu.qml \
    qrc/Imgcodec.qml \
    qrc/CompletingComponent.qml \
    qrc/Codecs.qml \
    qrc/Camera.qml \
    qrc/UserAgent.qml \
    qrc/IdStatus.qml \
    qrc/Slider.qml \
    qrc/UserAgent.qml \
    qrc/Switch.qml \
    qrc/Slider.qml \
    qrc/Root.qml \
    qrc/Page.qml \
    qrc/MyTest2.qml \
    qrc/Menu.qml \
    qrc/Imgcodec.qml \
    qrc/IdStatus.qml \
    qrc/Ids.qml \
    qrc/CompletingComponent.qml \
    qrc/Codecs.qml \
    qrc/Camera.qml \
    UserAgent.qml \
    Switch.qml \
    Slider.qml \
    Root.qml \
    Page.qml \
    MyTest2.qml \
    Menu.qml \
    KsSettings.qml \
    Imgcodec.qml \
    IdStatus.qml \
    Ids.qml \
    CompletingComponent.qml \
    Codecs.qml \
    Camera.qml \
    Clock.qml \
    Mic.qml
