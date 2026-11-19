import '/components/button/button_widget.dart';
import '/components/form_label/form_label_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  Local state fields for this page.

  String? email;

  String? password;

  String? error;

  ///  State fields for stateful widgets in this page.

  // Model for FormLabel.
  late FormLabelModel formLabelModel;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // Model for Senha.
  late FormLabelModel senhaModel;
  // State field(s) for Senha widget.
  late FocusNode senhaPasswordVisibilityFocusNode;
  FocusNode? senhaFocusNode;
  TextEditingController? senhaTextController;
  late bool senhaVisibility;
  String? Function(BuildContext, String?)? senhaTextControllerValidator;
  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for Button.
  late ButtonModel buttonModel2;
  // Model for Button.
  late ButtonModel buttonModel3;

  @override
  void initState(BuildContext context) {
    formLabelModel = createModel(context, () => FormLabelModel());
    senhaModel = createModel(context, () => FormLabelModel());
    senhaPasswordVisibilityFocusNode = FocusNode();
    senhaVisibility = false;
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    buttonModel3 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    formLabelModel.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    senhaModel.dispose();
    senhaFocusNode?.dispose();
    senhaTextController?.dispose();
    senhaPasswordVisibilityFocusNode.dispose();
    buttonModel1.dispose();
    buttonModel2.dispose();
    buttonModel3.dispose();
  }
}
