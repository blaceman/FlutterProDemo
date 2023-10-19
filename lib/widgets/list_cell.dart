part of widgets;

class CustomListTileDownload extends StatelessWidget {
  final String title;
  final String cover;
  final String tag;
  final bool showDivider;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;

  const CustomListTileDownload({
    super.key,
    required this.title,
    required this.cover,
    required this.tag,
    this.showDivider = true,
    this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: showDivider
              ? Border(
                  top: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                    width: 0.5,
                  ),
                )
              : null,
        ),
        child: Row(
          children: [
            CustomImage.network(
              url: cover,
              width: 125.w,
              height: 70.w,
              backgroundColor: Theme.of(context).colorScheme.background,
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.w,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (tag.isNotEmpty) SizedBox(height: 8.w),
                  if (tag.isNotEmpty)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomTag(child: Text(tag)),
                    ),
                  SizedBox(height: 8.w),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomButton(
                      type: CustomButtonType.borderless,
                      padding: const EdgeInsets.all(0),
                      fontSize: 14.w,
                      onPressed: onTap,
                      child: const Text('下载详情'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
