part of dxf;

/// TEXT (DXF)
///
/// Subclass marker (AcDbText)
class AcDbText implements AcDbEntity {
  AcDbText._init();

  @override
  List<GroupCode> _groupCodes = <GroupCode>[];

  @override
  String get _dxfString => _groupCodes.expand((e) => [e._dxfString]).join();

  @override
  String _type = 'TEXT';

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
    final result = _groupCodes.firstWhere((element) => element.code == 8);
    _layerName = value;
    result.value = value;
  }

  Point3D _firstAlignmentPoint = Point3D.zero;

  Point3D get firstAlignmentPoint => _firstAlignmentPoint;

  set firstAlignmentPoint(Point3D value) {
    _firstAlignmentPoint = value;
    setTagValue(10, value.x);
    setTagValue(20, value.y);
    setTagValue(30, value.z);
  }

  Point3D? _secondAlignmentPoint = null;

  Point3D? get secondAlignmentPoint => _firstAlignmentPoint;

  set secondAlignmentPoint(Point3D? value) {
    _secondAlignmentPoint = value;
    setTagValue(11, value?.x);
    setTagValue(21, value?.y);
    setTagValue(31, value?.z);
  }

  String _textString = 'Title';

  String get textString => _textString;

  set textString(String value) {
    final result = _groupCodes.firstWhere((element) => element.code == 1);
    _textString = value;
    result.value = value;
  }

  double _textHeight = 2.5;

  double get textHeight => _textHeight;

  set textHeight(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 40);
    _textHeight = value;
    result.value = value;
  }

  double _rotation = 0;

  double get rotation => _rotation;

  set rotation(double value) {
    _rotation = value;
    setTagValue(50, value);
  }

  TextAlignment _alignment = TextAlignment.left;

  TextAlignment get alignment => _alignment;

  set alignment(TextAlignment value) {
    _alignment = value;
    setTagValue(72, value.horizontal);
    setTagValue(73, value.vertical);
  }

  void setTagValue<T>(int code, T value) {
    final result = _groupCodes.firstWhere((e) => e.code == code);
    result.value = value;
  }

  factory AcDbText._fromGroupCodes(List<GroupCode> codes) {
    final _acDbEntity = AcDbText._init();
    _acDbEntity._groupCodes.addAll(codes);
    try {
      var result = codes.firstWhere((element) => element.code == 5);
      _acDbEntity._handle = result.value;
      result = codes.firstWhere((element) => element.code == 10);
      final x = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 20);
      final y = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 30);
      final z = double.parse(result.value);

      _acDbEntity._firstAlignmentPoint = Point3D(x, y, z);
      result = codes.firstWhere((element) => element.code == 1);
      _acDbEntity._textString = result.value;
      result = codes.firstWhere((element) => element.code == 40);
      _acDbEntity._textHeight = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 8);
      _acDbEntity._layerName = result.value;
    } catch (e) {
      throw AssertionError(['Missing group code!']);
    }
    return _acDbEntity;
  }

  AcDbText({
    Point3D firstAlignmentPoint = Point3D.zero,
    Point3D? secondAlignmentPoint,
    double y = 0,
    double z = 0,
    double rotation = 0,
    String textString = '',
    double textHeight = 2.5,
    TextAlignment alignment = TextAlignment.left,
    String layerName = '0',
  })  : _firstAlignmentPoint = firstAlignmentPoint,
        _secondAlignmentPoint = secondAlignmentPoint,
        _alignment = alignment,
        _rotation = rotation,
        _textString = textString,
        _textHeight = textHeight,
        _layerName = layerName {
    _groupCodes.add(GroupCode(0, type));
    _groupCodes.add(GroupCode(5, handle));
    _groupCodes.add(GroupCode(330, '1F'));
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layerName));
    _groupCodes.add(GroupCode(100, 'AcDbText'));

    // 39 = thickness
    _groupCodes.add(GroupCode(10, firstAlignmentPoint.x));
    _groupCodes.add(GroupCode(20, firstAlignmentPoint.y));
    _groupCodes.add(GroupCode(30, firstAlignmentPoint.z));
    _groupCodes.add(GroupCode(40, textHeight));
    _groupCodes.add(GroupCode(1, textString));
    _groupCodes.add(GroupCode(50, rotation));
    // 41 = relativeXScaleFactor
    // 51 = obliqueAngle
    // 7 = styleName
    // 71 = generationFlags
    _groupCodes.add(GroupCode(72, alignment.horizontal));
    _groupCodes.add(GroupCode(11, secondAlignmentPoint?.x));
    _groupCodes.add(GroupCode(21, secondAlignmentPoint?.y));
    _groupCodes.add(GroupCode(31, secondAlignmentPoint?.z));
    _groupCodes.add(GroupCode(100, 'AcDbText'));
    _groupCodes.add(GroupCode(73, alignment.vertical));
  }
}
