part of widgets;

class CustomBottomAppBar extends StatelessWidget {
  final Widget child;

  const CustomBottomAppBar({
    Key? key,
    required this.child,
  }) : super(key: key);

  factory CustomBottomAppBar.operate({
    Widget? text,
    List<OperateButton> actions,
    void Function()? onPressed,
  }) = _BottomAppBarWithOperate;

  EdgeInsets get _padding {
    return EdgeInsets.symmetric(
      horizontal: AppTheme.margin,
      vertical: 10.w,
    ).copyWith(bottom: Screen.bottomBar > 0 ? 0 : null);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: _padding.add(EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        )),
        child: child,
      ),
    );
  }
}

class _BottomAppBarWithOperate extends CustomBottomAppBar {
  final Widget? text;
  final List<OperateButton> actions;
  final void Function()? onPressed;

  _BottomAppBarWithOperate({
    Key? key,
    this.text,
    this.onPressed,
    this.actions = const [],
  }) : super(
          key: key,
          child: _BottomAppBarWithOperateChild(
            text: text,
            actions: actions,
            onPressed: onPressed,
          ),
        );
}

class _BottomAppBarWithOperateChild extends StatelessWidget {
  final Widget? text;
  final List<OperateButton> actions;
  final void Function()? onPressed;

  const _BottomAppBarWithOperateChild({
    Key? key,
    this.text,
    this.actions = const [],
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...actions.map((item) {
          return CustomButton(
            type: CustomButtonType.borderless,
            fontSize: 13.w,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            onPressed: item.onPressed,
            foregroundColor: Theme.of(context).colorScheme.onSurface,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconTheme(
                  data: IconThemeData(
                    color: Theme.of(context).colorScheme.onSurface,
                    size: 20.w,
                  ),
                  child: item.icon,
                ),
                SizedBox(height: 3.w),
                DefaultTextStyle.merge(
                  child: item.text,
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
              ],
            ),
          );
        }).toList(),
        if (actions.isNotEmpty && text != null) SizedBox(width: 15.w),
        if (text != null)
        Expanded(
          child: CustomButton(
            shape: CustomButtonShape.stadium,
            onPressed: onPressed,
            child: text!,
          ),
        ),
      ],
    );
  }
}

class OperateButton {
  final Widget text;
  final Widget icon;
  final void Function()? onPressed;

  const OperateButton({
    required this.text,
    required this.icon,
    this.onPressed,
  });
}
