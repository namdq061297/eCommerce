---
name: t_store-flutter
description: >
  Skill dành riêng cho project t_store (eCommerce Flutter).
  Áp dụng khi tạo màn hình, widget, controller, model, hoặc bất kỳ file Dart nào
  trong project này. State management là GetX, backend là Firebase, font là Poppins,
  package name là t_store, icon pack là Iconsax.
  Luôn dùng skill này khi làm việc với t_store, bao gồm: thêm feature, sửa UI,
  tạo controller GetX, gọi Firestore/Firebase Auth, xử lý cart, product, order,
  wishlist, profile, address, checkout, authentication.
---

# T_Store — Flutter eCommerce Skill

Project **t_store**: ứng dụng eCommerce Flutter với GetX + Firebase.
Mọi code mới phải tuân theo đúng convention, naming, và folder structure của project này.

---

## 1. Thông tin project

| Key | Value |
|-----|-------|
| Package name | `t_store` |
| State management | **GetX** (`get: ^4.6.6`) |
| Local storage | **GetStorage** (`get_storage: ^2.1.1`) |
| Backend | **Firebase** (Auth + Firestore + Storage) |
| HTTP | `http: ^1.2.1` |
| Font | **Poppins** (Light 300, Regular 400, Medium 500, SemiBold 600, Bold 800) |
| Icons | **Iconsax** (`iconsax: ^0.0.8`) |
| Navigation | `Get.to()`, `Get.off()`, `Get.offAll()` |
| Entry point | `lib/main.dart` → `App()` → `GetMaterialApp` |

---

## 2. Folder Structure

```
lib/
├── main.dart
├── app.dart                          # GetMaterialApp, theme, home
├── navigation_menu.dart              # BottomNavigationBar (Home/Store/Wishlist/Profile)
│
├── common/
│   ├── commons_screen/
│   │   └── success_screen.dart
│   ├── styles/
│   │   └── spacing_style.dart
│   └── widgets/                      # Shared reusable widgets (prefix T)
│       ├── TCart.dart
│       ├── TCircularIcon.dart
│       ├── TFormDivider.dart
│       ├── TRoundContainer.dart
│       ├── TSectionHeading.dart
│       ├── TSocialButton.dart
│       ├── TVerticalImageText.dart
│       ├── appbar/
│       ├── brand/
│       ├── choice/
│       ├── custom_shapes/
│       ├── image/
│       ├── layout/
│       ├── list_tile/
│       ├── products/
│       └── text/
│
├── features/
│   ├── authentication/
│   │   ├── controllers/
│   │   │   ├── login/login.controller.dart
│   │   │   ├── signup/signup.controller.dart
│   │   │   ├── onboarding/onboarding.controller.dart
│   │   │   └── navigation/navigation.controller.dart
│   │   └── screens/
│   │       ├── login/
│   │       ├── signup/
│   │       ├── onboarding/
│   │       └── password/
│   ├── shop/
│   │   ├── controllers/
│   │   │   └── home_controller.dart
│   │   └── screens/
│   │       ├── home/
│   │       ├── store/
│   │       ├── cart/
│   │       ├── checkout/
│   │       ├── wishlist/
│   │       ├── order/
│   │       ├── product_detail/
│   │       │   ├── controller/product_detail.controller.dart
│   │       │   └── widgets/
│   │       ├── product_review/
│   │       └── setting/
│   └── personalization/
│       └── screens/
│           ├── profile/
│           └── address/
│
└── utils/
    ├── constants/
    │   ├── colors.dart         # TColors
    │   ├── sizes.dart          # TSizes
    │   ├── text_strings.dart   # TTexts
    │   ├── image_strings.dart  # TImages
    │   ├── enums.dart          # TextSizes, OrderStatus, PaymentMethods
    │   └── api_constants.dart
    ├── device/device_utility.dart
    ├── exceptions/             # Custom exceptions (Firebase, format, platform)
    ├── formatters/formatter.dart
    ├── helpers/
    │   ├── helper_functions.dart   # THelperFunctions
    │   ├── cloud_helper_functions.dart
    │   ├── network_manager.dart
    │   └── pricing_calculator.dart
    ├── http/http_client.dart
    ├── loaders/
    ├── local_storage/storage_utility.dart
    ├── logging/logger.dart
    ├── popups/
    │   ├── loaders.dart            # TLoaders (snackbar, toast)
    │   └── full_screen_loader.dart
    ├── theme/
    │   ├── theme.dart              # TAppTheme (light + dark)
    │   └── widget_themes/
    └── validators/validation.dart  # TValidator
```

