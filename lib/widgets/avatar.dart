part of widgets;

class CustomAvatar extends StatelessWidget {
  final String url;
  final double? size;
  final double? border;
  final CustomImageType type;

  const CustomAvatar({
    Key? key,
    required this.url,
    this.size,
    this.border,
    this.type = CustomImageType.network,
  }) : super(key: key);

  double get _size => size ?? 50.w;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      clipBehavior: Clip.hardEdge,
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.surface,
        shape: CircleBorder(
          side: border != null
              ? BorderSide(
                  width: border!,
                  color: Theme.of(context).colorScheme.surface,
                )
              : BorderSide.none,
        ),
      ),
      child: CustomImage(
        type: type,
        url: url,
        fit: BoxFit.cover,
        radius: _size / 2,
        backgroundColor: Theme.of(context).colorScheme.surface,
        placeholder: Image.asset(
          'assets/images/avatar.png',
          fit: BoxFit.cover,
        ),
        error: Image.asset(
          'assets/images/avatar.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
