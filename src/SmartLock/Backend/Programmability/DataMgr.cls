Class SmartLock.Backend.Programmability.DataMgr
{

ClassMethod AddUser(UserObj As SmartLock.Backend.Tables.Users) As %Status
{
    set obj = ##class(SmartLock.Backend.Tables.Users).%New()

    if $LENGTH(UserObj.UserLogin)>0 { set obj.UserLogin = UserObj.UserLogin }
    if $LENGTH(UserObj.UserPassword)>0 { set obj.UserPassword = UserObj.UserPassword }
    if $LENGTH(UserObj.PublicKey)>0 { set obj.PublicKey = UserObj.PublicKey }

    set status = obj.%Save()
    return status
}

}
