import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';
import 'package:flutter_ui_catalog/shared/code_viewer/code_viewer.dart';
import 'package:flutter_ui_catalog/shared/component_preview/component_preview_frame.dart';

class ComponentDemoCard extends StatefulWidget {
  const ComponentDemoCard({
    required this.title,
    required this.description,
    required this.preview,
    required this.sourceCode,
    required this.properties,
    required this.notes,
    this.actions = const <Widget>[],
    this.initiallyShowCode = false,
    super.key,
  });

  final String title;
  final String description;
  final Widget preview;
  final String sourceCode;
  final List<String> properties;
  final List<String> notes;
  final List<Widget> actions;
  final bool initiallyShowCode;

  @override
  State<ComponentDemoCard> createState() => _ComponentDemoCardState();
}

class _ComponentDemoCardState extends State<ComponentDemoCard> {
  late bool _showCode;

  @override
  void initState() {
    super.initState();
    _showCode = widget.initiallyShowCode;
  }

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(widget.description),
                    ],
                  ),
                ),
                ...widget.actions,
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            ComponentPreviewFrame(child: widget.preview),
            if (widget.properties.isNotEmpty) ...<Widget>[
              const SizedBox(height: AppSpacing.md),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: widget.properties
                    .map((property) => Chip(label: Text(property)))
                    .toList(growable: false),
              ),
            ],
            if (widget.notes.isNotEmpty) ...<Widget>[
              const SizedBox(height: AppSpacing.md),
              ...widget.notes.map(
                (note) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Icon(Icons.info_outline, size: 18),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(child: Text(note)),
                    ],
                  ),
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.sm),
            TextButton.icon(
              onPressed: () => setState(() => _showCode = !_showCode),
              icon: Icon(_showCode ? Icons.code_off : Icons.code),
              label: Text(_showCode ? 'Ocultar código' : 'Ver código'),
            ),
            if (_showCode) ...<Widget>[
              const SizedBox(height: AppSpacing.sm),
              CodeViewer(code: widget.sourceCode),
            ],
          ],
        ),
      ),
    );
  }
}
