# Exploit Development Helper Scripts
This repository contains scattered scripts that I use or used to use during exploit development.


### Who does what? 


#### prirtable_helper
This script is a ruby tranlation for "printable_helper.c" program from "Art of exploitation (P:369)" to zero-out EAX.


```
$ ruby prirtables_helper.rb [STR]  # Try: KING
```

#### hash_func_name
This script computes and resolves Windows Function Names Hashes.

Both scripts (hash_func_name and hash_func_name_bitwise) do the samething however I've been challenged by the awesome @ryujin to do it using bitwite way instead of just manipulating a given string as I did in the first try. I personally use the bitwise one.

```
$ ruby resolv_symol-bitwise.rb [FUNCTION NAME] # Try: ExitProcess
```
