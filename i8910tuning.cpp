/****************************************************************************
**
** Trolltech hereby grants a license to use the Qt/Eclipse Integration
** plug-in (the software contained herein), in binary form, solely for the
** purpose of creating code to be used with Trolltech's Qt software.
**
** Qt Designer is licensed under the terms of the GNU General Public
** License versions 2.0 and 3.0 ("GPL License"). Trolltech offers users the
** right to use certain no GPL licensed software under the terms of its GPL
** Exception version 1.2 (http://trolltech.com/products/qt/gplexception).
**
** THIS SOFTWARE IS PROVIDED BY TROLLTECH AND ITS CONTRIBUTORS (IF ANY) "AS
** IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
** TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
** PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
** OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
** EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
** PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
** PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
** LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
** NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
** SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** Since we now have the GPL exception I think that the "special exception
** is no longer needed. The license text proposed above (other than the
** special exception portion of it) is the BSD license and we have added
** the BSD license as a permissible license under the exception.
**
****************************************************************************/

#include "i8910tuning.h"
#include <QSize>
#include <QResizeEvent>
#include <QMessageBox>
#include <QDir>
#include <QStringList>
#include <QFileInfo>
#include <QObject>
#include <QPixmap>
#ifdef Q_OS_SYMBIAN
#include <centralrepository.h>
#include "coemain.h"
#endif
/*#include "ui_faenilator.h"*/
#include <QProcess>
#include <QFile>
#include "QtAppLauncher.h"
#include <QMenu>
#include <QPushButton>
#include <QMainWindow>
#include <QDebug>
#include <QIODevice>

QFile* logfile;
QTextStream* log2;

i8910tuning::i8910tuning(QWidget *parent, QFile* a, QTextStream* b)
    : QWidget(parent)
{
    setFocusPolicy(Qt::StrongFocus);
    logfile = a;
    log2 = b;
    ui.setupUi(this);
}

/*void i8910tuning::keyPressEvent(QKeyEvent * event)
{
    QString keylol;
    keylol.number(event->nativeVirtualKey());
    *log2 << keylol;
    log2->flush();
}*/

#ifdef Q_OS_SYMBIAN
TInt i8910tuning::ChangeValInt(const TUid KUidRepository, const TUint32 key, const TInt newkeyvalue){
#ifdef Q_OS_SYMBIAN
        TInt err;
	CRepository* iRepository = 0;
	QString intstr;
	TRAP(err, iRepository = CRepository::NewL(KUidRepository));
	intstr = QString::number(err);
	
	if(err) {
		QMessageBox::information(this, tr("Error while changing value"), "NewL ChangeValInt error:"+intstr);
		return err;
	}
	err = iRepository->Set(key, newkeyvalue); 
	intstr = QString::number(err);
	if(err) {
                QMessageBox::information(this, tr("Error while changing value"), "Set error:"+intstr);
		return err;
	}
	delete iRepository;
	return err;
#endif
} 

TInt i8910tuning::ChangeValStr(const TUid KUidRepository, const TUint32 key, const QString newkeyvalue){
#ifdef Q_OS_SYMBIAN
        TInt err;
        TBuf<1024> tbuf(newkeyvalue.utf16());
        CRepository* iRepository = 0;
        QString intstr;
        TRAP(err, iRepository = CRepository::NewL(KUidRepository));
        intstr = QString::number(err);

        if(err) {
                QMessageBox::information(this, tr("Error while changing value"), "NewL ChangeValInt error:"+intstr);
                return err;
        }
        err = iRepository->Set(key, tbuf);
        intstr = QString::number(err);
        if(err) {
                QMessageBox::information(this, tr("Error while changing value"), "Set error:"+intstr);
                return err;
        }
        delete iRepository;
        return err;
#endif
}

TInt i8910tuning::ReadValInt(const TUid KUidRepository, const TUint32 key){
#ifdef Q_OS_SYMBIAN
        TInt err;
	TInt val;
	QString intstr;
	CRepository* iRepository = 0;
	TRAP(err, iRepository = CRepository::NewL(KUidRepository));
	intstr = QString::number(err);
	
	if(err) {
		QMessageBox::information(this, tr("Error while reading value"), "NewL ReadValInt error:"+intstr);
		delete iRepository;
		return err;
	}
	err = iRepository->Get(key, val);
	intstr = QString::number(err);
	/*intstr.number(val);*/
	if(err) {
		QMessageBox::information(this, tr("Error while reading value"), "Get error:"+intstr);
		delete iRepository;
		return err;
	}
	delete iRepository;
        /*intstr = QString::number(val);
        QMessageBox::information(this, tr("Error while reading value"), "Success returned:"+intstr);*/
	return val;
#endif
} 

TInt i8910tuning::ReadValStr(const TUid KUidRepository, const TUint32 key, QString* retval){
#ifdef Q_OS_SYMBIAN
    TInt err = 0;
        TBuf<1024> val;
        //I want to return a QString, not a TBuf
        QString intstr;
        CRepository* iRepository = 0;
        TRAP(err, iRepository = CRepository::NewL(KUidRepository));
        intstr = QString::number(err);

        if(err) {
                QMessageBox::information(this, tr("Error while reading value"), "NewL ReadValInt error:"+intstr);
                delete iRepository;
                return err;
        }
        err = iRepository->Get(key, val);
        intstr = QString::number(err);
        /*intstr.number(val);*/
        if(err) {
                QMessageBox::information(this, tr("Error while reading value"), "Get error:"+intstr);
                delete iRepository;
                return err;
        }
        delete iRepository;

        retval->insert(0, (QChar*) val.Ptr(),val.Length());

        return err;
#endif
}
#endif



int i8910tuning::AFphoto_slot()
{
#ifdef Q_OS_SYMBIAN
    TInt val;
	TInt error;
	QString intstr;
	static const TUid repository = { 0x101F8808 };
	const TUint32 key = 0x3A;
	error = ChangeValInt( repository, key, 1);
	val = ReadValInt(repository, key);
	
	intstr = QString::number(val);
        //QMessageBox::information(this, tr("Error while reading value"), "AFphoto returns:"+intstr);
	return val;
#endif
}


int i8910tuning::PFphoto_slot()
{
#ifdef Q_OS_SYMBIAN
	TInt error;
	TInt val;
	static const TUid repository = { 0x101F8808 };
	const TUint32 key = 0x3A;
	error = ChangeValInt( repository, key, 0);
	val = ReadValInt(repository, key);
	
	return val;
#endif
}

int i8910tuning::CheckPhotoFocus_slot()
{
#ifdef Q_OS_SYMBIAN
	TInt val;
	static const TUid repository = { 0x101F8808 };

        const TUint32 key = 0x3A;
        //QMessageBox::information(this, tr("checkphotofocus"), "CheckPhoto called");

        val = ReadValInt(repository, key);
	//val ---> AF: 1, PF: 0, ERROR : -1 (penso, KErrNotFound)
	QString intstr = QString::number(val);

        //QMessageBox::information(this, tr("checkphotofocus"), intstr);

        return val;
#endif
}

int i8910tuning::CheckVideoFocus_slot()
{
#ifdef Q_OS_SYMBIAN
	TInt val;
	static const TUid repository = { 0x101F8808 };
	const TUint32 key = 0x3B;
	val = ReadValInt(repository, key);
	QString intstr = QString::number(val);
	//AF: 1, PF: 0, ERROR : -1 (penso, KErrNotFound)
	return val;
#endif
}

int i8910tuning::AFvideo_slot()
{
#ifdef Q_OS_SYMBIAN
	TInt error;
	TInt val;
	static const TUid repository = { 0x101F8808 };
	const TUint32 key = 0x3B;
	error = ChangeValInt( repository, key, 1);
	val = ReadValInt(repository, key);	
	
	return val;
#endif
}

int i8910tuning::PFvideo_slot()
{
#ifdef Q_OS_SYMBIAN
	TInt error;
	TInt val;
	static const TUid repository = { 0x101F8808 };
	const TUint32 key = 0x3B;
	error = ChangeValInt( repository, key, 0);
	val = ReadValInt(repository, key);
	
	return val;
#endif
}

int i8910tuning::supprON_slot()
{
#ifdef Q_OS_SYMBIAN
	QFile videosett("E:/data/SymbianTuning/noisesuppr/ON.txt");
	QFile oldsett("C:/Private/10202BE9/10282EDC.txt");
	QFile oldcre("C:/Private/10202BE9/persists/10282EDC.cre");
	if (oldsett.exists()) oldsett.remove();
	if (oldcre.exists()) oldcre.remove();
	
	if (videosett.copy("C:/Private/10202BE9/10282EDC.txt")) return 0;
		else return -1;
 #endif
}

