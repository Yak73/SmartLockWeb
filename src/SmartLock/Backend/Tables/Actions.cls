Class SmartLock.Backend.Tables.Actions Extends %Persistent
{

Property ActionDescription As %String;

Storage Default
{
<Data name="ActionsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ActionDescription</Value>
</Value>
</Data>
<DataLocation>^SmartLock.Backend77EE.ActionsD</DataLocation>
<DefaultData>ActionsDefaultData</DefaultData>
<IdLocation>^SmartLock.Backend77EE.ActionsD</IdLocation>
<IndexLocation>^SmartLock.Backend77EE.ActionsI</IndexLocation>
<StreamLocation>^SmartLock.Backend77EE.ActionsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
