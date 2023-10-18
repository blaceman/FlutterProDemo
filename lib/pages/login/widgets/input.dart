part of login_page;

class BuildInput extends StatelessWidget {
  final TextEditingController? controller;
  final Widget label;

  const BuildInput({
    super.key,
    required this.label,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return TextField(
      controller: controller,
      style: TextStyle(fontSize: 16.w, height: 1.3),
      decoration: InputDecoration(
        hintText: SR.input.tr,
        isCollapsed: true,
        isDense: true,
        filled: true,
        contentPadding: EdgeInsets.only(bottom: 14.w),
        prefixIcon: DefaultTextStyle.merge(
          style: TextStyle(fontSize: 16.w, height: 1.3),
          child: Padding(
            padding: EdgeInsets.only(right: 15.w, bottom: 14.w),
            child: label,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: colorScheme.outline,
          ),
          borderRadius: BorderRadius.zero,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: colorScheme.outline,
          ),
          borderRadius: BorderRadius.zero,
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: colorScheme.outline,
          ),
          borderRadius: BorderRadius.zero,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: colorScheme.primary,
          ),
          borderRadius: BorderRadius.zero,
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: colorScheme.outline,
          ),
          borderRadius: BorderRadius.zero,
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: colorScheme.outline,
          ),
          borderRadius: BorderRadius.zero,
        ),
      ),
    );
  }
}
