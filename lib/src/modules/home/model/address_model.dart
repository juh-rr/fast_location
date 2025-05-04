import 'dart:convert';

class AddressModel {
    String cep;
    String logradouro;
    String? complemento;
    String bairro;
    String localidade;
    String uf;

    AddressModel({
        required this.cep,
        required this.logradouro,
        this.complemento,
        required this.bairro,
        required this.localidade,
        required this.uf,
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
    );

    Map<String, dynamic> toMap() => {
        "cep": cep,
        "logradouro": logradouro,
        "complemento": complemento,
        "bairro": bairro,
        "localidade": localidade,
        "uf": uf,
    };
}