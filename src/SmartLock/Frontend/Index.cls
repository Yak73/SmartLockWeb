Class SmartLock.FrontEnd.Index Extends %CSP.Page
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
    function submitResult(rawData)
    {
      if (rawData === "ok")
        webix.message({text: 'Successfully saved', type: 'success'})
      else
        webix.message({text: 'Error on save' + rawData, type: 'error'})
    }

   	var ui_template = {
			rows:[
			{	width:"500",
				view:"tabbar",
				multiview:true,
				value:"logRegPage",
				options:[
					{id:"log", value:"Log In"},
					{id:"reg", value:"Registration"}
				],
			},
			{
				 animate:true, cells:[
				 {
					 id:"log", view:"form",  elements:[
						{view: "text", width:"500", name: "login", label: "Login"},
						{view: "text", width:"500", name: "password", label: "Password"},
						{view:"button", width:"500", value:"Log In", id:"btn", click:function(){
							var values = this.getFormView().getValues();
							webix.ajax().post("/smartlockapi/registration", values).then(function(response){
								var body = response.text();
									if(body==1){
										webix.message("Successfully logged in");
										// a href => main page
									} else{
										webix.message("Failed to log in");
									}
								}
							);
						}},
						{view:"button", width:"500", value:"Enter", id:"btn", click:function(){
							location.href='main.html';
						}}
				
					]
				 },
				 {
					  id:"reg", view:"form",  elements:[
						{view: "text", width:"500",name: "login", label: "Login"},
						{view: "text", width:"500",name: "password", label: "Password"},
						{view:"button", width:"500",value:"Registration", id:"regButton",
							click:function(){
							var values = this.getFormView().getValues();
							webix.ajax().post("/smartlockapi/registration", values).then(function(response){
								var body = response.text();
									if(body==1){
										webix.message("Successfully registered");
									} else{
										webix.message("Failed to register, please try another login");
									}
								}
							);
						}}
					]
				 }
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
