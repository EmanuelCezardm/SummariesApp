import 'package:flutter/material.dart';
import 'package:summaries_app/domain/model/user_model.dart';
import 'package:summaries_app/ui/screens/main/home_screen.dart';
import 'package:summaries_app/ui/screens/menu/edit_profile_screen.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:summaries_app/ui/widgets/app_elevated_button.dart';

class ProfileScreen extends StatefulWidget {
  final UserModel user;

  const ProfileScreen({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel get user => widget.user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.blue,
        ),
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(user: user),
            ),
          );
        },
      ),
    );
  }

  Container _buildBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          const Text(
            "Perfil",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          _buildProfileImage(context),
          const SizedBox(
            height: 35,
          ),
          _buildForm(),
        ],
      ),
    );
  }

  Center _buildProfileImage(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 4, color: Theme.of(context).scaffoldBackgroundColor),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 10),
                ),
              ],
              shape: BoxShape.circle,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://img2.gratispng.com/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg",
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 4,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                color: AppColors.blue,
              ),
              child: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildForm() {
    return Column(
      children: [
        TextFormField(
          enabled: false,
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.person_outline,
              color: AppColors.blue,
              size: 40,
            ),
            labelText: 'Nome',
            labelStyle: TextStyle(
              color: AppColors.blue,
            ),
          ),
          initialValue: user.name,
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          enabled: false,
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.phone_android_outlined,
              color: AppColors.blue,
              size: 40,
            ),
            labelText: 'Telefone',
            labelStyle: TextStyle(
              color: AppColors.blue,
            ),
          ),
          initialValue: user.cellPhone,
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          enabled: false,
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.email_outlined,
              color: AppColors.blue,
              size: 40,
            ),
            labelText: 'E-mail',
            labelStyle: TextStyle(
              color: AppColors.blue,
            ),
          ),
          initialValue: user.email,
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          width: double.maxFinite,
          child: AppElevatedButton(
            color: AppColors.lilas,
            fontSize: 24,
            text: 'EDITAR',
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfileScreen(user: user),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  /*Row _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppColors.lilas,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {},
            child: const Text(
              "CANCELAR",
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 2.2,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              primary: AppColors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              "EDITAR",
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 2.2,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }*/
}
