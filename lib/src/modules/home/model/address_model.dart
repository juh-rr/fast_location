/*class AddressModel {
  late String cep;
  late String publicPlace;
  late String? complement;
  late String neighborhood;
  late String city;
  late String state;

  AddressModel({
    required this.cep,
    required this.publicPlace,
    required this.complement,
    required this.neighborhood,
    required this.city,
    required this.state,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    cep = json["cep"];
    publicPlace = json["logradouro"];
    complement = json["complemento"] ?? '';
    neighborhood = json["bairro"];
    city = json["localidade"];
    state = json["uf"];
  }

  AddressModel.fromJsonLocal(Map<String, dynamic> json) {
    cep = json["cep"];
    publicPlace = json["publicPlace"];
    complement = json["complement"] ?? '';
    neighborhood = json["neighborhood"];
    city = json["city"];
    state = json["state"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["cep"] = cep;
    json["publicPlace"] = publicPlace;
    json["complement"] = complement;
    json["neighborhood"] = neighborhood;
    json["city"] = city;
    json["state"] = state;

    return json;
  }
}*/
import 'dart:convert';

class AddressModel {
    String cep;
    String logradouro;
    String? complemento;
    String bairro;
    String localidade;
    String uf;
    String? unidade;
    String? ibge;
    String? gia;

    AddressModel({
        required this.cep,
        required this.logradouro,
        this.complemento,
        required this.bairro,
        required this.localidade,
        required this.uf,
        this.unidade,
        this.ibge,
        this.gia,
    });

    factory AddressModel.fromJson(String str) => AddressModel.fromMap(json.decode(str));

    factory AddressModel.fromJsonLocal(String str) => AddressModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AddressModel.fromMap(Map<String, dynamic> json) => AddressModel(
        cep: json["cep"],
        logradouro: json["logradouro"],
        complemento: json["complemento"],
        bairro: json["bairro"],
        localidade: json["localidade"],
        uf: json["uf"],
        unidade: json["unidade"],
        ibge: json["ibge"],
        gia: json["gia"],
    );

    Map<String, dynamic> toMap() => {
        "cep": cep,
        "logradouro": logradouro,
        "complemento": complemento,
        "bairro": bairro,
        "localidade": localidade,
        "uf": uf,
        "unidade": unidade,
        "ibge": ibge,
        "gia": gia,
    };
}