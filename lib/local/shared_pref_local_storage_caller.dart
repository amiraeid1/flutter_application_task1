// import 'dart:convert';


// import 'package:shared_preferences/shared_preferences.dart';

// import 'i_local_storage_caller.dart';
// import 'login_model.dart';

// class SharedPrefsLocalStorageCaller implements ILocalStorageCaller {
//   final SharedPreferences sharedPreferences;
//   SharedPrefsLocalStorageCaller({required this.sharedPreferences});

//   @override
//   Future<bool> saveData({
//     required String key,
//     required dynamic value,
//     required DataType dataType,
//   }) async {
//     return await _tryCatchWrapper(
//       () async {
//         return await getSetMethod(
//             sharedPrefsMethod: dataType, key: key, value: value);
//       },
//     );
//   }

//   @override
//   Future<dynamic> restoreData({
//     required String key,
//     required DataType dataType,
//   }) async {
//     return await _tryCatchWrapper(
//       () async {
//         return await getGetMethod(sharedPrefsMethod: dataType, key: key);
//       },
//     );
//   }

//   @override
//   Future<LogInModel?> restoreUserData({
//     required String key,
//   }) async {
//     return await _tryCatchWrapper(
//       () async {
//         final String? user =
//             await getGetMethod(sharedPrefsMethod: DataType.string, key: key);
//         if (user != null) {
//           final Map<String, dynamic>? json = jsonDecode(user);
//           return LogInModel.fromJson(json!);
//         } else {
//           return null;
//         }
//       },
//     );
//   }

//   @override
//   Future<bool> clearAll() async {
//     return await _tryCatchWrapper(
//       () async {
//         return await sharedPreferences.clear();
//       },
//     );
//   }

//   @override
//   Future<bool> clearKey({required key}) async {
//     return await _tryCatchWrapper(
//       () async {
//         return await sharedPreferences.remove(key);
//       },
//     );
//   }

//   @override
//   getSetMethod({
//     required DataType sharedPrefsMethod,
//     required String key,
//     required dynamic value,
//   }) {
//     switch (sharedPrefsMethod) {
//       case DataType.string:
//         return sharedPreferences.setString(key, value);
//       case DataType.int:
//         return sharedPreferences.setInt(key, value);
//       case DataType.double:
//         return sharedPreferences.setDouble(key, value);
//       case DataType.bool:
//         return sharedPreferences.setBool(key, value);
//       case DataType.stringList:
//         return sharedPreferences.setStringList(key, value);
//     }
//   }

//   @override
//   getGetMethod({
//     required DataType sharedPrefsMethod,
//     required String key,
//   }) {
//     switch (sharedPrefsMethod) {
//       case DataType.string:
//         return sharedPreferences.getString(key);
//       case DataType.int:
//         return sharedPreferences.getInt(key);
//       case DataType.double:
//         return sharedPreferences.getDouble(key);
//       case DataType.bool:
//         return sharedPreferences.getBool(key);
//       case DataType.stringList:
//         return sharedPreferences.getStringList(key);
//     }
//   }

//   Future<T> _tryCatchWrapper<T>(Function body) async {
//     try {
//       return await body();
//     } on Exception catch (e) {
//       throw e.toString();
//     }
//   }
// }
