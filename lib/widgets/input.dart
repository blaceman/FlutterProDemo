part of widgets;

class CustomInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? helper;
  final String? hintText;
  final String? error;
  final Color? backgroundColor;
  final bool required;
  final bool readOnly;
  final bool obscureText;
  final IconData? iconData;
  final int? minLines;
  final int? maxLines;
  final void Function()? onTap;
  final void Function()? onIcon;
  final ValueChanged<String>? onChanged;
  final InputDecoration decoration;
  final TextInputType? keyboardType;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;

  const CustomInput({
    Key? key,
    this.controller,
    this.label,
    this.helper,
    this.hintText,
    this.error,
    this.required = false,
    this.readOnly = false,
    this.obscureText = false,
    this.onTap,
    this.onIcon,
    this.iconData,
    this.onChanged,
    this.decoration = const InputDecoration(),
    this.minLines,
    this.maxLines = 1,
    this.keyboardType,
    this.autofocus = false,
    this.inputFormatters,
    this.backgroundColor,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final decorationTheme = theme.inputDecorationTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null || required)
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: (decorationTheme.contentPadding?.horizontal ?? 0) / 2,
              vertical: 10.w,
            ).copyWith(top: 0),
            child: RichText(
              text: TextSpan(
                text: label,
                style: decorationTheme.labelStyle,
                children: [
                  if (required)
                    TextSpan(
                      text: label != null ? ' *' : '*',
                      style: const TextStyle(color: AppTheme.error),
                    ),
                ],
              ),
            ),
          ),
        TextField(
          autofocus: autofocus,
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          obscureText: obscureText,
          onChanged: onChanged,
          minLines: minLines,
          maxLines: maxLines,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          style: TextStyle(
            fontSize: 16.w,
            height: 1.3,
          ),
          decoration: decoration.copyWith(
            hintText: hintText,
            hintStyle: const TextStyle(fontWeight: FontWeight.normal),
            fillColor: backgroundColor,
            suffixIconConstraints: const BoxConstraints(),
            suffixIcon: _suffixIcon(decorationTheme),
          ),
        ),
        if (helper != null)
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: (decorationTheme.contentPadding?.horizontal ?? 0) / 2,
              vertical: 10.w,
            ).copyWith(bottom: 0),
            child: Text(
              helper!,
              style: decorationTheme.helperStyle,
            ),
          )
      ],
    );
  }

  Widget? _suffixIcon(InputDecorationTheme decorationTheme) {
    if (iconData == null) return null;
    return Padding(
      padding: EdgeInsetsDirectional.only(
        end: (decorationTheme.contentPadding?.horizontal ?? 0) / 2,
      ),
      child: GestureDetector(
        onTap: onIcon,
        child: Icon(iconData!, size: 24.w),
      ),
    );
  }
}

class CustomInputSearch extends StatelessWidget {
  final IconData iconData;
  final String? hintText;
  final TextEditingController? controller;
  final Color? backgroundColor;
  final bool readOnly;
  final void Function()? onTap;

  const CustomInputSearch({
    Key? key,
    this.iconData = AssetIcons.search,
    this.hintText,
    this.controller,
    this.backgroundColor,
    this.readOnly = false,
    this.onTap,
  }) : super(key: key);

  EdgeInsetsGeometry get _padding {
    return EdgeInsets.symmetric(
      vertical: 8.w,
      horizontal: 20.w,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      controller: controller,
      onTap: onTap,
      style: TextStyle(
        fontSize: 15.w,
        height: 1.2,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      decoration: InputDecoration(
        fillColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
        contentPadding: _padding.subtract(EdgeInsets.symmetric(
          horizontal: _padding.horizontal / 4,
        )),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _padding.horizontal / 4,
          ),
          child: Icon(
            iconData,
            size: 24.w,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
          ),
        ),
        prefixIconConstraints: const BoxConstraints(),
        hintText: hintText ?? '输入关键词搜索',
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50.w)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50.w)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50.w)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50.w)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50.w)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50.w)),
        ),
      ),
    );
  }
}
