part of widgets;

enum CustomButtonType { filled, ghost, borderless }

enum CustomButtonSize { large, medium, small }

enum CustomButtonShape { radius, stadium, square }

class CustomButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final CustomButtonType type;
  final CustomButtonSize size;
  final CustomButtonShape shape;
  final double? width;
  final double? height;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    this.type = CustomButtonType.filled,
    this.size = CustomButtonSize.medium,
    this.shape = CustomButtonShape.stadium,
    this.width,
    this.height,
    this.padding,
    this.fontSize,
  }) : super(key: key);

  OutlinedBorder? get _shape {
    switch (shape) {
      case CustomButtonShape.stadium:
        return const StadiumBorder();
      case CustomButtonShape.radius:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.w),
        );
      case CustomButtonShape.square:
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        );
    }
  }

  EdgeInsetsGeometry? get _padding {
    switch (size) {
      case CustomButtonSize.large:
        return EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.w);
      case CustomButtonSize.medium:
        return EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.w);
      case CustomButtonSize.small:
        return EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w);
    }
  }

  double? get _fontSize {
    switch (size) {
      case CustomButtonSize.large:
        return 18.w;
      case CustomButtonSize.medium:
        return 16.w;
      case CustomButtonSize.small:
        return 14.w;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(fontSize: fontSize ?? _fontSize),
          ),
          padding: MaterialStateProperty.all(padding ?? _padding),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            switch (type) {
              case CustomButtonType.filled:
                final color = foregroundColor ?? colorScheme.onPrimary;
                final opacity = color.opacity / 2;
                if (states.contains(MaterialState.disabled)) {
                  return color.withOpacity(opacity);
                }
                return color;
              case CustomButtonType.ghost:
              case CustomButtonType.borderless:
                final color = foregroundColor ?? colorScheme.primary;
                final opacity = color.opacity / 2;
                if (states.contains(MaterialState.pressed)) {
                  return color.withOpacity(opacity);
                }
                if (states.contains(MaterialState.disabled)) {
                  return color.withOpacity(opacity);
                }
                return color;
            }
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            switch (type) {
              case CustomButtonType.filled:
                final color = backgroundColor ?? colorScheme.primary;
                final opacity = color.opacity / 2;
                if (states.contains(MaterialState.pressed)) {
                  return color.withOpacity(opacity);
                }
                if (states.contains(MaterialState.disabled)) {
                  return color.withOpacity(opacity);
                }
                return color;
              case CustomButtonType.ghost:
              case CustomButtonType.borderless:
                return Colors.transparent;
            }
          }),
          side: MaterialStateProperty.resolveWith((states) {
            switch (type) {
              case CustomButtonType.filled:
              case CustomButtonType.borderless:
                return BorderSide.none;
              case CustomButtonType.ghost:
                var color = foregroundColor ?? colorScheme.primary;
                final opacity = color.opacity / 2;
                if (states.contains(MaterialState.pressed)) {
                  color = color.withOpacity(opacity);
                }
                if (states.contains(MaterialState.disabled)) {
                  color = color.withOpacity(opacity);
                }
                return BorderSide(
                  color: color,
                  width: 1,
                );
            }
          }),
          shape: MaterialStateProperty.all(_shape),
        ),
        child: child,
      ),
    );
  }
}
