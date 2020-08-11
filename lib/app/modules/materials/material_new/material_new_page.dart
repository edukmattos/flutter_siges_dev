import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_select/smart_select.dart';

import '../../../models/units_measure_model.dart';
import 'material_new_controller.dart';

class MaterialNewPage extends StatefulWidget {
  final String title;
  const MaterialNewPage({Key key, this.title = "MaterialNew"})
      : super(key: key);

  @override
  _MaterialNewPageState createState() => _MaterialNewPageState();
  
}

class _MaterialNewPageState
    extends ModularState<MaterialNewPage, MaterialNewController> {
  //use 'controller' variable to access controller

  Widget _submitButton() {
    return RaisedButton(
      child: new Text("ENVIAR", style: new TextStyle(color: Colors.white)),
      color: Colors.orange,
      elevation: 15.0,
      //shape: StadiumBorder(),
      onPressed: controller.isFormValid
          ? () async {
              //controller.save();
              var result = await controller.save();
              //print("result: $result");
              if (result) {
                Modular.to.pushReplacementNamed('/units_measure/list');
              } else {
                _flushBar();
                //Modular.to.pushReplacementNamed('/auth');
              }
            }
          : null,
    );
  }

  Widget _flushBar() {
    return Flushbar(
      title: controller.errorTitle,
      message: controller.errorMsg,
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      //showProgressIndicator: true,
      //progressIndicatorController: controller.errorMsg,
      //progressIndicatorBackgroundColor: Colors.grey[800],
      margin: EdgeInsets.all(0),
      borderRadius: 0,
      backgroundColor: Colors.red,
      icon: Icon(
        Icons.error_outline,
        size: 30.0,
        color: Colors.white,
      ),
      duration: Duration(seconds: 3),
    )..show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(18),
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Observer(
                    name: 'observerCode',
                    builder: (_) {
                      return TextFormField(
                        textDirection: TextDirection.rtl,
                        autofocus: true,
                        onChanged: controller.changeCode,
                        obscureText: false,
                        maxLines: 1,
                        maxLength: 5,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Código',
                            prefixIcon: Icon(Icons.email,
                                color: Colors.orange, size: 20),
                            helperText: ' ',
                            errorText: controller.validateCode()),
                        //validator: (value) {
                        //  if (Validator.required(value)) return 'Obrigatorio.';
                        //  if (Validator.email(value)) return 'Invalido.';
                        //  return null;
                        //}
                      );
                    }),
                SizedBox(
                  height: 10,
                ),
                Observer(
                    name: 'descriptionObserver',
                    builder: (_) {
                      return TextFormField(
                        onChanged: controller.changeDescription,
                        obscureText: false,
                        maxLines: 1,
                        maxLength: 30,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Descrição',
                            prefixIcon: Icon(Icons.lock,
                                color: Colors.orange, size: 20),
                            helperText: ' ',
                            errorText: controller.validateDescription()),
                        //validator: (value) {
                        //  if (Validator.required(value)) return 'Obrigatorio.';
                        //  return null;
                        //}
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                Observer(
                    name: 'materialUnitIdObserver',
                    builder: (_) {
                      return SmartSelect<UnitsMeasureModel>.single(
                        title: 'Unidade',
                        value: controller.unitMeasureSelected,
                        isTwoLine: false,
                        isLoading: false,
                        leading: Container(
                          width: 40,
                          alignment: Alignment.center,
                          child: const Icon(Icons.calendar_today),
                        ),
                        options: SmartSelectOption.listFrom<UnitsMeasureModel,
                                UnitsMeasureModel>(
                            source: controller.unitsMeasureOptions,
                            value: (index, item) => item,
                            title: (index, item) => item.code),
                        choiceType: SmartSelectChoiceType.chips,
                        modalType: SmartSelectModalType.popupDialog,
                        modalConfig: SmartSelectModalConfig(
                          useHeader: true,
                          useConfirmation: true,
                          useFilter: true,
                          headerStyle: SmartSelectModalHeaderStyle(
                            centerTitle: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0)),
                            ),
                          ),
                        ),
                        onChange: controller.changeUnitMeasureSelected,
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                Observer(
                    name: 'obseverDescription',
                    builder: (_) {
                      return TextFormField(
                        onChanged: controller.changeDescription,
                        obscureText: false,
                        maxLines: 1,
                        maxLength: 30,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.orange,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Descrição',
                            prefixIcon: Icon(Icons.lock,
                                color: Colors.orange, size: 20),
                            helperText: ' ',
                            errorText: controller.validateDescription()),
                        //validator: (value) {
                        //  if (Validator.required(value)) return 'Obrigatorio.';
                        //  return null;
                        //}
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                Observer(
                    name: 'submitButtonObserver',
                    builder: (_) {
                      return _submitButton();
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
