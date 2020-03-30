/****************************************************************************
** Meta object code from reading C++ file 'obstacle_extractor_panel.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.5.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/obstacle_detector/include/obstacle_detector/panels/obstacle_extractor_panel.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'obstacle_extractor_panel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.5.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_obstacle_detector__ObstacleExtractorPanel_t {
    QByteArrayData data[3];
    char stringdata0[57];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_obstacle_detector__ObstacleExtractorPanel_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_obstacle_detector__ObstacleExtractorPanel_t qt_meta_stringdata_obstacle_detector__ObstacleExtractorPanel = {
    {
QT_MOC_LITERAL(0, 0, 41), // "obstacle_detector::ObstacleEx..."
QT_MOC_LITERAL(1, 42, 13), // "processInputs"
QT_MOC_LITERAL(2, 56, 0) // ""

    },
    "obstacle_detector::ObstacleExtractorPanel\0"
    "processInputs\0"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_obstacle_detector__ObstacleExtractorPanel[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   19,    2, 0x08 /* Private */,

 // slots: parameters
    QMetaType::Void,

       0        // eod
};

void obstacle_detector::ObstacleExtractorPanel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        ObstacleExtractorPanel *_t = static_cast<ObstacleExtractorPanel *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->processInputs(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

const QMetaObject obstacle_detector::ObstacleExtractorPanel::staticMetaObject = {
    { &rviz::Panel::staticMetaObject, qt_meta_stringdata_obstacle_detector__ObstacleExtractorPanel.data,
      qt_meta_data_obstacle_detector__ObstacleExtractorPanel,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *obstacle_detector::ObstacleExtractorPanel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *obstacle_detector::ObstacleExtractorPanel::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_obstacle_detector__ObstacleExtractorPanel.stringdata0))
        return static_cast<void*>(const_cast< ObstacleExtractorPanel*>(this));
    return rviz::Panel::qt_metacast(_clname);
}

int obstacle_detector::ObstacleExtractorPanel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = rviz::Panel::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 1)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 1)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 1;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
