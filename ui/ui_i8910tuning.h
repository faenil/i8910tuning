/********************************************************************************
** Form generated from reading UI file 'i8910tuning.ui'
**
** Created: Mon 4. Jul 17:17:47 2011
**      by: Qt User Interface Compiler version 4.7.3
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_I8910TUNING_H
#define UI_I8910TUNING_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QHeaderView>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_i8910tuning
{
public:

    void setupUi(QWidget *i8910tuning)
    {
        if (i8910tuning->objectName().isEmpty())
            i8910tuning->setObjectName(QString::fromUtf8("i8910tuning"));
        i8910tuning->resize(400, 300);

        retranslateUi(i8910tuning);

        QMetaObject::connectSlotsByName(i8910tuning);
    } // setupUi

    void retranslateUi(QWidget *i8910tuning)
    {
        i8910tuning->setWindowTitle(QApplication::translate("i8910tuning", "i8910tuning", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class i8910tuning: public Ui_i8910tuning {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_I8910TUNING_H
