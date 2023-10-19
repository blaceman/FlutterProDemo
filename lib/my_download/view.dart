part of download_page;

class MyDownLoadPage extends GetView<MyDownloadController> {
  const MyDownLoadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的下载'),
      ),
      body: CustomPullScrollView(
          controller: controller.refreshController,
          onRefresh: controller.onRefresh,
          onLoading: controller.onLoading,
          builder: (context, physics) => CustomScrollView(
                physics: physics,
                slivers: [
                  Obx(
                    () => controller.isEmpty
                        ? SliverToBoxAdapter(
                            child: Container(
                              alignment: Alignment.center,
                              height: 200.w,
                              child: const CustomEmptyData(),
                            ),
                          )
                        : SliverList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                              final item = controller.downloadList[index];
                              return CustomListTileDownload(
                                showDivider: index != 0,
                                title: item.name ?? '-',
                                cover: item.cover ?? '',
                                tag: item.category ?? '',
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppTheme.margin,
                                  vertical: 14.w,
                                ),
                                onTap: () {},
                              );
                            }, childCount: controller.downloadList.length),
                          ),
                  )
                ],
              )),
    );
  }
}
