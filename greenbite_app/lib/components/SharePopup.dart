import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ph.dart';

class SharePopup extends StatelessWidget {
  const SharePopup({super.key});

  void _handleShareOption(BuildContext context, String label) {
    Navigator.of(context).pop();
    debugPrint('Shared via $label');
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Share to',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildShareOption(context, 'Messenger', Mdi.facebook_messenger, const Color(0xFF0084FF)),
                _buildShareOption(context, 'WhatsApp', Bi.whatsapp, const Color(0xFF25D366)),
                _buildShareOption(context, 'Copy Link', Mdi.link, const Color(0xFF28df3f)),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildShareOption(context, 'Facebook', Mdi.facebook, const Color(0xFF1877F2)),
                _buildShareOption(context, 'Telegram', Ph.telegram_logo, const Color(0xFF0088CC)),
                const SizedBox(width: 60),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShareOption(BuildContext context, String label, String icon, Color color) {
    return GestureDetector(
      onTap: () => _handleShareOption(context, label),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
            child: Center(
              child: Iconify(icon, size: 30, color: color),
            ),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}