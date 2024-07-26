class Item {
  final String name;
  final String img;
  final int delay;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  Item(
      {required this.name,
      required this.img,
      required this.delay,
      this.top,
      this.bottom,
      this.left,
      this.right});
}
