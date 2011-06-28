/****************************************************************************
** Meta object code from reading C++ file 'i8910tuning.h'
**
** Created: Wed 17. Nov 19:49:36 2010
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "i8910tuning.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'i8910tuning.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_i8910tuning[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
      29,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      13,   12,   12,   12, 0x0a,
      24,   12,   20,   12, 0x0a,
      39,   12,   20,   12, 0x0a,
      54,   12,   20,   12, 0x0a,
      69,   12,   20,   12, 0x0a,
      84,   12,   20,   12, 0x0a,
     107,   12,   20,   12, 0x0a,
     130,   12,   20,   12, 0x0a,
     145,   12,   20,   12, 0x0a,
     161,   12,   20,   12, 0x0a,
     179,   12,   20,   12, 0x0a,
     196,   12,   20,   12, 0x0a,
     209,   12,   20,   12, 0x0a,
     222,   12,   20,   12, 0x0a,
     235,   12,   20,   12, 0x0a,
     247,   12,   20,   12, 0x0a,
     259,   12,   20,   12, 0x0a,
     274,   12,   20,   12, 0x0a,
     288,   12,   12,   12, 0x0a,
     307,   12,   12,   12, 0x0a,
     319,   12,   20,   12, 0x0a,
     331,   12,   12,   12, 0x0a,
     356,   12,   12,   12, 0x0a,
     382,   12,   12,   12, 0x0a,
     397,   12,   12,   12, 0x0a,
     411,   12,   12,   12, 0x0a,
     427,   12,   12,   12, 0x0a,

 // methods: signature, parameters, type, tag, flags
     479,  448,  443,   12, 0x02,
     530,  511,  443,   12, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_i8910tuning[] = {
    "i8910tuning\0\0mod2()\0int\0AFphoto_slot()\0"
    "AFvideo_slot()\0PFphoto_slot()\0"
    "PFvideo_slot()\0CheckPhotoFocus_slot()\0"
    "CheckVideoFocus_slot()\0supprON_slot()\0"
    "supprOFF_slot()\0checkSuppr_slot()\0"
    "milestone_slot()\0vivaz_slot()\0"
    "i8910_slot()\0i8510_slot()\0n900_slot()\0"
    "palm_slot()\0devplat_slot()\0droidx_slot()\0"
    "startcamera_slot()\0exit_slot()\0"
    "inUseJpeg()\0deleteEmptyCamera_slot()\0"
    "deleteGalleryCache_slot()\0changeid5800()\0"
    "changeidn97()\0changeidvivaz()\0"
    "changeidi8910()\0TInt\0"
    "KUidRepository,key,newkeyvalue\0"
    "ChangeValInt(TUid,TUint32,TInt)\0"
    "KUidRepository,key\0ReadValInt(TUid,TUint32)\0"
};

const QMetaObject i8910tuning::staticMetaObject = {
    { &QWidget::staticMetaObject, qt_meta_stringdata_i8910tuning,
      qt_meta_data_i8910tuning, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &i8910tuning::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *i8910tuning::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *i8910tuning::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_i8910tuning))
        return static_cast<void*>(const_cast< i8910tuning*>(this));
    return QWidget::qt_metacast(_clname);
}

int i8910tuning::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QWidget::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: mod2(); break;
        case 1: { int _r = AFphoto_slot();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 2: { int _r = AFvideo_slot();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 3: { int _r = PFphoto_slot();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 4: { int _r = PFvideo_slot();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 5: { int _r = CheckPhotoFocus_slot();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 6: { int _r = CheckVideoFocus_slot();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 7: { int _r = supprON_slot();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 8: { int _r = supprOFF_slot();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 9: { int _r = checkSuppr_slot();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 10: { int _r = milestone_slot();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 11: { int _r = vivaz_slot();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 12: { int _r = i8910_slot();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 13: { int _r = i8510_slot();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 14: { int _r = n900_slot();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 15: { int _r = palm_slot();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 16: { int _r = devplat_slot();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 17: { int _r = droidx_slot();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 18: startcamera_slot(); break;
        case 19: exit_slot(); break;
        case 20: { int _r = inUseJpeg();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 21: deleteEmptyCamera_slot(); break;
        case 22: deleteGalleryCache_slot(); break;
        case 23: changeid5800(); break;
        case 24: changeidn97(); break;
        case 25: changeidvivaz(); break;
        case 26: changeidi8910(); break;
        case 27: { TInt _r = ChangeValInt((*reinterpret_cast< const TUid(*)>(_a[1])),(*reinterpret_cast< const TUint32(*)>(_a[2])),(*reinterpret_cast< const TInt(*)>(_a[3])));
            if (_a[0]) *reinterpret_cast< TInt*>(_a[0]) = _r; }  break;
        case 28: { TInt _r = ReadValInt((*reinterpret_cast< const TUid(*)>(_a[1])),(*reinterpret_cast< const TUint32(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< TInt*>(_a[0]) = _r; }  break;
        default: ;
        }
        _id -= 29;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
