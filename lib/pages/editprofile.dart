import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final String address;
  final String contact;
  final String birthdate;

  const EditProfilePage({
    super.key,
    required this.address,
    required this.contact,
    required this.birthdate,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController addressController;
  late TextEditingController contactController;
  late TextEditingController birthdateController;

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController(text: widget.address);
    contactController = TextEditingController(text: widget.contact);
    birthdateController = TextEditingController(text: widget.birthdate);
  }

  void _saveChanges() {
    Navigator.pop(context, {
      'address': addressController.text,
      'contact': contactController.text,
      'birthdate': birthdateController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: contactController,
              decoration: const InputDecoration(labelText: 'Contact Info'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: birthdateController,
              decoration: const InputDecoration(labelText: 'Birthdate'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: _saveChanges, child: const Text("Save")),
          ],
        ),
      ),
    );
  }
}
