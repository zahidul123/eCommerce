import 'package:ciblecommerce/ProductDetails_OrderList/CategoryWisePList/BlocStates/CategoryListBloc.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/CategoryWisePList/BlocStates/CategoryListEvent.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/CategoryWisePList/BlocStates/CategoryListState.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/CategoryWisePList/Data/modelClass/CategoryResponseModel.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/ProductDetails/UiView/ProductDetailsUi.dart';
import 'package:ciblecommerce/utils/colors.dart';
import 'package:ciblecommerce/widgets/BottomNavigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryWiseData extends StatefulWidget {
  String category_id;

  CategoryWiseData({@required this.category_id});

  @override
  State<StatefulWidget> createState() {
    return Category(category_id);
  }
}

class Category extends State<CategoryWiseData> {
  String category_id;
  TextEditingController searchcontroll = TextEditingController();
  Category(this.category_id);
  List<BookList>mBooklist;
  List<BookList>mTempBooklist;
  CategoryListBloc categoryListBloc;
  bool containershow;
  @override
  void initState() {
    containershow=true;
    mBooklist=List<BookList>();
    mTempBooklist=List<BookList>();
    categoryListBloc = BlocProvider.of<CategoryListBloc>(context);
    categoryListBloc.add(FetchCategoryListEvent(categoryId: category_id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            'Category List',
            style: TextStyle(color: Colors.black),
          )),
      body: Container(
        child: ListView(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xffEFEFEF),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          onChanged: searchProduct,
                          style: TextStyle(color: CustomColors.optimal_black),
                          controller: searchcontroll,
                          decoration: InputDecoration(
                              hintText: "Search",
                              prefixIcon:
                              Icon(Icons.search, color: CustomColors.optimal_black),
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),

            containershow==true?
            Container(
                width:MediaQuery.of(context).size.width ,
                height: MediaQuery.of(context).size.height*.74,
              child: BlocListener<CategoryListBloc, CategoryListState>(
                  listener: (context, state) {
            if (state is CategoryListErrorState) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorResponse),
                ),
              );
            }
          }, child: BlocBuilder<CategoryListBloc, CategoryListState>(
            builder: (context, state) {
              if (state is CategoryListInitialState) {
                return buildLoading();
              } else if (state is CategoryListLoadingState) {
                return buildLoading();
              } else if (state is CategoryListDataLoadState) {
                  this.mBooklist = state.response;
                  return buildCategoryList(mBooklist);

              } else {
                return errorDialog();
              }
            },
          ))):
                Container(child: buildCategoryList(mTempBooklist),)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget errorDialog() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "No data found",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildCategoryList(List<BookList>booklist) {
    return GridView.builder(
        shrinkWrap: false,
        itemCount: booklist.length,
        physics: ScrollPhysics() /*NeverScrollableScrollPhysics()*/,
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 65),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, position) {
          return Container(
            width: 100,
            height: 100,
            child: InkWell(
              child: Card(
                elevation: 5,
                child: Container(
                  height: 50,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                            width: MediaQuery.of(context).size.width * .48,
                            height: MediaQuery.of(context).size.width * .3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('assets/ic_icons/lather.jpg'),
                                ))),
                      ),
                      Expanded(
                        child: Padding(
                          child: FittedBox(
                            child: Text(
                              booklist[position].bookName,
                              style: TextStyle(fontStyle: FontStyle.italic),
                              textAlign: TextAlign.center,
                            ),
                            fit: BoxFit.scaleDown,
                          ),
                          padding: EdgeInsets.all(5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetailsUi(
                            product_id: booklist[position].bookId)));
              },
            ),
          );
        });
  }

  void searchProduct(String value) {
    mTempBooklist.clear();
    if(value!=""){
      mBooklist.forEach((element) {
        if(element.categoryName.toLowerCase().contains(value.toLowerCase())){
          setState(() {
            mTempBooklist.add(element);
          });
        }
      });

      if(mTempBooklist.length>=0){
        setState(() {
          containershow=false;
        });
      }
    }else{
      setState(() {
        containershow=true;
      });
    }


  }
}
