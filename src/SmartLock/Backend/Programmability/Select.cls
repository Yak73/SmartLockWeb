Class SmartLock.Backend.Programmability.Select
{

ClassMethod SelectFromUsers2LocksForUser(ListLocksOfUser, UserLogin As %String) As %Status
{
        set ListLocksOfUser = []
        &sql(
            DECLARE MyCursor CURSOR FOR
            SELECT UserLabelForLock
            INTO :lock
            FROM SmartLock_Backend_Tables.Users2Locks as u2l
            WHERE u2l.UserFK->UserLogin = :UserLogin
        )
        &sql(OPEN MyCursor)
        
        FOR { 
            &sql(FETCH MyCursor)
            if (SQLCODE) quit

            set obj = {"LockName": (lock)}
            do ListLocksOfUser.%Push(obj)
            }
            &sql(CLOSE MyCursor)
            
            quit
}

ClassMethod GetLockIdByLoginAndPwd(LockLogin As %String, LockPassword As %String) As %Integer
{
    &sql(
            SELECT id
            INTO :lockid
            FROM SmartLock_Backend_Tables.Locks as l
            WHERE l.LockLogin = :LockLogin AND l.LockPassword = :LockPassword
        )
    return lockid
}

ClassMethod GetUserIdByLogin(UserLogin As %String) As %Integer
{
    &sql(
            SELECT id
            INTO :userid
            FROM SmartLock_Backend_Tables.Users as u
            WHERE u.UserLogin = :UserLogin
        )
    return userid
}

ClassMethod GetUser2LocksIdByLogin(UserLogin As %String, LockLabel As %String) As %Integer
{
    &sql(
            SELECT id
            INTO :u2lid
            FROM SmartLock_Backend_Tables.Users2Locks as u2l
            WHERE u2l.UserFK->UserLogin = :UserLogin AND u2l.UserLabelForLock = :LockLabel
        )
    return u2lid
}

ClassMethod SelectFromActionHistory(ListOfActions, UserLogin As %String, LockLabel As %String)
{
        set ListOfActions = []
        &sql(
            DECLARE MyCursor CURSOR FOR
            SELECT ah.ActionFK->ActionDescription, ah.ActionDate 
                INTO :actionDesc, :actionDate
            FROM SmartLock_Backend_Tables.ActionHistory as ah
            JOIN SmartLock_Backend_Tables.Users2Locks as u2l 
                ON u2l.LockFK = ah.LockFK
            WHERE ah.UserFK->UserLogin = :UserLogin AND u2l.UserLabelForLock = :LockLabel
        )
        &sql(OPEN MyCursor)
        
        FOR { 
            &sql(FETCH MyCursor)
            if (SQLCODE) quit

            set obj = {"actionDesc": (actionDesc), "actionDate": (actionDate)}
            do ListOfActions.%Push(obj)
            }
            &sql(CLOSE MyCursor)
            
            quit
}

}
