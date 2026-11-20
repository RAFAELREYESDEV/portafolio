import 'package:flutter/material.dart';
import '../models/comment_model.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _authorController = TextEditingController();
  final _contentController = TextEditingController();

  final List<CommentModel> _comments = [
    CommentModel(
      author: 'Profesor Programación III',
      content: 'Excelente estructuración de widgets y modularidad en rutas.',
      date: DateTime.now().subtract(const Duration(hours: 3)),
    ),
    CommentModel(
      author: 'Compañero UNIMAR',
      content: 'Muy limpia la combinación de verde y blanco, se lee impecable.',
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  @override
  void dispose() {
    _authorController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _addComment() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _comments.insert(
          0,
          CommentModel(
            author: _authorController.text.trim(),
            content: _contentController.text.trim(),
            date: DateTime.now(),
          ),
        );
      });

      _authorController.clear();
      _contentController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('¡Comentario publicado exitosamente!'),
          backgroundColor: AppTheme.darkGreenText,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      appBar: const CustomAppBar(title: 'COMENTARIOS'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'DEJA UN MENSAJE O FEEDBACK',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppTheme.darkGreenText,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 14),

            // Formulario interactivo
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _authorController,
                      style: const TextStyle(color: AppTheme.textMain, fontSize: 13),
                      decoration: InputDecoration(
                        labelText: 'Tu Nombre / Alias',
                        labelStyle: const TextStyle(color: AppTheme.textMuted),
                        prefixIcon: const Icon(Icons.person_outline, color: AppTheme.primaryGreen),
                        filled: true,
                        fillColor: AppTheme.backgroundWhite,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: AppTheme.borderGreen),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: AppTheme.primaryGreen, width: 1.5),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Por favor ingresa tu nombre';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _contentController,
                      maxLines: 3,
                      style: const TextStyle(color: AppTheme.textMain, fontSize: 13),
                      decoration: InputDecoration(
                        labelText: 'Escribe tu comentario...',
                        labelStyle: const TextStyle(color: AppTheme.textMuted),
                        prefixIcon: const Icon(Icons.chat_bubble_outline, color: AppTheme.primaryGreen),
                        filled: true,
                        fillColor: AppTheme.backgroundWhite,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: AppTheme.borderGreen),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: AppTheme.primaryGreen, width: 1.5),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Por favor escribe un mensaje';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _addComment,
                        icon: const Icon(Icons.send, size: 16),
                        label: const Text('PUBLICAR COMENTARIO'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 28),

            // Lista de comentarios
            const Text(
              'MENSAJES RECIBIDOS',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppTheme.darkGreenText,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 12),

            ..._comments.map((comment) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          comment.author,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.darkGreenText,
                          ),
                        ),
                        Text(
                          '${comment.date.day}/${comment.date.month}/${comment.date.year}',
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppTheme.textMuted,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      comment.content,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.textMain,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
