import 'package:flutter/material.dart';
import 'package:cvpr_face_recognition/features/settings/settings.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.settings_outlined, size: 20),
            const SizedBox(width: 8),
            Text("Settings", style: theme.textTheme.headlineSmall),
          ],
        ),
      ),
      body: const _SettingsViewBody(),
    );
  }
}

class _SettingsViewBody extends StatelessWidget {
  const _SettingsViewBody();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        children: [
          _AccountSection(),
          SizedBox(height: 16),
          _DetectionSettingsSection(),
          SizedBox(height: 16),
          _PrivacyAndSecuritySection(),
          SizedBox(height: 16),
          _NotificationsSection(),
          SizedBox(height: 16),
          _DisplaySettingsSection(),
          SizedBox(height: 16),
          _PerformanceSection(),
          SizedBox(height: 16),
          _AppInformationSection(),
        ],
      ),
    );
  }
}

class _AppInformationSection extends StatelessWidget {
  const _AppInformationSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.info_outline_rounded, size: 20),
                const SizedBox(width: 8),
                Text("App Information", style: theme.textTheme.headlineSmall),
              ],
            ),
            const SizedBox(height: 16),
            const _CustomListTile(title: "Version", value: "1.0.0"),
            const SizedBox(height: 8),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 8),
            const _CustomListTile(title: "Database Size", value: "24.5 MB"),
            const SizedBox(height: 8),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 8),
            const _CustomListTile(title: "Total Recognitions", value: "1,247"),
            const SizedBox(height: 8),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 8),
            const _CustomListTile(title: "Unique Individuals", value: "89"),
            const SizedBox(height: 8),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 20),
            const _CustomListTile(title: "Last Backup", value: "2 hours ago"),
            const SizedBox(height: 36),
            SettingsActionButton(title: "Export Data", onPressed: () {}),
            const SizedBox(height: 12),
            SettingsActionButton(title: "Backup Settings", onPressed: () {}),
            const SizedBox(height: 12),
            SettingsActionButton(title: "Check for Updates", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class _PerformanceSection extends StatelessWidget {
  const _PerformanceSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsetsGeometry.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.camera_alt_outlined, size: 20),
                const SizedBox(width: 8),
                Text("Performance", style: theme.textTheme.headlineSmall),
              ],
            ),
            const SizedBox(height: 16),
            SettingsDropdown(
              title: "Camera Resolution",
              subtitle: "Higher resolution uses more battery",
              initialSelection: "720p",
              entries: const [
                DropdownMenuEntry(label: "480p (Low)", value: "480p"),
                DropdownMenuEntry(label: "720p (Medium)", value: "720p"),
                DropdownMenuEntry(label: "1080p (High)", value: "1080p"),
              ],
              onSelected: (value) {},
            ),
            const SizedBox(height: 20),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 20),
            SettingsDropdown(
              title: "Processing Quality",
              subtitle:
                  "Higher quality improves accuracy but uses more resources",
              initialSelection: "medium",
              entries: const [
                DropdownMenuEntry(label: "Low (Fast)", value: "low"),
                DropdownMenuEntry(label: "Medium (Balanced)", value: "medium"),
                DropdownMenuEntry(label: "High (Accurate)", value: "high"),
              ],
              onSelected: (value) {},
            ),
            const SizedBox(height: 20),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 20),
            SettingsToggleTile(
              title: "Battery Optimization",
              subtitle: "Reduce processing to save battery",
              value: false,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}

class _DisplaySettingsSection extends StatelessWidget {
  const _DisplaySettingsSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsetsGeometry.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.phone_iphone_outlined, size: 20),
                const SizedBox(width: 8),
                Text("Display Settings", style: theme.textTheme.headlineSmall),
              ],
            ),
            const SizedBox(height: 16),
            SettingsToggleTile(
              leading: Icon(
                isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
                size: 20,
              ),
              title: "Dark Mode",
              subtitle: "Switch to ${isDark ? 'Light' : 'Dark'} theme",
              value: theme.brightness == Brightness.dark,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 20),
            SettingsToggleTile(
              title: "Show Confidence %",
              subtitle: "Display confidence percentage on detections",
              value: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 20),
            SettingsToggleTile(
              title: "Show Bounding Boxes",
              subtitle: "Display boxes around detected faces",
              value: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 20),
            SettingsSliderTile(
              title: "Overlay Opacity",
              subtitle: "Transparency of detection overlays",
              value: 80,
              min: 20,
              max: 100,
              divisions: 8,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationsSection extends StatelessWidget {
  const _NotificationsSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsetsGeometry.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.notifications_outlined, size: 20),
                const SizedBox(width: 8),
                Text("Notifications", style: theme.textTheme.headlineSmall),
              ],
            ),
            const SizedBox(height: 16),
            SettingsToggleTile(
              title: "Enable Notifications",
              subtitle: "Receive alerts for recognition events",
              value: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 20),
            SettingsToggleTile(
              title: "Recognition Alerts",
              subtitle: "Alert when a person is recognized",
              value: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 20),
            SettingsToggleTile(
              title: "Sound Alerts",
              subtitle: "Play sound when face is recognized",
              value: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 20),
            SettingsToggleTile(
              title: "Vibration Alerts",
              subtitle: "Vibrate when face is recognized",
              value: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 20),
            SettingsToggleTile(
              title: "Low Confidence Alerts",
              subtitle: "Alert for low confidence detections",
              value: false,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}

