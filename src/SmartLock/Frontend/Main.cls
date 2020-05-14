Class SmartLock.FrontEnd.Main Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{
      
       do ..header()
       do ..body()
       do ..footer()
       return $$$OK
}

ClassMethod header() As %Status
{
 &HTML<
   <html>
     <head>
       <script type="text/javascript" src="webix/webix.min.js" ></script>
       <link rel="stylesheet" type="text/css" href="webix/webix.min.css">
       <link rel="stylesheet" href="https://cdn.materialdesignicons.com/2.7.94/css/materialdesignicons.css?v=7.2.0" type="text/css" charset="utf-8">
     </head>

 >
 
 Quit $$$OK
}

ClassMethod body() As %Status
{
   &JS<
    <script type="text/javascript">
  function loadData(){
			
			$$(table).parse(tableData);
		}
		
		var tableData;
		
		var locksTable=[
		{id:1, name:"Замок_1", action:"", history:"View"},
		{id:2, name:"Замок_2", action:"", history:"View"},
		{id:3, name:"Замок_3", action:"", history:"View"}
		]	
		
		var ui_template = {
			rows:[
			{	
				id:"table",
				view:"datatable",
				/*save:"rest->/someUrl",
				url:function(params){
					return webix.ajax("/downloadUrl");
				},*/
				autoConfig:true,
				data:locksTable ,
				css:"webix_data_border webix_header_border",
				columns:[
				{id:"id", width:"100",   header:["Number"]},
				{id:"name",  header:["Название"]},
				{id:"action",   header:["Open"], template:"<img src='./lock.png' style='display: block; margin-left: auto; margin-right: auto; margin-top:5px;' class='opened'/>"},
				{id:"history",  header:["History"]},
				{id:"delete", template:"<input type='button' class='webix_button delete_button' value='Remove'>", header:["Delete"]}
				],
				onClick:{ 
					"opened":function(event, cell, target){
					webix.message("Opened row: "+cell.row); 
					return false;
					},
					"delete_button":function(event, cell, target){
					webix.message("Deleted row: "+cell.row); 
					return false;
					}
				},
			}
			]
				
		};
    
    webix.ready(function(){
      webix.ui(ui_template);
    });
    </script>
  >
}

ClassMethod footer() As %Status
{
 &HTML<
   </body></html>
 >
 Quit $$$OK
}

}
