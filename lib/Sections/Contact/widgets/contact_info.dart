import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../constants.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  void _copyToClipboard(BuildContext context, String text, String label) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label copied to clipboard'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ContactConstants.infoTitle,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          ContactConstants.infoDescription,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.secondaryText,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 40),
        _buildContactItem(
          context,
          icon: Icons.email_outlined,
          title: ContactConstants.emailLabel,
          value: ContactConstants.email,
          onTap: () =>
              _copyToClipboard(context, ContactConstants.email, 'Email'),
        ),
        const SizedBox(height: 24),
        _buildContactItem(
          context,
          icon: Icons.phone_outlined,
          title: ContactConstants.phoneLabel,
          value: ContactConstants.phone,
          onTap: () =>
              _copyToClipboard(context, ContactConstants.phone, 'Phone'),
        ),
        const SizedBox(height: 24),
        _buildContactItem(
          context,
          icon: Icons.location_on_outlined,
          title: ContactConstants.locationLabel,
          value: ContactConstants.location,
          onTap: () =>
              _copyToClipboard(context, ContactConstants.location, 'Location'),
        ),
        const SizedBox(height: 40),
        _buildAvailabilityCard(),
      ],
    );
  }

  Widget _buildContactItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.secondaryText.withOpacity(0.1),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.accent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: AppColors.accent,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.secondaryText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.copy_outlined,
              color: AppColors.secondaryText.withOpacity(0.7),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvailabilityCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.accent.withOpacity(0.1),
            AppColors.accent.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.accent.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Available for Work',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            ContactConstants.availabilityMessage,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.secondaryText,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
