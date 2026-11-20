import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class HobbiesScreen extends StatelessWidget {
  const HobbiesScreen({super.key});

  final List<Map<String, dynamic>> hobbies = const [
    {
      'title': 'Videojuegos y Estrategia',
      'icon': Icons.sports_esports_outlined,
      'desc':
          'Aficionado a juegos de estrategia, simulación espacial y mundos abiertos. Me interesa el diseño de niveles y mecánicas de interacción.',
    },
    {
      'title': 'Música y Producción',
      'icon': Icons.headphones_outlined,
      'desc':
          'Amante del Synthwave, Cyberpunk OSTs y Lo-Fi. La música es el motor principal para las sesiones de programación y concentración.',
    },
    {
      'title': 'Hardware & Exploración Tech',
      'icon': Icons.memory_outlined,
      'desc':
          'Curiosidad constante por arquitecturas de computadores, periféricos mecánicos, servidores locales y optimización de software.',
    },
    {
      'title': 'Café y Desarrollo',
      'icon': Icons.coffee_outlined,
      'desc':
          'El ritual de un buen café antes de diseñar una nueva interfaz o resolver un bug complejo.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      appBar: const CustomAppBar(title: 'HOBBIES & INTERESES'),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'MÁS ALLÁ DEL CÓDIGO',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppTheme.darkGreenText,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Las pasiones e intereses que nutren mi creatividad y lógica en el día a día.',
            style: TextStyle(fontSize: 12, color: AppTheme.textMuted),
          ),
          const SizedBox(height: 20),

          ...hobbies.map((hobby) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(18),
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceOverlay,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppTheme.borderGreen,
                      ),
                    ),
                    child: Icon(
                      hobby['icon'] as IconData,
                      color: AppTheme.primaryGreen,
                      size: 26,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hobby['title'] as String,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.darkGreenText,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          hobby['desc'] as String,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppTheme.textMain,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