---

## 3. Naming Convention

| Loại | Convention | Ví dụ |
|------|-----------|-------|
| Widget class | `T` prefix + PascalCase | `TRoundContainer`, `TProductCardVertical` |
| Controller | PascalCase + `Controller` | `LoginController`, `HomeController` |
| Screen | PascalCase + `Screen` | `LoginScreen`, `HomeScreen` |
| File | snake_case + `.dart` | `login.screen.dart`, `login.controller.dart` |
| Constants class | `T` prefix | `TColors`, `TSizes`, `TTexts`, `TImages` |
| Helper class | `T` prefix | `THelperFunctions`, `TValidator`, `TLoaders` |

---

## 4. GetX Controller Pattern

```dart
import 'package:get/get.dart';

class ExampleController extends GetxController {
  // Singleton access
  static ExampleController get instance => Get.find();

  // Observable state
  final isLoading = false.obs;
  final count = 0.obs;
  final items = <String>[].obs;

  // Actions
  void increment() => count.value++;

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      // call repo / firebase
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
```

**Đăng ký controller trong Screen:**
```dart
// Lần đầu dùng — đăng ký
final controller = Get.put(ExampleController());

// Đã đăng ký rồi — tìm lại
final controller = Get.find<ExampleController>();

// Singleton shortcut
final controller = ExampleController.instance;
```

**Rebuild UI với Obx:**
```dart
Obx(() => Text('${controller.count.value}'))
Obx(() => controller.isLoading.value
    ? const CircularProgressIndicator()
    : const Text('Done'))
```

---

## 5. Screen Pattern

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Example')),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            // widgets
          ],
        ),
      ),
    );
  }
}
```

---

## 6. Colors — TColors

```dart
// Màu chính
TColors.primary        // #4b68ff
TColors.secondary      // #FFE24B (vàng)
TColors.accent         // #b0c7ff

// Text
TColors.textPrimary    // #333333
TColors.textSecondary  // #6C757D
TColors.textWhite      // white

// Background
TColors.light          // #F6F6F6
TColors.dark           // #272727
TColors.primaryBackground // #F3F5FF

// Neutral
TColors.black          // #232323
TColors.white          // #FFFFFF
TColors.darkerGrey     // #4F4F4F
TColors.darkGrey       // #939393
TColors.grey           // #E0E0E0

// Status
TColors.error          // #D32F2F
TColors.success        // #388E3C
TColors.warning        // #F57C00
```

**Dark mode check:**
```dart
final dark = THelperFunctions.isDarkMode(context);
color: dark ? TColors.darkerGrey : TColors.white,
backgroundColor: dark ? TColors.dark : TColors.light,
```

---

## 7. Sizes — TSizes

```dart
TSizes.xs = 4.0        // padding nhỏ nhất
TSizes.sm = 8.0
TSizes.md = 16.0
TSizes.lg = 24.0
TSizes.xl = 32.0

TSizes.defaultSpace = 24.0        // padding màn hình
TSizes.spaceBtwItems = 16.0       // khoảng cách giữa items
TSizes.spaceBtwSections = 32.0    // khoảng cách giữa sections
TSizes.spaceBtwInputFields = 16.0 // khoảng cách giữa fields

TSizes.iconXs = 12.0
TSizes.iconSm = 16.0
TSizes.iconMd = 24.0
TSizes.iconLg = 32.0

TSizes.borderRadiusSm = 4.0
TSizes.borderRadiusMd = 8.0
TSizes.borderRadiusLg = 12.0
TSizes.cardRadiusLg = 16.0
TSizes.cardRadiusMd = 12.0
TSizes.productImageRadius = 16.0
TSizes.buttonRadius = 12.0
TSizes.inputFieldRadius = 12.0
```

---

## 8. Icons — Iconsax

Luôn dùng **Iconsax** thay vì `Icons.xxx`:

```dart
import 'package:iconsax/iconsax.dart';

