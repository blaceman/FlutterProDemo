part of main_page;

class BuildNavigationBarIcon extends StatelessWidget {
  final String asset;
  const BuildNavigationBarIcon({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    final bottomNavigationBarTheme = BottomNavigationBarTheme.of(context);
    return Image.asset(
      asset,
      width: bottomNavigationBarTheme.unselectedIconTheme?.size,
      height: bottomNavigationBarTheme.unselectedIconTheme?.size,
      fit: BoxFit.contain,
    );
  }
}
