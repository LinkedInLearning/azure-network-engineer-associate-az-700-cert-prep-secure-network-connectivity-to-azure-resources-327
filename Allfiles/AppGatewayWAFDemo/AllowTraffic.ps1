$rgName = "LL-Demo-RG"
$appGWName = "ccwd-appgw01"
$fwPolicyName = "ccwd-waf-pol01"

# Pull the existing Azure resources

$appGW = Get-AzApplicationGateway -Name $appGWName -ResourceGroupName $rgName
$pol = Get-AzApplicationGatewayFirewallPolicy -Name $fwPolicyName -ResourceGroupName $rgName

# Update the resources

$pol[0].CustomRules[0].Action = "allow"
$appGW.FirewallPolicy = $pol

# Push your changes to Azure

Set-AzApplicationGatewayFirewallPolicy -Name $fwPolicyName -ResourceGroupName $rgName -CustomRule $pol.CustomRules
Set-AzApplicationGateway -ApplicationGateway $appGW