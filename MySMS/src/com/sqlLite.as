package com
 {
	import flash.data.SQLConnection;
	import flash.data.SQLMode;
	import flash.filesystem.File;

	public class sqlLite extends SQLConnection
	{
		import mx.core.Application;
		import mx.skins.halo.ApplicationTitleBarBackgroundSkin;
		
		import mx.collections.ArrayCollection;
		import mx.controls.Alert;
		import flash.data.SQLConnection;
		import flash.events.SQLErrorEvent;
		import flash.events.SQLEvent;
		import flash.data.SQLStatement;
		
		  public var _id:int;
		  
		  public var _insertContacts:SQLStatement;

      	  public var _selectContacts:SQLStatement;
		  
     	  public var _name:String;
     	  
      	  public var _phone:int;
      	  
      	  public const _counterProduct:int = 1;
      	  
	      public var databaseFile:File = File.documentsDirectory.resolvePath("data.db");
	      
	      public var mysqlConnection:SQLConnection;
	
	      public const CREATE_CONTACTS_TABLE:String =
	
	      "CREATE TABLE contacts (id INTEGER PRIMARY KEY,name TEXT," +
	
	      "phone INTEGER);"
	      
	       public var INSERT_CONTACTS:String;
		   public const SELECT_CONTACTS:String = "SELECT * FROM contacts";
		   
			
		public function createDatabase(databaseFile:File, productCount:int):void {

             if ((databaseFile != null) && (databaseFile.exists))

            {
                  databaseFile.deleteFile();
                  //dg1.dataProvider=null;
                  Alert.show("Database Created Successfully.");
            } 
			
			//if(!databaseFile.exists ){
			
            if (productCount < 1){

                  productCount = 1;
            }

            mysqlConnection = new SQLConnection();

            mysqlConnection.open(databaseFile, SQLMode.CREATE);

            mysqlConnection.close();

            schemaGeneration();
      //  }	
      }
      
      public function schemaGeneration():void {
      	
            var sqlStatement:SQLStatement = new SQLStatement();

            mysqlConnection=new SQLConnection();

            sqlStatement.sqlConnection = mysqlConnection;

            mysqlConnection.open(databaseFile, SQLMode.CREATE);

            sqlStatement.text = CREATE_CONTACTS_TABLE;

            sqlStatement.execute();

            mysqlConnection.close();

      }
      
        public function createInsertStatements():void {

            if((Application.application.txt1.text !="")&&(Application.application.txt2.text !="")){

                  _id=0;

                  _name=Application.application.txt1.text;

                  _phone=parseInt(Application.application.txt2.text);

                  if((databaseFile != null) && (databaseFile.exists)) {
                  	
                        INSERT_CONTACTS="INSERT INTO contacts (id, name, phone)" +

                        " VALUES ("+"((SELECT max(id) FROM contacts)+1)"+",'"+_name+"','"+_phone+

                        "');";

                        _insertContacts =new SQLStatement();

                        mysqlConnection=new SQLConnection();

                        _insertContacts.sqlConnection= mysqlConnection;

                        mysqlConnection.open(databaseFile, SQLMode.CREATE);

                        _insertContacts.text = INSERT_CONTACTS;

                        _insertContacts.execute();

                        mysqlConnection.close();

                        createSelectStatements();

                        clearAll();

                  }

                  else {

                        Alert.show("There is no database so please create it First.");
                  }

            } }
            
            public function createSelectStatements():void {

                  _selectContacts =new SQLStatement();

                  mysqlConnection=new SQLConnection();

                  _selectContacts.sqlConnection = mysqlConnection;

                  mysqlConnection.open(databaseFile,SQLMode.READ);

                  _selectContacts.text = SELECT_CONTACTS;

                  _selectContacts.execute();

                  ob=_selectContacts.getResult().data;

                  mysqlConnection.close();

                //  dg1.dataProvider=ob;
                Application.application.cnt.dg1.dataProvider = ob;

      }
      			public var ob:Array=new Array();
            
            public function clearAll():void {
                  
                  Application.application.txt1.text="";
                  Application.application.txt2.text="";
      		}
		
	}
}