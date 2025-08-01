import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/pages/project_detail_page.dart';
import 'package:mnwr_portfolio/widgets/project_logo.dart';

class ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProjectDetailPage(
                  project: widget.project,
                ),
              ),
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
            child: Container(
              height: 240, // Reduced height since no image
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: _isHovered
                      ? widget.project['color'].withOpacity(0.6)
                      : Colors.white.withOpacity(0.1),
                  width: _isHovered ? 2 : 1,
                ),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: widget.project['color'].withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ]
                    : [],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Project Icon and Category
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProjectLogo(
                              project: widget.project,
                              size: 50,
                              padding: 8,
                              fontSize: 24,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: widget.project['color'].withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color:
                                      widget.project['color'].withOpacity(0.5),
                                ),
                              ),
                              child: Text(
                                widget.project['category'],
                                style: TextStyle(
                                  color: widget.project['color'],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Project Title
                        Text(
                          widget.project['title'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Project Description
                        Text(
                          widget.project['description'],
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 13,
                            height: 1.4,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),

                        // Technologies
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: (widget.project['technologies']
                                  as List<String>)
                              .take(3) // Show only first 3 technologies
                              .map((tech) => Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[800],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      tech,
                                      style: TextStyle(
                                        color: Colors.grey[300],
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
