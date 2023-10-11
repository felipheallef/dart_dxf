part of dxf;

enum TextAlignment {
  left(0, 0),
  center(0, 1),
  right(0, 2),
  aligned(0, 3),
  middle(0, 4),
  fit(0, 5),
  topLeft(3, 0),
  topCenter(3, 1),
  topRight(3, 2),
  middleLeft(2, 0),
  middleCenter(2, 1),
  middleRight(2, 2),
  bottomLeft(1, 0),
  bottomCenter(1, 1),
  bottomRight(1, 2);

  /// Vertical text justification type (optional, default = 0): integer codes (not bit-coded):
  /// 0 = Baseline; 1 = Bottom; 2 = Middle; 3 = Top
  ///
  /// See the Group 72 and 73 integer codes table for clarification:
  /// https://documentation.help/AutoCAD-DXF/WS1a9193826455f5ff18cb41610ec0a2e719-79d1.htm
  final int vertical;

  /// Horizontal text justification type (optional, default = 0) integer codes (not bit-coded)
  /// 0 = Left; 1= Center; 2 = Right
  /// 3 = Aligned (if vertical alignment = 0)
  /// 4 = Middle (if vertical alignment = 0)
  /// 5 = Fit (if vertical alignment = 0)
  ///
  /// See the Group 72 and 73 integer codes table for clarification:
  /// https://documentation.help/AutoCAD-DXF/WS1a9193826455f5ff18cb41610ec0a2e719-79d1.htm
  final int horizontal;

  const TextAlignment(this.vertical, this.horizontal);

  static TextAlignment of([int vertical = 0, int horizontal = 0]) {
    return values.firstWhere(
        (e) => e.vertical == vertical && e.horizontal == horizontal);
  }
}
