class Data{
  int Players_=0;
  String Question_="";
  Map<String,int> Choices_=new Map<String,int>();

  void add_Choice(String choice){
    Choices_[choice]=0;
  }
  //Data({this.Players_,this.Question_,this.Choices_});
}