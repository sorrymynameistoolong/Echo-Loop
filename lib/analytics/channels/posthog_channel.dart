/// PostHog 上报通道
/// PostHog 通道已禁用。
/// 原 SDK setup、capture、identify、person properties 与 Session Replay 实现已注释停用。
library;

import '../analytics_channel.dart';

class PostHogChannel implements AnalyticsChannel {
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
