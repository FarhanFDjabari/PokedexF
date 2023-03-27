import 'package:flutter/material.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';

class ExceptionIndicator extends StatelessWidget {
  const ExceptionIndicator({
    required this.title,
    this.titleTextStyle,
    this.asset,
    this.message,
    this.onTryAgain,
    Key? key,
  }) : super(key: key);
  final String title;
  final String? message;
  final Widget? asset;
  final VoidCallback? onTryAgain;
  final TextStyle? titleTextStyle;

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: UIHelper.padSymmetric(vertical: 32, horizontal: 16),
          child: Column(
            children: [
              asset ?? Container(),
              const SizedBox(
                height: 32,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: titleTextStyle,
              ),
              if (message != null)
                const SizedBox(
                  height: 16,
                ),
              if (message != null)
                Text(
                  "$message",
                  textAlign: TextAlign.center,
                ),
              if (onTryAgain != null) const Spacer(),
              if (onTryAgain != null)
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: onTryAgain,
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Try Again',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
}
