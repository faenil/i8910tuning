/*
 * AppLauncher.h
 *
 *  Created on: 23/ago/2010
 *      Author: faenil
 */

#ifndef APPLAUNCHER_H_
#define APPLAUNCHER_H_


#endif /* APPLAUNCHER_H_ */
#include <QProcess>
#include <QtGui/QMainWindow>

class QtAppLauncher : public QMainWindow
	{
		Q_OBJECT
		
	public:
	QtAppLauncher(QWidget *parent = 0);
		
		
	public slots:
	void processError(QProcess::ProcessError err);
 
	public:
        QProcess* process2;
	};
