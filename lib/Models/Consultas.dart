// To parse this JSON data, do
//
//     final consulta = consultaFromJson(jsonString);

import 'dart:convert';

List<Consulta> consultaFromJson(String str) =>
    List<Consulta>.from(json.decode(str).map((x) => Consulta.fromJson(x)));

String consultaToJson(List<Consulta> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Consulta {
  String nombre;
  String fechaNacimiento;
  String motivo;
  String fechaConsulta;
  String nivelConsulta;
  SiguentePaso? siguentePaso;
  String descripcionConsulta;
  List<PruebasClinica> pruebasClinicas;
  String recomendaciones;

  Consulta({
    required this.nombre,
    required this.fechaNacimiento,
    required this.motivo,
    required this.fechaConsulta,
    required this.nivelConsulta,
    this.siguentePaso,
    required this.descripcionConsulta,
    required this.pruebasClinicas,
    required this.recomendaciones,
  });

  factory Consulta.fromJson(Map<String, dynamic> json) => Consulta(
        nombre: json["nombre"],
        fechaNacimiento: json["fecha_nacimiento"],
        motivo: json["motivo"],
        fechaConsulta: json["fecha_consulta"],
        nivelConsulta: json["nivel_consulta"],
        siguentePaso: json["siguente_paso"] == null
            ? null
            : SiguentePaso.fromJson(json["siguente_paso"]),
        descripcionConsulta: json["descripcion_consulta"],
        pruebasClinicas: List<PruebasClinica>.from(
            json["pruebas_clinicas"].map((x) => PruebasClinica.fromJson(x))),
        recomendaciones: json["recomendaciones"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "fecha_nacimiento": fechaNacimiento,
        "motivo": motivo,
        "fecha_consulta": fechaConsulta,
        "nivel_consulta": nivelConsulta,
        "siguente_paso": siguentePaso?.toJson(),
        "descripcion_consulta": descripcionConsulta,
        "pruebas_clinicas":
            List<dynamic>.from(pruebasClinicas.map((x) => x.toJson())),
        "recomendaciones": recomendaciones,
      };
}

class PruebasClinica {
  String orden;
  String titulo;
  List<Paso> pasos;
  bool complete;
  String tiempoEsperaAprox;

  PruebasClinica({
    required this.orden,
    required this.titulo,
    required this.pasos,
    required this.complete,
    required this.tiempoEsperaAprox,
  });

  factory PruebasClinica.fromJson(Map<String, dynamic> json) => PruebasClinica(
        orden: json["orden"],
        titulo: json["titulo"],
        pasos: List<Paso>.from(json["pasos"].map((x) => Paso.fromJson(x))),
        complete: json["complete"],
        tiempoEsperaAprox: json["tiempo_espera_aprox"],
      );

  Map<String, dynamic> toJson() => {
        "orden": orden,
        "titulo": titulo,
        "pasos": List<dynamic>.from(pasos.map((x) => x.toJson())),
        "complete": complete,
        "tiempo_espera_aprox": tiempoEsperaAprox,
      };
}

class Paso {
  int orden;
  String descripcion;
  bool complete;

  Paso({
    required this.orden,
    required this.descripcion,
    required this.complete,
  });

  factory Paso.fromJson(Map<String, dynamic> json) => Paso(
        orden: json["orden"],
        descripcion: json["descripcion"],
        complete: json["complete"],
      );

  Map<String, dynamic> toJson() => {
        "orden": orden,
        "descripcion": descripcion,
        "complete": complete,
      };
}

class SiguentePaso {
  String descripcion;
  String estimado;

  SiguentePaso({
    required this.descripcion,
    required this.estimado,
  });

  factory SiguentePaso.fromJson(Map<String, dynamic> json) => SiguentePaso(
        descripcion: json["descripcion"],
        estimado: json["estimado"],
      );

  Map<String, dynamic> toJson() => {
        "descripcion": descripcion,
        "estimado": estimado,
      };
}
