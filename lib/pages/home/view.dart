part of home_page;

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SR.home.tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("${SR.hello.tr} : ${state.count}", style: TextStyle(fontSize: 50.sp),),
            ElevatedButton(onPressed: () {}, child: Text(SR.login.tr)),
          ],
        ),
      ),
    );
  }
}
