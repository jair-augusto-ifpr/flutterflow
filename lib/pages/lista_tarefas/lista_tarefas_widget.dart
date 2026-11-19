import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lista_tarefas_model.dart';
export 'lista_tarefas_model.dart';

class ListaTarefasWidget extends StatefulWidget {
  const ListaTarefasWidget({super.key});

  static String routeName = 'ListaTarefas';
  static String routePath = '/listaTarefas';

  @override
  State<ListaTarefasWidget> createState() => _ListaTarefasWidgetState();
}

class _ListaTarefasWidgetState extends State<ListaTarefasWidget> {
  late ListaTarefasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaTarefasModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        foregroundColor: FlutterFlowTheme.of(context).primaryText,
        elevation: 0.0,
        title: Text(
          'Tarefas',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
            child: IconButton(
              tooltip: 'Cadastrar tarefa',
              onPressed: () async {
                context.pushNamed(CadastroTarefaWidget.routeName);
              },
              icon: Icon(
                Icons.add_rounded,
                color: FlutterFlowTheme.of(context).onPrimary,
              ),
              style: IconButton.styleFrom(
                backgroundColor: FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder<List<TarefasRecord>>(
        stream: queryTarefasRecord(
          queryBuilder: (tarefas) =>
              tarefas.orderBy('criadoEm', descending: true),
        ),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  'Não foi possível carregar as tarefas.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final tarefas = snapshot.data!;
          if (tarefas.isEmpty) {
            return Center(
              child: Text(
                'Nenhuma tarefa cadastrada',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                    ),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 24.0),
            itemCount: tarefas.length,
            itemBuilder: (context, index) {
              final tarefa = tarefas[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tarefa.titulo,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        tarefa.descricao,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              font: GoogleFonts.inter(),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      if (tarefa.criadoEm != null) ...[
                        const SizedBox(height: 8.0),
                        Text(
                          dateTimeFormat('dd/MM/yyyy HH:mm', tarefa.criadoEm),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    font: GoogleFonts.inter(),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
