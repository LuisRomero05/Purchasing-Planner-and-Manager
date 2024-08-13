class Note {
  String titulo;
  String descripcion;
  String fecha;
  int? id;
  String etiqueta;
  double precio;

  Note({
    this.id,
    required this.titulo,
    required this.descripcion,
    required this.fecha,
    required this.etiqueta,
    required this.precio,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      titulo: json['titulo'],
      descripcion: json['descripcion'],
      fecha: json['fecha'],
      etiqueta: json['etiqueta'],
      precio: json['precio'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> note = <String, dynamic>{};
    note['titulo'] = titulo;
    note['descripcion'] = descripcion;
    note['fecha'] = fecha;
    note['etiqueta']= etiqueta;
    note['precio']=precio;
    return note;
  }
}