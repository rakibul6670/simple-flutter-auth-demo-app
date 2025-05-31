# 🚀 Simple Flutter Auth Demo App

A beginner-friendly Flutter authentication demo app using a dummy REST API (GET and POST). This project demonstrates user login, API handling, and proper error messages using custom snackbars. Built with clean code architecture and good development practices.

---

## 📱 Features

- 🔐 User login with form validation
- ✅ Dummy REST API integration for GET & POST requests
- 📦 API handling using `http` package
- 🍭 Clean and modular code structure
- 🔔 Custom snackbar for error notifications
- 🌐 Responsive UI layout for various screen sizes

---

## 🛠️ Project Structure
lib/
├── api_services/          # REST API কল ও সার্ভিস সংক্রান্ত ফাইল রাখা হয়
│   └── api_service.dart   # API থেকে GET ও POST রিকোয়েস্ট করার ফাংশনগুলো
├── constants/             # কনস্ট্যান্ট মান যেমন API URL, key ইত্যাদি
│   └── api_constant.dart  # API এর বেস URL ও endpoint গুলো সংরক্ষণ করা হয়েছে
├── models/                # ডেটা মডেল ফাইল যেমন ইউজার মডেল
│   └── user_model.dart    # ইউজার ডেটার স্ট্রাকচার ও মডেল
├── screen/                # UI স্ক্রিনগুলো আলাদা ফোল্ডারে ভাগ করা হয়েছে
│   ├── auth/              # Authentication সংক্রান্ত স্ক্রিন (Login, Signup)
│   │   ├── login_screen.dart
│   │   └── signup_screen.dart
│   ├── intro/             # Splash Screen ও Intro Screen এর ফাইল
│   │   ├── splash_screen.dart
│   │   └── intro_screen.dart
│   └── dashboard/         # ইউজার লগইন হওয়ার পর দেখানো মেইন ড্যাশবোর্ড স্ক্রিন
│       └── dashboard_screen.dart
├── utils/                 # হেল্পার ফাংশন বা ছোট ছোট ইউটিলিটি ফাইল
│   └── show_custom_snack.dart  # কাস্টম Snackbar দেখানোর জন্য ইউটিলিটি
└── main.dart              # অ্যাপ্লিকেশনের এন্ট্রি পয়েন্ট, রান করার জায়গা


## 📦 Dependencies

এই প্রজেক্টে নিচের প্যাকেজগুলো ব্যবহার করা হয়েছে:

| প্যাকেজ নাম             | বর্ণনা                                      | সংস্করণ       |
|------------------------|---------------------------------------------|---------------|
| flutter_native_splash  | অ্যাপ শুরু হওয়ার সময় স্প্ল্যাশ স্ক্রিন দেখানোর জন্য | ^2.4.6        |
| flutter_launcher_icons | অ্যাপের আইকন তৈরি করার জন্য                | ^0.14.3       |
| get                    | স্টেট ম্যানেজমেন্ট ও রাউটিংয়ের জন্য             | ^4.7.2        |
| shared_preferences     | ছোট ডেটা লোকালি সংরক্ষণের জন্য               | ^2.5.3        |
| introduction_screen    | ইন্ট্রো স্ক্রিন তৈরির জন্য                         | ^3.1.17       |
| http                   | REST API কল করার জন্য                       | ^1.4.0        |
| cupertino_icons        | আইওএস স্টাইলের আইকন ব্যবহারের জন্য          | ^1.0.8        |


⚙️ pubspec.yaml:

yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_native_splash: ^2.4.6
  flutter_launcher_icons: ^0.14.3
  get: ^4.7.2
  shared_preferences: ^2.5.3
  introduction_screen: ^3.1.17
  http: ^1.4.0
  cupertino_icons: ^1.0.8
  
# 🧠 Best Practices Followed
- **Separation of Concerns:**  
  API কল, UI, এবং ইউটিলিটি ফাইলগুলো আলাদা আলাদা ফোল্ডারে ভাগ করা হয়েছে, যাতে কোড মেইনটেইন করা সহজ হয়।

- **Error Handling:**  
  ইউজারকে ভালো ফিডব্যাক দেয়ার জন্য কাস্টম Snackbar ব্যবহার করা হয়েছে।

- **Clean Code:**  
  কোডের readability বজায় রাখতে পরিষ্কার কমেন্ট এবং স্ট্রাকচার ফলো করা হয়েছে।

- **Modular Architecture:**  
  প্রতিটি স্ক্রিন এবং ফাংশন আলাদা ফাইলে রাখা হয়েছে, যা রিইউজেবিলিটি বাড়ায়।

- **Responsive Design:**  
  বিভিন্ন ডিভাইসের জন্য UI রেসপন্সিভ রাখা হয়েছে।


# 🧑‍💻 Author

**Rakibul Hossain**  
GitHub: [@rakibul6670](https://github.com/rakibul6670)  
Email: rakibulpb6670@gmail.com  




