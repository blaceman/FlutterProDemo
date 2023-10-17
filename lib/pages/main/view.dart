part of main_page;

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) => Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: controller.onPageChanged,
          children: [
            Container(
              color: Colors.orange,
            ),
            Container(
                // color: Colors.blue,
                )
          ],
        ),
        bottomNavigationBar: GetBuilder<MainController>(
          id: 'navigation',
          builder: (controller) => BottomNavigationBar(
            currentIndex: controller.currentPage,
            onTap: controller.pageController.jumpToPage,
            items: [
              BottomNavigationBarItem(
                icon: const BuildNavigationBarIcon(
                  asset: AssetImages.tabBar1,
                ),
                activeIcon: const BuildNavigationBarIcon(
                  asset: AssetImages.tabBar1Active,
                ),
                label: SR.home.tr,
              ),
              BottomNavigationBarItem(
                icon: const BuildNavigationBarIcon(
                  asset: AssetImages.tabBar2,
                ),
                activeIcon: const BuildNavigationBarIcon(
                  asset: AssetImages.tabBar2Active,
                ),
                label: SR.mine.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
