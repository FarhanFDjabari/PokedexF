import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';

class CaptureReleasePokemonDialog extends StatefulWidget {
  const CaptureReleasePokemonDialog({
    super.key,
    required this.imageUrl,
    required this.name,
    this.durationInSeconds = 2,
    this.isCapture = true,
  });

  final String imageUrl;
  final String name;
  final bool isCapture;
  final int durationInSeconds;

  @override
  State<CaptureReleasePokemonDialog> createState() =>
      _CaptureReleasePokemonDialogState();
}

class _CaptureReleasePokemonDialogState
    extends State<CaptureReleasePokemonDialog>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  String get _imageUrl => widget.imageUrl;
  String get _name => widget.name;
  bool get _isCapture => widget.isCapture;
  int get _durationInSeconds => widget.durationInSeconds;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: _durationInSeconds),
      value: 1,
      animationBehavior: AnimationBehavior.preserve,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: theme.colorScheme.surface,
      child: SizedBox(
        width: UIHelper.mediaWidth(context, 1),
        height: UIHelper.mediaHeight(context, 0.45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                if (!_isCapture)
                  SizedBox(
                    height: 150,
                    child: FadeTransition(
                      opacity: CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.easeInOut,
                      ),
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset.zero,
                          end: const Offset(0.1, 0),
                        ).animate(_animationController),
                        child: UIHelper.networkImageLoader(
                          imageUrl: _imageUrl,
                          scale: 0.5,
                        ),
                      ),
                    ),
                  ),
                if (_isCapture)
                  SizedBox(
                    height: 150,
                    child: UIHelper.networkImageLoader(
                      imageUrl: _imageUrl,
                      scale: 0.5,
                    ),
                  ),
                if (_isCapture)
                  ScaleTransition(
                    scale: CurvedAnimation(
                      parent: _animationController,
                      curve: Curves.bounceIn,
                    ),
                    child: UIHelper.pokeballLoading(
                      width: 100,
                      height: 100,
                    ),
                  ),
              ],
            ),
            Text(
              '${_isCapture ? 'Capturing' : 'Releasing'} ${toBeginningOfSentenceCase(_name)}',
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