Iconsax.home           // bottom nav
Iconsax.shop           // store
Iconsax.heart          // wishlist
Iconsax.user           // profile
Iconsax.search_normal  // search
Iconsax.shopping_cart  // cart
Iconsax.notification   // notification
Iconsax.setting_2      // settings
Iconsax.check          // success
Iconsax.warning_2      // warning/error
Iconsax.add            // add button
Iconsax.heart5         // filled heart (đã wishlist)
Iconsax.arrow_left     // back
Iconsax.more_circle    // more options
```

---

## 9. Strings — TTexts

```dart
import 'package:t_store/utils/constants/text_strings.dart';

TTexts.appName         // 'T-Store'
TTexts.signIn          // 'Sign In'
TTexts.createAccount   // 'Create Account'
TTexts.email           // 'E-Mail'
TTexts.password        // 'Password'
TTexts.firstName       // 'First Name'
TTexts.lastName        // 'Last Name'
TTexts.phoneNo         // 'Phone Number'
TTexts.forgetPassword  // 'Forget Password?'
TTexts.loginTitle      // 'Welcome back,'
TTexts.signupTitle     // 'Let\'s create your account'
TTexts.skip            // 'Skip'
TTexts.done            // 'Done'
TTexts.tContinue       // 'Continue'
```

---

## 10. Loaders — TLoaders

```dart
import 'package:t_store/utils/popups/loaders.dart';

TLoaders.successSnackBar(title: 'Thành công', message: 'Đã lưu!');
TLoaders.warningSnackBar(title: 'Chú ý', message: 'Thiếu thông tin');
TLoaders.errorSnackBar(title: 'Lỗi', message: 'Không thể kết nối');
TLoaders.customToast(message: 'Đã thêm vào giỏ hàng');
TLoaders.hideSnackBar();
```

---

## 11. Validation — TValidator

```dart
import 'package:t_store/utils/validators/validation.dart';

TextFormField(validator: TValidator.validateEmail)
TextFormField(validator: TValidator.validatePassword)
TextFormField(validator: TValidator.validatePhoneNumber)
// Password rule: >= 6 ký tự, có hoa, số, ký tự đặc biệt
```

---

## 12. Navigation

```dart
Get.to(() => const ExampleScreen());          // push
Get.off(() => const ExampleScreen());         // replace
Get.offAll(() => const LoginScreen());        // clear stack
Get.back();                                   // pop
Get.back(result: someData);                   // pop with result
```

---

## 13. Enums

```dart
// file: lib/utils/constants/enums.dart
enum TextSizes { small, medium, large }
enum OrderStatus { processing, shipped, delivered }
enum PaymentMethods {
  paypal, googlePay, applePay, visa, masterCard,
  creditCard, paystack, razorPay, paytm
}
```

---

## 14. Theme

```dart
// TAppTheme.lightTheme / darkTheme — đã config sẵn:
// - fontFamily: 'Poppins'
// - useMaterial3: true
// - primaryColor: TColors.primary
// - Scaffold: white (light) / black (dark)
// - AppBar, Button, TextField, Chip, Checkbox — đều custom

// KHÔNG override theme component riêng lẻ,
// sửa trong lib/utils/theme/widget_themes/ nếu cần thay đổi global
```

---

## 15. Checklist khi tạo Feature mới

- [ ] Tạo folder đúng cấu trúc trong `features/[feature]/`
- [ ] Controller kế thừa `GetxController`, có `static get instance => Get.find()`
- [ ] File đặt tên `name.controller.dart` / `name.screen.dart`
- [ ] Dùng `TColors` thay `Colors.xxx`
- [ ] Dùng `TSizes` thay hardcode số
- [ ] Dùng `TTexts` thay hardcode string
- [ ] Dùng `Iconsax` thay `Icons`
- [ ] Dùng `TLoaders` cho snackbar/toast
- [ ] Dùng `THelperFunctions.isDarkMode(context)` để handle dark mode
- [ ] Dùng `TValidator` trong form
- [ ] Widget shared đặt vào `common/widgets/` với prefix `T`
- [ ] Widget riêng của màn hình đặt vào `screens/[screen]/widgets/`
