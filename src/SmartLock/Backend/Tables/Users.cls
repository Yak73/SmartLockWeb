Class SmartLock.Backend.Tables.Users Extends %Persistent
{

Property UserLogin As %String;

Property UserPassword As %String;

Property PublicKey As %String;

Index UserLoginIndex On UserLogin [ Unique ];

Storage Default
{
<Data name="UsersDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>UserLogin</Value>
</Value>
<Value name="3">
<Value>UserPassword</Value>
</Value>
<Value name="4">
<Value>PublicKey</Value>
</Value>
</Data>
<DataLocation>^SmartLock.Backend.Ta77EE.UsersD</DataLocation>
<DefaultData>UsersDefaultData</DefaultData>
<IdLocation>^SmartLock.Backend.Ta77EE.UsersD</IdLocation>
<IndexLocation>^SmartLock.Backend.Ta77EE.UsersI</IndexLocation>
<StreamLocation>^SmartLock.Backend.Ta77EE.UsersS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
