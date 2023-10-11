part of dxf;

class Point3D {
  const Point3D(this.x, this.y, this.z);

  final double x, y, z;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Point3D &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y &&
          z == other.z;

  @override
  int get hashCode => x.hashCode ^ y.hashCode ^ z.hashCode;

  static const Point3D zero = Point3D(0, 0, 0);
}
