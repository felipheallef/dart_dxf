part of dxf;

class Point2D extends Point3D {
  const Point2D(this.x, this.y) : super(x, y, 0);

  final double x, y;
}
