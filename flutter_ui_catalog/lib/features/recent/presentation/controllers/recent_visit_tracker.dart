import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_catalog/features/recent/presentation/controllers/recent_components_controller.dart';

class RecentVisitTracker extends ConsumerStatefulWidget {
  const RecentVisitTracker({
    required this.componentId,
    required this.child,
    super.key,
  });

  final String componentId;
  final Widget child;

  @override
  ConsumerState<RecentVisitTracker> createState() => _RecentVisitTrackerState();
}

class _RecentVisitTrackerState extends ConsumerState<RecentVisitTracker> {
  @override
  void initState() {
    super.initState();
    _track();
  }

  @override
  void didUpdateWidget(RecentVisitTracker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.componentId != widget.componentId) {
      _track();
    }
  }

  void _track() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(recentComponentsProvider.notifier).visit(widget.componentId);
      }
    });
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
