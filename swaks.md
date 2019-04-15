# SWAKS commands for sending e-mails  

```bash
echo "Hello" | swaks --to example@mail.com --from=noreply@mail.com --server=xyz.mail.com --auth=LOGIN --auth-user=noreply --auth-password=test
```

# Telnet commands for sending e-mails  
```bash
telnet xyz.mail.com 25
ehlo mail.com
AUTH NTLM
bm9yZXBseUBzaXZpZy5hbA==
QCRyV2lWd1hpJWd4
mail from: noreply@mail.com
rcpt to: example@mail.com
Data
Hello Everyone
.
```
