Class SmartLock.Backend.Programmability.Check
{

ClassMethod IsUserLoginExist(Login As %String) As %Boolean
{
    &sql(SELECT COUNT(1) INTO :exist FROM SmartLock_Backend_Tables.Users WHERE UserLogin = :Login)
    if (exist)
    {
        return 1
    }
    else
    {
        return 0
    }
}

ClassMethod IsCorrectUserLoginAndPwd(Login As %String, Pwd As %String) As %Status
{
    &sql(SELECT COUNT(1) INTO :exist FROM SmartLock_Backend_Tables.Users WHERE UserLogin = :Login AND UserPassword = :Pwd)
    if (exist)
    {
        return 1
    }
    else
    {
        return 0
    }
}

}