int i8910tuning::supprOFF_slot()
{
#ifdef Q_OS_SYMBIAN
	QFile videosett("E:/data/SymbianTuning/noisesuppr/OFF.txt");
	QFile oldsett("C:/Private/10202BE9/10282EDC.txt");
	QFile oldcre("C:/Private/10202BE9/persists/10282EDC.cre");
	if (oldsett.exists()) oldsett.remove();
	if (oldcre.exists()) oldcre.remove();
	
	if (videosett.copy("C:/Private/10202BE9/10282EDC.txt")) return 0;
		else return -1;
#endif
}

int i8910tuning::checkSuppr_slot(){
#ifdef Q_OS_SYMBIAN
	QFile oldsett("C:/Private/10202BE9/10282EDC.txt");
	if (!oldsett.exists()) return -1;
	QFile on("E:/data/SymbianTuning/noisesuppr/ON.txt");
	if (!on.exists()) return -2;
	QFile off("E:/data/SymbianTuning/noisesuppr/OFF.txt");
	if (!off.exists()) return -3;
	
	if (on.readAll() == oldsett.readAll()) return 1;
	if (off.readAll() == oldsett.readAll()) return 0;
	return -4;
#endif
}
int i8910tuning::milestone_slot()
{
#ifdef Q_OS_SYMBIAN
    QFile codec("E:/data/SymbianTuning/codecs/milestone.dll64P");
	QFile oldcod("C:/System/Data/jpegenc_sn.dll64P");
	if (oldcod.exists()) oldcod.remove();
	
	if (codec.copy("C:/System/Data/jpegenc_sn.dll64P")) return 0;
		else return -1;
#endif
}

int i8910tuning::vivaz_slot()
{
#ifdef Q_OS_SYMBIAN
	QFile codec("E:/data/SymbianTuning/codecs/vivaz.dll64P");
	QFile oldcod("C:/System/Data/jpegenc_sn.dll64P");
	if (oldcod.exists()) oldcod.remove();
	
	if (codec.copy("C:/System/Data/jpegenc_sn.dll64P")) return 0;
		else return -1;
#endif
}

int i8910tuning::n900_slot()
{
#ifdef Q_OS_SYMBIAN
	QFile codec("E:/data/SymbianTuning/codecs/n900.dll64P");
	QFile oldcod("C:/System/Data/jpegenc_sn.dll64P");
	if (oldcod.exists()) oldcod.remove();
	
	if (codec.copy("C:/System/Data/jpegenc_sn.dll64P")) return 0;
		else return -1;
#endif
}

int i8910tuning::devplat_slot()
{
#ifdef Q_OS_SYMBIAN
	QFile codec("E:/data/SymbianTuning/codecs/devplat.dll64P");
	QFile oldcod("C:/System/Data/jpegenc_sn.dll64P");
	if (oldcod.exists()) oldcod.remove();
	
	if (codec.copy("C:/System/Data/jpegenc_sn.dll64P")) return 0;
		else return -1;
#endif
}

int i8910tuning::droidx_slot()
{
#ifdef Q_OS_SYMBIAN
	QFile codec("E:/data/SymbianTuning/codecs/droidx.dll64P");
	QFile oldcod("C:/System/Data/jpegenc_sn.dll64P");
	if (oldcod.exists()) oldcod.remove();
	
	if (codec.copy("C:/System/Data/jpegenc_sn.dll64P")) return 0;
		else return -1;
#endif
}

int i8910tuning::palm_slot()
{
#ifdef Q_OS_SYMBIAN
	QFile codec("E:/data/SymbianTuning/codecs/palm.dll64P");
	QFile oldcod("C:/System/Data/jpegenc_sn.dll64P");
	if (oldcod.exists()) oldcod.remove();
	
	if (codec.copy("C:/System/Data/jpegenc_sn.dll64P")) return 0;
		else return -1;
#endif
}

int i8910tuning::i8510_slot()
{
#ifdef Q_OS_SYMBIAN
	QFile codec("E:/data/SymbianTuning/codecs/i8510.dll64P");
	QFile oldcod("C:/System/Data/jpegenc_sn.dll64P");
	if (oldcod.exists()) oldcod.remove();
	
	if (codec.copy("C:/System/Data/jpegenc_sn.dll64P")) return 0;
		else return -1;
#endif
}

int i8910tuning::i8910_slot()
{
#ifdef Q_OS_SYMBIAN
	QFile codec("E:/data/SymbianTuning/codecs/i8910.dll64P");
	QFile oldcod("C:/System/Data/jpegenc_sn.dll64P");
	if (oldcod.exists()) oldcod.remove();
	
	if (codec.copy("C:/System/Data/jpegenc_sn.dll64P")) return 0;
		else return -1;
#endif
}

int i8910tuning::inUseJpeg()
	{
#ifdef Q_OS_SYMBIAN
		QFile codec("C:/system/data/jpegenc_sn.dll64P");
		QFile codecZ("Z:/system/data/jpegenc_sn.dll64P");
		QFile i8910cod("E:/data/SymbianTuning/codecs/i8910.dll64P");
		QFile i8510cod("E:/data/SymbianTuning/codecs/i8510.dll64P");
		QFile vivazcod("E:/data/SymbianTuning/codecs/vivaz.dll64P");
		QFile palmprecod("E:/data/SymbianTuning/codecs/palmpre.dll64P");
		QFile milestonecod("E:/data/SymbianTuning/codecs/milestone.dll64P");
		QFile droidxcod("E:/data/SymbianTuning/codecs/droidx.dll64P");
		QFile devplatcod("E:/data/SymbianTuning/codecs/devplat.dll64P");
		QFile n900cod("E:/data/SymbianTuning/codecs/n900.dll64P");
		
	if ( !(codec.exists())){
		if (codecZ.size() == i8910cod.size()) return 22;
		else 
			{
			if (codecZ.size() == i8510cod.size()) return 33;
			else 
				{
				if (codecZ.size() == vivazcod.size()) return 44;
                                else
                                        {
                                        if (codecZ.size() == palmprecod.size()) return 55;
                                        else
                                                {
                                                if (codecZ.size() == milestonecod.size()) return 66;
                                                else
                                                        {
                                                        if (codecZ.size() == droidxcod.size()) return 77;
                                                        else
                                                                {
                                                                if (codecZ.size() == devplatcod.size()) return 88;
                                                                else
                                                                        {
                                                                        if (codecZ.size() == n900cod.size()) return 99;
                                                                        else return -3;

                                                                        }
                                                                }
                                                        }
                                                }
                                        }
                                }
                        }
        }
        else
                {
                if (codec.size() == i8910cod.size()) return 2;
                else
                        {
                        if (codec.size() == i8510cod.size()) return 3;
                        else
                                {
                                if (codec.size() == vivazcod.size()) return 4;
                                else
                                        {
                                        if (codec.size() == palmprecod.size()) return 5;
                                        else
                                                {
                                                if (codec.size() == milestonecod.size()) return 6;
                                                else
                                                        {
                                                        if (codec.size() == droidxcod.size()) return 7;
                                                        else
                                                                {
                                                                if (codec.size() == devplatcod.size()) return 8;
                                                                else
                                                                        {
                                                                        if (codec.size() == n900cod.size()) return 9;
                                                                        else return -2;

                                                                        }
                                                                }
                                                        }
                                                }
                                        }
                                }
                        }
                }
#endif
}

int i8910tuning::inUseUA()
{
#ifdef Q_OS_SYMBIAN
                QFile UA("C:/Private/10202BE9/persists/101F8731.cre");
                QFile i8910("E:/data/SymbianTuning/UA/i8910.cre");
                QFile N8("E:/data/SymbianTuning/UA/N8.cre");
                QFile C6("E:/data/SymbianTuning/UA/C6.cre");
                QFile vivaz("E:/data/SymbianTuning/UA/vivaz.cre");
                QFile ua_5800("E:/data/SymbianTuning/UA/5800.cre");

        if ( !(UA.exists())) return 2;

        else
        {
            if (UA.size() == i8910.size()) return 2;
            else {
                if (UA.size() == ua_5800.size()) return 3;
                else {
                    if (UA.size() == vivaz.size()) return 4;
                    else {
                        if (UA.size() == C6.size()) return 5;
                        else {
                            if (UA.size() == N8.size()) return 6;
                        }
                    }
                }
            }
        }

        return -1;
#endif
}

