import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../theme/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showSignatureButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showSignatureButton = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.canPop(context);

    return AppBar(
      title: Text(title),
      leading: canPop
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 20),
              color: AppTheme.darkGreenText,
              tooltip: 'Volver',
              onPressed: () => Navigator.pop(context),
            )
          : null,
      actions: [
        if (showSignatureButton)
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: Tooltip(
              message: 'Ver firma del desarrollador',
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.signature);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceOverlay,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppTheme.primaryGreen,
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryGreen.withValues(alpha: 0.2),
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.fingerprint,
                        color: AppTheme.accentGreen,
                        size: 20,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'FIRMA',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.darkGreenText,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
