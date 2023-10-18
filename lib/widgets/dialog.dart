part of widgets;

class CustomDialog extends StatelessWidget {
  final Widget child;
  final Widget? title;
  final Widget? cancel;
  final Widget? confirm;
  final void Function()? onCancel;
  final void Function()? onConfirm;

  const CustomDialog({
    Key? key,
    required this.child,
    this.title,
    this.cancel,
    this.confirm,
    this.onCancel,
    this.onConfirm,
  }) : super(key: key);

  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    Widget? title,
    Widget? confirm,
    Widget? cancel,
    void Function()? onConfirm,
    void Function()? onCancel,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => WillPopScope(
        onWillPop: () async => barrierDismissible,
        child: CustomDialog(
          title: title,
          confirm: confirm,
          cancel: cancel,
          onConfirm: onConfirm,
          onCancel: onCancel,
          child: builder(context),
        ),
      ),
    );
  }

  static Future<void> showAccess({
    required BuildContext context,
    required Widget content,
  }) async {
    await show(
      context: context,
      builder: (context) => content,
      cancel: const Text('取消'),
      confirm: const Text('去设置'),
      onCancel: () => Navigator.of(context).pop(),
      onConfirm: () => Access.setting(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonGroup = <Widget>[];
    if (cancel != null) {
      buttonGroup.add(Expanded(
        child: CustomButton(
          type: CustomButtonType.ghost,
          shape: CustomButtonShape.stadium,
          size: CustomButtonSize.small,
          onPressed: onCancel,
          child: cancel!,
        ),
      ));
    }
    if (confirm != null && cancel != null) {
      buttonGroup.add(SizedBox(width: 12.w));
    }
    if (confirm != null) {
      buttonGroup.add(Expanded(
        child: CustomButton(
          shape: CustomButtonShape.stadium,
          size: CustomButtonSize.small,
          onPressed: onConfirm,
          child: confirm!,
        ),
      ));
    }
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.all(AppTheme.margin),
              child: DefaultTextStyle.merge(
                textAlign: TextAlign.center,
                style: DialogTheme.of(context).titleTextStyle,
                child: title!,
              ),
            ),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.all(AppTheme.margin).copyWith(
                top: title != null ? 0 : null,
                bottom: buttonGroup.isNotEmpty ? 0 : null,
              ),
              child: DefaultTextStyle.merge(
                textAlign: TextAlign.left,
                style: DialogTheme.of(context).contentTextStyle,
                child: Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(minHeight: 80.h),
                  child: child,
                ),
              ),
            ),
          ),
          if (buttonGroup.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(AppTheme.margin),
              child: Row(children: buttonGroup),
            ),
        ],
      ),
    );
  }
}
