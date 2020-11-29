/*
Edited by-Anuj Jain
*/

import 'PopularItem_modal.dart';

List<PopularItemModal> getPopularItems(){

  List<PopularItemModal> popularitems=new List();
  PopularItemModal popularItemModal=new PopularItemModal();

  popularItemModal.img="Assets/banner8.jpg";
  popularitems.add(popularItemModal);
  popularItemModal=new PopularItemModal();

  popularItemModal.img="Assets/banner1.png";
  popularitems.add(popularItemModal);
  popularItemModal=new PopularItemModal();

  popularItemModal.img="Assets/banner4.jpg";
  popularitems.add(popularItemModal);
  popularItemModal=new PopularItemModal();

  popularItemModal.img="Assets/banner2.jpg";
  popularitems.add(popularItemModal);
  popularItemModal=new PopularItemModal();

  popularItemModal.img="Assets/banner3.jpg";
  popularitems.add(popularItemModal);
  popularItemModal=new PopularItemModal();

  popularItemModal.img="Assets/banner4.jpg";
  popularitems.add(popularItemModal);
  popularItemModal=new PopularItemModal();

  return popularitems;
}