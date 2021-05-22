import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class ViewPdf extends StatefulWidget {
  final int id;

  const ViewPdf({Key key, this.id}) : super(key: key);
  @override
  _ViewPdfState createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewPdf> {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    int id = widget.id;
    document = await PDFDocument.fromURL(
      "https://rumanian-straighten.000webhostapp.com/repo/PDFs/$id.pdf",
      /* cacheManager: CacheManager(
          Config(
            "customCacheKey",
            stalePeriod: const Duration(days: 2),
            maxNrOfCacheObjects: 10,
          ),
        ), */
    );

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            tooltip: 'Voltar',
            onPressed: () {
              Navigator.pop(context);
              //createAlertDialog(context);
            },
          ), //IconB
          title: Text(
            'trabalho',
            style: TextStyle(fontFamily: 'ChewyRegular', fontSize: 30),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFFC75555),
        ),
        body: Center(
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFC75555)),
                ))
              : PDFViewer(
                  document: document,
                  pickerButtonColor: Color(0xFFC75555),
                  showPicker: false,
                ),
        ),
      ),
    );
  }
}

/*  @override
  Widget build(BuildContext context) {
    int id = widget.id;
    print('/////////// $id');
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'trabalho',
            style: TextStyle(fontFamily: 'ChewyRegular', fontSize: 30),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFFC75555),
        ),
        body: PDF().cachedFromUrl(
          'https://rumanian-straighten.000webhostapp.com/repo/PDFs/$id.pdf',
          placeholder: (progress) => Center(child: Text('$progress %')),
          errorWidget: (error) => Center(
            child: Text(
              error.toString(),
            ),
          ),
        ));
  }
} */
