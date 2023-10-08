part of dxf;

/// BLOCKS Section
///
/// The BLOCKS section of the DXF file contains an entry for each block
/// reference in the drawing.
class BlocksSection {
  BlocksSection._init();

  /// DXF Group Codes
  final _groupCodes = <GroupCode>[];

  factory BlocksSection._fromGroupCodes(List<GroupCode> codes) {
    var _section = BlocksSection._init();
    _section._groupCodes.addAll(codes);
    return _section;
  }

  void _addBlock(AcDbBlock block) {
    _groupCodes.insertAll(
        _groupCodes.indexWhere((e) => e.code == 0 && e.value == 'ENDSEC'),
        block._groupCodes);
  }
}
