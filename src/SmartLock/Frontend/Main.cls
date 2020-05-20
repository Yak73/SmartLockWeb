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
	 <body>

 >
 
 Quit $$$OK
}

ClassMethod body() As %Status
{
   &JS<
    <script type="text/javascript">
    
	var get=location.search;
	var userLogin;
	if(get!=''){
		userLogin = (get.substr(1).split('&'))[0].split('=')[1];
	}
	
		function deleteLock(cell){
			for(var i=0; i &lt; locksTable.length; i++){
				if(locksTable[i].id === cell.row){
					var lockName = locksTable[i].name;
				}
			}
		
			webix.ajax().get("/smartlockapi/delete-lock", lockName).then(function(response){
					if(body == 1){
									webix.message("Successfully deleted");
								} else {
									webix.message("Failed to delete");
								}
			});
		}
		
		function openLock(cell){
			for(var i=0; i &lt; locksTable.length; i++){
				if(locksTable[i].id === cell.row){
					var lockName = locksTable[i].name;
				}
			}

			webix.ajax().get("/smartlockapi/open-lock", lockName).then(function(response){
					if(body == 1){
									webix.message("Successfully opened");
								} else {
									webix.message("Failed to open");
								}
			});
		}
		
		function loadHistory(cell){
			for(var i=0; i &lt; locksTable.length; i++){
				if(locksTable[i].id === cell.row){
					var lockName = locksTable[i].name;
				}
			}

			webix.ajax().get("/smartlockapi/get-history", lockName).then(function(response){
					$$("historyView").parse(response.json());
					$$("historyView").show();
			});
		}
		
		var locksTable=[
		{id:"1", name:"Lock_1", action:"", history:"View"},
		{id:"2", name:"Lock_2", action:"", history:"View"},
		{id:"3", name:"Lock_3", action:"", history:"View"}
		]	
		
		webix.ui({
			width:"400",
			view:"window",
			id:"createForm",
			head:"Create",
			modal:true,
			position:"center",
			body:
			{view:"form", id:"editform", elements:[
				{ view:"text", label:"Login", name:"UserLogin", value : userLogin, readonly : true},
				{ view:"text", width:"400", label:"New lock's login", name:"LockLogin"},
				{ view:"text", label:"New lock's name", name:"LockLabelByUser"},
				{ view:"text", label:"Password", name:"LockPassword"},
				{ cols:[
					{ view:"button", value:"Cancel", click:function(){
						this.getTopParentView().hide(); 
					}},
				{ view:"button", type:"form", value:"Save", click:function(){
					var values = this.getFormView().getValues();
						webix.ajax().post("/smartlockapi/create-lock", values).then(function(response){
							var body = response.text();
								if(body == 1){
									webix.message("Successfully created");
								} else {
									webix.message("Failed to create");
								}
							}
						);
							
					this.getTopParentView().hide(); 
					// reload table
				}}
				]}
			],
			elementsConfig: {
				labelPosition: "top",
			}
			}
		});
		
		webix.ui({
			width:"400",
			view:"window",
			id:"historyView",
			head:"History",
			//data:historyTableData,
			modal:true,
			position:"center",
			body:
			{ view:"form", rows:[
				{view:"datatable", id:"historyForm", columns:[
					{id:"historyView",  header:["Date"]},
					{id:"actionDate",    header:["Action"]},
				]
				},
				{ view:"button", value:"Cancel", click:function(){
						this.getTopParentView().hide(); 
					}},
			]
			}
			
		});
		
		var ui_template = {
			rows:[
			{	
				height:"200",
				id:"table",
				view:"datatable",
				save:"rest->/someUrl",
				// add user's login to params
				url:function(){
					return webix.ajax().get("/smartlockapi/locks-table-for-user", "login=" + userLogin);
				},
				autoConfig:true,
				// remove, must download from url, need to test
				// data:locksTable ,
				css:"webix_data_border webix_header_border",
				columns:[
				{id:"name",  header:["Название"]},
				{id:"action",   header:["Open"], template:"<img src='./lock.png' style='display: block; margin-left: auto; margin-right: auto; margin-top:5px;' class='opened'/>"},
				{id:"history", template:"<input type='button' class='webix_button historyViewClass' value='View'>", header:["History"]},
				{id:"delete", template:"<input type='button' class='webix_button delete_button' value='Remove'>", header:["Delete"]}
				],
				onClick:{ 
					"opened":function(event, cell, target){
						openLock(cell);
						return false;
					},
					"delete_button":function(event, cell, target){
						deleteLock(cell);
						return false;
					},
					"historyViewClass":function(event, cell, target){
						loadHistory(cell);
						return false;
					},
					
				},
			},
			{
				id:"create", view:"form",  elements:[
					{view:"button", width:"500", value:"Create new lock", id:"btn", click:function(){
							 $$("createForm").show();
					}}
				]
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
