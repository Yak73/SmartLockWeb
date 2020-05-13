Class SmartLock.Backend.Tables.Locks Extends %Persistent
{

Property LockLogin As %String;

Property LockPassword As %String;

Index LockLogindIndex On LockLogin [ Unique ];

Storage Default
{
<Data name="LocksDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>LockLogin</Value>
</Value>
<Value name="3">
<Value>LockPassword</Value>
</Value>
</Data>
<DataLocation>^SmartLock.Backend.Ta77EE.LocksD</DataLocation>
<DefaultData>LocksDefaultData</DefaultData>
<IdLocation>^SmartLock.Backend.Ta77EE.LocksD</IdLocation>
<IndexLocation>^SmartLock.Backend.Ta77EE.LocksI</IndexLocation>
<StreamLocation>^SmartLock.Backend.Ta77EE.LocksS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
