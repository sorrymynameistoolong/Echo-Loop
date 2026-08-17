/// 全球/默认上报通道（Firebase Analytics）
/// Firebase Analytics 通道已禁用。
/// 原 firebase_analytics 实现已注释停用，保留同名类型以兼容旧代码。
library;

import '../analytics_channel.dart';

class FirebaseChannel implements AnalyticsChannel {
  @override
  String get name => 'Disabled';

  @override
  Future<void> initialize() async {}

  @override
  Future<void> logEvent(String name, Map<String, Object>? parameters) async {}

  @override
  Future<void> setUserId(String? id) async {}

  @override
  Future<void> setUserProperty(String name, String? value) async {}

  @override
  Future<void> registerSuperProperties(Map<String, Object> properties) async {}

  @override
  Future<void> unregisterSuperProperty(String name) async {}
}
