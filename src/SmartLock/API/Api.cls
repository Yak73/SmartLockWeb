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

/// Регистрирует (add) юзера с логином login и паролем password
/// Проверка на ошибку: если логин занят выводит "Логин занят"
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

/// Авторизует (check) юзера с логином login и паролем password
/// Проверка на ошибку: если логин или пароль неправильный выводит "Неправильный логин или пароль"
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
        write "Неправильный логин или пароль"
        set result = -1
    }

    Return result
}

/// "Возвращает" (get) для юзера с логином UserLogin список его замков (элемент списка - пользовательское название конкретного замка) 
/// return list[ {"LockName": LockName}, ...]
ClassMethod GetListOfLocksForUser(UserLogin) As %Status
{
    do ##class(SmartLock.Backend.Programmability.Select).SelectFromUsers2LocksForUser(.ListOfLocksForUser, UserLogin)
    write ListOfLocksForUser.%ToJSON()
    Return $$$OK
}

/// Добавляет (add) связь с замком для юзера 
/// Проверки на ошибку: *нет такого замка *нет такого юзера *для этого юзера уже есть этот замок *общая ошибка при добавлении
ClassMethod AddLockToUser(UserLogin As %String, LockLogin As %String, LockPassword As %String, LockLabelByUser As %String) As %Status
{
    set error = ""
    set LockId = ##class(SmartLock.Backend.Programmability.Select).GetLockIdByLoginAndPwd(LockLogin, LockPassword)
    set UserId = ##class(SmartLock.Backend.Programmability.Select).GetUserIdByLogin(UserLogin)
    if (LockId && UserId)
    {
        set IsUnic = ##class(SmartLock.Backend.Programmability.Check).IsUnicUserToLock(UserId, LockId)
        if IsUnic 
        {
            set CorrectAdd = ##class(SmartLock.Backend.Programmability.DataMgr).AddLockToUser(UserId, LockId, LockLabelByUser)
            if (CorrectAdd)
            {
                write 1
                set result = 1
            }
            else { set error = "Ошибка при добавлении" }
        }
        else { set error = "Такой замок уже есть у пользователя" } 
        
    }     
    else
    {   
        if ('LockId) { set error = "Неправильный логин или пароль замка" }
        if ('UserId) { set error = "Ошибка с поиском пользователя" }
    }

    if $LENGTH(error) > 0 
    {
        write error
        set result = -1
    }

    Return result
}

/// "Возвращает" (get) историю действий с замком для юзера
/// return list[ {"actionDesc": actionDesc,"actionDate": actionDate}, ...]
ClassMethod ViewHistory(UserLogin As %String, LockLabel As %String) As %Status
{
    do ##class(SmartLock.Backend.Programmability.Select).SelectFromActionHistory(.ListOfActions, UserLogin, LockLabel)
    write ListOfActions.%ToJSON()
    Return $$$OK
}

}
