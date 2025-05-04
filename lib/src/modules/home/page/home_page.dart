//import 'package:desafio1/src/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
//import 'package:search_cep/search_cep.dart';
import 'package:desafio1/src/services/via_cep_service.dart';
import 'package:desafio1/src/modules/history/page/history_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchCepController = TextEditingController(); //ed de 'var' para 'final'
  bool _loading = false;
  bool _enableField = true;
  String? _result;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _searchCepController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Fast Location"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            tooltip: 'Histórico de pesquisa',
            onPressed: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>HistoryPage(),
                  ),
            ),
          ),
            ],
      ),
      body: SingleChildScrollView(
      padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildSearchCepTextField(),
            _buildSearchCepButton(),
            _buildResultForm()
          ],
        ),
      ),
    );
  }

  Widget _buildSearchCepTextField() {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(labelText: 'Cep'),
      controller: _searchCepController,
      enabled: _enableField,
    );
  }

  Widget _buildSearchCepButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: ElevatedButton(
        onPressed: _searchCep,
        child: _loading ? _circularLoading() : Text('Consultar'),
        style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
  ),
), 
      ),
    );
  }

  void _searching(bool enable) {
    setState(() {
      _result = enable ? '' : _result;
      _loading = enable;
      _enableField = !enable;
    });
  }

  Widget _circularLoading() {
    return SizedBox(
      height: 15.0,
      width: 15.0,
      child: CircularProgressIndicator(),
    );
  }

  Future _searchCep() async {
    _searching(true);

    late var cep = _searchCepController.text;

    var resultCep = await ViaCepService.fetchCep(cep: cep);
    

    setState(() {
      _result = ('${resultCep.logradouro}, ${resultCep.complemento}, ${resultCep.bairro}, ${resultCep.localidade}, ${resultCep.uf} ');
    });
    _searching(false);
  }

  Widget _buildResultForm() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: 
      Text(_result ?? '',
      style: TextStyle(
      fontSize: 20,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold)
      )
    );
  }
  }