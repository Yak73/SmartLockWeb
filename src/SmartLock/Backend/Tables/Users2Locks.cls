Class SmartLock.Backend.Tables.Users2Locks Extends %Persistent
{

Property UserFK As SmartLock.Backend.Tables.Users;

Property LockFK As SmartLock.Backend.Tables.Locks;

Property UserLabelForLock As %String;

Property AddDate As %DateTime [ InitialExpression = {$ZDATETIME($NOW(), "YYYYMMDD")} ];

Storage Default
{
<Data name="Users2LocksDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>UserFK</Value>
</Value>
<Value name="3">
<Value>LockFK</Value>
</Value>
<Value name="4">
<Value>UserLabelForLock</Value>
</Value>
<Value name="5">
<Value>AddDate</Value>
</Value>
</Data>
<DataLocation>^SmartLock.Back77EE.Users2LocksD</DataLocation>
<DefaultData>Users2LocksDefaultData</DefaultData>
<IdLocation>^SmartLock.Back77EE.Users2LocksD</IdLocation>
<IndexLocation>^SmartLock.Back77EE.Users2LocksI</IndexLocation>
<StreamLocation>^SmartLock.Back77EE.Users2LocksS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
