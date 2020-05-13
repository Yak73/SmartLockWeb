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
      id:"tab2_content",
      view:"form",
      width: "400",
      elements:[
        {view: "text", name: "login", label: "Login"},
        {view: "text", name: "password", label: "Password"},
        { view:"button",  value:"Submit", id:"btn", click:function(){
          var values = this.getFormView().getValues();
          var answer = webix.ajax().post("/smartlockapi/registration", values, submitResult);
        }}
    ]};
    
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
