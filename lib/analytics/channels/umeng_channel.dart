/// 中国大陆移动端上报通道（友盟）
/// 友盟通道已禁用。
/// 原 umeng_common_sdk 初始化、事件与用户标识实现已注释停用。
library;

import '../analytics_channel.dart';

class UmengChannel implements AnalyticsChannel {
  static bool get isConfigured => false;

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
