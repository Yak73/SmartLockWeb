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

            do ListLocksOfUser.%Push(lock)
            }
            &sql(CLOSE MyCursor)
            
            quit
}

}
