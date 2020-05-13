Class SmartLock.Backend.Tables.ActionHistory Extends %Persistent
{

Property UserFK As SmartLock.Backend.Tables.Users;

Property LockFK As SmartLock.Backend.Tables.Locks;

Property ActionFK As SmartLock.Backend.Tables.Actions;

Property ActionDate As %DateTime;

Storage Default
{
<Data name="ActionHistoryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ActionDate</Value>
</Value>
<Value name="3">
<Value>User</Value>
</Value>
<Value name="4">
<Value>Lock</Value>
</Value>
<Value name="5">
<Value>Action</Value>
</Value>
<Value name="6">
<Value>UserFK</Value>
</Value>
<Value name="7">
<Value>LockFK</Value>
</Value>
<Value name="8">
<Value>ActionFK</Value>
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
