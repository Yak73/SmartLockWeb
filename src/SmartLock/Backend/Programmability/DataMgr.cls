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

ClassMethod AddLockToUser(UserId As %Integer, LockId As %Integer, LockLabelByUser As %String) As %Status
{
    set obj = ##class(SmartLock.Backend.Tables.Users2Locks).%New()

    if UserId { do obj.UserFKSetObjectId(UserId) }
    if LockId { do obj.LockFKSetObjectId(LockId) }
    if $LENGTH(LockLabelByUser)>0 { set obj.UserLabelForLock = LockLabelByUser }

    set status = obj.%Save()
    return status
}

ClassMethod DeleteLockToUser(UserLogin As %String, LockLabelByUser As %String) As %Status
{
    set idToDel = ##class(SmartLock.Backend.Programmability.Select).GetUser2LocksIdByLogin(UserLogin, LockLabelByUser)
    set status = ##class(SmartLock.Backend.Tables.Users2Locks).%DeleteId(idToDel)

    return status
}

ClassMethod AddOpenActionInHistory(UserId, LockId)
{
    set obj = ##class(SmartLock.Backend.Tables.ActionHistory).%New()

    if UserId { do obj.UserFKSetObjectId(UserId) }
    if LockId { do obj.LockFKSetObjectId(LockId) }
    do obj.ActionFKSetObjectId(1) // Open Action has id = 1

    set status = obj.%Save()
    return status
}

}
