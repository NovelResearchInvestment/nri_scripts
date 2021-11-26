<!--
 * @Author: Gabriel Feng
 * @Date: 2021-11-03 10:40:06
 * @LastEditTime: 2021-11-03 11:07:17
 * @LastEditors: Gabriel Feng
 * @Description: 
 * @FilePath: \nri_scripts\windows\set_cmd_proxy.md
 * -------------------------------------------------------------------------------
-->


```batch
netsh winhttp set proxy proxy-server="socks=localhost:7890" bypass-list="localhost"
netsh winhttp set proxy proxy-server="http=localhost:7890" bypass-list="localhost"
netsh winhttp set proxy proxy-server="https=localhost:7890" bypass-list="localhost"
netsh winhttp show proxy
netsh winhttp reset proxy
```
