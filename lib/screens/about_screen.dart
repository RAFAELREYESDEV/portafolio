import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      appBar: const CustomAppBar(title: 'SOBRE MÍ'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar con halo verde esmeralda
            Center(
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.primaryGreen, width: 2.5),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryGreen.withValues(alpha: 0.25),
                      blurRadius: 16,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 54,
                  backgroundColor: AppTheme.surfaceOverlay,
                  child: Icon(
                    Icons.person,
                    size: 58,
                    color: AppTheme.accentGreen,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Rafael Reyes',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: AppTheme.darkGreenText,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Estudiante de Ingeniería de Sistemas • UNIMAR',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.accentGreen,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 24),

            // Tarjeta de perfil
            _buildInfoCard(
              title: '¿QUIÉN SOY?',
              icon: Icons.badge_outlined,
              content:
                  'Soy estudiante del Decanato de Ingeniería y Afines en la Universidad de Margarita (UNIMAR). Me apasiona el desarrollo de software y la creación de interfaces interactivas limpias con Flutter y Dart.',
            ),
            const SizedBox(height: 16),

            // Tarjeta de enfoque
            _buildInfoCard(
              title: 'ENFOQUE TÉCNICO',
              icon: Icons.code,
              content:
                  'Actualmente cursando Programación III, profundizando en Programación Orientada a Objetos (POO), arquitectura de widgets en Flutter, consumo de APIs y buenas prácticas de desarrollo móvil y web.',
            ),
            const SizedBox(height: 16),

            // Datos rápidos
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.surfaceCard,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.borderGreen),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Column(
                children: [
                  _DetailRow(label: 'Ubicación', value: 'Isla de Margarita, Venezuela'),
                  Divider(color: AppTheme.borderGreen, height: 20),
                  _DetailRow(label: 'Especialidad', value: 'Ingeniería de Sistemas'),
                  Divider(color: AppTheme.borderGreen, height: 20),
                  _DetailRow(label: 'Asignatura', value: 'Programación III (V-01)'),
                  Divider(color: AppTheme.borderGreen, height: 20),
                  _DetailRow(label: 'GitHub', value: 'github.com/Rafaelreyesdev'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required IconData icon,
    required String content,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppTheme.surfaceCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.borderGreen,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppTheme.accentGreen, size: 20),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkGreenText,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(
              fontSize: 13,
              color: AppTheme.textMain,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: AppTheme.textMuted),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.darkGreenText,
          ),
        ),
      ],
    );
  }
}
