import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class SignatureScreen extends StatelessWidget {
  const SignatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      appBar: const CustomAppBar(
        title: 'FIRMA & CONTACTO',
        showSignatureButton: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            // Panel de Firma Digital
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
              decoration: BoxDecoration(
                color: AppTheme.surfaceCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.primaryGreen, width: 2.0),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryGreen.withValues(alpha: 0.15),
                    blurRadius: 16,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'FIRMA DIGITAL DE AUTORÍA',
                    style: TextStyle(
                      fontSize: 11,
                      letterSpacing: 2,
                      color: AppTheme.accentGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Firma estilizada en verde esmeralda
                  Text(
                    'Rafael Reyes',
                    style: GoogleFonts.dancingScript(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.darkGreenText,
                      shadows: [
                        Shadow(
                          color: AppTheme.primaryGreen.withValues(alpha: 0.4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'R.R. • Dev ID: UNIMAR-PRG3-2026',
                    style: GoogleFonts.rajdhani(
                      fontSize: 12,
                      color: AppTheme.textMuted,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Información de Contacto
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'INFORMACIÓN DE CONTACTO',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkGreenText,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 14),

            _buildContactTile(
              icon: Icons.code,
              title: 'GitHub',
              subtitle: 'github.com/Rafaelreyesdev',
            ),
            const SizedBox(height: 12),
            _buildContactTile(
              icon: Icons.school_outlined,
              title: 'Institución',
              subtitle: 'Universidad de Margarita (UNIMAR)',
            ),
            const SizedBox(height: 12),
            _buildContactTile(
              icon: Icons.email_outlined,
              title: 'Correo',
              subtitle: 'rafaelreyes.dev@unimar.edu.ve',
            ),
            const SizedBox(height: 12),
            _buildContactTile(
              icon: Icons.location_on_outlined,
              title: 'Ubicación',
              subtitle: 'Nueva Esparta, Venezuela',
            ),

            const SizedBox(height: 30),
            // Botón de retorno al hub central
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('VOLVER AL CENTRO DE COMANDO'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.surfaceCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.borderGreen),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.surfaceOverlay,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppTheme.primaryGreen, size: 22),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppTheme.textMuted,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.darkGreenText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
