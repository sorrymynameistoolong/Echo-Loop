/// 遥测禁用后的兼容通道。
///
/// 所有方法均为 no-op：不写日志、不联网、不保存用户标识或属性。
library;

import '../analytics_channel.dart';

/// 仅打日志的分析通道（Debug 用）
class LogOnlyChannel implements AnalyticsChannel {
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
