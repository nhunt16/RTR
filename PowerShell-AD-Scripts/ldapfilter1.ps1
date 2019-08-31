# LDAP Filter 1 -> get DC from current domain
# LDAP Filter 2 -> get (human) users
# LDAP Filter 3 -> get users starting with Nicolas.H

# $ldapFilter = "(primaryGroupID=516)"
#$ldapFilter = "(&(objectCategory=person)(objectClass=user))"
#$ldapFilter = "(&(objectCategory=person)(objectClass=user)(cn=Nicolas.H*))"
$ldapFilter = "(primaryGroupID=516)"

$domain = New-Object System.DirectoryServices.DirectoryEntry
$search = New-Object System.DirectoryServices.DirectorySearcher
$search.SearchRoot = $domain
$search.Filter = $ldapFilter
$search.SearchScope = "Subtree"

$results = $search.FindAll()

foreach ($result in $results)
{
	$object = $result.GetDirectoryEntry()
	Write-Host "Object Name = " $object.name
}