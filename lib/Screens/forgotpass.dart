import 'package:flutter/material.dart';
import 'package:soccer_management/Screens/logIn.dart';
import 'package:soccer_management/Screens/principal.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class ForgotPassPage extends StatelessWidget {
  static String id = 'forgotPassword_page';

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: AppBar(
        backgroundColor: const Color(0xffF4F4F4),
        leading: IconButton(
          color: const Color(0xFF011C53),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.of(context).pop(PrincipalPage.id);
          },
        ),
        /*
         * Texto de inicio sesion
        */
        title: const Text(
          'Recuperar contraseña',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato',
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: sizeScreen.height * .005),
            /*
               * Seccion de formulario
              */
            const Text(
              'Escribe tu correo electronico',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lato',
              ),
            ),
            _textFieldEmail(),
            SizedBox(height: sizeScreen.height * .11),
            _buttonSingIn(context, sizeScreen)
          ],
        ),
      ),
    ));
  }
}

Widget _textFieldEmail() {
  return _textFieldGeneral(
    labelText: 'Correo electronico',
    icon: Icons.email_outlined,
    hintText: 'example@hotmail.com',
    obscureText: true,
    onChanged: () {},
  );
}

Widget _buttonSingIn(BuildContext context, Size size) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: const Color(0xFF011C53),
      padding: const EdgeInsets.symmetric(
        horizontal: 100,
        vertical: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: const Text(
      'Enviar',
      style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato'),
    ),
    onPressed: () {
      //Fañta envio de correo electronico
      AwesomeDialog(
          context: context,
          animType: AnimType.SCALE,
          title: 'Recuperar contraseña',
          body: const Center(
            child: Text(
              '''Se le ha enviado un correo electronico.\nRevise su bandeja de no deseados o la seccion de spam''',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato'),
            ),
          ),
          btnOkColor: const Color(0xFF011C53),
          btnOkText: 'Volver al inicio',
          btnOkOnPress: () {
            Navigator.of(context)
                  .pushNamedAndRemoveUntil(LogInPage.id,
                  (Route<dynamic> route) => false);
          } ,
          )
        .show();
    },
  );
}

/// Clase generica de text labels
// ignore: camel_case_types
class _textFieldGeneral extends StatefulWidget {
  final String labelText; //Texto del label
  final String? hintText; //Texto de muestra
  final TextInputType? keyboardType;
  final IconData icon;
  final Function onChanged;
  final bool obscureText;

  const _textFieldGeneral({
    required this.labelText,
    this.hintText,
    this.keyboardType,
    required this.icon,
    required this.onChanged,
    this.obscureText = false,
  });

  @override
  State<_textFieldGeneral> createState() => _textFieldGeneralState();
}

// ignore: camel_case_types
class _textFieldGeneralState extends State<_textFieldGeneral> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: TextField(
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          labelText: widget.labelText,
          hintText: widget.hintText,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
