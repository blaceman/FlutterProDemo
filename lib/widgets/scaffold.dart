part of widgets;

class CustomScaffold extends StatelessWidget {
  final String? background;
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;

  const CustomScaffold({
    super.key,
    this.background,
    this.body,
    this.appBar,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: Colors.transparent,
          titleTextStyle: AppBarTheme.of(context).titleTextStyle?.copyWith(
                color: Colors.white,
              ),
          iconTheme: AppBarTheme.of(context).iconTheme?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: appBar,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0, 1],
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.background,
                    ],
                  ),
                ),
                child: SafeArea(
                  bottom: false,
                  left: false,
                  right: false,
                  child: SizedBox(height: 100.w),
                ),
              ),
            ),
            if (body != null)
              SafeArea(
                bottom: false,
                left: false,
                right: false,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: body!,
                ),
              ),
          ],
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
