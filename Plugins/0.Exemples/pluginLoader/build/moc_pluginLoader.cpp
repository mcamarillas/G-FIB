/****************************************************************************
** Meta object code from reading C++ file 'pluginLoader.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../pluginLoader.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/qplugin.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'pluginLoader.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.8. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_PluginLoader_t {
    QByteArrayData data[15];
    char stringdata0[197];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_PluginLoader_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_PluginLoader_t qt_meta_stringdata_PluginLoader = {
    {
QT_MOC_LITERAL(0, 0, 12), // "PluginLoader"
QT_MOC_LITERAL(1, 13, 19), // "createDefaultPlugin"
QT_MOC_LITERAL(2, 33, 0), // ""
QT_MOC_LITERAL(3, 34, 24), // "createPluginFromTemplate"
QT_MOC_LITERAL(4, 59, 12), // "attachPlugin"
QT_MOC_LITERAL(5, 72, 4), // "name"
QT_MOC_LITERAL(6, 77, 21), // "openFilesInTextEditor"
QT_MOC_LITERAL(7, 99, 11), // "resetCamera"
QT_MOC_LITERAL(8, 111, 13), // "cameraPreset1"
QT_MOC_LITERAL(9, 125, 13), // "cameraPreset2"
QT_MOC_LITERAL(10, 139, 13), // "cameraPreset3"
QT_MOC_LITERAL(11, 153, 13), // "cameraPreset4"
QT_MOC_LITERAL(12, 167, 13), // "cameraPreset5"
QT_MOC_LITERAL(13, 181, 10), // "loadObject"
QT_MOC_LITERAL(14, 192, 4) // "file"

    },
    "PluginLoader\0createDefaultPlugin\0\0"
    "createPluginFromTemplate\0attachPlugin\0"
    "name\0openFilesInTextEditor\0resetCamera\0"
    "cameraPreset1\0cameraPreset2\0cameraPreset3\0"
    "cameraPreset4\0cameraPreset5\0loadObject\0"
    "file"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_PluginLoader[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      13,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   79,    2, 0x0a /* Public */,
       3,    0,   80,    2, 0x0a /* Public */,
       4,    0,   81,    2, 0x0a /* Public */,
       4,    1,   82,    2, 0x0a /* Public */,
       6,    0,   85,    2, 0x0a /* Public */,
       7,    0,   86,    2, 0x0a /* Public */,
       8,    0,   87,    2, 0x0a /* Public */,
       9,    0,   88,    2, 0x0a /* Public */,
      10,    0,   89,    2, 0x0a /* Public */,
      11,    0,   90,    2, 0x0a /* Public */,
      12,    0,   91,    2, 0x0a /* Public */,
      13,    0,   92,    2, 0x0a /* Public */,
      13,    1,   93,    2, 0x0a /* Public */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    5,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,   14,

       0        // eod
};

void PluginLoader::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<PluginLoader *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->createDefaultPlugin(); break;
        case 1: _t->createPluginFromTemplate(); break;
        case 2: _t->attachPlugin(); break;
        case 3: _t->attachPlugin((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 4: _t->openFilesInTextEditor(); break;
        case 5: _t->resetCamera(); break;
        case 6: _t->cameraPreset1(); break;
        case 7: _t->cameraPreset2(); break;
        case 8: _t->cameraPreset3(); break;
        case 9: _t->cameraPreset4(); break;
        case 10: _t->cameraPreset5(); break;
        case 11: _t->loadObject(); break;
        case 12: _t->loadObject((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject PluginLoader::staticMetaObject = { {
    &QObject::staticMetaObject,
    qt_meta_stringdata_PluginLoader.data,
    qt_meta_data_PluginLoader,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *PluginLoader::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *PluginLoader::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_PluginLoader.stringdata0))
        return static_cast<void*>(this);
    if (!strcmp(_clname, "Plugin"))
        return static_cast< Plugin*>(this);
    if (!strcmp(_clname, "edu.upc.fib.graug.Plugin/1.0"))
        return static_cast< Plugin*>(this);
    return QObject::qt_metacast(_clname);
}

int PluginLoader::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 13)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 13;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 13)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 13;
    }
    return _id;
}

QT_PLUGIN_METADATA_SECTION
static constexpr unsigned char qt_pluginMetaData[] = {
    'Q', 'T', 'M', 'E', 'T', 'A', 'D', 'A', 'T', 'A', ' ', '!',
    // metadata version, Qt version, architectural requirements
    0, QT_VERSION_MAJOR, QT_VERSION_MINOR, qPluginArchRequirements(),
    0xbf, 
    // "IID"
    0x02,  0x66,  'P',  'l',  'u',  'g',  'i',  'n', 
    // "className"
    0x03,  0x6c,  'P',  'l',  'u',  'g',  'i',  'n', 
    'L',  'o',  'a',  'd',  'e',  'r', 
    0xff, 
};
QT_MOC_EXPORT_PLUGIN(PluginLoader, PluginLoader)

QT_WARNING_POP
QT_END_MOC_NAMESPACE
