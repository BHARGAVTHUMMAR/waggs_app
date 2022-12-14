import 'package:get/get.dart';

import '../modules/Add_To_Cart_Shipping_View/bindings/add_to_cart_shipping_view_binding.dart';
import '../modules/Add_To_Cart_Shipping_View/views/add_to_cart_shipping_view_view.dart';
import '../modules/My_Account_Change_Password/bindings/my_account_change_password_binding.dart';
import '../modules/My_Account_Change_Password/views/my_account_change_password_view.dart';
import '../modules/My_Account_new_changed_And_Old_Password_Change/bindings/my_account_new_changed_and_old_password_change_binding.dart';
import '../modules/My_Account_new_changed_And_Old_Password_Change/views/my_account_new_changed_and_old_password_change_view.dart';
import '../modules/OTP_screen/bindings/o_t_p_screen_binding.dart';
import '../modules/OTP_screen/views/o_t_p_screen_view.dart';
import '../modules/Pet_view_details/bindings/pet_view_details_binding.dart';
import '../modules/Pet_view_details/views/pet_view_details_view.dart';
import '../modules/Top_selling_Store_all_Products/bindings/top_selling_store_all_products_binding.dart';
import '../modules/Top_selling_Store_all_Products/views/top_selling_store_all_products_view.dart';
import '../modules/Vet_view_details/bindings/vet_view_details_binding.dart';
import '../modules/Vet_view_details/views/vet_view_details_view.dart';
import '../modules/View_All_My_Cart/bindings/view_all_my_cart_binding.dart';
import '../modules/View_All_My_Cart/views/view_all_my_cart_view.dart';
import '../modules/add_pet/bindings/add_pet_binding.dart';
import '../modules/add_pet/views/add_pet_view.dart';
import '../modules/book_appoiment/bindings/book_appoiment_binding.dart';
import '../modules/book_appoiment/views/book_appoiment_view.dart';
import '../modules/cart_drawer/bindings/cart_drawer_binding.dart';
import '../modules/cart_drawer/views/cart_drawer_view.dart';
import '../modules/date_time_appoiment/bindings/date_time_appoiment_binding.dart';
import '../modules/date_time_appoiment/views/date_time_appoiment_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_screen/bindings/login_screen_binding.dart';
import '../modules/login_screen/views/login_screen_view.dart';
import '../modules/mobileVerify/bindings/mobile_verify_binding.dart';
import '../modules/mobileVerify/views/mobile_verify_view.dart';
import '../modules/my_account/bindings/my_account_binding.dart';
import '../modules/my_account/views/my_account_view.dart';
import '../modules/my_pet/bindings/my_pet_binding.dart';
import '../modules/my_pet/views/my_pet_view.dart';
import '../modules/notification_page/bindings/notification_page_binding.dart';
import '../modules/notification_page/views/notification_page_view.dart';
import '../modules/order_detail/bindings/order_detail_binding.dart';
import '../modules/order_detail/views/order_detail_view.dart';
import '../modules/order_page/bindings/order_page_binding.dart';
import '../modules/order_page/views/order_page_view.dart';
import '../modules/otpVerify/bindings/otp_verify_binding.dart';
import '../modules/otpVerify/views/otp_verify_view.dart';
import '../modules/plane/bindings/plane_binding.dart';
import '../modules/plane/views/plane_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/product_list_screen/bindings/product_list_screen_binding.dart';
import '../modules/product_list_screen/views/product_list_screen_view.dart';
import '../modules/search_product_page/bindings/search_product_page_binding.dart';
import '../modules/search_product_page/views/search_product_page_view.dart';
import '../modules/singup_screen/bindings/singup_screen_binding.dart';
import '../modules/singup_screen/views/singup_screen_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/view-product/bindings/view_product_binding.dart';
import '../modules/view-product/views/view_product_view.dart';
import '../modules/view_cart/bindings/view_cart_binding.dart';
import '../modules/view_cart/views/view_cart_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.SINGUP_SCREEN,
      page: () => const SingupScreenView(),
      binding: SingupScreenBinding(),
    ),
    GetPage(
      name: _Paths.O_T_P_SCREEN,
      page: () => OTPScreenView(),
      binding: OTPScreenBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_PRODUCT,
      page: () => ViewProductView(),
      binding: ViewProductBinding(),
    ),
    // GetPage(
    //   name: _Paths.CATAGORY_PAGE,
    //   page: () => CatagoryPageView(),
    //   binding: CatagoryPageBinding(),
    // ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => const ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.TOP_SELLING_STORE_ALL_PRODUCTS,
      page: () => TopSellingStoreAllProductsView(),
      binding: TopSellingStoreAllProductsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_LIST_SCREEN,
      page: () => const ProductListScreenView(),
      binding: ProductListScreenBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_ALL_MY_CART,
      page: () => const ViewAllMyCartView(),
      binding: ViewAllMyCartBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TO_CART_SHIPPING_VIEW,
      page: () => const AddToCartShippingViewView(),
      binding: AddToCartShippingViewBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.MY_ACCOUNT,
      page: () => const MyAccountView(),
      binding: MyAccountBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PLANE,
      page: () =>  PlaneView(),
      binding: PlaneBinding(),
    ),
    GetPage(
      name: _Paths.MY_ACCOUNT_CHANGE_PASSWORD,
      page: () => const MyAccountChangePasswordView(),
      binding: MyAccountChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.MY_ACCOUNT_NEW_CHANGED_AND_OLD_PASSWORD_CHANGE,
      page: () => const MyAccountNewChangedAndOldPasswordChangeView(),
      binding: MyAccountNewChangedAndOldPasswordChangeBinding(),
    ),
    GetPage(
      name: _Paths.MY_PET,
      page: () =>  MyPetView(),
      binding: MyPetBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PET,
      page: () => const AddPetView(),
      binding: AddPetBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_CART,
      page: () => const ViewCartView(),
      binding: ViewCartBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_PAGE,
      page: () => OrderPageView(),
      binding: OrderPageBinding(),
    ),
    GetPage(
      name: _Paths.MOBILE_VERIFY,
      page: () => const MobileVerifyView(),
      binding: MobileVerifyBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFY,
      page: () => const OtpVerifyView(),
      binding: OtpVerifyBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAIL,
      page: () => OrderDetailView(),
      binding: OrderDetailBinding(),
    ),
    GetPage(
      name: _Paths.CART_DRAWER,
      page: () => const CartDrawerView(),
      binding: CartDrawerBinding(),
    ),
    GetPage(
      name: _Paths.PET_VIEW_DETAILS,
      page: () =>  PetViewDetailsView(),
      binding: PetViewDetailsBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_APPOIMENT,
      page: () =>  BookAppoimentView(),
      binding: BookAppoimentBinding(),
    ),
    GetPage(
      name: _Paths.VET_VIEW_DETAILS,
      page: () =>  VetViewDetailsView(),
      binding: VetViewDetailsBinding(),
    ),
    GetPage(
      name: _Paths.DATE_TIME_APPOIMENT,
      page: () =>  DateTimeAppoimentView(),
      binding: DateTimeAppoimentBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_PAGE,
      page: () => const NotificationPageView(),
      binding: NotificationPageBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_PRODUCT_PAGE,
      page: () => const SearchProductPageView(),
      binding: SearchProductPageBinding(),
    ),
  ];
}
