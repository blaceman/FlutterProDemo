part of download_page;

class MyDownloadControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyDownloadController());
  }
}

class MyDownloadController extends GetxController {
  final EasyRefreshController refreshController = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  RxList downloadList = [].obs;
  bool get isEmpty => downloadList.isEmpty;

  String keyword = '';

  final int _limit = 20;
  int _page = 1;
  bool _noMore = false;

  @override
  void onClose() {
    refreshController.dispose();
    Freezed.fromJson({});
    // freezedToJson();
    super.onClose();
  }

  Future<void> _getDownloadList([bool isRefresh = false]) async {
    if (isRefresh) _page = 1;
    // final result = await CourseAPI.myDownloadCourse(
    //   keyword: keyword,
    //   categoryID: 0,
    //   page: _page,
    //   limit: _limit,
    // );
    // if (isRefresh) downloadList.clear();
    // downloadList.addAll(result);
    // _page++;
    // _noMore = result.length < _limit;
    // update();
    Future.delayed(const Duration(seconds: 2), () {
      // 模仿网络请求在2秒后执行的代码
      List<DownloadModel> result = [
        DownloadModel(name: '红楼梦', category: '文学'),
        DownloadModel(name: '西游记', category: '文学')
      ];
      if (isRefresh) downloadList.clear();
      downloadList.addAll(result);
      _page++;
      _noMore = result.length < _limit;
      update();
    });
  }

  void onRefresh() async {
    try {
      await _getDownloadList(true);
      refreshController.finishRefresh(IndicatorResult.success);
      refreshController.resetFooter();
    } catch (error) {
      refreshController.finishRefresh(IndicatorResult.fail);
    }
  }

  void onLoading() async {
    if (_noMore) {
      refreshController.finishLoad(IndicatorResult.noMore);
      return;
    }
    try {
      await _getDownloadList();
      refreshController.finishLoad();
    } catch (error) {
      refreshController.finishLoad(IndicatorResult.fail);
    }
  }
}
