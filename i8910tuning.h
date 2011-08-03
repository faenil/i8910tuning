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

#ifndef I8910TUNING_H
#define I8910TUNING_H

#include <QtGui/QWidget>
#include "ui_i8910tuning.h"
#include <QtGui/QMainWindow>

#ifdef Q_OS_SYMBIAN
#include <e32base.h>
#include <e32std.h>
#include "apgtask.h"
#include "f32file.h"
#include <centralrepository.h>
#include "apgcli.h"
#include "apacmdln.h"
#include "hal.h"
#include <eikenv.h>
#include <eikappui.h>
#include <aknenv.h>
#include <aknappui.h>
#endif

#include <QFile>
#include <QTextStream>
#include <QWidget>
#include <qdeclarative.h>
#include <QProcess>
class i8910tuning : public QWidget
{
    Q_OBJECT

public:
    QProcess* process;
    i8910tuning(QWidget *parent = 0, QFile* a = NULL, QTextStream* b = NULL);
    //void keyPressEvent(QKeyEvent * event);
    QByteArray toLE(int value);
    ~i8910tuning();
#ifdef Q_OS_SYMBIAN
    Q_INVOKABLE TInt ChangeValInt(const TUid KUidRepository, const TUint32 key, const TInt newkeyvalue);
    Q_INVOKABLE TInt ReadValInt(const TUid KUidRepository, const TUint32 key);
    Q_INVOKABLE TInt ChangeValStr(const TUid KUidRepository, const TUint32 key, const QString newkeyvalue);
    Q_INVOKABLE TInt ReadValStr(const TUid KUidRepository, const TUint32 key, QString* retval);
    Q_INVOKABLE TInt CreateValInt(const TUid KUidRepository, const TUint32 key, const TInt newkeyvalue);
#endif
    void deleteEmptyCamera(const QString &folder);
    int deleteAllFilesIn(const QString &folder);


    
public slots: 
    int AFphoto_slot();
    int AFvideo_slot();
    int PFphoto_slot();
    int PFvideo_slot();
    int CheckPhotoFocus_slot();
    int CheckVideoFocus_slot();
    int supprON_slot();
    int supprOFF_slot();
    int checkSuppr_slot();
    int milestone_slot();
    int vivaz_slot();
    int i8910_slot();
    int i8510_slot();
    int n900_slot();
    int palm_slot();
    int devplat_slot();
    int droidx_slot();
    void startcamera_slot();
    void exit_slot();
    int inUseJpeg();
    int inUseUA();
    int inUseFWID();
    void deleteEmptyCamera_slot();
    int deleteGalleryCache_slot();
    int deleteTempFiles_slot();
    int changeUA_vivaz();
    int changeUA_I8910();
    int changeUA_N8v14();
    int changeUA_C6();
    int changeUA_5800();
    int changeUA_iPhone();
    int changeUA_desktop();
    int changeUA_android();
    int changeFW_vivaz();
    int changeFW_I8910();
    int changeFW_N8();
    int changeFW_C6();
    int changeFW_5800();
    int setks_slot(int x1, int x2, int x3, int x4, int x5, int x6, int x7, int x8, int x9, int xa, int xb);
    int defaultks_slot();
    QVariantList getks_slot();
    QVariantList getClock_slot();
    int createOCPatch(int min, int medium, int max);
    int changeMicSens_slot(int valueMicAmp, int valueChannel);

#ifdef Q_OS_SYMBIAN
    void handleMicAmp(int value, TApaTask task);
    void handleChannel(int value, TApaTask task);
    void handle1_10(int value, TApaTask task);
#endif
    int dimlight_slot();
    int changeClockMode_slot(int mode);
    int startL(QString path);
    int callSummary_slot();
    int getClockValue_slot();
    int getcallSummary_slot();
    int getDimLight_slot();
    int getWDR_slot();
    int wdr_slot();
    int enableLocked_slot();
    int enableDynamic_slot();
    int changeOrientation_slot(QString uid, int value);

private:
    Ui::i8910tuning ui;
};

#endif // I8910TUNING_H
