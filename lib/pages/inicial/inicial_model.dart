import '/components/button/button_widget.dart';
import '/flutter_flow/flutter_flow_model.dart';
import 'inicial_widget.dart' show InicialWidget;
import 'package:flutter/material.dart';

class InicialModel extends FlutterFlowModel<InicialWidget> {
  late ButtonModel usuariosButtonModel;
  late ButtonModel tarefasButtonModel;

  @override
  void initState(BuildContext context) {
    usuariosButtonModel = createModel(context, () => ButtonModel());
    tarefasButtonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    usuariosButtonModel.dispose();
    tarefasButtonModel.dispose();
  }
}
