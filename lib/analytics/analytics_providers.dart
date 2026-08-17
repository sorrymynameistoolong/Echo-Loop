///
/// 遥测服务兼容层。
///
/// 生产版本已禁用所有远程分析、崩溃上报、Session Replay 与用户标识关联。
/// 业务代码继续依赖本文件提供的 Provider，但实际通道始终为本地 no-op。
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'analytics_channel.dart';
import 'analytics_service.dart';
import 'channels/log_only_channel.dart';
import 'consent_manager.dart';

late AnalyticsService _analyticsService;

/// 注入本地 no-op 分析服务；不会初始化或连接任何第三方 SDK。
void initAnalytics(AnalyticsService service) {
  _analyticsService = service;
}

/// 兼容现有业务调用点的本地分析服务 Provider。
final analyticsServiceProvider = Provider<AnalyticsService>((ref) {
  return _analyticsService;
});

/// 初始化本地 no-op 分析服务。
///
/// 原 Firebase/PostHog/友盟初始化与通道选择代码已注释停用；保留在版本历史中。
Future<AnalyticsService> initAnalyticsService(
  SharedPreferences prefs, {
  required String userId,
}) async {
  final service = AnalyticsService(
    channel: LogOnlyChannel(),
    consent: ConsentManager(prefs),
  );
  await service.initializeDisabled();
  return service;
}

/*
// 遥测已禁用。以下原逻辑不再执行：
// - Firebase Analytics 初始化及 setAnalyticsCollectionEnabled
// - PostHog setup、事件捕获、用户识别、person properties
// - 友盟通道及按地区选择逻辑
// - super properties 和权限快照上报
*/

// 保留接口类型引用，避免未来恢复功能时改变业务层 API。
AnalyticsChannel disabledAnalyticsChannel() => LogOnlyChannel();
