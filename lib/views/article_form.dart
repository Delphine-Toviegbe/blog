import 'dart:convert';
import 'package:blog/models/article.dart';
import 'package:blog/models/category.dart';
import 'package:blog/views/articles.dart';
import 'package:blog/views/nav_bar.dart';
import 'package:blog/views/start1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import '../controllers/api_helper.dart';

class ArticleForm extends StatefulWidget {
  Article? article;
  ArticleForm({Key? key, this.article}) : super(key: key);

  @override
  _ArticleFormState createState() => _ArticleFormState();
}

class _ArticleFormState extends State<ArticleForm> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  int? _category;
  QuillController _controller = QuillController.basic();
  final FocusNode _focusNode = FocusNode();

  List<Category>? _categories;

  void _refetchData() async {
    var data = await APIHelper.getCategories();
    setState(() {
      _categories = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.article != null){
      setState(() {
        _titleController.text = widget.article!.title as String;
        _category = widget.article!.category;
        _controller = QuillController(
            document: Document.fromJson(widget.article!.content!),
            selection: const TextSelection.collapsed(offset: 0)
        );
      });
    }
    _refetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Article"),
        actions: [
          IconButton(
              onPressed: () async {
                if(formKey.currentState!.validate()) {
                  // Save new journal
                  if (widget.article == null) {
                    Article article = Article(
                        title: _titleController.text,
                        category: _category,
                        content: _controller.document.toDelta().toJson()
                    );
                    await APIHelper.createArticle(article);
                  }
                  else{
                    Article article = widget.article!;
                    article.title = _titleController.text;
                    article.category = _category;
                    article.content = _controller.document.toDelta().toJson();
                    await APIHelper.updateArticle(article);
                  }

                  // Clear the text fields
                  _titleController.text = '';
                  _category = null;
                  _controller = QuillController.basic();

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Articles()),
                  );
                }
              },
              icon: const Icon(Icons.save)
          )
        ],
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                  controller: _titleController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(hintText: 'Title'),
                  validator: (String? value){
                    return (value==null || value=="") ? "This field is required" : null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: DropdownButtonFormField(
                  hint: const Text("Category"),
                  value: _category,
                  items: _categories?.map((Category category){
                    return DropdownMenuItem<int>(
                      value: category.id,
                      child: Text(category.name!, style: const TextStyle(color: Colors.black),),
                    );
                  }).toList(),
                  onChanged: (int? v) async{
                    setState(() {
                      _category = v;
                    });
                  },
                  validator: (str) => str==null ? "This field is required" : null,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: QuillEditor(
                    controller: _controller,
                    scrollController: ScrollController(),
                    scrollable: true,
                    focusNode: _focusNode,
                    autoFocus: false,
                    readOnly: false,
                    expands: false,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
              QuillToolbar.basic(controller: _controller),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(selectedIndex: 1),
    );
  }
}
