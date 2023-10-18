part of widgets;

class CustomEmptyData extends StatelessWidget {
  final Widget? text;

  const CustomEmptyData({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Icon(
            Icons.hourglass_empty_rounded,
            size: 40.w,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
        ),
        SizedBox(height: 10.w),
        DefaultTextStyle.merge(
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.w,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          child: text ?? const Text('暂无数据'),
        ),
      ],
    );
  }
}