int i8910tuning::inUseFWID()
        {
#ifdef Q_OS_SYMBIAN
                QFile FWID("C:/resource/versions/sw.txt");
                QFile i8910("Z:/resource/versions/sw.txt");
                QFile N8("E:/data/SymbianTuning/FWID/N8/sw.txt");
                QFile C6("E:/data/SymbianTuning/FWID/C6/sw.txt");
                QFile vivaz("E:/data/SymbianTuning/FWID/vivaz/sw.txt");
                QFile ua_5800("E:/data/SymbianTuning/FWID/5800/sw.txt");
                QString fwidstring;
                QString compareFwString;

        if ( !(FWID.exists())) return 2;

        else
        {
            if (!(FWID.open(QIODevice::ReadOnly))) return -1;
            if (!(i8910.open(QIODevice::ReadOnly))) return -1;
            if (!(N8.open(QIODevice::ReadOnly))) return -1;
            if (!(C6.open(QIODevice::ReadOnly))) return -1;
            if (!(vivaz.open(QIODevice::ReadOnly))) return -1;
            if (!(ua_5800.open(QIODevice::ReadOnly))) return -1;

            QTextStream fwstream(&FWID);
            QTextStream i8910fwstream(&i8910);
            QTextStream n8fwstream(&N8);
            QTextStream c6fwstream(&C6);
            QTextStream vivazfwstream(&vivaz);
            QTextStream ua_5800fwstream(&ua_5800);

            fwidstring = fwstream.readLine();

            compareFwString = i8910fwstream.readLine();
            if (!(fwidstring.compare(compareFwString))) return 2;
            else {
                compareFwString = ua_5800fwstream.readLine();
                if (!(fwidstring.compare(compareFwString))) return 3;
                else {
                    compareFwString = vivazfwstream.readLine();
                    if (!(fwidstring.compare(compareFwString))) return 4;
                    else {
                        compareFwString = c6fwstream.readLine();
                        if (!(fwidstring.compare(compareFwString))) return 5;
                        else {
                            compareFwString = n8fwstream.readLine();
                            if (!(fwidstring.compare(compareFwString))) return 6;
                        }
                    }
                }
            }
        }


        return -2;
#endif
}

void i8910tuning::deleteEmptyCamera(const QString &folder)
{
#ifdef Q_OS_SYMBIAN
	QDir dir(folder);
		QStringList entries = dir.entryList(QDir::Dirs | QDir::NoDotAndDotDot);
		foreach (QString entry, entries) {
			QFileInfo fileInfo(folder + "/" + entry);
			QDir currdir(folder + "/" + entry);
			if (!currdir.rmdir(fileInfo.filePath()))	deleteEmptyCamera(fileInfo.filePath());
		}	
		if (!dir.rmdir(dir.absolutePath()))
			qWarning() << "can't remove '" << dir.absolutePath() << "'";
#endif
}

void i8910tuning::deleteEmptyCamera_slot()
{
#ifdef Q_OS_SYMBIAN
        deleteEmptyCamera("E:/Videos");
        deleteEmptyCamera("F:/Videos");
        deleteEmptyCamera("E:/Images/Camera");
        deleteEmptyCamera("F:/Images/Camera");
#endif
}

int i8910tuning::deleteGalleryCache(const QString &folder)
{
#ifdef Q_OS_SYMBIAN
	QDir dir(folder);	
	QStringList entries = dir.entryList(QDir::Dirs | QDir::Files | QDir::NoDotAndDotDot);
	foreach (QString entry, entries) {
		QFileInfo fileInfo(folder + "/" + entry);
		if (fileInfo.isFile() && !QFile::remove(fileInfo.filePath())) {
			qWarning() << "can't remove '" << fileInfo.filePath() << "'";
                        return -1;
		} else if (fileInfo.isDir())
                        if (deleteGalleryCache(fileInfo.filePath())) return -1;
	}	
        if (!dir.rmdir(dir.absolutePath())){
		qWarning() << "can't remove '" << dir.absolutePath() << "'";
                return -1;
        }
        return 0;
#endif
}

int i8910tuning::deleteGalleryCache_slot()
{
#ifdef Q_OS_SYMBIAN
    if (QDir("C:/Private/101f8857/cache").exists() &&  deleteGalleryCache("C:/Private/101f8857/cache")) return -1;
    if (QDir("E:/Private/101f8857/cache").exists() && deleteGalleryCache("E:/Private/101f8857/cache")) return -1;
    if (QDir("F:/Private/101f8857/cache").exists() && deleteGalleryCache("F:/Private/101f8857/cache")) return -1;
    return 0;
#endif
}

int i8910tuning::changeUA_5800()
{
#ifdef Q_OS_SYMBIAN
    QFile newUA("E:/data/SymbianTuning/UA/5800.cre");
    QFile oldUA("C:/Private/10202BE9/persists/101F8731.cre");
    if (oldUA.exists()) oldUA.remove();

    if (newUA.copy("C:/Private/10202BE9/persists/101F8731.cre")) return 0;
            else return -1;
#endif
}

int i8910tuning::changeUA_C6()
{
#ifdef Q_OS_SYMBIAN
    QFile newUA("E:/data/SymbianTuning/UA/C6.cre");
    QFile oldUA("C:/Private/10202BE9/persists/101F8731.cre");
    if (oldUA.exists()) oldUA.remove();

    if (newUA.copy("C:/Private/10202BE9/persists/101F8731.cre")) return 0;
            else return -1;
#endif
}

int i8910tuning::changeUA_N8()
{
#ifdef Q_OS_SYMBIAN
    QFile newUA("E:/data/SymbianTuning/UA/N8.cre");
    QFile oldUA("C:/Private/10202BE9/persists/101F8731.cre");
    if (oldUA.exists()) oldUA.remove();

    if (newUA.copy("C:/Private/10202BE9/persists/101F8731.cre")) return 0;
            else return -1;
#endif
}

int i8910tuning::changeUA_vivaz()
{
#ifdef Q_OS_SYMBIAN
    QFile newUA("E:/data/SymbianTuning/UA/vivaz.cre");
    QFile oldUA("C:/Private/10202BE9/persists/101F8731.cre");
    if (oldUA.exists()) oldUA.remove();

    if (newUA.copy("C:/Private/10202BE9/persists/101F8731.cre")) return 0;
            else return -1;
#endif
}

int i8910tuning::changeUA_I8910()
{
#ifdef Q_OS_SYMBIAN
    QFile newUA("E:/data/SymbianTuning/UA/I8910.cre");
    QFile oldUA("C:/Private/10202BE9/persists/101F8731.cre");
    if (oldUA.exists()) oldUA.remove();

    if (newUA.copy("C:/Private/10202BE9/persists/101F8731.cre")) return 0;
            else return -1;
#endif
}

int i8910tuning::changeFW_I8910()
{
#ifdef Q_OS_SYMBIAN
    QFile customersw("Z:/resource/versions/customersw.txt");
    QFile langsw("Z:/resource/versions/langsw.txt");
    QFile model("Z:/resource/versions/model.txt");
    QFile product("Z:/resource/versions/product.txt");
    QFile platform("Z:/resource/versions/platform.txt");
    QFile sw("Z:/resource/versions/sw.txt");
    QFile customerswC("C:/resource/versions/customersw.txt");
    QFile langswC("C:/resource/versions/langsw.txt");
    QFile modelC("C:/resource/versions/model.txt");
    QFile productC("C:/resource/versions/product.txt");
    QFile platformC("C:/resource/versions/platform.txt");
    QFile swC("C:/resource/versions/sw.txt");
    QFile versionsC("C:/resource/versions/versions.txt");


    if (!QDir("C:/resource/versions").exists()) QDir().mkpath("C:/resource/versions");

    if (versionsC.exists()) versionsC.remove();

    if (customerswC.exists()) customerswC.remove();
    if (!(customersw.copy("C:/resource/versions/customersw.txt"))) return -1;

    if (langswC.exists()) langswC.remove();
    if (!(langsw.copy("C:/resource/versions/langsw.txt"))) return -1;

    if (modelC.exists()) modelC.remove();
    if (!(model.copy("C:/resource/versions/model.txt"))) return -1;

    if (productC.exists()) productC.remove();
    if (!(product.copy("C:/resource/versions/product.txt"))) return -1;

    if (platformC.exists()) platformC.remove();
    if (!(platform.copy("C:/resource/versions/platform.txt"))) return -1;

    if (swC.exists()) swC.remove();
    if (!(sw.copy("C:/resource/versions/sw.txt"))) return -1;
    else return 0;
#endif
}

