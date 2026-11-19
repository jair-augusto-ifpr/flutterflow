import '/backend/backend.dart';
import '/components/button/button_widget.dart';
import '/components/form_label/form_label_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cadastro_usuario_model.dart';
export 'cadastro_usuario_model.dart';

class CadastroUsuarioWidget extends StatefulWidget {
  const CadastroUsuarioWidget({super.key});

  static String routeName = 'CadastroUsuario';
  static String routePath = '/cadastroUsuario';

  @override
  State<CadastroUsuarioWidget> createState() => _CadastroUsuarioWidgetState();
}

class _CadastroUsuarioWidgetState extends State<CadastroUsuarioWidget> {
  late CadastroUsuarioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CadastroUsuarioModel());
    _model.nomeTextController ??= TextEditingController();
    _model.nomeFocusNode ??= FocusNode();
    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  InputDecoration _fieldDecoration(String hint) {
    final borderColor = FlutterFlowTheme.of(context).alternate;
    final radius = BorderRadius.circular(8.0);
    return InputDecoration(
      isDense: true,
      hintText: hint,
      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
            font: GoogleFonts.inter(),
            color: FlutterFlowTheme.of(context).secondaryText,
            letterSpacing: 0.0,
          ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: radius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: FlutterFlowTheme.of(context).primary),
        borderRadius: radius,
      ),
      filled: true,
      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
      contentPadding: const EdgeInsets.all(16.0),
    );
  }

  Future<void> _salvar() async {
    if (_model.saving) {
      return;
    }
    final nome = _model.nomeTextController!.text.trim();
    final email = _model.emailTextController!.text.trim();
    if (nome.isEmpty || email.isEmpty) {
      await showDialog(
        context: context,
        builder: (alertContext) {
          return AlertDialog(
            title: const Text('Preencha todas as informações'),
            content: const Text('Nome e email são obrigatórios.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertContext),
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
      return;
    }

    safeSetState(() => _model.saving = true);
    try {
      await UsuariosRecord.collection.doc().set(
            createUsuariosRecordData(
              nome: nome,
              email: email,
              criadoEm: getCurrentTimestamp,
            ),
          );
      _model.nomeTextController?.clear();
      _model.emailTextController?.clear();
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário cadastrado com sucesso')),
      );
      context.safePop();
    } catch (e) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Não foi possível salvar: $e')),
      );
    } finally {
      if (mounted) {
        safeSetState(() => _model.saving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          foregroundColor: FlutterFlowTheme.of(context).primaryText,
          elevation: 0.0,
          title: Text(
            'Cadastro de usuário',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                wrapWithModel(
                  model: _model.nomeLabelModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const FormLabelWidget(label: 'Nome'),
                ),
                TextFormField(
                  controller: _model.nomeTextController,
                  focusNode: _model.nomeFocusNode,
                  decoration: _fieldDecoration('Nome do usuário'),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16.0),
                wrapWithModel(
                  model: _model.emailLabelModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const FormLabelWidget(label: 'Email'),
                ),
                TextFormField(
                  controller: _model.emailTextController,
                  focusNode: _model.emailFocusNode,
                  decoration: _fieldDecoration('email@exemplo.com'),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24.0),
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: _salvar,
                  child: wrapWithModel(
                    model: _model.salvarButtonModel,
                    updateCallback: () => safeSetState(() {}),
                    child: ButtonWidget(
                      iconPresent: false,
                      iconEndPresent: false,
                      content: 'Salvar',
                      variant: 'primary',
                      size: 'large',
                      fullWidth: true,
                      loading: _model.saving,
                      disabled: _model.saving,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
