# ENV var inheritance 

### quickstart
- Run `make init`

### running locally
- Set environment variable and run `envar-inheritance-caller` 
```
❯ export XYZ=501
❯ ./caller 
OUTPUT: 
 X = 501
```

### running as pod

- Run `make redeploy` which applies with envvar `XYZ=50001` into pod variables
```shell
❯ kubectl logs envar-inheritance-caller-6f746d5d48-t22hc
OUTPUT: 
 X = 500001
```