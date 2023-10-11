import 'dart:math';

import 'package:dxf/dxf.dart';

void main() {
  final dxf = DXF.create();
  // or dxf = DXF.fromString(dxfString);
  var arc = AcDbArc(
    x: -3.4,
    y: 19.8,
    z: 0,
    radius: 4.5,
    startAngle: 297,
    endAngle: 40,
  );
  dxf.addEntities(arc);

  var circle = AcDbCircle(
    x: 0.2,
    y: 12,
    z: 0,
    radius: 2.5,
  );
  dxf.addEntities(circle);

  var ellipse = AcDbEllipse(
    x: 5.4,
    y: 19,
    z: 0,
    xEndPoint: -1.6,
    yEndPoint: -0.8,
    zEndPoint: 0,
    ratioMajor: 0.5,
    start: 0,
    end: 2 * pi,
  );
  dxf.addEntities(ellipse);

  var line = AcDbLine(
    x: 3.6,
    y: 14.3,
    x1: 8.08,
    y1: 15.3,
  );
  dxf.addEntities(line);

  var mtext = AcDbMText(
      x: 3.7,
      y: 12.3,
      z: 0,
      textHeight: 2.5,
      textString: 'Hello, xin chào',
      columnWidth: 12.9);
  dxf.addEntities(mtext);

  var point = AcDbPoint(x: -0.6, y: 8.3, z: 0);
  dxf.addEntities(point);

  var vertices = <List<double>>[];
  vertices.addAll([
    [2.4, 21.1],
    [6.7, 22.6],
    [9.9, 21.7],
    [13.5, 22.6]
  ]);

  var polyline = AcDbPolyline(vertices: vertices, isClosed: false);
  dxf.addEntities(polyline);

  final text = AcDbText(
    firstAlignmentPoint: Point2D(14.2, 16.7),
    textString: 'https://humg.edu.vn',
  );

  dxf.addEntities(text);

  // Load string from ASCII DXF file
  final dxf1 = DXF.fromString(dxf.dxfString);

  final text1 = AcDbText(
    firstAlignmentPoint: Point2D(18.2, 26.7),
    textString: 'DXF package',
  );

  dxf1.addEntities(text1);

  final solid = AcDbSolid(
    x: 3.2,
    y: 24.5,
    x1: 2.4,
    y1: 26.3,
    x2: 5.3,
    y2: 27.9,
    x3: 6.1,
    y3: 27.7,
  );

  dxf1.addEntities(solid);
  print(dxf1.dxfString);
}
