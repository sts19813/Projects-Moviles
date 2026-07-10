import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_ui_catalog/app/theme/app_radius.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';

class CodeViewer extends StatefulWidget {
  const CodeViewer({
    required this.code,
    this.initiallyExpanded = false,
    super.key,
  });

  final String code;
  final bool initiallyExpanded;

  @override
  State<CodeViewer> createState() => _CodeViewerState();
}

class _CodeViewerState extends State<CodeViewer> {
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initiallyExpanded;
  }

  Future<void> _copy() async {
    await Clipboard.setData(ClipboardData(text: widget.code));
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Código copiado al portapapeles')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final background = isDark
        ? const Color(0xFF282C34)
        : const Color(0xFFF6F8FA);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: AppSpacing.md),
                child: Text('Dart'),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () => setState(() => _expanded = !_expanded),
                icon: Icon(_expanded ? Icons.unfold_less : Icons.unfold_more),
                label: Text(_expanded ? 'Contraer' : 'Expandir'),
              ),
              IconButton(
                tooltip: 'Copiar código',
                onPressed: _copy,
                icon: const Icon(Icons.copy_all_outlined),
              ),
              const SizedBox(width: AppSpacing.xs),
            ],
          ),
          const Divider(height: 1),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: _expanded ? 520 : 220,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            child: SelectionArea(
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: HighlightView(
                    widget.code,
                    language: 'dart',
                    theme: isDark ? atomOneDarkTheme : githubTheme,
                    padding: const EdgeInsets.all(AppSpacing.md),
                    textStyle: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
