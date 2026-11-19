import '/components/button/button_widget.dart';
import '/components/form_label/form_label_widget.dart';
import '/flutter_flow/flutter_flow_model.dart';
import 'cadastro_tarefa_widget.dart' show CadastroTarefaWidget;
import 'package:flutter/material.dart';

class CadastroTarefaModel extends FlutterFlowModel<CadastroTarefaWidget> {
  late FormLabelModel tituloLabelModel;
  FocusNode? tituloFocusNode;
  TextEditingController? tituloTextController;

  late FormLabelModel descricaoLabelModel;
  FocusNode? descricaoFocusNode;
  TextEditingController? descricaoTextController;

  late ButtonModel salvarButtonModel;
  bool saving = false;

  @override
  void initState(BuildContext context) {
    tituloLabelModel = createModel(context, () => FormLabelModel());
    descricaoLabelModel = createModel(context, () => FormLabelModel());
    salvarButtonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    tituloLabelModel.dispose();
    tituloFocusNode?.dispose();
    tituloTextController?.dispose();
    descricaoLabelModel.dispose();
    descricaoFocusNode?.dispose();
    descricaoTextController?.dispose();
    salvarButtonModel.dispose();
  }
}
