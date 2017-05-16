component {
  
  public any function findImage(any id)
  {
    imgData = new Query();
    imgData.setSQL("SELECT * FROM dbo.Media WHERE mediaId = :id");
    imgData.addParam( name = "id", value = "#arguments.id#", cfsqltype = "cf_sql_varchar" );
    returnValue = imgData.execute();
    return returnValue;
  }
}