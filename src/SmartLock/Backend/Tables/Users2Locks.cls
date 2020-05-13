Class SmartLock.Backend.Tables.Users2Locks Extends %Persistent
{

Property UserFK As SmartLock.Backend.Tables.Users;

Property LockFK As SmartLock.Backend.Tables.Locks;

Property UserLabel As %String;

Property AddDate As %DateTime [ InitialExpression = {$ZDATETIME($NOW(), "YYYYMMDD")} ];

/// [ InitialExpression = {$ZDATETIME($NOW(), "YYYYMMDD")} ];
Storage Default
{
<Data name="Users2LocksDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>User</Value>
</Value>
<Value name="3">
<Value>Lock</Value>
</Value>
<Value name="4">
<Value>UserLabel</Value>
</Value>
<Value name="5">
<Value>AddDate</Value>
</Value>
<Value name="6">
<Value>UserFK</Value>
</Value>
<Value name="7">
<Value>LockFK</Value>
</Value>
</Data>
<DataLocation>^SmartLock.Back77EE.Users2LocksD</DataLocation>
<DefaultData>Users2LocksDefaultData</DefaultData>
<Description>
<![CDATA[[ InitialExpression = {$ZDATETIME($NOW(), "YYYYMMDD")} ];]]></Description>
<IdLocation>^SmartLock.Back77EE.Users2LocksD</IdLocation>
<IndexLocation>^SmartLock.Back77EE.Users2LocksI</IndexLocation>
<StreamLocation>^SmartLock.Back77EE.Users2LocksS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