/*int i8910tuning::changeFW_I8910()
{
#ifdef Q_OS_SYMBIAN

    int err;

    QFile dat("C:/BatchCopy.dat");
    if (dat.exists()) dat.remove();
    if (!dat.open(QIODevice::Append | QIODevice::WriteOnly)) return 1;
    QTextStream datstream(&dat);

    datstream << "Z:\\resource\\versions\\sw.txt >> C:\\resource\\versions\\sw.txt\n"
              << "Z:\\resource\\versions\\customersw.txt >> C:\\resource\\versions\\customersw.txt\n"
              << "Z:\\resource\\versions\\fwid1.txt >> C:\\resource\\versions\\fwid1.txt\n"
              << "Z:\\resource\\versions\\fwid2.txt >> C:\\resource\\versions\\fwid2.txt\n"
              << "Z:\\resource\\versions\\fwid3.txt >> C:\\resource\\versions\\fwid3.txt\n"
              << "Z:\\resource\\versions\\langsw.txt >> C:\\resource\\versions\\langsw.txt\n"
              << "Z:\\resource\\versions\\model.txt >> C:\\resource\\versions\\model.txt\n"
              << "Z:\\resource\\versions\\product.txt >> C:\\resource\\versions\\product.txt\n"
              << "Z:\\resource\\versions\\platform.txt >> C:\\resource\\versions\\platform.txt\n";
    dat.close();

    err = startL("C:/sys/bin/BatchCopyPlus.exe");
    if (err) return -1;
    return 0;

#endif
}*/

/*int i8910tuning::changeFW_N8()
{
#ifdef Q_OS_SYMBIAN
    int err;

    QFile dat("C:/BatchCopy.dat");
    if (dat.exists()) dat.remove();
    if (!dat.open(QIODevice::Append | QIODevice::WriteOnly)) return 1;
    QTextStream datstream(&dat);

    datstream << "E:\\data\\SymbianTuning\\FWID\\N8\\sw.txt >> C:\\resource\\versions\\sw.txt\n"
              << "E:\\data\\SymbianTuning\\FWID\\N8\\customersw.txt >> C:\\resource\\versions\\customersw.txt\n"
              << "E:\\data\\SymbianTuning\\FWID\\N8\\fwid1.txt >> C:\\resource\\versions\\fwid1.txt\n"
              << "E:\\data\\SymbianTuning\\FWID\\N8\\fwid2.txt >> C:\\resource\\versions\\fwid2.txt\n"
              << "E:\\data\\SymbianTuning\\FWID\\N8\\fwid3.txt >> C:\\resource\\versions\\fwid3.txt\n"
              << "E:\\data\\SymbianTuning\\FWID\\N8\\langsw.txt >> C:\\resource\\versions\\langsw.txt\n"
              << "E:\\data\\SymbianTuning\\FWID\\N8\\model.txt >> C:\\resource\\versions\\model.txt\n"
              << "E:\\data\\SymbianTuning\\FWID\\N8\\product.txt >> C:\\resource\\versions\\product.txt\n"
              << "E:\\data\\SymbianTuning\\FWID\\N8\\platform.txt >> C:\\resource\\versions\\platform.txt\n"
              << "#thanks to madhacker for BatchCopyPlus";
    dat.close();

    err = startL("C:/sys/bin/BatchCopyPlus.exe");
    if (err) return -1;
    return 0;
#endif
}*/


int i8910tuning::changeFW_N8()
{
#ifdef Q_OS_SYMBIAN
    QFile customersw("E:/data/SymbianTuning/FWID/N8/customersw.txt");
    QFile fwid1("E:/data/SymbianTuning/FWID/N8/fwid1.txt");
    QFile fwid2("E:/data/SymbianTuning/FWID/N8/fwid2.txt");
    QFile fwid3("E:/data/SymbianTuning/FWID/N8/fwid3.txt");
    QFile langsw("E:/data/SymbianTuning/FWID/N8/langsw.txt");
    QFile model("E:/data/SymbianTuning/FWID/N8/model.txt");
    QFile product("E:/data/SymbianTuning/FWID/N8/product.txt");
    QFile platform("E:/data/SymbianTuning/FWID/N8/platform.txt");
    QFile sw("E:/data/SymbianTuning/FWID/N8/sw.txt");
    QFile customerswC("C:/resource/versions/customersw.txt");
    QFile fwid1C("C:/resource/versions/fwid1.txt");
    QFile fwid2C("C:/resource/versions/fwid2.txt");
    QFile fwid3C("C:/resource/versions/fwid3.txt");
    QFile langswC("C:/resource/versions/langsw.txt");
    QFile modelC("C:/resource/versions/model.txt");
    QFile productC("C:/resource/versions/product.txt");
    QFile platformC("C:/resource/versions/platform.txt");
    QFile swC("C:/resource/versions/sw.txt");
    QFile versionsC("C:/resource/versions/versions.txt");

    if (!QDir("C:/resource/versions").exists()) QDir().mkpath("C:/resource/versions");
    if (versionsC.exists()) versionsC.remove();

    if (customerswC.exists()) customerswC.remove();
    if (!(customersw.copy("C:/resource/versions/customersw.txt"))) return -1;

    if (fwid1C.exists()) fwid1C.remove();
    if (!(fwid1.copy("C:/resource/versions/fwid1.txt"))) return -1;

    if (fwid2C.exists()) fwid2C.remove();
    if (!(fwid2.copy("C:/resource/versions/fwid2.txt"))) return -1;

    if (fwid3C.exists()) fwid3C.remove();
    if (!(fwid3.copy("C:/resource/versions/fwid3.txt"))) return -1;

    if (langswC.exists()) langswC.remove();
    if (!(langsw.copy("C:/resource/versions/langsw.txt"))) return -1;

    if (modelC.exists()) modelC.remove();
    if (!(model.copy("C:/resource/versions/model.txt"))) return -1;

    if (productC.exists()) productC.remove();
    if (!(product.copy("C:/resource/versions/product.txt"))) return -1;

    if (platformC.exists()) platformC.remove();
    if (!(platform.copy("C:/resource/versions/platform.txt"))) return -1;

    if (swC.exists()) swC.remove();
    if (!(sw.copy("C:/resource/versions/sw.txt"))) return -1;
    else return 0;
#endif
}


int i8910tuning::changeFW_vivaz()
{
#ifdef Q_OS_SYMBIAN
    QFile customersw("E:/data/SymbianTuning/FWID/vivaz/customersw.txt");
    QFile langsw("E:/data/SymbianTuning/FWID/vivaz/langsw.txt");
    QFile model("E:/data/SymbianTuning/FWID/vivaz/model.txt");
    QFile product("E:/data/SymbianTuning/FWID/vivaz/product.txt");
    QFile platform("E:/data/SymbianTuning/FWID/vivaz/platform.txt");
    QFile sw("E:/data/SymbianTuning/FWID/vivaz/sw.txt");
    QFile versions("E:/data/SymbianTuning/FWID/vivaz/versions.txt");
    QFile customerswC("C:/resource/versions/customersw.txt");
    QFile fwid1C("C:/resource/versions/fwid1.txt");
    QFile fwid2C("C:/resource/versions/fwid2.txt");
    QFile fwid3C("C:/resource/versions/fwid3.txt");
    QFile langswC("C:/resource/versions/langsw.txt");
    QFile modelC("C:/resource/versions/model.txt");
    QFile productC("C:/resource/versions/product.txt");
    QFile platformC("C:/resource/versions/platform.txt");
    QFile swC("C:/resource/versions/sw.txt");
    QFile versionsC("C:/resource/versions/versions.txt");

    if (!QDir("C:/resource/versions").exists()) QDir().mkpath("C:/resource/versions");

    if (customerswC.exists()) customerswC.remove();
    if (!(customersw.copy("C:/resource/versions/customersw.txt"))) return -1;

    if (fwid1C.exists()) fwid1C.remove();
    if (fwid2C.exists()) fwid2C.remove();
    if (fwid3C.exists()) fwid3C.remove();

    if (versionsC.exists()) versionsC.remove();
    if (!(versions.copy("C:/resource/versions/versions.txt"))) return -1;

    if (langswC.exists()) langswC.remove();
    if (!(langsw.copy("C:/resource/versions/langsw.txt"))) return -1;

    if (modelC.exists()) modelC.remove();
    if (!(model.copy("C:/resource/versions/model.txt"))) return -1;

    if (productC.exists()) productC.remove();
    if (!(product.copy("C:/resource/versions/product.txt"))) return -1;

    if (platformC.exists()) platformC.remove();
    if (!(platform.copy("C:/resource/versions/platform.txt"))) return -1;

    if (swC.exists()) swC.remove();
    if (!(sw.copy("C:/resource/versions/sw.txt"))) return -1;
    else return 0;
#endif
}

