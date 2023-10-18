part of widgets;

class CustomBottomSheet extends StatelessWidget {
  final Widget child;
  final Widget? title;
  final Widget? cancel;
  final Widget? confirm;
  final void Function()? onCancel;
  final void Function()? onConfirm;
  final EdgeInsets? minimum;
  final bool isScrollable;
  final bool showHeader;

  const CustomBottomSheet({
    Key? key,
    required this.child,
    this.title,
    this.cancel,
    this.confirm,
    this.onCancel,
    this.onConfirm,
    this.minimum,
    this.isScrollable = true,
    this.showHeader = true,
  }) : super(key: key);

  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    Widget? title,
    Widget? confirm,
    Widget? cancel,
    Widget? extra,
    void Function()? onConfirm,
    void Function()? onCancel,
    EdgeInsets? minimum,
    bool isScrollable = true,
    bool enableDrag = true,
    bool showHeader = true,
  }) {
    return showCustomModalBottomSheet<T>(
      context: context,
      enableDrag: enableDrag,
      containerWidget: (context, animation, child) {
        Widget bottomSheet = CustomBottomSheet(
          title: title,
          confirm: confirm,
          cancel: cancel,
          onConfirm: onConfirm,
          onCancel: onCancel,
          minimum: minimum,
          isScrollable: isScrollable,
          showHeader: showHeader,
          child: child,
        );
        if (extra != null) {
          bottomSheet = Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: FadeTransition(
                  opacity: animation,
                  child: extra,
                ),
              ),
              bottomSheet,
            ],
          );
        }
        return bottomSheet;
      },
      builder: builder,
    );
  }

  static Future<String?> showReply({
    required BuildContext context,
    Widget? title,
    Widget? confirm,
    TextEditingController? controller,
  }) async {
    String text = '';
    return show<String>(
      context: context,
      title: title,
      confirm: confirm ?? const Text('发表'),
      isScrollable: false,
      onConfirm: () => Navigator.of(context).pop(text.trim()),
      onCancel: Navigator.of(context).pop,
      builder: (BuildContext context) => CustomInput(
        maxLines: 5,
        controller: controller,
        backgroundColor: Theme.of(context).colorScheme.outline.withOpacity(0.4),
        hintText: '请输入内容',
        autofocus: true,
        onChanged: (value) => text = value,
      ),
    );
  }

  static void showMenu({
    required BuildContext context,
    Widget? title,
    List<CustomBottomSheetMenuItem> children = const [],
  }) {
    show(
      context: context,
      title: title,
      minimum: const EdgeInsets.all(0),
      isScrollable: false,
      showHeader: false,
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            ...children,
            CustomBottomSheetMenuItem(
              title: const Text('取消'),
              showDivider: false,
              style: const TextStyle(fontWeight: FontWeight.normal),
              onTap: Navigator.of(context).pop,
            ),
          ],
        );
      },
      onCancel: Navigator.of(context).pop,
    );
  }

  static Future<int?> showNumber({
    required BuildContext context,
    int min = 0,
    int max = 100,
    int? value,
    Widget? title,
  }) async {
    final adapter = NumberPickerAdapter(
      data: [
        NumberPickerColumn(
          begin: min,
          end: max,
          initValue: value ?? min,
        ),
      ],
    );
    return show<int>(
      context: context,
      title: title,
      minimum: const EdgeInsets.all(0),
      isScrollable: false,
      enableDrag: false,
      builder: (context) => _BottomSheetWithPicker(
        adapter: adapter,
      ),
      onCancel: Navigator.of(context).pop,
      onConfirm: () {
        Navigator.of(context).pop(adapter.getSelectedValues().first);
      },
    );
  }

  static Future<T?> showPicker<T>({
    required BuildContext context,
    List<T> items = const [],
    T? value,
    Widget? title,
    required Widget Function(T value) builder,
  }) async {
    final textStyle = TextStyle(
      fontSize: 16.w,
      height: 1.2,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
    final adapter = PickerDataAdapter<T>(
      data: List.generate(items.length, (index) {
        return PickerItem(
          value: items[index],
          text: DefaultTextStyle.merge(
            style: textStyle,
            child: Center(child: builder(items[index])),
          ),
        );
      }),
    );
    final index = items.indexWhere(
      (element) => element.hashCode == value?.hashCode,
    );
    return show<T>(
      context: context,
      title: title,
      minimum: const EdgeInsets.all(0),
      isScrollable: false,
      enableDrag: false,
      builder: (context) => _BottomSheetWithPicker(
        adapter: adapter,
        values: index >= 0 ? [index] : null,
      ),
      onCancel: Navigator.of(context).pop,
      onConfirm: () {
        Navigator.of(context).pop(adapter.getSelectedValues().first);
      },
    );
  }

  static Future<List<AreaModel>?> showArea({
    required BuildContext context,
    List<AreaModel> items = const [],
  }) async {
    final textStyle = TextStyle(
      fontSize: 15.w,
      height: 1.2,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
    final data = <PickerItem<AreaModel>>[];
    for (var province in items) {
      final cityList = <PickerItem<AreaModel>>[];
      if ((province.children ?? []).isNotEmpty) {
        for (var city in province.children!) {
          final areaList = <PickerItem<AreaModel>>[];
          if ((city.children ?? []).isNotEmpty) {
            for (var area in city.children!) {
              areaList.add(PickerItem(
                value: area,
                text: DefaultTextStyle.merge(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle,
                  child: Center(child: Text(area.label ?? '-')),
                ),
              ));
            }
          }
          cityList.add(PickerItem(
            value: city,
            text: DefaultTextStyle.merge(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textStyle,
              child: Center(child: Text(city.label ?? '-')),
            ),
            children: areaList,
          ));
        }
      }
      data.add(PickerItem(
        value: province,
        text: DefaultTextStyle.merge(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textStyle,
          child: Center(child: Text(province.label ?? '-')),
        ),
        children: cityList,
      ));
    }
    final adapter = PickerDataAdapter<AreaModel>(data: data);
    return show<List<AreaModel>>(
      context: context,
      title: const Text('选择所在地'),
      minimum: const EdgeInsets.all(0),
      enableDrag: false,
      builder: (context) => _BottomSheetWithPicker(adapter: adapter),
      onCancel: () {
        // context.pop();
      },
      onConfirm: () {
        Navigator.of(context).pop(adapter.getSelectedValues());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyChild = SafeArea(
      top: false,
      minimum:
          (minimum ?? const EdgeInsets.all(AppTheme.margin)).copyWith(top: 0),
      child: child,
    );
    if (isScrollable) {
      bodyChild = SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        controller: ModalScrollController.of(context),
        child: bodyChild,
      );
    }
    return SafeArea(
      bottom: false,
      minimum: const EdgeInsets.only(top: AppTheme.margin),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: Theme.of(context).bottomSheetTheme.backgroundColor,
        shape: Theme.of(context).bottomSheetTheme.shape,
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (showHeader)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      padding: const EdgeInsets.all(AppTheme.margin),
                      type: CustomButtonType.borderless,
                      size: CustomButtonSize.small,
                      foregroundColor: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.7),
                      onPressed: onCancel,
                      child: cancel ?? const Text('取消'),
                    ),
                    if (title != null)
                      DefaultTextStyle.merge(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.w,
                          fontWeight: FontWeight.w600,
                        ),
                        child: title!,
                      ),
                    CustomButton(
                      padding: const EdgeInsets.all(AppTheme.margin),
                      type: CustomButtonType.borderless,
                      size: CustomButtonSize.small,
                      onPressed: onConfirm,
                      child: confirm ?? const Text('确定'),
                    ),
                  ],
                ),
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: bodyChild,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomSheetWithPicker extends StatelessWidget {
  final PickerAdapter adapter;
  // final List<PickerDelimiter>? delimiters;
  final List<int>? values;

  const _BottomSheetWithPicker({
    Key? key,
    required this.adapter,
    // this.delimiters,
    this.values,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16.w,
      height: 1.2,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
    return DefaultTextStyle.merge(
      style: textStyle,
      child: Picker(
        adapter: adapter,
        selecteds: values,
        itemExtent: 40.w,
        height: 200.w,
        backgroundColor: Colors.transparent,
        containerColor: Colors.transparent,
        hideHeader: true,
        textStyle: textStyle,
        // delimiter: delimiters,
      ).makePicker(),
    );
  }
}

class CustomBottomSheetMenuItem extends StatelessWidget {
  final Widget title;
  final bool showDivider;
  final TextStyle? style;
  final void Function()? onTap;

  const CustomBottomSheetMenuItem({
    Key? key,
    required this.title,
    this.onTap,
    this.style,
    this.showDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50.w,
        decoration: BoxDecoration(
          border: showDivider
              ? Border(
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                    width: 1,
                  ),
                )
              : null,
        ),
        child: DefaultTextStyle.merge(
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.w,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ).merge(style),
          child: title,
        ),
      ),
    );
  }
}

class CustomBottomSheetShareItem {
  final String title;
  final String asset;
  final void Function()? onTap;

  const CustomBottomSheetShareItem({
    required this.title,
    required this.asset,
    this.onTap,
  });
}
