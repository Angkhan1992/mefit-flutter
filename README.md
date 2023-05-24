# mefit

A new Flutter project.

## Getting Started

@JsonSerializable(fieldRename: FieldRename.snake)

@override
    void init(BuildContext context) {
    super.init(context);
    fetchData();
}

@override
Future<void> fetchData() async {}

### Commen Command
dart fix --apply
flutter pub run build_runner build --delete-conflicting-outputs


### For Admin Web
flutter run lib/admin/admin.dart -d chrome

### For User Mobile
flutter build -t user/user.dart appbundle --release