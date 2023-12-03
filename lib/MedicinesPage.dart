import 'packages.dart';

class MedicinesPage extends StatefulWidget {
  State<MedicinesPage> createState() => _NaserApp();
}

class _NaserApp extends State<MedicinesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Color(0xff182848),
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(),
      body: Container(
        child: ListView.builder(
          itemCount: filteredMedicines.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Card(
                  shadowColor: Colors.blueAccent,
                  child: ListTile(
                      title: Text(filteredMedicines[index].name),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.info, color: Colors.blueAccent),
                      )),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