int i8910tuning::changeFW_5800()
{
#ifdef Q_OS_SYMBIAN
    QFile customersw("E:/data/SymbianTuning/FWID/5800/customersw.txt");
    QFile fwid1("E:/data/SymbianTuning/FWID/5800/fwid1.txt");
    QFile fwid2("E:/data/SymbianTuning/FWID/5800/fwid2.txt");
    QFile fwid3("E:/data/SymbianTuning/FWID/5800/fwid3.txt");
    QFile langsw("E:/data/SymbianTuning/FWID/5800/langsw.txt");
    QFile model("E:/data/SymbianTuning/FWID/5800/model.txt");
    QFile product("E:/data/SymbianTuning/FWID/5800/product.txt");
    QFile platform("E:/data/SymbianTuning/FWID/5800/platform.txt");
    QFile sw("E:/data/SymbianTuning/FWID/5800/sw.txt");
    QFile customerswC("C:/resource/versions/customersw.txt");
    QFile fwid1C("C:/resource/versions/fwid1.txt");
    QFile fwid2C("C:/resource/versions/fwid2.txt");
    QFile fwid3C("C:/resource/versions/fwid3.txt");
    QFile langswC("C:/resource/versions/langsw.txt");
    QFile modelC("C:/resource/versions/model.txt");
    QFile productC("C:/resource/versions/product.txt");
    QFile platformC("C:/resource/versions/platform.txt");
    QFile swC("C:/resource/versions/sw.txt");
    QFile versionsC("C:/resource/versions/versions.txt");

    if (!QDir("C:/resource/versions").exists()) QDir().mkpath("C:/resource/versions");

    if (versionsC.exists()) versionsC.remove();

    if (customerswC.exists()) customerswC.remove();
    if (!(customersw.copy("C:/resource/versions/customersw.txt"))) return -1;

    if (fwid1C.exists()) fwid1C.remove();
    if (!(fwid1.copy("C:/resource/versions/fwid1.txt"))) return -1;

    if (fwid2C.exists()) fwid2C.remove();
    if (!(fwid2.copy("C:/resource/versions/fwid2.txt"))) return -1;

    if (fwid3C.exists()) fwid3C.remove();
    if (!(fwid3.copy("C:/resource/versions/fwid3.txt"))) return -1;

    if (langswC.exists()) langswC.remove();
    if (!(langsw.copy("C:/resource/versions/langsw.txt"))) return -1;

    if (modelC.exists()) modelC.remove();
    if (!(model.copy("C:/resource/versions/model.txt"))) return -1;

    if (productC.exists()) productC.remove();
    if (!(product.copy("C:/resource/versions/product.txt"))) return -1;

    if (platformC.exists()) platformC.remove();
    if (!(platform.copy("C:/resource/versions/platform.txt"))) return -1;

    if (swC.exists()) swC.remove();
    if (!(sw.copy("C:/resource/versions/sw.txt"))) return -1;
    else return 0;
#endif
}


int i8910tuning::changeFW_C6()
{
#ifdef Q_OS_SYMBIAN
    QFile customersw("E:/data/SymbianTuning/FWID/C6/customersw.txt");
    QFile fwid1("E:/data/SymbianTuning/FWID/C6/fwid1.txt");
    QFile fwid2("E:/data/SymbianTuning/FWID/C6/fwid2.txt");
    QFile fwid3("E:/data/SymbianTuning/FWID/C6/fwid3.txt");
    QFile langsw("E:/data/SymbianTuning/FWID/C6/langsw.txt");
    QFile model("E:/data/SymbianTuning/FWID/C6/model.txt");
    QFile product("E:/data/SymbianTuning/FWID/C6/product.txt");
    QFile platform("E:/data/SymbianTuning/FWID/C6/platform.txt");
    QFile sw("E:/data/SymbianTuning/FWID/C6/sw.txt");
    QFile customerswC("C:/resource/versions/customersw.txt");
    QFile fwid1C("C:/resource/versions/fwid1.txt");
    QFile fwid2C("C:/resource/versions/fwid2.txt");
    QFile fwid3C("C:/resource/versions/fwid3.txt");
    QFile langswC("C:/resource/versions/langsw.txt");
    QFile modelC("C:/resource/versions/model.txt");
    QFile productC("C:/resource/versions/product.txt");
    QFile platformC("C:/resource/versions/platform.txt");
    QFile swC("C:/resource/versions/sw.txt");
    QFile versionsC("C:/resource/versions/versions.txt");

    if (!QDir("C:/resource/versions").exists()) QDir().mkpath("C:/resource/versions");


    if (versionsC.exists()) versionsC.remove();

    if (customerswC.exists()) customerswC.remove();
    if (!(customersw.copy("C:/resource/versions/customersw.txt"))) return -1;

    if (fwid1C.exists()) fwid1C.remove();
    if (!(fwid1.copy("C:/resource/versions/fwid1.txt"))) return -1;

    if (fwid2C.exists()) fwid2C.remove();
    if (!(fwid2.copy("C:/resource/versions/fwid2.txt"))) return -1;

    if (fwid3C.exists()) fwid3C.remove();
    if (!(fwid3.copy("C:/resource/versions/fwid3.txt"))) return -1;

    if (langswC.exists()) langswC.remove();
    if (!(langsw.copy("C:/resource/versions/langsw.txt"))) return -1;

    if (modelC.exists()) modelC.remove();
    if (!(model.copy("C:/resource/versions/model.txt"))) return -1;

    if (productC.exists()) productC.remove();
    if (!(product.copy("C:/resource/versions/product.txt"))) return -1;

    if (platformC.exists()) platformC.remove();
    if (!(platform.copy("C:/resource/versions/platform.txt"))) return -1;

    if (swC.exists()) swC.remove();
    if (!(sw.copy("C:/resource/versions/sw.txt"))) return -1;
    else return 0;
#endif
}

/* KINETIC SCROLLING VALUES DESCRIPTION
0x1
Name: View mass
Type: int
Desc: Value indicates the mass of the view.

0x2
Name: Gravity
Type: int
Desc: Gravity - friction.

0x3
Name: Surface erp
Type: int
Desc: Surface parameter erp

0x4
Name: Surface cfm
Type: int
Desc: Surface parameter cfm.

0x5
Name: Highlight timeout
Type: int
Desc: Timeout for highlight.

0x6
Name: Drag treshold
Type: int
Desc: Treshold for drag.

0x7
Name: Frame delay
Type: int
Desc: Frame delay.

0x8
Name: Min frame interval
Type: int
Desc: Min frame interval.

0x9
Name: Ode enabled
Type: int
Desc: True if ODE is enabled.

0xa
Name: Short list empty space
Type: int
Desc: Short list empty space percent.

0xb
Name: Long list empty space
Type: int
Desc: Long list empty space percent.





DEFAULT VALUES------------------------
const TInt KParamNotSet( -1 );
const TInt KDefaultMass( 10 );
const TInt KDefaultGravity( 10 );
const TInt KDefaultSurfaceErp( 20 );
const TInt KDefaultSurfaceCfm( 20 );
const TInt KDefaultHighlightTimeout( 20 );
const TInt KDefaultDragThreshold( 200 );
const TInt KDefaultFrameDelay( 17 );
const TInt KDefaultMinFrameInterval( 60 );
const TBool KDefaultFeatureEnabled( ETrue );
const TInt KDefaultShortListEmptySpace( 33 );
const TInt KDefaultLongListEmptySpace( 33 );
const TBool KDefaultFpsLoggingEnabled( EFalse );
  */
