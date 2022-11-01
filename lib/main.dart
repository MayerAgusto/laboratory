import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:laboratory/objects/Paciente.dart';
import 'package:laboratory/objects/Revision.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Laboratorio 03'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Paciente> _pacientes = <Paciente>[
    new Paciente(
        nombres: "Jhon Carter",
        dni: "74362544",
        estatura: 1.75,
        direccion: "Av. Victor Andres Belaunde #225",
        lat: 14.45,
        long: 75.52),
    new Paciente(
        nombres: "Michael Carter",
        dni: "4036251",
        estatura: 1.55,
        direccion: "Av. Pampa de camarones - 45",
        lat: 20.45,
        long: 18.52),
  ];

  Widget _FormChequeo(BuildContext context) {
    TextEditingController peso = TextEditingController();
    TextEditingController temperatura = TextEditingController();
    TextEditingController presion = TextEditingController();
    TextEditingController saturacion = TextEditingController();
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text("Ingrese nuevo chequeo",
                style: Theme.of(context).textTheme.bodyLarge),
            TextFormField(
                controller: peso,
                decoration: InputDecoration(hintText: "Peso")),
            TextFormField(
                controller: temperatura,
                decoration: InputDecoration(hintText: "Temperatura")),
            TextFormField(
                controller: presion,
                decoration: InputDecoration(hintText: "Presion")),
            TextFormField(
                controller: saturacion,
                decoration: InputDecoration(hintText: "Saturacion")),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Wrap(
                children: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Atras")),
                  RaisedButton(
                    onPressed: () => {
                      setState(() {
                        Navigator.of(context).pop();
                      })
                    },
                    child: const Text("Guardar"),
                  )
                ],
              ),
            )
          ]),
        )
      ],
    );
  }

  Widget _FormBuilder(BuildContext context) {
    TextEditingController nombres = TextEditingController();
    TextEditingController dni = TextEditingController();
    TextEditingController estatura = TextEditingController();
    TextEditingController direccion = TextEditingController();
    TextEditingController lat = TextEditingController();
    TextEditingController long = TextEditingController();

    return SimpleDialog(contentPadding: EdgeInsets.zero, children: [
      Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Ingrese datos del usuario",
                style: Theme.of(context).textTheme.bodyLarge),
            TextFormField(
                controller: nombres,
                decoration: InputDecoration(hintText: "Nombre")),
            TextFormField(
                controller: dni, decoration: InputDecoration(hintText: "DNI")),
            TextFormField(
                controller: estatura,
                decoration: InputDecoration(hintText: "Estatura")),
            TextFormField(
                controller: direccion,
                decoration: InputDecoration(hintText: "Direccion")),
            TextFormField(
                controller: lat,
                decoration: InputDecoration(hintText: "Latitud")),
            TextFormField(
                controller: long,
                decoration: InputDecoration(hintText: "Longitud")),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Wrap(
                children: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Atras")),
                  RaisedButton(
                    onPressed: () => {
                      setState(() {
                        _pacientes.add(new Paciente(
                            nombres: nombres.text,
                            dni: dni.text,
                            estatura: double.parse(estatura.text),
                            direccion: direccion.text,
                            lat: double.parse(lat.text),
                            long: double.parse(long.text)));
                        Navigator.of(context).pop();
                      })
                    },
                    child: const Text("Guardar"),
                  )
                ],
              ),
            )
          ],
        ),
      )
    ]);
  }

  Widget _dialogBuilder(BuildContext context, Paciente paciente) {
    return SimpleDialog(contentPadding: EdgeInsets.zero, children: [
      Image.network(
        "https://socialdigital.iadb.org/sites/default/files/2021-02/banner-24_1200x525-v01-01.jpg",
        fit: BoxFit.fill,
      ),
      Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                paciente.nombres,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 18,
              ),
              Text("Estatura: ${paciente.estatura.toString()}"),
              Text("DNI: ${paciente.dni}"),
              Text("Direccion: ${paciente.direccion}"),
              SizedBox(
                height: 150,
                child: ListView.builder(
                    itemCount: paciente.revisiones.length,
                    itemExtent: 60,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Column(children: [
                          Text(paciente.revisiones[index].getPeso.toString()),
                        ]),
                      );
                    }),
              ),
              Align(
                alignment: Alignment.center,
                child: Wrap(
                  children: [
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Atras")),
                    RaisedButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            TextEditingController peso =
                                TextEditingController();
                            TextEditingController temperatura =
                                TextEditingController();
                            TextEditingController presion =
                                TextEditingController();
                            TextEditingController saturacion =
                                TextEditingController();
                            return SimpleDialog(
                              contentPadding: EdgeInsets.zero,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text("Ingrese nuevo chequeo",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge),
                                        TextFormField(
                                            controller: peso,
                                            decoration: InputDecoration(
                                                hintText: "Peso")),
                                        TextFormField(
                                            controller: temperatura,
                                            decoration: InputDecoration(
                                                hintText: "Temperatura")),
                                        TextFormField(
                                            controller: presion,
                                            decoration: InputDecoration(
                                                hintText: "Presion")),
                                        TextFormField(
                                            controller: saturacion,
                                            decoration: InputDecoration(
                                                hintText: "Saturacion")),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Wrap(
                                            children: [
                                              FlatButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Atras")),
                                              RaisedButton(
                                                onPressed: () => {
                                                  setState(() {
                                                    paciente.addRevision(
                                                        new Revision(
                                                            peso: double.parse(
                                                                peso.text),
                                                            temperatura:
                                                                double.parse(
                                                                    temperatura
                                                                        .text),
                                                            presion:
                                                                double.parse(
                                                                    presion
                                                                        .text),
                                                            saturacion: double
                                                                .parse(saturacion
                                                                    .text)));
                                                    Navigator.of(context).pop();
                                                  })
                                                },
                                                child: const Text("Guardar"),
                                              )
                                            ],
                                          ),
                                        )
                                      ]),
                                )
                              ],
                            );
                          }),
                      child: const Text("Chequeo"),
                    )
                  ],
                ),
              )
            ],
          ))
    ]);
  }

  Widget _listPacientesBuilder(BuildContext context, int index) {
    return new GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => _dialogBuilder(context, _pacientes[index])),
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        alignment: Alignment.centerLeft,
        child: Text(
          _pacientes[index].nombres,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pacientes"),
      ),
      body: ListView.builder(
          itemCount: _pacientes.length,
          itemExtent: 60,
          itemBuilder: _listPacientesBuilder),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context, builder: (context) => _FormBuilder(context)),
        tooltip: 'Nuevo Paciente',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
