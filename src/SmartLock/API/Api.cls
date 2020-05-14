Class SmartLock.API.Api Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
  <Route Url="/registration" Method="POST" Call="Registration"/>
  <Route Url="/authorization" Method="POST" Call="Authorization"/>
  <Route Url="/test" Method="GET" Call="Test"/>
</Routes>
}

/// "Возвращает" (печатает) "this is test"
ClassMethod Test() As %Status
{
    write "this is test"
    Return $$$OK
}

/// Регистрирует юзера с логином login и паролем password, если логин свободен, иначе выводит "Логин занят"
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
        write 1
    }
    Return result
}

/// "Возвращает" (печатает) для юзера с логином login и паролем password "ok" если данные корректны, и "Неправильный Логин или Пароль" иначе
ClassMethod Authorization() As %Status
{
    set obj = {}
    set obj.UserLogin = %request.Get("login")
    set obj.UserPassword = %request.Get("password")
    set correct = ##class(SmartLock.Backend.Programmability.Check).IsCorrectUserLoginAndPwd(obj.UserLogin, obj.UserPassword)
    if (correct)
    {
        write 1
        set result = 1
    }     
    else
    {   
        write "Неправильный Логин или Пароль"
        set result = -1
    }

    Return result
}

/// "Возвращает" (печатает) для юзера с логином UserLogin список его замков (элемент списка - пользовательское название конкретного замка) 
ClassMethod GetListOfLocksForUser(UserLogin) As %Status
{
    do ##class(SmartLock.Backend.Programmability.Select).SelectFromUsers2LocksForUser(.ListOfLocksForUser, UserLogin)
    write ListOfLocksForUser.%ToJSON()
    Return $$$OK
}

}
