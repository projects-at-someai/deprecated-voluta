import 'package:flutter/material.dart';
import 'package:voluta_digital_trf/ui/palette.dart';
import 'package:voluta_digital_trf/util/models/items/item.dart';
import 'package:voluta_digital_trf/widgets/buttons.dart';
import 'package:voluta_digital_trf/widgets/forms.dart';
import 'package:voluta_digital_trf/widgets/text.dart';

class StudioItemDialog extends StatefulWidget {
  final List<StudioItem> input;
  final String type;
  final String title;
  final String buttonText;
  StudioItemDialog(this.input, this.type, this.title, this.buttonText);

  @override
  _StudioItemDialogState createState() => _StudioItemDialogState();
}

class _StudioItemDialogState extends State<StudioItemDialog> {
  bool showingForm;
  List<StudioItem> items;
  String newItem;
  initState() {
    super.initState();
    this.items = widget.input;
    newItem = "";
    showingForm = false;
  }

  onAddItemPressed() {
    if (showingForm) {
      this.onItemAdded(newItem);
    } else {
      setState(() {
        this.showingForm = true;
      });
    }
  }

  onAddCancelled() {
    setState(() {
      this.newItem = "";
      this.showingForm = false;
    });
  }

  onInputChanged(String value) {
    setState(() {
      this.newItem = value;
    });
  }

  List<Widget> buildForm() => [
        VolutaText.h3("New ${widget.type}"),
        VolutaForms.getTextField(
          newItem,
          onInputChanged,
        )
      ];

  List<Widget> buildList() => items
      .map((item) => Container(
          child: Row(
            children: [
              GestureDetector(
                  onTap: () => onItemRemoved(item),
                  child: Container(
                      alignment: Alignment.center,
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Palette.gold60,
                          )),
                      child:
                          Icon(Icons.close, color: Palette.gold60, size: 32))),
              Container(width: 16),
              VolutaText.h3(item.toString(), color: Palette.white)
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          padding: EdgeInsets.all(16)))
      .toList();

  onItemAdded(String value) {
    StudioItem newItem;
    switch (widget.type) {
      case ("Artist"):
        newItem = new Artist.fromString(value);
        break;
      case ("HealthQuestion"):
        if (!HealthQuestion.isValid(value)) return;
        newItem = new HealthQuestion.fromString(value);
        break;
      case ("LegalClause"):
        if (!LegalClause.isValid(value)) return;
        newItem = new LegalClause.fromString(value);
        break;
      case ("TattooInk"):
        if (!TattooInk.isValid(value)) return;
        newItem = new TattooInk.fromString(value);
        break;
      case ("InkThinner"):
        newItem = new InkThinner.fromString(value);
        break;
      case ("Needle"):
        if (!Needle.isValid(value)) return;
        newItem = new Needle.fromString(value);
        break;
      case ("DisposableTube"):
        newItem = new DisposableTube.fromString(value);
        break;
      case ("DisposableGrip"):
        newItem = new DisposableGrip.fromString(value);
        break;
      case ("Salve"):
        newItem = new Salve.fromString(value);
        break;
      default:
        return;
    }

    setState(() {
      this.items.add(newItem);
      this.showingForm = false;
      this.newItem = "";
    });
  }

  onItemRemoved(StudioItem item) {
    setState(() {
      this.items.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Container(
          width: MediaQuery.of(context).size.width *
              (widget.type == "HealthQuestion" || widget.type == "LegalClause"
                  ? 9 / 10
                  : 2 / 3),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              Container(
                  child: Row(
                children: [
                  VolutaText.h1(widget.title, color: Palette.white),
                  TextButton(
                    child: VolutaText.h2("DONE"),
                    onPressed: () => Navigator.of(context).pop(items),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
              ))
            ]
              ..addAll(showingForm
                  ? buildForm()
                  : [
                      Container(
                          constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * 3 / 4),
                          child: SingleChildScrollView(
                              child: Column(children: buildList())))
                    ])
              ..add(VolutaButtons.primary(context, onAddItemPressed,
                  VolutaText.h2(widget.buttonText, color: Palette.grey80))),
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          decoration: BoxDecoration(
              color: Palette.grey60, borderRadius: BorderRadius.circular(16)),
        )));
  }
}
