import 'package:get/get.dart';

import '../modules/auth/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/auth/forgot_password/views/forgot_password_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/signup/bindings/signup_binding.dart';
import '../modules/auth/signup/views/signup_view.dart';
import '../modules/service_provider/service_provider_chats/bindings/service_provider_chats_binding.dart';
import '../modules/service_provider/service_provider_chats/views/service_provider_chats_view.dart';
import '../modules/service_provider/service_provider_dashboard/bindings/service_provider_dashboard_binding.dart';
import '../modules/service_provider/service_provider_dashboard/views/service_provider_dashboard_view.dart';
import '../modules/service_provider/service_provider_earnings/bindings/service_provider_earnings_binding.dart';
import '../modules/service_provider/service_provider_earnings/views/service_provider_earnings_view.dart';
import '../modules/service_provider/service_provider_home/bindings/service_provider_home_binding.dart';
import '../modules/service_provider/service_provider_home/views/service_provider_home_view.dart';
import '../modules/service_provider/service_provider_map/bindings/service_provider_map_binding.dart';
import '../modules/service_provider/service_provider_map/views/service_provider_map_view.dart';
import '../modules/service_provider/service_provider_profile/bindings/service_provider_profile_binding.dart';
import '../modules/service_provider/service_provider_profile/views/service_provider_profile_view.dart';
import '../modules/service_provider/service_provider_task_manager/bindings/service_provider_task_manager_binding.dart';
import '../modules/service_provider/service_provider_task_manager/views/service_provider_task_manager_view.dart';
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
import '../modules/vendor/vendor_chat/bindings/vendor_chat_binding.dart';
import '../modules/vendor/vendor_chat/views/vendor_chat_view.dart';
import '../modules/vendor/vendor_dashboard/bindings/vendor_dashboard_binding.dart';
import '../modules/vendor/vendor_dashboard/views/vendor_dashboard_view.dart';
import '../modules/vendor/vendor_earnings/bindings/vendor_earnings_binding.dart';
import '../modules/vendor/vendor_earnings/views/vendor_earnings_view.dart';
import '../modules/vendor/vendor_home/bindings/vendor_home_binding.dart';
import '../modules/vendor/vendor_home/views/vendor_home_view.dart';
import '../modules/vendor/vendor_orders/bindings/vendor_orders_binding.dart';
import '../modules/vendor/vendor_orders/views/vendor_orders_view.dart';
import '../modules/vendor/vendor_products/bindings/vendor_products_binding.dart';
import '../modules/vendor/vendor_products/views/vendor_products_view.dart';
import '../modules/vendor/vendor_profile/bindings/vendor_profile_binding.dart';
import '../modules/vendor/vendor_profile/views/vendor_profile_view.dart';

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
    GetPage(
      name: _Paths.VENDOR_DASHBOARD,
      page: () => VendorDashboardView(),
      binding: VendorDashboardBinding(),
    ),
    GetPage(
      name: _Paths.VENDOR_HOME,
      page: () => const VendorHomeView(),
      binding: VendorHomeBinding(),
    ),
    GetPage(
      name: _Paths.SERVICE_PROVIDER_HOME,
      page: () => const ServiceProviderHomeView(),
      binding: ServiceProviderHomeBinding(),
    ),
    GetPage(
      name: _Paths.SERVICE_PROVIDER_DASHBOARD,
      page: () => ServiceProviderDashboardView(),
      binding: ServiceProviderDashboardBinding(),
    ),
    GetPage(
      name: _Paths.VENDOR_PRODUCTS,
      page: () => const VendorProductsView(),
      binding: VendorProductsBinding(),
    ),
    GetPage(
      name: _Paths.VENDOR_EARNINGS,
      page: () => const VendorEarningsView(),
      binding: VendorEarningsBinding(),
    ),
    GetPage(
      name: _Paths.VENDOR_ORDERS,
      page: () => const VendorOrdersView(),
      binding: VendorOrdersBinding(),
    ),
    GetPage(
      name: _Paths.VENDOR_PROFILE,
      page: () => const VendorProfileView(),
      binding: VendorProfileBinding(),
    ),
    GetPage(
      name: _Paths.VENDOR_CHAT,
      page: () => const VendorChatView(),
      binding: VendorChatBinding(),
    ),
    GetPage(
      name: _Paths.SERVICE_PROVIDER_PROFILE,
      page: () => const ServiceProviderProfileView(),
      binding: ServiceProviderProfileBinding(),
    ),
    GetPage(
      name: _Paths.SERVICE_PROVIDER_TASK_MANAGER,
      page: () => const ServiceProviderTaskManagerView(),
      binding: ServiceProviderTaskManagerBinding(),
    ),
    GetPage(
      name: _Paths.SERVICE_PROVIDER_EARNINGS,
      page: () => const ServiceProviderEarningsView(),
      binding: ServiceProviderEarningsBinding(),
    ),
    GetPage(
      name: _Paths.SERVICE_PROVIDER_CHATS,
      page: () => const ServiceProviderChatsView(),
      binding: ServiceProviderChatsBinding(),
    ),
    GetPage(
      name: _Paths.SERVICE_PROVIDER_MAP,
      page: () => const ServiceProviderMapView(),
      binding: ServiceProviderMapBinding(),
    ),
  ];
}