int i8910tuning::setks_slot(int x1, int x2, int x3, int x4, int x5, int x6, int x7, int x8, int x9, int xa, int xb)
{
#ifdef Q_OS_SYMBIAN
        const TUint32 key0x1 = 0x1;
        const TUint32 key0x2 = 0x2;
        const TUint32 key0x3 = 0x3;
        const TUint32 key0x4 = 0x4;
        const TUint32 key0x5 = 0x5;
        const TUint32 key0x6 = 0x6;
        const TUint32 key0x7 = 0x7;
        const TUint32 key0x8 = 0x8;
        const TUint32 key0x9 = 0x9;
        const TUint32 key0xa = 0xa;
        const TUint32 key0xb = 0xb;
        static const TUid repository = { 0x20021192 };

        bool somethingwrong = false;
        TInt error;

        error = ChangeValInt( repository, key0x1, x1);
        if (error) somethingwrong = true;
        error = ChangeValInt( repository, key0x2, x2);
        if (error) somethingwrong = true;
        error = ChangeValInt( repository, key0x3, x3);
        if (error) somethingwrong = true;
        error = ChangeValInt( repository, key0x4, x4);
        if (error) somethingwrong = true;
        error = ChangeValInt( repository, key0x5, x5);
        if (error) somethingwrong = true;
        error = ChangeValInt( repository, key0x6, x6);
        if (error) somethingwrong = true;
        error = ChangeValInt( repository, key0x7, x7);
        if (error) somethingwrong = true;
        error = ChangeValInt( repository, key0x8, x8);
        if (error) somethingwrong = true;
        error = ChangeValInt( repository, key0x9, x9);
        if (error) somethingwrong = true;
        error = ChangeValInt( repository, key0xa, xa);
        if (error) somethingwrong = true;
        error = ChangeValInt( repository, key0xb, xb);
        if (error) somethingwrong = true;

        if (somethingwrong) return -1;
        else return 0;
#endif
}

QVariantList i8910tuning::getks_slot()
{
#ifdef Q_OS_SYMBIAN
        const TUint32 key0x1 = 0x1;
        const TUint32 key0x2 = 0x2;
        const TUint32 key0x3 = 0x3;
        const TUint32 key0x4 = 0x4;
        const TUint32 key0x5 = 0x5;
        const TUint32 key0x6 = 0x6;
        const TUint32 key0x7 = 0x7;
        const TUint32 key0x8 = 0x8;
        const TUint32 key0x9 = 0x9;
        const TUint32 key0xa = 0xA;
        const TUint32 key0xb = 0xB;
        static const TUid repository = { 0x20021192 };

        QVariantList ksvalues;
        ksvalues.reserve(11);
        ksvalues << ReadValInt( repository, key0x1) << ReadValInt( repository, key0x2) << ReadValInt( repository, key0x3)
                 << ReadValInt( repository, key0x4) << ReadValInt( repository, key0x5) << ReadValInt( repository, key0x6)
                 << ReadValInt( repository, key0x7) << ReadValInt( repository, key0x8) << ReadValInt( repository, key0x9)
                 << ReadValInt( repository, key0xa) << ReadValInt( repository, key0xb);

        return ksvalues;
#else
        QVariantList list;
        list << 1 << 2 << 3 << 4 << 5 << 6 << 7 << 8 << 9 << 10 << 11;
        return list;
#endif

}


QVariantList i8910tuning::getClock_slot()
{
#ifdef Q_OS_SYMBIAN
    QVariantList clock_list;

    qint32 idle;
    qint32 min;
    qint32 medium;
    qint32 max;

    //A908, A918, A928 for min/2, A968, a978, a988 for min, a998 for medium, a9a8, a9b8 for max
    QFile powerdll("Z:/sys/bin/power.dll");
    if (!powerdll.open(QIODevice::ReadOnly))
    {
        //TODO
    }

    QDataStream stream(&powerdll);
    stream.setByteOrder(QDataStream::LittleEndian);

    powerdll.seek(0xA908);
    stream >> idle;

    powerdll.seek(0xA968);
    stream >> min;

    powerdll.seek(0xA998);
    stream >> medium;

    powerdll.seek(0xA9A8);
    stream >> max;

    clock_list << min << medium << max;

    powerdll.close();

    return clock_list;
#else
        QVariantList list;
        list << 200 << 500 << 700 ;
        return list;
#endif
}


int i8910tuning::createOCPatch(int min, int medium, int max)
{
#ifdef Q_OS_SYMBIAN
        /*QFile powerdll("Z:/sys/bin/power.dll");
        if (!powerdll.open(QIODevice::ReadOnly)) {return 1;}*/

        QByteArray old_value;

        // USE /r/n FOR LINE BREAKS TO BE NOTEPAD-COMPATIBLE
        //A908, A918, A928 for min/2, A968, a978, a988 for min, a998 for medium, a9a8, a9b8 for max

        QFile patchfile("E:/Patches/"+QString::number(min)+"_"+QString::number(medium)+"_"+QString::number(max)+".rmp" );
        QTextStream patchstream(&patchfile);
        if (!patchfile.open(QIODevice::Truncate | QIODevice::WriteOnly)) { return 1;}

        patchstream << ";OC Patch "<<QString::number(min)<<"mhz || "<<QString::number(medium)<<"mhz || "<<QString::number(max)<<"mhz created by SymbianTuning, software written by faenil\r\n"
                    << ";Visit www.i8910tuning.com for more info\r\n"
                    << ";Credits to Panagiotis Xenitidis for the OC mod which faenil reversed\r\n"
                    << ";Credits to oisemen for the help in reversing the mod\r\n\r\n\r\n";

        QByteArray new_clock = toLE(min/2);
        /*powerdll.seek(0xA908);
        old_value = powerdll.read(4);
        old_value = old_value.toHex();*/
        patchstream << "rel:sys\\bin\\power.dll:0000A908:" << "????????" <<":"<< new_clock << "\r\n";
        patchstream << "rel:sys\\bin\\power.dll:0000A918:" << "????????" <<":"<< new_clock << "\r\n";
        patchstream << "rel:sys\\bin\\power.dll:0000A928:" << "????????" <<":"<< new_clock << "\r\n";

        new_clock = toLE(min);
        /*powerdll.seek(0xA968);
        old_value = powerdll.read(4);
        old_value = old_value.toHex();*/
        patchstream << "rel:sys\\bin\\power.dll:0000A968:" << "????????" <<":"<< new_clock << "\r\n";
        patchstream << "rel:sys\\bin\\power.dll:0000A978:" << "????????" <<":"<< new_clock << "\r\n";
        patchstream << "rel:sys\\bin\\power.dll:0000A988:" << "????????" <<":"<< new_clock << "\r\n";

        new_clock = toLE(medium);
        /*powerdll.seek(0xA998);
        old_value = powerdll.read(4);
        old_value = old_value.toHex();*/
        patchstream << "rel:sys\\bin\\power.dll:0000A998:" << "????????" <<":"<< new_clock << "\r\n";

        new_clock = toLE(max);
        /*powerdll.seek(0xA9A8);
        old_value = powerdll.read(4);
        old_value = old_value.toHex();*/
        patchstream << "rel:sys\\bin\\power.dll:0000A9A8:" << "????????" <<":"<< new_clock << "\r\n";
        patchstream << "rel:sys\\bin\\power.dll:0000A9B8:" << "????????" <<":"<< new_clock << "\r\n";

        patchstream.flush();
        patchfile.close();
        /*powerdll.close();*/
        return 0;
#endif
}

QByteArray i8910tuning::toLE(int value)
{
#ifdef Q_OS_SYMBIAN
    QByteArray bella;
    char a = value >> 24;
    char b = value >> 16;
    char c = value >> 8;
    char d = value;
    //uint32_t new_value = d << 24 | c << 16 | b << 8 | a;

    bella.append(d);
    bella.append(c);
    bella.append(b);
    bella.append(a);

    return bella.toHex();
#endif
}


