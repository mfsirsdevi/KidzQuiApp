component {
  loginObject = CreateObject("component", "model.ImageModel");
  
  public any function findImage(any id)
  {
    return loginObject.findImage(id).getResult().media;
  }
}