class _PrivacyAndSecuritySection extends StatelessWidget {
  const _PrivacyAndSecuritySection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.shield_outlined, size: 20),
                const SizedBox(width: 8),
                Text(
                  "Privacy & Security",
                  style: theme.textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(height: 16),
            SettingsDropdown(
              title: "Data Retention Period",
              subtitle: "How long to keep recognition data",
              initialSelection: "7D",
              entries: const [
                DropdownMenuEntry(label: "7 Days", value: "7D"),
                DropdownMenuEntry(label: "1 Month", value: "1M"),
                DropdownMenuEntry(label: "6 Months", value: "6M"),
                DropdownMenuEntry(label: "1 Year", value: "1Y"),
              ],
              onSelected: (value) {},
            ),
            const SizedBox(height: 20),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 20),
            SettingsToggleTile(
              title: "Anonymize Data",
              subtitle: "Remove personal identifiers from stored data",
              value: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 20),
            SettingsToggleTile(
              title: "Encrypt Data",
              subtitle: "Encrypt all stored recognition data",
              value: false,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 20),
            SettingsToggleTile(
              title: "Biometric Authentication",
              subtitle: "Use fingerprint or face to unlock",
              value: false,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 20),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                textStyle: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                foregroundColor: isDark
                    ? const Color(0xFFF8FAFC)
                    : const Color(0xFFF8FAFC),
                backgroundColor: isDark
                    ? const Color(0xFF7F1D1D)
                    : const Color(0xFFEF4444),
              ),
              icon: const Icon(Icons.delete_outline, size: 20),
              label: const Text("Clear All Data"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _DetectionSettingsSection extends StatelessWidget {
  const _DetectionSettingsSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.remove_red_eye_outlined, size: 20),
                const SizedBox(width: 8),
                Text(
                  "Detection Settings",
                  style: theme.textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(height: 16),
            SettingsToggleTile(
              title: "Face Detection",
              subtitle: "Enable real-time face recognition",
              value: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 20),
            SettingsSliderTile(
              title: "Confidence Treshold",
              subtitle: "Minimum confidence for positive identification",
              value: 100,
              min: 50,
              max: 100,
              divisions: 10,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 20),
            SettingsSliderTile(
              title: "Detection Sensitivity",
              subtitle: "How sensitive the face detection algorithm is",
              value: 75,
              min: 25,
              max: 100,
              divisions: 15,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 20),
            SettingsToggleTile(
              title: "Real-time Processing",
              subtitle: "Process faces as they appear in the camera",
              value: true,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountSection extends StatelessWidget {
  const _AccountSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person_outline, size: 20),
                const SizedBox(width: 8),
                Text("Account", style: theme.textTheme.headlineSmall),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Name",
              style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
            ),
            Text("John Doe", style: theme.textTheme.bodyLarge),
            const SizedBox(height: 16),
            Text(
              "Email",
              style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
            ),
            Text("john.doe@example.com", style: theme.textTheme.bodyLarge),
            const SizedBox(height: 16),
            Text(
              "Role",
              style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
            ),
            Text("Administrator", style: theme.textTheme.bodyLarge),
            const SizedBox(height: 16),
            FilledButton(
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(
                    color: isDark
                        ? const Color(0xFF334155)
                        : const Color(0xFFE2E8F0),
                    width: 1.0,
                  ),
                ),
                backgroundColor: Colors.transparent,
              ),
              onPressed: () {},
              child: Text(
                "Edit Profile",
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String value;
  const _CustomListTile({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SettingsListTile(
      title: title,
      trailing: Text(
        value,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: theme.textTheme.bodyMedium?.color,
        ),
      ),
    );
  }
}