/* Keys iCode:
# The following are not included in the Symbian headers.
EKey0 = 0x30
EKey1 = 0x31
EKey2 = 0x32
EKey3 = 0x33
EKey4 = 0x34
EKey5 = 0x35
EKey6 = 0x36
EKey7 = 0x37
EKey8 = 0x38
EKey9 = 0x39
EKeyStar = 0x2a
EKeyHash = 0x23
EKeyLeftSoftkey = EKeyDevice0
EKeyRightSoftkey = EKeyDevice1
EKeySelect = EKeyDevice3
EKeyEdit = EKeyLeftShift
EKeyMenu = EKeyApplication0

EScancode0=0x30
EScancode1=0x31
EScancode2=0x32
EScancode3=0x33
EScancode4=0x34
EScancode5=0x35
EScancode6=0x36
EScancode7=0x37
EScancode8=0x38
EScancode9=0x39
EScancodeStar=0x2a
EScancodeHash=0x7f
EScancodeBackspace=0x01
EScancodeLeftSoftkey=EStdKeyDevice0
EScancodeRightSoftkey=EStdKeyDevice1
EScancodeSelect=0xa7
EScancodeYes=0xc4
EScancodeNo=0xc5
EScancodeLeftArrow=0xe
EScancodeRightArrow=0xf
EScancodeUpArrow=0x10
EScancodeDownArrow=0x11
EScancodeEdit=EStdKeyLeftShift
EScancodeMenu=EStdKeyApplication0
*/
int i8910tuning::changeMicSens_slot(int valueMicAmp, int valueChannel)
{
#ifdef Q_OS_SYMBIAN
    static const TUid testaudio = { 0x0113813F };
    TInt err;

    TRAP(err, startL("testaudio.exe"));

    if (err) return -1;

    TApaTaskList tasklist(CCoeEnv::Static()->WsSession());

    TApaTask     task(tasklist.FindApp(testaudio));

    //NOT NEEDED SINCE USING EAPACOMMANDBACKGROUND
    //task.SendToBackground();  // or BringToForeground()

    // SEND KEY EVENTS
    TKeyEvent key;
    key.iModifiers = 0;
    key.iRepeats = 0;
    key.iCode = 0x33;
    key.iScanCode = 0x8b;
    task.SendKey(key);

    key.iCode = EKeyDevice3;
    key.iScanCode = EStdKeyDevice3;
    task.SendKey(key);

    // ENTER INTO ARM_ARM
    key.iCode = 0x34;
    key.iScanCode = 0;
    task.SendKey(key);

    key.iCode = EKeyDevice3;
    key.iScanCode = EStdKeyDevice3;
    task.SendKey(key);

    // NOW I'M IN ARM_AMR

    key.iCode = 0x31;
    key.iScanCode = 0;
    task.SendKey(key);

    key.iCode = EKeyDevice3;
    key.iScanCode = EStdKeyDevice3;
    task.SendKey(key);

    // CALL HANDLEVALUE(VALUE) TO SET THE VALUE TO THAT PROPERTY
    handleMicAmp(valueMicAmp,task);

    // NOW GO BACK AND CHANGE PROPERTY
    key.iCode = EKeyDevice1;
    key.iScanCode = EStdKeyDevice1;
    task.SendKey(key);

    key.iCode = 0x32;
    key.iScanCode = 0;
    task.SendKey(key);

    key.iCode = EKeyDevice3;
    key.iScanCode = EStdKeyDevice3;
    task.SendKey(key);

    handleChannel(valueChannel, task);

    key.iCode = EKeyDevice1;
    key.iScanCode = EStdKeyDevice1;
    task.SendKey(key);
    task.SendKey(key);
    task.SendKey(key);

    //NOW I'M IN MAIN MENU, TIME TO HIT BACKUP

    key.iCode = 0x36;
    key.iScanCode = 0;
    task.SendKey(key);

    key.iCode = EKeyDevice1;
    key.iScanCode = EStdKeyDevice1;
    task.SendKey(key);

#endif

}

#ifdef Q_OS_SYMBIAN
void i8910tuning::handleMicAmp(int value, TApaTask task)
{
    TKeyEvent key;
    key.iModifiers = 0;
    key.iRepeats = 0;
    key.iScanCode = 0;
    switch(value)
    {
    case 0:
        key.iCode = 0x30;
        task.SendKey(key);
        break;

    case 6:
        key.iCode = 0x36;
        task.SendKey(key);
        break;

    case 12:
        key.iCode = 0x31;
        task.SendKey(key);

        key.iCode = 0x32;
        task.SendKey(key);
        break;

    case 18:
        key.iCode = 0x31;
        task.SendKey(key);

        key.iCode = 0x38;
        task.SendKey(key);
        break;

    case 24:
        key.iCode = 0x32;
        task.SendKey(key);

        key.iCode = 0x34;
        task.SendKey(key);
        break;

    case 30:
        key.iCode = 0x33;
        task.SendKey(key);

        key.iCode = 0x30;
        task.SendKey(key);
        break;
    }

    //APPLY SENDING THE HASH KEYEVENT
    key.iCode = EKeyDevice3;
    key.iScanCode = EStdKeyDevice3;
    task.SendKey(key);
}
#endif

#ifdef Q_OS_SYMBIAN
void i8910tuning::handleChannel(int value, TApaTask task)
{
    TKeyEvent key;
    key.iModifiers = 0;
    key.iRepeats = 0;
    key.iScanCode = 0;

    if (value < 10) handle1_10(value, task);

    else if (value <20)
    {
        key.iCode = 0x31;
        task.SendKey(key);

        handle1_10(value-10, task);
    }
    else if (value <30)
    {
        key.iCode = 0x32;
        task.SendKey(key);

        handle1_10(value-20, task);
    }
    else if (value == 30)
    {
        key.iCode = 0x33;
        task.SendKey(key);
        key.iCode = 0x30;
        task.SendKey(key);
    }
    else if (value == 31)
    {
        key.iCode = 0x33;
        task.SendKey(key);
        key.iCode = 0x31;
        task.SendKey(key);
    }


    //APPLY SENDING THE HASH KEYEVENT
    key.iCode = EKeyDevice3;
    key.iScanCode = EStdKeyDevice3;
    task.SendKey(key);
}
#endif

#ifdef Q_OS_SYMBIAN
void i8910tuning::handle1_10(int value, TApaTask task)
{
    TKeyEvent key;
    key.iModifiers = 0;
    key.iRepeats = 0;
    key.iScanCode = 0;
    switch(value)
    {
    case 0:
        key.iCode = 0x30;
        break;

    case 1:
        key.iCode = 0x31;
        break;

    case 2:
        key.iCode = 0x32;
        break;

    case 3:
        key.iCode = 0x33;
        break;

    case 4:
        key.iCode = 0x34;
        break;

    case 5:
        key.iCode = 0x35;
        break;

    case 6:
        key.iCode = 0x36;
        break;

    case 7:
        key.iCode = 0x37;
        break;

    case 8:
        key.iCode = 0x38;
        break;

    case 9:
        key.iCode = 0x39;
        break;
    }

    task.SendKey(key);
}
#endif

int i8910tuning::enableDynamic_slot()
{
#ifdef Q_OS_SYMBIAN
    static const TUid tunemm = { 0x20003ACB };
    TInt err;

    TRAP(err, startL("TuneMM.exe"));

    if (err) return -1;

    TApaTaskList tasklist(CCoeEnv::Static()->WsSession());

    TApaTask     task(tasklist.FindApp(tunemm));

    //NOT NEEDED SINCE USING EAPACOMMANDBACKGROUND
    //task.SendToBackground();  // or BringToForeground()

    // SEND KEY EVENTS
    TKeyEvent key;
    key.iModifiers = 0;
    key.iRepeats = 0;
    key.iCode = 0x35;
    key.iScanCode = 0;
    task.SendKey(key);
    //QMessageBox::information(this, tr("Error while reading value"), "key 5 sent");


    key.iCode = EKeyDevice3;
    key.iScanCode = EStdKeyDevice3;
    task.SendKey(key);

    //QMessageBox::information(this, tr("Error while reading value"), "select");


    key.iCode = 0x34;
    key.iScanCode = 0;
    task.SendKey(key);

    //QMessageBox::information(this, tr("Error while reading value"), "key 4");

    key.iCode = EKeyDevice3;
    key.iScanCode = EStdKeyDevice3;
    task.SendKey(key);
    User::After(1000000);
    //QMessageBox::information(this, tr("Error while reading value"), "select");

    key.iCode = 0x31;
    key.iScanCode = 0;
    task.SendKey(key);
    User::After(1000000);
    //QMessageBox::information(this, tr("Error while reading value"), "key 1");

    key.iCode = EKeyDevice3;
    key.iScanCode = EStdKeyDevice3;
    task.SendKey(key);
    User::After(2000000);

    //QMessageBox::information(this, tr("Error while reading value"), "select");

    key.iCode = EKeyDevice1;
    key.iScanCode = EStdKeyDevice1;
    task.SendKey(key);
    task.SendKey(key);
    task.SendKey(key);
    task.SendKey(key);
    return 0;
#endif
}


