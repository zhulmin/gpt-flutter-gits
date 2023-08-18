enum Api {

  
  signIn('/v1/signin'),

  //add api here
  //...

  profile('/v1/users');


  final String path;
  const Api(this.path);
}

