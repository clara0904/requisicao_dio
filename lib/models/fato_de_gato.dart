class FatoDeGato {
  String? fact;
  int? length;

  FatoDeGato({this.fact, this.length});

  factory FatoDeGato.fromJson(Map<String, dynamic> json) {
    return FatoDeGato(
      fact: json['fact'],
      length: json['length'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fact': fact,
      'length': length,
    };
  }
}
