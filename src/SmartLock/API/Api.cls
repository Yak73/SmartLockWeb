Class SmartLock.API.Api Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
  <Route Url="/registration" Method="POST" Call="Registration"/>
  <Route Url="/test" Method="GET" Call="Test"/>
</Routes>
}

ClassMethod Test() As %Status
{
    write "this is test"
    Return $$$OK
}

ClassMethod Registration() As %Status
{
    set obj = {}
    set obj.UserLogin = %request.Get("login")
    set obj.UserPassword = %request.Get("password")
    set busy = ##class(SmartLock.Backend.Programmability.Check).IsUserLoginExist(obj.UserLogin)
    if (busy)
    {
        write "Логин занят"
        set result = -1
    }     
    else
    {
        set result = ##class(SmartLock.Backend.Programmability.DataMgr).AddUser(obj)
        write "ok"
    }
    Return result
}

ClassMethod Authorization() As %Status
{
    set obj = {}
    set obj.UserLogin = %request.Get("login")
    set obj.UserPassword = %request.Get("password")
    set correct = ##class(SmartLock.Backend.Programmability.Check).IsCorrectUserLoginAndPwd(obj.UserLogin, obj.UserPassword)
    if (correct)
    {
        write "ok"
        set result = 0
    }     
    else
    {   
        write "Неправильный Логин или Пароль"
        set result = -1
    }

    Return result
}
