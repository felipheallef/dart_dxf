part of dxf;

/// INSERT (DXF)
///
/// Subclass marker (AcDbBlockReference)
class AcDbInsert implements AcDbEntity {
  AcDbInsert._init();

  @override
  List<GroupCode> _groupCodes = <GroupCode>[];

  @override
  String get _dxfString => _groupCodes.expand((e) => [e._dxfString]).join();

  @override
  String _type = 'INSERT';

  @override
  String get type => _type;

  @override
  String _handle = Random().nextInt(9999).toString();

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

  Point3D _point = Point3D(0, 0, 0);

  Point3D get point => _point;

  set point(Point3D value) {
    _point = value;
    setTagValue(10, value.x);
    setTagValue(20, value.y);
    setTagValue(30, value.z);
  }

  Point3D _scale = Point3D(1, 1, 1);

  Point3D get scale => _scale;

  set scale(Point3D value) {
    _scale = value;
    setTagValue(41, value.x);
    setTagValue(42, value.y);
    setTagValue(43, value.z);
  }

  String _blockName = '';

  String get blockName => _blockName;

  set blockName(String value) {
    _blockName = value;
    setTagValue(2, value);
  }

  double _rotation = 0;

  double get rotation => _rotation;

  set rotation(double value) {
    _rotation = value;
    setTagValue(50, value);
  }

  void setTagValue<T>(int code, T value) {
    final result = _groupCodes.firstWhere((e) => e.code == code);
    result.value = value;
  }

  /// Create AcDbInsert entity.
  AcDbInsert({
    Point3D point = const Point3D(0, 0, 0),
    Point3D scale = const Point3D(1, 1, 1),
    String blockName = '',
    double rotation = 0.0,
    String layerName = '0',
    String description = '',
    String xrefPathName = '',
  })  : _point = point,
        _scale = scale,
        _blockName = blockName,
        _rotation = rotation,
        _layerName = layerName {
    _groupCodes.add(GroupCode(0, type));
    _groupCodes.add(GroupCode(5, handle));
    _groupCodes.add(GroupCode(330, '1F')); // ownerObjectHandle
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layerName));
    _groupCodes.add(GroupCode(100, 'AcDbBlockReference'));
    _groupCodes.add(GroupCode(2, blockName));
    _groupCodes.add(GroupCode(10, point.x));
    _groupCodes.add(GroupCode(20, point.y));
    _groupCodes.add(GroupCode(30, point.z));
    _groupCodes.add(GroupCode(41, scale.x));
    _groupCodes.add(GroupCode(42, scale.y));
    _groupCodes.add(GroupCode(43, scale.z));
    _groupCodes.add(GroupCode(50, rotation));
  }

  factory AcDbInsert._fromGroupCodes(List<GroupCode> codes) {
    final _acDbEntity = AcDbInsert._init();
    _acDbEntity._groupCodes.addAll(codes);

    try {
      var result = codes.firstWhere((e) => e.code == 5);
      _acDbEntity._handle = result.value;

      final x = double.parse(codes.firstWhere((e) => e.code == 10).value);
      final y = double.parse(codes.firstWhere((e) => e.code == 20).value);
      final z = double.parse(codes.firstWhere((e) => e.code == 30).value);

      _acDbEntity._point = Point3D(x, y, z);

      final scaleX = double.parse(codes.firstWhere((e) => e.code == 41).value);
      final scaleY = double.parse(codes.firstWhere((e) => e.code == 42).value);
      final scaleZ = double.parse(codes.firstWhere((e) => e.code == 43).value);

      _acDbEntity._scale = Point3D(scaleX, scaleY, scaleZ);

      result = codes.firstWhere((e) => e.code == 2);
      _acDbEntity._blockName = result.value;

      result = codes.firstWhere((e) => e.code == 8);
      _acDbEntity._layerName = result.value;
    } catch (e) {
      throw AssertionError('Missing group code!');
    }
    return _acDbEntity;
  }
}
