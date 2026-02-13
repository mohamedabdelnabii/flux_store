# FluxStore - E-Commerce App 🛍️

FluxStore is a modern, high-performance e-commerce application built with **Flutter** and **Clean Architecture**. It provides a seamless shopping experience with features like category browsing, product search, cart management, and wishlist synchronization.

---

## 🚀 Features

- **Modern UI**: Polished and responsive design using `flutter_screenutil`.
- **Clean Architecture**: Organized into Data, Domain, and Presentation layers for scalability.
- **State Management**: Robust state management using `flutter_bloc` (Cubit).
- **Offline Support**: Local caching of data using **Hive**.
- **Real-time Notifications**: Integrated with **Firebase Cloud Messaging (FCM)** for foreground and background notifications.
- **Search & Filtering**: Comprehensive search with advanced filtering options.
- **Cart & Wishlist**: Fully functional cart and wishlist with real-time synchronization.

---

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **Networking**: [Dio](https://pub.dev/packages/dio) & [Retrofit](https://pub.dev/packages/retrofit)
- **Local Database**: [Hive](https://pub.dev/packages/hive)
- **Dependency Injection**: [GetIt](https://pub.dev/packages/get_it)
- **State Management**: [Bloc/Cubit](https://pub.dev/packages/flutter_bloc)
- **Serialization**: [Freezed](https://pub.dev/packages/freezed) & [JSON Serializable](https://pub.dev/packages/json_serializable)

---

## ⚙️ Project Structure

```text
lib/
├── core/               # Shared components, utilities, and base configurations
│   ├── di/             # Dependency Injection setup
│   ├── networking/     # API services and error handling
│   ├── theme/          # App design system (colors, typography)
│   └── routes/         # Navigation configuration
└── features/           # Feature-based modular structure
    ├── auth/           # Login, Signup, and Password recovery
    ├── home/           # Landing page and navigation
    ├── cart/           # Shopping bag and checkout
    ├── wishlist/       # Saved items
    └── products/       # Detailed product views and search
```

---

## 🛠️ Getting Started

1. **Clone the repository**:
   ```bash
   git clone https://github.com/mohamedabdelnabii/flux_store.git
   ```
2. **Setup Firebase**:
   - Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS).
3. **Install dependencies**:
   ```bash
   flutter pub get
   ```
4. **Generate code**:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
5. **Run the app**:
   ```bash
   flutter run
   ```

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

Developed with ❤️ by [Mohamed Abdelnabi](https://github.com/mohamedabdelnabii)
