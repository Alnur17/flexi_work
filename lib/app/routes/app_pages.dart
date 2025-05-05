import 'package:get/get.dart';

import '../modules/auth/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/auth/forgot_password/views/forgot_password_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/signup/bindings/signup_binding.dart';
import '../modules/auth/signup/views/signup_view.dart';
import '../modules/user/cart/bindings/cart_binding.dart';
import '../modules/user/cart/views/cart_view.dart';
import '../modules/user/chat/bindings/chat_binding.dart';
import '../modules/user/chat/views/chat_view.dart';
import '../modules/user/home/bindings/home_binding.dart';
import '../modules/user/home/views/home_view.dart';
import '../modules/user/my_search/bindings/my_search_binding.dart';
import '../modules/user/my_search/views/my_search_view.dart';
import '../modules/user/order_details/bindings/order_details_binding.dart';
import '../modules/user/order_details/views/order_details_view.dart';
import '../modules/user/payment/bindings/payment_binding.dart';
import '../modules/user/payment/views/payment_view.dart';
import '../modules/user/product_details/bindings/product_details_binding.dart';
import '../modules/user/product_details/views/product_details_view.dart';
import '../modules/user/profile/bindings/profile_binding.dart';
import '../modules/user/profile/views/profile_view.dart';
import '../modules/user/store_profile/bindings/store_profile_binding.dart';
import '../modules/user/store_profile/views/store_profile_view.dart';
import '../modules/user/tasker_profile/bindings/tasker_profile_binding.dart';
import '../modules/user/tasker_profile/views/tasker_profile_view.dart';
import '../modules/user/user_dashboard/bindings/user_dashboard_binding.dart';
import '../modules/user/user_dashboard/views/user_dashboard_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.USER_DASHBOARD,
      page: () => UserDashboardView(),
      binding: UserDashboardBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => const ProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.STORE_PROFILE,
      page: () => const StoreProfileView(),
      binding: StoreProfileBinding(),
    ),
    GetPage(
      name: _Paths.MY_SEARCH,
      page: () => const MySearchView(),
      binding: MySearchBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.TASKER_PROFILE,
      page: () => const TaskerProfileView(),
      binding: TaskerProfileBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAILS,
      page: () => const OrderDetailsView(),
      binding: OrderDetailsBinding(),
    ),
  ];
}
