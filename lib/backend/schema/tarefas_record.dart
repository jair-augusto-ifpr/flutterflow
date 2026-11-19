import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TarefasRecord extends FirestoreRecord {
  TarefasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "criadoEm" field.
  DateTime? _criadoEm;
  DateTime? get criadoEm => _criadoEm;
  bool hasCriadoEm() => _criadoEm != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _criadoEm = snapshotData['criadoEm'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tarefas');

  static Stream<TarefasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TarefasRecord.fromSnapshot(s));

  static Future<TarefasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TarefasRecord.fromSnapshot(s));

  static TarefasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TarefasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TarefasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TarefasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TarefasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TarefasRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createTarefasRecordData({
  String? titulo,
  String? descricao,
  DateTime? criadoEm,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
      'descricao': descricao,
      'criadoEm': criadoEm,
    }.withoutNulls,
  );

  return firestoreData;
}

class TarefasRecordDocumentEquality implements Equality<TarefasRecord> {
  const TarefasRecordDocumentEquality();

  @override
  bool equals(TarefasRecord? e1, TarefasRecord? e2) {
    return e1?.titulo == e2?.titulo &&
        e1?.descricao == e2?.descricao &&
        e1?.criadoEm == e2?.criadoEm;
  }

  @override
  int hash(TarefasRecord? e) =>
      const ListEquality().hash([e?.titulo, e?.descricao, e?.criadoEm]);

  @override
  bool isValidKey(Object? o) => o is TarefasRecord;
}
