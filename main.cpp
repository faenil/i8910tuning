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

#include <QtGui>
#include <QApplication>

#include <QDeclarativeView>
#include <QDeclarativeContext>


 int main(int argc, char *argv[])
 {
     QFile logfile2("C:/hxlog.txt");
     QTextStream log2(&logfile2);
     if (!logfile2.open(QIODevice::Append | QIODevice::WriteOnly)) return 1;

     log2 << "file";
#ifdef Q_OS_SYMBIAN
     QApplication::setGraphicsSystem("openvg");
#endif
     log2 << "graphics system";
     QApplication app(argc, argv);

     QDeclarativeView view;
     view.rootContext()->setContextProperty("i8910tuning", new i8910tuning(0, &logfile2, &log2));
     view.setSource(QUrl("qrc:/Page.qml"));

     log2 << "dec view";

#ifdef Q_OS_SYMBIAN
     CAknAppUi* appUi = dynamic_cast<CAknAppUi*> (CEikonEnv::Static()->AppUi());
     TRAPD(error,
     if (appUi) {
         // Lock application orientation into landscape
         appUi->SetOrientationL(CAknAppUi::EAppUiOrientationPortrait);
     }
     );
#endif
 log2 << "locked portrait";
#ifdef Q_OS_SYMBIAN
     view.showFullScreen();
#else
     view.show();
#endif

     return app.exec();

 }
