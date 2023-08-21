List currentuserData=List.empty(growable: true);

void addcurrentuser( int userid){
  currentuserData.add(userid);
}
void removecurrentuser(){
  currentuserData.clear();
}