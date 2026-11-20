import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/footer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNodeIndex = 0;

  final List<Map<String, dynamic>> _stationNodes = [
    {
      'title': 'SOBRE MÍ',
      'subtitle': '¿Quién soy? • UNIMAR',
      'icon': Icons.person_pin_outlined,
      'route': AppRoutes.about,
      'description':
          'Perfil del desarrollador, formación en Ingeniería de Sistemas y metas profesionales.',
    },
    {
      'title': 'PROYECTOS & STACK',
      'subtitle': 'Flutter • Dart • Git',
      'icon': Icons.layers_outlined,
      'route': AppRoutes.projects,
      'description':
          'Aplicaciones móviles desarrolladas en Programación III y tecnologías dominadas.',
    },
    {
      'title': 'COMENTARIOS',
      'subtitle': 'Feedback & Mensajes',
      'icon': Icons.forum_outlined,
      'route': AppRoutes.comments,
      'description':
          'Módulo interactivo para escribir y recibir mensajes en memoria en tiempo real.',
    },
    {
      'title': 'HOBBIES & INTERESES',
      'subtitle': 'Gaming • Música • Tech',
      'icon': Icons.sports_esports_outlined,
      'route': AppRoutes.hobbies,
      'description':
          'Pasatiempos, producción musical y tecnologías que complementan mi lógica de desarrollo.',
    },
  ];

  void _navigateToRoute(String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    final activeNode = _stationNodes[_selectedNodeIndex];

    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      appBar: const CustomAppBar(title: 'CYBER STATION HUB'),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 580),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Encabezado de Identidad
                    _buildHeader(),
                    const SizedBox(height: 14),

                    // Estación Central Interactiva
                    _buildStationDisplay(),
                    const SizedBox(height: 16),

                    // Tarjeta del Nodo Activo
                    _buildActiveNodeCard(activeNode),
                    const SizedBox(height: 20),

                    // Cuadrícula de Acceso a Secciones
                    _buildNavigationGrid(),
                    const SizedBox(height: 24),

                    // Pie de Página
                    const FooterWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppTheme.surfaceCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.borderGreen),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'RAFAEL REYES',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: AppTheme.darkGreenText,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'CENTRO DE COMANDO • PORTAFOLIO',
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 1,
                  color: AppTheme.accentGreen,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: AppTheme.surfaceOverlay,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppTheme.primaryGreen),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.circle, color: AppTheme.primaryGreen, size: 8),
                SizedBox(width: 6),
                Text(
                  'EN LÍNEA',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkGreenText,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStationDisplay() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.backgroundWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderGreen, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryGreen.withValues(alpha: 0.08),
            blurRadius: 14,
            spreadRadius: 1,
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Imagen de la estación espacial en verde y blanco
          AspectRatio(
            aspectRatio: 1.15,
            child: Image.asset(
              'assets/images/station_bg.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppTheme.surfaceCard,
                  child: const Center(
                    child: Icon(
                      Icons.hub_outlined,
                      size: 64,
                      color: AppTheme.primaryGreen,
                    ),
                  ),
                );
              },
            ),
          ),

          // Puntos interactivos en los 4 cuadrantes
          Positioned(
            top: 14,
            left: 14,
            child: _buildStationTag(
              index: 0,
              label: '1. SOBRE MÍ',
              icon: Icons.person_outline,
            ),
          ),
          Positioned(
            top: 14,
            right: 14,
            child: _buildStationTag(
              index: 1,
              label: '2. PROYECTOS',
              icon: Icons.folder_open,
            ),
          ),
          Positioned(
            bottom: 14,
            left: 14,
            child: _buildStationTag(
              index: 2,
              label: '3. COMENTARIOS',
              icon: Icons.chat_bubble_outline,
            ),
          ),
          Positioned(
            bottom: 14,
            right: 14,
            child: _buildStationTag(
              index: 3,
              label: '4. HOBBIES',
              icon: Icons.sports_esports_outlined,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStationTag({
    required int index,
    required String label,
    required IconData icon,
  }) {
    final isSelected = _selectedNodeIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedNodeIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.primaryGreen
              : AppTheme.backgroundWhite.withValues(alpha: 0.95),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppTheme.darkGreenText : AppTheme.primaryGreen,
            width: isSelected ? 1.8 : 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? AppTheme.primaryGreen.withValues(alpha: 0.4)
                  : Colors.black.withValues(alpha: 0.08),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 13,
              color: isSelected ? Colors.white : AppTheme.darkGreenText,
            ),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : AppTheme.darkGreenText,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveNodeCard(Map<String, dynamic> activeNode) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.primaryGreen, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryGreen.withValues(alpha: 0.12),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceOverlay,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppTheme.borderGreen),
                ),
                child: Icon(
                  activeNode['icon'] as IconData,
                  color: AppTheme.accentGreen,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activeNode['title'] as String,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.darkGreenText,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      activeNode['subtitle'] as String,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppTheme.accentGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => _navigateToRoute(activeNode['route'] as String),
                icon: const Icon(Icons.arrow_forward, size: 14),
                label: const Text('ACCEDER', style: TextStyle(fontSize: 11)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            activeNode['description'] as String,
            style: const TextStyle(
              fontSize: 12,
              color: AppTheme.textMuted,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'MÓDULOS DEL PORTAFOLIO',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: AppTheme.darkGreenText,
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.6,
          ),
          itemCount: _stationNodes.length,
          itemBuilder: (context, index) {
            final node = _stationNodes[index];
            final isSelected = _selectedNodeIndex == index;

            return InkWell(
              onTap: () {
                setState(() {
                  _selectedNodeIndex = index;
                });
                _navigateToRoute(node['route'] as String);
              },
              borderRadius: BorderRadius.circular(12),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isSelected ? AppTheme.surfaceOverlay : AppTheme.surfaceCard,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? AppTheme.primaryGreen : AppTheme.borderGreen,
                    width: isSelected ? 1.6 : 1.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      node['icon'] as IconData,
                      color: isSelected ? AppTheme.accentGreen : AppTheme.primaryGreen,
                      size: 22,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      node['title'] as String,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.darkGreenText,
                      ),
                    ),
                    Text(
                      node['subtitle'] as String,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 9,
                        color: AppTheme.accentGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
