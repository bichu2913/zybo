part of 'banner_cubit.dart';



abstract class BannerState {}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}
class BannerSuccess extends BannerState {
  final List<Bannerlistingres> data; 

  BannerSuccess(this.data);
}



class BannerFailure extends BannerState {
  final String error;
  BannerFailure(this.error);
}