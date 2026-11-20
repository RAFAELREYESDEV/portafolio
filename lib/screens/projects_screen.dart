import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  final List<ProjectModel> projects = const [
    ProjectModel(
      title: 'App Calculadora Móvil',
      description:
          'Calculadora aritmética interactiva desarrollada en Flutter con diseño limpio, manejo de estados y teclado personalizado para la materia.',
      technologies: ['Flutter', 'Dart', 'Git', 'GitHub'],
      iconCode: 'calculate',
    ),
    ProjectModel(
      title: 'Portafolio Cyber Station',
      description:
          'Aplicación con interfaz interactiva inspirada en estaciones de comando, implementando rutas nombradas, widgets modulares y paleta verde y blanco.',
      technologies: ['Flutter Web', 'Custom Theme', 'Google Fonts'],
      iconCode: 'space_dashboard',
    ),
    ProjectModel(
      title: 'App de Layouts y Responsive',
      description:
          'Prácticas de diseño adaptable utilizando Column, Row, Stack y MediaQuery para distintas resoluciones de pantalla.',
      technologies: ['Dart', 'Widgets', 'UI/UX'],
      iconCode: 'devices',
    ),
    ProjectModel(
      title: 'Módulo de Gestión y Datos',
      description:
          'Estructura de modelos en POO y serialización de datos para registro de usuarios y control académico.',
      technologies: ['POO', 'Dart Models', 'JSON'],
      iconCode: 'storage',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      appBar: const CustomAppBar(title: 'PROYECTOS & STACK'),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Sección de Stack Tecnológico
          const Text(
            'STACK TECNOLÓGICO',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppTheme.darkGreenText,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _TechChip(name: 'Flutter', icon: Icons.flutter_dash),
              _TechChip(name: 'Dart', icon: Icons.code),
              _TechChip(name: 'Git & GitHub', icon: Icons.merge_type),
              _TechChip(name: 'VS Code', icon: Icons.terminal),
              _TechChip(name: 'POO', icon: Icons.account_tree),
              _TechChip(name: 'Material UI', icon: Icons.layers),
            ],
          ),
          const SizedBox(height: 28),

          // Lista de proyectos
          const Text(
            'PROYECTOS DESTACADOS',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppTheme.darkGreenText,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 14),

          ...projects.map((project) => _buildProjectCard(project)),
        ],
      ),
    );
  }

  Widget _buildProjectCard(ProjectModel project) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceOverlay,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.folder_outlined,
                  color: AppTheme.accentGreen,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  project.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkGreenText,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            project.description,
            style: const TextStyle(
              fontSize: 13,
              color: AppTheme.textMain,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: project.technologies
                .map(
                  (tech) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceOverlay,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppTheme.borderGreen),
                    ),
                    child: Text(
                      tech,
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppTheme.darkGreenText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  final String name;
  final IconData icon;

  const _TechChip({required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.surfaceCard,
        borderRadius: BorderRadius.circular(20),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppTheme.primaryGreen, size: 16),
          const SizedBox(width: 6),
          Text(
            name,
            style: const TextStyle(
              fontSize: 12,
              color: AppTheme.darkGreenText,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
