# flutter基于getx框架搭建。

本文结合项目代码，分三部分，分别为：*项目目录结构*、*getx使用*、其他*第三方框架*，来说明flutter项目框架。



#### 项目目录结构：

![image-20231020145751613](https://p.ipic.vip/itn1zp.png)

+ 用`library`  `part  ` `part of` 来做文件管理。
+ 每个`index.dart`为文件路径引用。
+ 每个`view.dart`都有一个`controller.dart`来做逻辑数据处理。

#### gex使用：

##### 状态管理：

+ `GetxService`:用作管理全局的状态管理，在demo里在`GlobalService`，`HttpService`类中使用，分别用作全局单例用户储存及网络请求。

+ `GetxController`:与`view.dart`的`page`绑定在一起，用作分离逻辑代码及页面代码。在getx中常用有两种。

  + 第一种：使用`bindings`，在路由`GetPage`中绑定，如`MyDownloadControllerBinding`，然后实现`dependencies`方法里初始化`Controller`, 然后用`obx`，`obs`来做响应式绑定。
  + 第二种：在`view.dart`的`page`使用`GetBuilder`来初始化`GetxController`，如`HomeController`,达到到`view.dart `的`page`与 `controller`绑定。然后再`controller`使用`update()`来刷新`Page的GetBuilder`。看业务场景来使用,但`GetBuilder`更为通用。

+ `getView`:`page`可以继承`GetView`并且声明泛型为你绑定的`controller`,这样子就直接使用`controller`。

  

##### 	路由管理：

+ 在`main.dart`初始化路由管理：

  ```dart
     GetMaterialApp(
                    initialRoute: Routers.main,
                    getPages: Routers.getPages)
  ```

  其中`initialRoute`为路由初始界面`getPages`为`List<GetPage>`数组。如：

  ```dart
  
  abstract class Routers {
    static const String login = "/login";
    static const String userInfo = "/user_info";
    
    static final List<GetPage> getPages = [
      GetPage(
        name: login,
        page: () => const LoginPage(),
        binding: LoginControllerBinding(),
      ),
      GetPage(
        name: userInfo,
        page: () => const UserInfoPage(),
        binding: UserInfoControllerBinding(),
        middlewares: [LoginMiddleware()],
      ),
    ];
  }
  
  ```

+ `GetPage`：为getx路由管理页面。

+ `Bindings`:与`GetxController`结合使用，使其绑定到`view.dart`的`page`上。

+ `middlewares`:中间件用作路由拦截。

+ 路由跳转：设置完以上就可以使用Get路由跳转啦。

  ```dart
  Get.toNamed(Routers.login);
  //带参数
  Get.toNamed(Routers.login, arguments: {'name":"aaaa'});
  //也可以直接在路由别名后面跟参数，类似于 Url 给后端路由。
  Get.toNamed('/NextScreen?name=aaaa');
  
  //返回
  Get.back();
  //offAllName: 进入下一个界面并取消之前的所有路由
  Get.offAllName(Routers.login);
  //offName：进入下一个界面，且导航没有返回
  Get.offName(Routers.login);
  //返回根页面
  Get.until((route) => route.isFirst);
  ```

##### getx其他用法：

+ 多语言配置：在`GetMaterialApp`初始化配置`LanguageRes`，在项目的`string_res文件夹下`有`LanguageRes`相关配置。

  ```dart
  GetMaterialApp(
                    translations: LanguageRes(),
                    locale: const Locale('zh', 'CN'),
                    fallbackLocale: const Locale('en', 'US'),
                    )
  ```

  然后在需要的时候调用：

  ```dart
    void changeLanguage() {
      if (Get.locale == const Locale('zh', 'CN')) {
        Get.updateLocale(const Locale('en', 'US'));
      } else {
        Get.updateLocale(const Locale('zh', 'CN'));
      }
    }
  ```

  

+ 主题切换：在`GetMaterialApp`初始化配置`theme`，在项目的`theme.dart下的AppTheme`有`AppTheme.dark与AppTheme.dark`相关配置。

  ```dart
  GetMaterialApp(
                    theme: AppTheme.light,
                    darkTheme: AppTheme.dark,
                    themeMode: AppTheme.mode,
                    )
  ```

  然后在需要的时候调用：

  ```dart
  Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  ```

+ 其他：

  ```dart
  //snackbar
  Get.snackbar("title", "message");
  //dialog
  Get.defaultDialog(
  	title: "title",
  	middleText: "this is dialog message",
  	titleStyle: const TextStyle(color: Colors.blueGrey),
  	middleTextStyle:const TextStyle(color: Colors.blueGrey),
  );
  //
  Get.bottomSheet(Container(
    height: 200,
    color: Colors.blueGrey,
    child: const Center(
      child: Text("bottomSheet"),
    ),
  ));
  ```

  

  

#### 其他第三方框架

+ `flutter_screenutil`:用来适配屏幕尺寸。

  ```dart
  ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
      	...
      )
  ```

  在`mart.dart`初始化后使用：

  ```dart
      //根据屏幕宽度适配尺寸：540.w  
      //根据屏幕高度适配尺寸(一般根据宽度适配即可)： 200.h  
     	//根据宽度或高度中的较小者进行调整： 200.r   
      //适配字体：24.sp 
     	//取12和12.sp中的最小值：12.sm 
  		//...
  ```

  

+ `freezed_annotation`:freezed代码生成器执行，在项目`lib/freezed_models/content/content.dart`有用法说明。
+ `permission_handler`:动态权限获取
+ `image_picker`：相册访问
+ `logger`:打印log
+ `dio`:\#网络请求框架等等
+ 项目还有其他的公共组件在`lib/utils`与`lib/widgets`可以看一下。
