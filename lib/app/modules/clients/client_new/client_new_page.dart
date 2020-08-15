import 'package:brasil_fields/brasil_fields.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:siges/shared/widgets/buttons/button_raised_widget.dart';
import '../../../config/app_config.dart';
import 'client_new_controller.dart';

class ClientNewPage extends StatefulWidget {
  final String title;
  final String subtitle;

  const ClientNewPage({
    Key key, 
    this.title = appPageTagClient, 
    this.subtitle = appPageTagFunctionNew
  }) 
  : super(key: key);

  @override
  _ClientNewPageState createState() => _ClientNewPageState();
}

class _ClientNewPageState
    extends ModularState<ClientNewPage, ClientNewController> {
  //use 'controller' variable to access controller

    Widget _buttonSubmit() {
    return ButtonRaisedWidget(
      text: "Enviar",
      textColor: Colors.white,
      buttonColor: Colors.orange,
      onPressed: controller.isFormValid
        ? () async {
          //controller.save();
          var result = await controller.save();
          //print("result: $result");
          if (result) {
            Modular.to.pushReplacementNamed('/client/list');
          } else {
            _flushBar();
            //Modular.to.pushReplacementNamed('/auth');
          }
        }
        : null
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
    var appBar = AppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.title),
          Visibility(
            visible: true,
            child: Text(widget.subtitle,
              style: TextStyle(
                fontSize: 12.0
              ),
            ),
          )
        ],
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back), 
        onPressed: () {
          Modular.to.pushReplacementNamed('/client/list');
        }
      )
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8),
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Observer(
                          name: 'observerEinSsa',
                          builder: (_) {
                            return TextFormField(
                              textDirection: TextDirection.ltr,
                              autofocus: true,
                              onChanged: controller.changeEinSsa,
                              obscureText: false,
                              maxLines: 1,
                              maxLength: 20,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.orange,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'CPF/CNPJ',
                                prefixIcon: Icon(Icons.email,
                                  color: Colors.orange, size: 20),
                                helperText: ' ',
                                errorText: controller.validateEinSsa(),
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                CpfOuCnpjFormatter(),
                              ],
                              
                            );
                          },
                        ),
                        
                        SizedBox(
                          height: 10,
                        ),
                  
                        Observer(
                          name: 'nameObserver',
                          builder: (_) {
                            return TextFormField(
                              onChanged: controller.changeName,
                              obscureText: false,
                              maxLines: 1,
                              maxLength: 30,
                              keyboardType: TextInputType.name,
                              cursorColor: Colors.orange,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Nome',
                                prefixIcon: Icon(Icons.lock,
                                  color: Colors.orange, size: 20),
                                helperText: ' ',
                                errorText: controller.validateName(),
                              ),
                            );
                          },
                        ),
                  
                        SizedBox(
                          height: 20,
                        ),
                  
                        Observer(
                          name: 'emailObserver',
                          builder: (_) {
                            return TextFormField(
                              onChanged: controller.changeEmail,
                              obscureText: false,
                              maxLines: 1,
                              maxLength: 30,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.orange,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'E-mail',
                                prefixIcon: Icon(Icons.email,
                                  color: Colors.orange, size: 20),
                                helperText: ' ',
                                errorText: controller.validateEmail(),
                              ),
                            );
                          },
                        ),
                  
                        SizedBox(
                          height: 20,
                        ),
                  
                        Observer(
                          name: 'submitButtonObserver',
                          builder: (_) {
                            return _buttonSubmit();
                          },
                        ),
                      ],
                    ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
