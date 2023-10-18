part of widgets;

class CustomCellGroup extends StatelessWidget {
  final List<Widget> children;
  final double? minHeight;
  final bool showDivider;
  final bool isInset;

  const CustomCellGroup({
    Key? key,
    this.children = const [],
    this.minHeight,
    this.showDivider = true,
    this.isInset = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final ws = <Widget>[];
    for (var index = 0; index < children.length; index++) {
      if (index != 0 && showDivider) ws.add(const Divider(height: 0.5));
      ws.add(ConstrainedBox(
        constraints: BoxConstraints(minHeight: minHeight ?? 55.w),
        child: children[index],
      ));
    }
    Widget child = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: ws,
    );
    if (isInset) {
      child = DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow,
              blurRadius: 5,
            ),
          ],
        ),
        child: child,
      );
    } else {
      child = ColoredBox(
        color:  colorScheme.surface,
        child: child,
      );
    }
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      removeLeft: isInset,
      removeRight: isInset,
      child: child,
    );
  }
}

class CustomCell extends StatelessWidget {
  final Widget title;
  final Widget? icon;
  final Widget? value;
  final Widget? label;
  final bool? showArrow;
  final double? valueWidth;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final TextStyle? labelStyle;
  final EdgeInsets? padding;
  final void Function()? onTap;

  const CustomCell({
    Key? key,
    required this.title,
    this.icon,
    this.value,
    this.showArrow,
    this.valueWidth,
    this.onTap,
    this.titleStyle,
    this.valueStyle,
    this.labelStyle,
    this.padding,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final ws = <Widget>[];
    if (icon != null) {
      ws.add(Container(
        width: 26.w,
        height: 26.w,
        padding: EdgeInsets.all(4.w),
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: colorScheme.primary.withOpacity(0.1),
          shape: const CircleBorder(),
        ),
        child: IconTheme(
          data: IconThemeData(
            color: colorScheme.primary,
            size: 18.w,
          ),
          child: icon!,
        ),
      ));
      ws.add(SizedBox(width: 13.w));
    }
    ws.add(Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DefaultTextStyle.merge(
            style: TextStyle(
              fontSize: 16.w,
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w400,
            ).merge(titleStyle),
            child: title,
          ),
          if (label != null)
            DefaultTextStyle.merge(
              style: TextStyle(
                fontSize: 13.w,
                color: colorScheme.onSurface.withOpacity(0.5),
              ).merge(labelStyle),
              child: label!,
            ),
        ],
      ),
    ));
    if (value != null) {
      ws.add(SizedBox(width: 10.w));
      ws.add(Container(
        constraints: BoxConstraints(maxWidth: valueWidth ?? double.infinity),
        alignment: Alignment.centerRight,
        child: DefaultTextStyle.merge(
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 16.w,
            color: colorScheme.onSurface.withOpacity(0.7),
          ).merge(valueStyle),
          child: value!,
        ),
      ));
    }
    if (onTap != null && showArrow != false) {
      ws.add(SizedBox(width: 5.w));
      ws.add(Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16.w,
        color: colorScheme.onSurface.withOpacity(0.5),
      ));
    }
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: SafeArea(
        top: false,
        bottom: false,
        minimum: padding ??
            EdgeInsets.symmetric(
              vertical: 10.w,
              horizontal: AppTheme.margin,
            ),
        child: Row(children: ws),
      ),
    );
  }
}
