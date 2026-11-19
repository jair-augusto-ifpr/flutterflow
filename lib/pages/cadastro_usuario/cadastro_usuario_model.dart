import '/components/button/button_widget.dart';
import '/components/form_label/form_label_widget.dart';
import '/flutter_flow/flutter_flow_model.dart';
import 'cadastro_usuario_widget.dart' show CadastroUsuarioWidget;
import 'package:flutter/material.dart';

class CadastroUsuarioModel extends FlutterFlowModel<CadastroUsuarioWidget> {
  late FormLabelModel nomeLabelModel;
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;

  late FormLabelModel emailLabelModel;
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;

  late ButtonModel salvarButtonModel;
  bool saving = false;

  @override
  void initState(BuildContext context) {
    nomeLabelModel = createModel(context, () => FormLabelModel());
    emailLabelModel = createModel(context, () => FormLabelModel());
    salvarButtonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    nomeLabelModel.dispose();
    nomeFocusNode?.dispose();
    nomeTextController?.dispose();
    emailLabelModel.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();
    salvarButtonModel.dispose();
  }
}
