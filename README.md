# Solidity smart contract bug detection repository
A repository for Solidity smart contracts acting as security bug tests for static analysis tools. Currently, there are 13 different tests, 11 of them have security vulnerabilities in them, each with different levels of severity. 

The tests were used with 5 Solidity static analysis tools - namely, Remix IDE static analysis plugin, Slither, Oyente, Mythril and SmartCheck. You are more than welcome to use these tests with other static analysis tools for Solidity smart contracts as well.

Note: tests for Oyente are adapted separately due to the tool using an old solc version. Therefore, use testNumber_cpy.sol files for testing out Oyente.

The vulnerabilities in tests are as follows:
* Test 1 - canary test, no vulnerabilities; 
* Test 2 -  re-entrancy vulnerability; 
* Test 3 - dead code vulnerability; 
* Test 4 - weak PRNG and timestamp dependency vulnerabilities; 
* Test 5 - lost contracts and unprotected self-destruction vulnerabilities; 
* Test 6 - out-of-gas vulnerability; 
* Test 7 - gas griefing vulnerability; 
* Test 8 - usage of tx.origin for validation; 
* Test 9 - unchecked value transfer and contract locking vulnerabilities; 
* Test 10 - double constructor vulnerability; 
* Test 10.1 - constructor-like functions; 
* Test 11 - inline assembly code usage vulnerability; 
* Test 12 - code size test, no vulnerabilities.
