part of widgets;

class CustomTag extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? fontSize;
  final EdgeInsets? padding;

  const CustomTag({
    Key? key,
    required this.child,
    this.color,
    this.padding,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = color ?? AppTheme.primary;
    return Container(
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 3.w,
          ),
      decoration: ShapeDecoration(
        color: Color.alphaBlend(primaryColor.withOpacity(0.1), Colors.white),
        shape: const StadiumBorder(),
      ),
      child: DefaultTextStyle.merge(
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize ?? 11.w,
          color: primaryColor,
          height: 1.2,
          fontWeight: FontWeight.normal,
        ),
        child: child,
      ),
    );
  }
}
