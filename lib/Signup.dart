import 'packages.dart';

class SignupPage extends StatefulWidget {
  State<SignupPage> createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  String lebal = "email or phone";
  String phonepattern = r'(^(?:[+0]9)?[0-9]{10,12}$)',
      emailpattern =
          (r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  bool hidden = true;
  GlobalKey<FormState> signup = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Naser",
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
              title: Text("Sign-up Page"),
              centerTitle: true,
            ),
            body: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      TextFormField(),
                      TextFormField(),
                    ],
                  )
                ],
              ),
            )));
  }
}
