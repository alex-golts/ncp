# ncp - Nework Copy
Copy files or folders between isolated network locations in a single command.

# Use case
You want to copy a file or folder from remote server A to remote server B.
A and B are accessible from your host via SSH. A and B are disconnected from one another.

Typically, you could achieve this with the following steps:
1. SSH to server A.
2. Compress the desired folder to a tarball `tarball.tar.gz`.
3. Use `scp` to copy `tarball.tar.gz` from server A to your host.
4. remove `tarball.tar.gz` from server A.
5. Use `scp` to copy `tarball.tar.gz` from your host to the desired path on server B.
6. SSH to server B.
7. Uncompress `tarball.tar.gz` on server B.
8. Remove `tarball.tar.gz` from server B.

*Instead*, this utility does this in one command:  
`./ncp.sh $userA@serverA $pathFrom $userB@serverB $pathTo`

You can set up an alias `alias ncp=/path/to/ncp.sh` and then you can use the even simpler command:  
`ncp $userA@serverA $pathFrom $userB@serverB $pathTo`

# Copy from/to single remote server 
TBD. not implemented yet

## From server to host:
`ncp $user@server $pathFrom $pathToOnHost`

## From host to server: 
`ncp $pathFromOnHost $user@server $pathTo`