int i8910tuning::enableLocked_slot()
{
#ifdef Q_OS_SYMBIAN
    static const TUid tunemm = { 0x20003ACB };
    TInt err;

    TRAP(err, startL("TuneMM.exe"));

    if (err) return -1;

    TApaTaskList tasklist(CCoeEnv::Static()->WsSession());

    TApaTask     task(tasklist.FindApp(tunemm));

    //NOT NEEDED SINCE USING EAPACOMMANDBACKGROUND
    //task.SendToBackground();  // or BringToForeground()

    // SEND KEY EVENTS
    TKeyEvent key;
    key.iModifiers = 0;
    key.iRepeats = 0;
    key.iCode = 0x35;
    key.iScanCode = 0;
    task.SendKey(key);
    //QMessageBox::information(this, tr("Error while reading value"), "key 5 sent");


    key.iCode = EKeyDevice3;
    key.iScanCode = EStdKeyDevice3;
    task.SendKey(key);

    //QMessageBox::information(this, tr("Error while reading value"), "select");


    key.iCode = 0x34;
    key.iScanCode = 0;
    task.SendKey(key);

    //QMessageBox::information(this, tr("Error while reading value"), "key 4");

    key.iCode = EKeyDevice3;
    key.iScanCode = EStdKeyDevice3;
    task.SendKey(key);
    User::After(1000000);
    //QMessageBox::information(this, tr("Error while reading value"), "select");

    key.iCode = 0x32;
    key.iScanCode = 0;
    task.SendKey(key);
    User::After(1000000);
    //QMessageBox::information(this, tr("Error while reading value"), "key 2");

    key.iCode = EKeyDevice3;
    key.iScanCode = EStdKeyDevice3;
    task.SendKey(key);
    User::After(2000000);

    //QMessageBox::information(this, tr("Error while reading value"), "select");

    key.iCode = EKeyDevice1;
    key.iScanCode = EStdKeyDevice1;
    task.SendKey(key);
    task.SendKey(key);
    task.SendKey(key);
    task.SendKey(key);

    return 0;
#endif
}
int i8910tuning::changeClockMode_slot(int mode)
{
#ifdef Q_OS_SYMBIAN
    static const TUid tunemm = { 0x20003ACB };
    TInt err;

    TRAP(err, startL("TuneMM.exe"));

    if (err) return -1;

    TApaTaskList tasklist(CCoeEnv::Static()->WsSession());

    TApaTask     task(tasklist.FindApp(tunemm));

    //NOT NEEDED SINCE USING EAPACOMMANDBACKGROUND
    //task.SendToBackground();  // or BringToForeground()

    // SEND KEY EVENTS
    TKeyEvent key;
    key.iModifiers = 0;
    key.iRepeats = 0;
    key.iCode = 0x35;
    key.iScanCode = 0;
    task.SendKey(key);
    User::After(50);
    //QMessageBox::information(this, tr("Error while reading value"), "key 5 sent");


    key.iCode = EKeyDevice3;
    key.iScanCode = EStdKeyDevice3;
    task.SendKey(key);
    User::After(50);

    //QMessageBox::information(this, tr("Error while reading value"), "select");


    key.iCode = 0x34;
    key.iScanCode = 0;
    task.SendKey(key);
    User::After(50);

    //QMessageBox::information(this, tr("Error while reading value"), "key 4");

    key.iCode = EKeyDevice3;
    key.iScanCode = EStdKeyDevice3;
    task.SendKey(key);
    User::After(50);
    User::After(1000000);

    //QMessageBox::information(this, tr("Error while reading value"), "select");


    // mode 0: I'm in Dynamic, want to switch to Locked ---> sequence 5-4-2
    // mode 1: I'm in Locked, want to swtich to Dynamic ---> sequence 5-4-1
    // mode 2: I'm in Dynamic, want to switch to Locked and back to Dynamic ---> sequence 5-4-2-back-1
    // mode 3: I'm in Locked, want to switch to Dynamic and back to Locket  ---> sequence 5-4-1-back-2
    if (mode == 0 || mode == 2)
    {
        key.iCode = 0x32;
        key.iScanCode = 0;
        task.SendKey(key);
        User::After(1000000);

        //QMessageBox::information(this, tr("Error while reading value"), "key 2");

        key.iCode = EKeyDevice3;
        key.iScanCode = EStdKeyDevice3;
        task.SendKey(key);
        User::After(2000000);

        //QMessageBox::information(this, tr("Error while reading value"), "select");

        key.iCode = EKeyDevice1;
        key.iScanCode = EStdKeyDevice1;
        task.SendKey(key);


        //EXITS
        if (mode == 0){

            task.SendKey(key);

            task.SendKey(key);

            task.SendKey(key);

            //QMessageBox::information(this, tr("Error while reading value"), "rightkey");

            return 0;
        }
    }

    key.iCode = 0x31;
    key.iScanCode = 0;
    task.SendKey(key);
    User::After(1000000);

    //QMessageBox::information(this, tr("Error while reading value"), "key 1");


    key.iCode = EKeyDevice3;
    key.iScanCode = EStdKeyDevice3;
    task.SendKey(key);
    User::After(2000000);

    //QMessageBox::information(this, tr("Error while reading value"), "select");

    key.iCode = EKeyDevice1;
    key.iScanCode = EStdKeyDevice1;
    task.SendKey(key);


    //EXITS
    if (mode == 1 || mode == 2){
        task.SendKey(key);
        task.SendKey(key);
        task.SendKey(key);

        return 0;
    }

    key.iCode = 0x32;
    key.iScanCode = 0;
    task.SendKey(key);
    User::After(1000000);

    //QMessageBox::information(this, tr("Error while reading value"), "key2");


    key.iCode = EKeyDevice3;
    key.iScanCode = EStdKeyDevice3;
    task.SendKey(key);
    User::After(2000000);

    //QMessageBox::information(this, tr("Error while reading value"), "select");


    // EXIT TUNEMM
    key.iCode = EKeyDevice1;
    key.iScanCode = EStdKeyDevice1;
    task.SendKey(key);

    task.SendKey(key);

    task.SendKey(key);

    task.SendKey(key);
    return 0;

#endif
}

int i8910tuning::getClockValue_slot()
{
#ifdef Q_OS_SYMBIAN

    int cpuSpeed = 0;
    HAL::Get( HALData::ECPUSpeed, cpuSpeed );
    return cpuSpeed;
#endif

}

int i8910tuning::dimlight_slot()
{
#ifdef Q_OS_SYMBIAN
    TInt val;
    TInt error;
    static const TUid repository = { 0x10200c8c };
    const TUint32 key = 0x1;
    val = ReadValInt(repository, key);

    if (val==0)
    {
        error = ChangeValInt( repository, key, 50);
        val = ReadValInt(repository, key);
        if (val != 50) return -1;
    }
    else
    {
        error = ChangeValInt( repository, key, 0);
        val = ReadValInt(repository, key);
        if (val != 0) return -1;
    }
    return 0;
#endif
}

int i8910tuning::callSummary_slot()
{
#ifdef Q_OS_SYMBIAN
    TInt val;
    TInt error;
    static const TUid repository = { 0x101F8831 };
    const TUint32 key = 0x1;
    val = ReadValInt(repository, key);

    if (val==0)
    {
        error = ChangeValInt( repository, key, 1);
        val = ReadValInt(repository, key);
        if (val != 1) return -1;
    }
    else
    {
        error = ChangeValInt( repository, key, 0);
        val = ReadValInt(repository, key);
        if (val != 0) return -1;
    }
    return 0;
#endif
}

int i8910tuning::getcallSummary_slot()
{
#ifdef Q_OS_SYMBIAN
    TInt val;
    static const TUid repository = { 0x101F8831 };
    const TUint32 key = 0x1;
    val = ReadValInt(repository, key);

    return val;
#endif
}

int i8910tuning::startL(QString path)
{
#ifdef Q_OS_SYMBIAN

    TPtrC exeDescriptor (static_cast<const TUint16*>(path.utf16()), (path.length()));

    TRequestStatus launchStatus;
    RApaLsSession lsSession;
    User::LeaveIfError(lsSession.Connect());
    CleanupClosePushL(lsSession);
    TThreadId threadId;
    CApaCommandLine* cl = CApaCommandLine::NewLC();
    cl->SetExecutableNameL(exeDescriptor);
    cl->SetCommandL(EApaCommandBackground);

    User::LeaveIfError(lsSession.StartApp(*cl, threadId, &launchStatus));

    User::WaitForRequest(launchStatus);
    if (launchStatus.Int() != KErrNone){}

    CleanupStack::PopAndDestroy(cl);
    CleanupStack::PopAndDestroy(&lsSession);
#endif
}



void i8910tuning::startcamera_slot()
{
#ifdef Q_OS_SYMBIAN
	QtAppLauncher::QtAppLauncher();
#endif
}

void i8910tuning::exit_slot()
{
	exit(0);
}

i8910tuning::~i8910tuning()
{

}
