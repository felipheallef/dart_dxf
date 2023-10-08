part of dxf;

class BlockFlag {
  static final none = 0;
  static final anonymous = 1;
  static final noAttribute = 2;
  static final external = 4;
  static final xRef = 8;
  static final externallyDependent = 16;
  static final resolvedXRef = 32;
  static final referencedXRef = 64;
}

/// Block (DXF)
///
/// Subclass marker (AcDbBlock)
class AcDbBlock implements AcDbEntity {
  AcDbBlock._init();

  @override
  List<GroupCode> _groupCodes = <GroupCode>[];

  @override
  String get _dxfString => _groupCodes.expand((e) => [e._dxfString]).join();

  @override
  String _type = 'BLOCK';

  @override
  String get type => _type;

  @override
  String _handle = '190';

  @override
  String get handle => _handle;

  @override
  String _layerName = '0';

  @override
  String get layerName => _layerName;

  @override
  set layerName(String value) {
    final result = _groupCodes.firstWhere((e) => e.code == 8);
    _layerName = value;
    result.value = value;
  }

  double _x = 0;

  double get x => _x;

  set x(double value) {
    final result = _groupCodes.firstWhere((e) => e.code == 10);
    _x = value;
    result.value = value;
  }

  double _y = 0;

  double get y => _y;

  set y(double value) {
    final result = _groupCodes.firstWhere((e) => e.code == 20);
    _y = value;
    result.value = value;
  }

  double _z = 0;

  double get z => _z;

  set z(double value) {
    final result = _groupCodes.firstWhere((e) => e.code == 30);
    _z = value;
    result.value = value;
  }

  int _flags = BlockFlag.none;

  int get flags => _flags;

  set flags(int value) {
    _flags = value;
    setTagValue(70, value);
  }

  String _name = '';

  String get name => _name;

  set name(String value) {
    _name = value;
    setTagValue(2, value);
  }

  String _secondName = '';

  String get secondName => _secondName;

  set secondName(String value) {
    _secondName = value;
    setTagValue(3, value);
  }

  String _xrefPathName = '';

  String get xrefPathName => _xrefPathName;

  set xrefPathName(String value) {
    _xrefPathName = value;
    setTagValue(4, value);
  }

  String _description = '';

  String get description => _description;

  set description(String value) {
    _description = value;
    setTagValue(4, value);
  }

  void setTagValue<T>(int code, T value) {
    final result = _groupCodes.firstWhere((e) => e.code == code);
    result.value = value;
  }

  /// Create AcDbBlock entity.
  AcDbBlock({
    double x = 0,
    double y = 0,
    double z = 0,
    int flags = 0,
    String name = '',
    String secondName = '',
    String layerName = '0',
    String description = '',
    String xrefPathName = '',
  })  : _x = x,
        _y = y,
        _z = z,
        _name = name,
        _flags = flags,
        _secondName = secondName,
        _xrefPathName = xrefPathName,
        _description = description,
        _layerName = layerName {
    _groupCodes.add(GroupCode(0, type));
    _groupCodes.add(GroupCode(5, handle));
    _groupCodes.add(GroupCode(330, '1F')); // ownerObjectHandle
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layerName));
    _groupCodes.add(GroupCode(100, 'AcDbBlockBegin'));
    _groupCodes.add(GroupCode(2, name));
    _groupCodes.add(GroupCode(70, flags));
    _groupCodes.add(GroupCode(10, x));
    _groupCodes.add(GroupCode(20, y));
    _groupCodes.add(GroupCode(30, z));
    _groupCodes.add(GroupCode(3, secondName));
    _groupCodes.add(GroupCode(1, xrefPathName));
    _groupCodes.add(GroupCode(4, description));
    // End block
    _groupCodes.add(GroupCode(0, 'ENDBLK'));
    _groupCodes.add(GroupCode(5, handle));
    _groupCodes.add(GroupCode(330, '1F')); // ownerObjectHandle
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layerName));
    _groupCodes.add(GroupCode(100, 'AcDbBlockEnd'));
  }

  factory AcDbBlock._fromGroupCodes(List<GroupCode> codes) {
    final _acDbEntity = AcDbBlock._init();
    _acDbEntity._groupCodes.addAll(codes);
    
    try {
      var result = codes.firstWhere((e) => e.code == 5);
      _acDbEntity._handle = result.value;

      result = codes.firstWhere((e) => e.code == 10);
      _acDbEntity._x = double.parse(result.value);

      result = codes.firstWhere((e) => e.code == 20);
      _acDbEntity._y = double.parse(result.value);

      result = codes.firstWhere((e) => e.code == 30);
      _acDbEntity._z = double.parse(result.value);

      result = codes.firstWhere((e) => e.code == 2);
      _acDbEntity._name = result.value;

      result = codes.firstWhere((e) => e.code == 3);
      _acDbEntity._secondName = result.value;

      result = codes.firstWhere((e) => e.code == 70);
      _acDbEntity._flags = int.parse(result.value);

      result = codes.firstWhere((e) => e.code == 1);
      _acDbEntity._xrefPathName = result.value;

      result = codes.firstWhere((e) => e.code == 4);
      _acDbEntity._description = result.value;

      result = codes.firstWhere((e) => e.code == 8);
      _acDbEntity._layerName = result.value;
    } catch (e) {
      throw AssertionError('Missing group code!');
    }
    return _acDbEntity;
  }

  factory AcDbBlock.fromGroupCodes(List<GroupCode> codes) =
      AcDbBlock._fromGroupCodes;
}
