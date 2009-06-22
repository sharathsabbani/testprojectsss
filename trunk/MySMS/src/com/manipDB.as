package com
{
	import flash.data.SQLConnection;
	import flash.data.SQLMode;
	import flash.data.SQLStatement;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	
	import mx.controls.Alert;
	import mx.core.Application;
	
	public class manipDB
	{
		public function manipDB()
		{
		}
		
		public function init():void {
			 //if(addCnt.databaseFile.exists && addCnt.databaseFile!= null){
			 if(databaseFile.exists && databaseFile!= null){
			
				initializeDB();
				
			} 
			
			else{
				createDatabase(databaseFile, 1);
				
			}
			
		}
		
		  public var ob:Array=new Array();	
			
		  private var _id:int;
		  
		  public var _insertContacts:SQLStatement;

      	  public var _selectContacts:SQLStatement;
		  
     	  private var _name:String;
     
          private var _phone:String;
      	  
      	  public const _counterProduct:int = 1;
      	  
	      [Bindable]
	      public var databaseFile:File = File.documentsDirectory.resolvePath("data.db");
	      
	      public var mysqlConnection:SQLConnection;
	
	      private const CREATE_CONTACTS_TABLE:String =
	
	      "CREATE TABLE contacts (id INTEGER PRIMARY KEY,name TEXT," +
	
	      "phone TEXT);"
	      
	       private var INSERT_CONTACTS:String;
	       
		   private const SELECT_CONTACTS:String = "SELECT name,phone FROM contacts";
		   
			
		   public function createDatabase(databaseFile:File, productCount:int):void {

             if (productCount < 1){

                  productCount = 1;
            } 
            
            if(!databaseFile.exists){

		            mysqlConnection = new SQLConnection();
		
		            mysqlConnection.open(databaseFile, SQLMode.CREATE);
		
		            mysqlConnection.close();
		
		            schemaGeneration();
            }
  		}
      
     	   private function schemaGeneration():void {
      	
	            var sqlStatement:SQLStatement = new SQLStatement();
	
	            mysqlConnection=new SQLConnection();
	
	            sqlStatement.sqlConnection = mysqlConnection;
	
	            mysqlConnection.open(databaseFile);
	
	            sqlStatement.text = CREATE_CONTACTS_TABLE;
	
	            sqlStatement.execute();
	
	            mysqlConnection.close();

      }
      
     	 public function initializeDB():void {
	      		var sqlStatement:SQLStatement = new SQLStatement();
	
	            mysqlConnection=new SQLConnection();
	
	           if(databaseFile.exists && databaseFile!= null){
	            sqlStatement.sqlConnection = mysqlConnection;
	
	            mysqlConnection.open(databaseFile, SQLMode.CREATE);
	
	         //   sqlStatement.text = CREATE_CONTACTS_TABLE;
	            sqlStatement.text = SELECT_CONTACTS;
	         
	
	            sqlStatement.execute();
	
	            mysqlConnection.close();
	            createSelectStatements();
	            
	            
	            Application.application.cnt.dg1.dataProvider = ob;
           }
      	
      }
      
         public function createInsertStatements():void {

            if((Application.application.cnt.addCnt.txt1.text !="")&&(Application.application.cnt.addCnt.txt2.text !="")){

                  _id=0;

                  _name = Application.application.cnt.addCnt.txt1.text;

                 _phone = Application.application.cnt.addCnt.txt2.text;
                 
                  
            		    
			
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
		                        Alert.show("new contact added to phonebook");
            	      }
            	 }
			
				else {Alert.show("Please fill both fields");}
		 }
            
            public function createSelectStatements():void {

                  if(databaseFile.exists ){
                  	
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

      }
      			
			public var _deleteContacts:SQLStatement;
			
			public function createDeleteStatements(event:MouseEvent):void {
				
					if(Application.application.cnt.dg1.selectedItem != null ){
						
					var DELETE_CONTACTS:String = "delete from contacts where phone='"+Application.application.cnt.dg1.selectedItem.phone+"'";
      				
      					
      						
		      				_deleteContacts = new SQLStatement();
		      				
		      				mysqlConnection=new SQLConnection();
		      				
		      				_deleteContacts.sqlConnection = mysqlConnection;
		      				
		      				mysqlConnection.open(databaseFile,SQLMode.CREATE);
		      				
		      				_deleteContacts.text = DELETE_CONTACTS;
		      				
		      				_deleteContacts.execute();
		      				
		      				ob = _deleteContacts.getResult().data;
		      				
		      				createSelectStatements();
		      				 
		      				mysqlConnection.close();
		      				
		      				Alert.show("executed delete statement");
      			  	}
		
      				
      			} 
      			private function clearAll():void {
                  
                  Application.application.cnt.addCnt.txt1.text="";
                  Application.application.cnt.addCnt.txt2.text="";
      		}

	}
}