/*
 * AppLauncher.cpp
 *
 *  Created on: 23/ago/2010
 *      Author: faenil
 */
#include <QObject>
#include <QtGui/QWidget>
#include <QtGui/QMainWindow>
#include <QObject>
#include "QtAppLauncher.h"
#include <QtGui/QMessageBox>

#ifdef Q_OS_SYMBIAN
#include "apgtask.h"
#include "coemain.h"
#endif

QtAppLauncher::QtAppLauncher(QWidget *parent)
    : QMainWindow(parent)
{
#ifdef Q_OS_SYMBIAN
    const static TUid camera = {0x101F857A};
process2 = new QProcess();
//connect error() to slot processError() to get error, if occurs.
QObject::connect( process2, SIGNAL(error(QProcess::ProcessError)),
                      this, SLOT(processError(QProcess::ProcessError)));
QProcess::startDetached("Camcorder");

#endif
}
 
//get errors, if any
void QtAppLauncher::processError(QProcess::ProcessError err)
{
	switch(err)
	{
	case QProcess::FailedToStart:
		QMessageBox::information(0,"FailedToStart","FailedToStart");
		break;
	case QProcess::Crashed:
		QMessageBox::information(0,"Crashed","Crashed");
		break;
	case QProcess::Timedout:
		QMessageBox::information(0,"FailedToStart","FailedToStart");
		break;
	case QProcess::WriteError:
		QMessageBox::information(0,"Timedout","Timedout");
		break;
	case QProcess::ReadError:
		QMessageBox::information(0,"ReadError","ReadError");
		break;
	case QProcess::UnknownError:
		QMessageBox::information(0,"UnknownError","UnknownError");
		break;
	default:
		QMessageBox::information(0,"default","default");
		break;
	}
}
