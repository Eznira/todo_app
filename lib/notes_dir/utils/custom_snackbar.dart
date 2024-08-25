import 'package:flutter/material.dart';

class CustomSnackbar extends StatefulWidget {
  const CustomSnackbar({Key? key, required this.overlayEntry})
      : super(key: key);

  final OverlayEntry overlayEntry;

  @override
  State<CustomSnackbar> createState() => _CustomSnackbarState();
}

class _CustomSnackbarState extends State<CustomSnackbar> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        widget.overlayEntry.remove(); // Remove the overlay entry directly
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20.0,
      left: 10.0,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Copied to Clipboard!"),
          ),
        ),
      ),
    );
  }
}
