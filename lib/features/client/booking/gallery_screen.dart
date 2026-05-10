import 'package:atlas_paragliding/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class GalleryScreen extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const GalleryScreen({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  static Future<void> open(
    BuildContext context, {
    required List<String> images,
    required int initialIndex,
  }) {
    return Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black87,
        pageBuilder: (_, __, ___) => GalleryScreen(
          images: images,
          initialIndex: initialIndex,
        ),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.black87,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.space16),
          child: Column(
            children: [

              // ── TOP BAR ───────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  // Close button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(AppTheme.space8),
                      decoration: BoxDecoration(
                        color: cs.surface.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(AppTheme.rounded40),
                        border: Border.all(
                          color: cs.outline.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        color: cs.onSurface,
                        size: 20,
                      ),
                    ),
                  ),

                  // Counter pill
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.space12,
                      vertical: AppTheme.space6,
                    ),
                    decoration: BoxDecoration(
                      color: cs.surface.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(AppTheme.rounded40),
                      border: Border.all(
                        color: cs.outline.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Text(
                      '${_currentIndex + 1} / ${widget.images.length}',
                      style: AppTheme.paragraphSmMedium.copyWith(
                        color: cs.onSurface,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.space16),

              // ── GALLERY ───────────────────────────────────────
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.images.length,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTheme.space8,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppTheme.rounded40),
                        child: PhotoView(
                          imageProvider: AssetImage(widget.images[index]),
                          // covered = image always fills the container (like BoxFit.cover)
                          // no more black bars
                          minScale: PhotoViewComputedScale.covered,
                          maxScale: PhotoViewComputedScale.covered * 3,
                          backgroundDecoration: const BoxDecoration(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: AppTheme.space16),

              // ── DOT INDICATORS ────────────────────────────────
              if (widget.images.length <= 20)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.images.length, (index) {
                    final isActive = index == _currentIndex;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: isActive ? 20 : 6,
                      height: 6,
                      margin: const EdgeInsets.symmetric(
                        horizontal: AppTheme.space2,
                      ),
                      decoration: BoxDecoration(
                        color: isActive ? cs.primary : cs.outline,
                        borderRadius: BorderRadius.circular(AppTheme.rounded40),
                      ),
                    );
                  }),
                ),
            ],
          ),
        ),
      ),
    );
  }
}