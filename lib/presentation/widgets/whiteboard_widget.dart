import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_whiteboard/presentation/controllers/whiteboard_controller.dart';

class Whiteboard extends StatelessWidget {
  const Whiteboard({
    Key? key,
    required this.controller,
    this.canvasKey,
  })  : _readOnly = false,
        super(key: key);

  const Whiteboard.preview({
    super.key,
    required this.controller,
    this.canvasKey,
  }) : _readOnly = true;

  final WhiteboardController controller;
  final bool _readOnly;
  final GlobalKey? canvasKey;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        whiteboardControllerProvider.overrideWith((ref) => controller),
      ],
      child: _Whiteboard(
        readOnly: _readOnly,
        canvasKey: canvasKey,
      ),
    );
  }
}

class _Whiteboard extends ConsumerWidget {
  const _Whiteboard({
    Key? key,
    required this.readOnly,
    required this.canvasKey,
  }) : super(key: key);

  final bool readOnly;
  final GlobalKey? canvasKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RepaintBoundary(
      key: canvasKey,
      child: Stack(
        children: [],
      ),
    );
  }
}
