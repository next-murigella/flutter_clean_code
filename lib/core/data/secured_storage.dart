import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/foundation.dart';
import 'dart:io' show Platform;

import 'package:shared_preferences/shared_preferences.dart';

class SecuredStorageHandler {
  final _securedStorage = const FlutterSecureStorage();
  Options? options;

  Future<void> writeSecureData(SecuredStorageItem newItem) async {
    if (kIsWeb) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(newItem.key, newItem.value);
    } else if (Platform.isAndroid) {
      await _securedStorage.write(
          key: newItem.key,
          value: newItem.value,
          aOptions: _getAndroidOptions());
    } else if (Platform.isIOS) {
      await _securedStorage.write(
          key: newItem.key, value: newItem.value, iOptions: _getIOSOptions());
    } else {
      await _securedStorage.write(key: newItem.key, value: newItem.value);
    }
  }

  Future<String?> readSecureData(String key) async {
    if (kIsWeb) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
    } else if (Platform.isAndroid) {
      return await _securedStorage.read(
          key: key, aOptions: _getAndroidOptions());
    } else if (Platform.isIOS) {
      return await _securedStorage.read(key: key, iOptions: _getIOSOptions());
    } else {
      return await _securedStorage.read(key: key);
    }
  }

  Future<void> deleteSecureData(String key) async {
    if (kIsWeb) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('api_key');
    } else if (Platform.isAndroid) {
      await _securedStorage.delete(key: key, aOptions: _getAndroidOptions());
    } else if (Platform.isIOS) {
      await _securedStorage.delete(key: key, iOptions: _getIOSOptions());
    } else {
      await _securedStorage.delete(key: key);
    }
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  IOSOptions _getIOSOptions() =>
      const IOSOptions(accessibility: IOSAccessibility.first_unlock);
}

class SecuredStorageItem {
  final String key;
  final String value;

  SecuredStorageItem(this.key, this.value);
}
