Class SmartLock.Backend.Tables.ActionHistory Extends %Persistent
{

Property UserFK As SmartLock.Backend.Tables.Users;

Property LockFK As SmartLock.Backend.Tables.Locks;

Property ActionFK As SmartLock.Backend.Tables.Actions;

Property ActionDate As %DateTime [ InitialExpression = {$ZDATETIME($NOW(), "YYYYMMDD")} ];

Storage Default
{
<Data name="ActionHistoryDefaultData">
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
<Value>ActionFK</Value>
</Value>
<Value name="5">
<Value>ActionDate</Value>
</Value>
</Data>
<DataLocation>^SmartLock.Ba77EE.ActionHistoryD</DataLocation>
<DefaultData>ActionHistoryDefaultData</DefaultData>
<IdLocation>^SmartLock.Ba77EE.ActionHistoryD</IdLocation>
<IndexLocation>^SmartLock.Ba77EE.ActionHistoryI</IndexLocation>
<StreamLocation>^SmartLock.Ba77EE.ActionHistoryS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
