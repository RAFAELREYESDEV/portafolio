import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: AppTheme.backgroundWhite,
        border: Border(
          top: BorderSide(
            color: AppTheme.borderGreen,
            width: 1,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppTheme.primaryGreen,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              const Flexible(
                child: Text(
                  'PORTAFOLIO v1.0 • ING. DE SISTEMAS UNIMAR',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10,
                    letterSpacing: 1.0,
                    color: AppTheme.accentGreen,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          const Text(
            '© 2026 Rafael Reyes (@Rafaelreyesdev)',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11,
              letterSpacing: 0.8,
              color: AppTheme.darkGreenText,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
