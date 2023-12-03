import 'packages.dart';

class LoginPage extends StatefulWidget {
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool noAuth = false;
  late String auth;
  String lebal = "email or phone";
  String phonepattern = r'(^(?:[+0]9)?[0-9]{10,12}$)',
      emailpattern =
          (r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  bool hidden = true;
  GlobalKey<FormState> Login = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Login Page"),
        centerTitle: true,
      ),
      body: InkWell(
        child: Form(
          key: Login,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 150, top: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      users.forEach((user) {
                        if (value != user.auth) {
                          setState(() {
                            noAuth = true;
                          });
                        }
                      });
                      if (value!.isEmpty) {
                        return "غلطان خالي ";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          noAuth = false;
                        });
                      }
                      if (RegExp(emailpattern).hasMatch(value))
                        setState(() {
                          lebal = "email";
                        });
                      else if (RegExp(phonepattern).hasMatch(value)) {
                        setState(() {
                          lebal = "phone";
                        });
                      } else {
                        setState(() {
                          lebal = "email or phone";
                        });
                      }
                      users.forEach(
                        (user) {
                          if (value == user.auth) {
                            setState(() {
                              noAuth = false;
                              auth = user.GetPass;
                            });
                          }
                        },
                      );
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        iconColor: Colors.blueAccent,
                        focusColor: Colors.blueAccent,
                        prefixIcon: Icon(Icons.person),
                        labelText: lebal,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        iconColor: Colors.blueAccent,
                        focusColor: Colors.blueAccent,
                        suffixIcon: IconButton(
                            padding: EdgeInsets.all(5),
                            onPressed: () {
                              setState(() {
                                hidden ? hidden = false : hidden = true;
                              });
                            },
                            icon: hidden
                                ? Icon(
                                    Icons.visibility_off,
                                  )
                                : Icon(
                                    Icons.visibility,
                                  )),
                        prefixIcon: Icon(Icons.key),
                        labelText: "password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    obscureText: hidden,
                    validator: (value) {
                      if (value != auth || value!.isEmpty) {
                        return "غلطان خالي";
                      }
                      return null;
                    },
                  ),
                ),
                Column(
                  children: [
                    MaterialButton(
                        textColor: Colors.white,
                        color: Colors.blueAccent,
                        onPressed: () {
                          if (Login.currentState!.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => First()));
                          }
                        },
                        child: Text("Login")),
                    MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignupPage()));
                        },
                        child: Text("Don't have an Account!?"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class First extends StatefulWidget {
  State<First> createState() => _First();
}

List<Medicine> filteredMedicines = medicines;

class _First extends State<First> {
  List item = [
    {"title": "All"},
    {"title": "Pain reliever"},
    {"title": "Asthma medication"},
    {"title": "Blood pressure medication"},
    {"title": "Diabetes medication"},
    {"title": "Antidepressant"},
    {"title": "Anti-anxiety medication"},
    {"title": "Antibiotic"},
  ];

  String selectedCategory = "All";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Choosing Page"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            child: ListView(
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        filteredMedicines = medicines;
                      });
                      {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MedicinesPage()));
                      }
                    },
                    child: Container(
                      height: 200,
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                                color: Colors.blueAccent[100],
                                child: Icon(Icons.abc)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              item[0]['title'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            )
                          ],
                        ),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  itemCount: item.length - 1,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedCategory = item[index + 1]['title'];
                            filteredMedicines = medicines.where((medicine) =>
                                    medicine.category == selectedCategory)
                                .toList();
                        
                        });
                        {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MedicinesPage()));
                        }
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                                color: Colors.blueAccent[100],
                                child: Icon(Icons.abc)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              item[index + 1]['title'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                )
              ],
            ),
          ),
        ));
  }
}
