import 'package:flutter/material.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';

class PerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tela de Perfil",
      home: _PerfilScreen(),
    );
  }
}

class _PerfilScreen extends StatefulWidget {
  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<_PerfilScreen> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.blue,
            ),
            onPressed: () {},
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(children: [
              Text(
                "Perfil",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://img2.gratispng.com/20180331/eow/kisspng-computer-icons-user-clip-art-user-5abf13db298934.2968784715224718991702.jpg",
                              ))),
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
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Column(
                children: [
                  TextFormField(
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
                    keyboardType: TextInputType.name,
                    initialValue: 'Maria Antonella',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
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
                    keyboardType: TextInputType.phone,
                    initialValue: '(82) 99975-0801',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
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
                    keyboardType: TextInputType.emailAddress,
                    initialValue: 'Antonella@gmail.com',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.lilas,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: () {},
                        child: Text("CANCELAR",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white)),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: Text(
                          "SALVAR",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ]),
          ),
        ));
  }
}
