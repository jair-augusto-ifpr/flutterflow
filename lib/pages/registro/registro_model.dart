import '/components/button/button_widget.dart';
import '/components/form_label/form_label_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'registro_widget.dart' show RegistroWidget;
import 'package:flutter/material.dart';

class RegistroModel extends FlutterFlowModel<RegistroWidget> {
  ///  Local state fields for this page.

  String? email;

  String? password;

  String? confirmPassword;

  String? error;

  ///  State fields for stateful widgets in this page.

  // Model for FormLabel.
  late FormLabelModel formLabelModel1;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // Model for FormLabel.
  late FormLabelModel formLabelModel2;
  // State field(s) for senha widget.
  late FocusNode senhaPasswordVisibilityFocusNode;
  FocusNode? senhaFocusNode;
  TextEditingController? senhaTextController;
  late bool senhaVisibility;
  String? Function(BuildContext, String?)? senhaTextControllerValidator;
  // Model for FormLabel.
  late FormLabelModel formLabelModel3;
  // State field(s) for rsenha widget.
  late FocusNode rsenhaPasswordVisibilityFocusNode;
  FocusNode? rsenhaFocusNode;
  TextEditingController? rsenhaTextController;
  late bool rsenhaVisibility;
  String? Function(BuildContext, String?)? rsenhaTextControllerValidator;
  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for Button.
  late ButtonModel buttonModel2;

  @override
  void initState(BuildContext context) {
    formLabelModel1 = createModel(context, () => FormLabelModel());
    formLabelModel2 = createModel(context, () => FormLabelModel());
    senhaPasswordVisibilityFocusNode = FocusNode();
    senhaVisibility = false;
    formLabelModel3 = createModel(context, () => FormLabelModel());
    rsenhaPasswordVisibilityFocusNode = FocusNode();
    rsenhaVisibility = false;
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    formLabelModel1.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    formLabelModel2.dispose();
    senhaFocusNode?.dispose();
    senhaTextController?.dispose();
    senhaPasswordVisibilityFocusNode.dispose();
    formLabelModel3.dispose();
    rsenhaFocusNode?.dispose();
    rsenhaTextController?.dispose();
    rsenhaPasswordVisibilityFocusNode.dispose();
    buttonModel1.dispose();
    buttonModel2.dispose();
  }
}
