Note: All the files in this repo are created for testing purpose.Notes with imp points is available at: [bmaadi terraform blog](https://bhuvandevopsnotes.blogspot.com/2022/07/terraform-by-harsha.html)

## Imp Ponts:

* If terraform plan executes without error we cannot confirm apply also works any without issuees. plan is like a dry run.

Eg: we cannot attach 2 internet gateways to a single vpc, If you try to do that in code the plan will succeed, since it doesn't check any conditions and error will be thrown out while applying 



