import 'package:flutter/material.dart';
import 'editprofile.dart';

// Custom widget to display a profile detail row
class ProfileDetailRow extends StatelessWidget {
  final String title;
  final String value;

  const ProfileDetailRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title: ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String address = "Sitio Minoro, Mambusao, Capiz";
  String contact = "09702251086";
  String birthdate = "October 3, 2003";

  void _editProfile() async {
    final updated = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => EditProfilePage(
              address: address,
              contact: contact,
              birthdate: birthdate,
            ),
      ),
    );

    if (updated != null && mounted) {
      setState(() {
        address = updated['address'];
        contact = updated['contact'];
        birthdate = updated['birthdate'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            // Profile Picture
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://scontent.fceb1-5.fna.fbcdn.net/v/t39.30808-6/481455483_657424106945907_6506517043498877280_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeGr7-voD10Db5vEiO8TEfhUJv38zHJRDvwm_fzMclEO_APryKNOLC1vIAyJvznK7lJ1Uk7jmzakCGT_XtVNetdM&_nc_ohc=zyn8SISqxzoQ7kNvwF1l-u1&_nc_oc=AdkUyNUz_6xVp5g7WhJ9Qgi85fP5ybCtw7IMCVVVZlQ5zLU06IHW4QONk04FgnJqdoo&_nc_zt=23&_nc_ht=scontent.fceb1-5.fna&_nc_gid=uuUX7mR8gKBnkqR0RRN02w&oh=00_AfJOw9heECO-399Ot09Jv0eRkh6R_U1nZAb3d-ulpRWlSg&oe=682C0549',
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "John Benjie Tubongbanua",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "johnbenjie008@gmail.com",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 30),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    ProfileDetailRow(title: "Address", value: address),
                    const Divider(),
                    ProfileDetailRow(title: "Contact Info", value: contact),
                    const Divider(),
                    ProfileDetailRow(title: "Birthdate", value: birthdate),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: _editProfile,
              icon: const Icon(Icons.edit),
              label: const Text("Edit Profile"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
