[33mcommit 6c7a519c73d225a830d0c224efe449b3473e3144[m[33m ([m[1;36mHEAD -> [m[1;32mmain[m[33m)[m
Author: famin07 <famin8474@gmail.com>
Date:   Fri May 27 08:02:40 2022 +0000

    program

[1mdiff --git a/example.c b/example.c[m
[1mnew file mode 100644[m
[1mindex 0000000..0087f25[m
[1m--- /dev/null[m
[1m+++ b/example.c[m
[36m@@ -0,0 +1,7 @@[m
[32m+[m[32m#include <stdio.h>[m
[32m+[m[32mint main(void) {[m
[32m+[m[32m/* This is my first program in C */[m
[32m+[m[32mprintf(“Hello World!”);[m
[32m+[m[32mprintf(“I Love C”);[m
[32m+[m[32mreturn (0);[m
[32m+[m[32m}[m
[1mdiff --git a/server.c b/server.c[m
[1mnew file mode 100644[m
[1mindex 0000000..a818bf9[m
[1m--- /dev/null[m
[1m+++ b/server.c[m
[36m@@ -0,0 +1,75 @@[m
[32m+[m[32m/*[m
[32m+[m	[32mC socket server example[m
[32m+[m[32m*/[m
[32m+[m
[32m+[m[32m#include<stdio.h>[m
[32m+[m[32m#include<string.h>	//strlen[m
[32m+[m[32m#include<sys/socket.h>[m
[32m+[m[32m#include<arpa/inet.h>	//inet_addr[m
[32m+[m[32m#include<unistd.h>	//write[m
[32m+[m
[32m+[m[32mint main(int argc , char *argv[])[m
[32m+[m[32m{[m
[32m+[m	[32mint socket_desc , client_sock , c , read_size;[m
[32m+[m	[32mstruct sockaddr_in server , client;[m
[32m+[m	[32mchar client_message[2000];[m
[32m+[m[41m	[m
[32m+[m	[32m//Create socket[m
[32m+[m	[32msocket_desc = socket(AF_INET , SOCK_STREAM , 0);[m
[32m+[m	[32mif (socket_desc == -1)[m
[32m+[m	[32m{[m
[32m+[m		[32mprintf("Could not create socket");[m
[32m+[m	[32m}[m
[32m+[m	[32mputs("Socket created");[m
[32m+[m[41m	[m
[32m+[m	[32m//Prepare the sockaddr_in structure[m
[32m+[m	[32mserver.sin_family = AF_INET;[m
[32m+[m	[32mserver.sin_addr.s_addr = INADDR_ANY;[m
[32m+[m	[32mserver.sin_port = htons( 8888 );[m
[32m+[m[41m	[m
[32m+[m	[32m//Bind[m
[32m+[m	[32mif( bind(socket_desc,(struct sockaddr *)&server , sizeof(server)) < 0)[m
[32m+[m	[32m{[m
[32m+[m		[32m//print the error message[m
[32m+[m		[32mperror("bind failed. Error");[m
[32m+[m		[32mreturn 1;[m
[32m+[m	[32m}[m
[32m+[m	[32mputs("bind done");[m
[32m+[m[41m	[m
[32m+[m	[32m//Listen[m
[32m+[m	[32mlisten(socket_desc , 3);[m
[32m+[m[41m	[m
[32m+[m	[32m//Accept and incoming connection[m
[32m+[m	[32mputs("Waiting for incoming connections...");[m
[32m+[m	[32mc = sizeof(struct sockaddr_in);[m
[32m+[m[41m	[m
[32m+[m	[32m//accept connection from an incoming client[m
[32m+[m	[32mclient_sock = accept(socket_desc, (struct sockaddr *)&client, (socklen_t*)&c);[m
[32m+[m	[32mif (client_sock < 0)[m
[32m+[m	[32m{[m
[32m+[m		[32mperror("accept failed");[m
[32m+[m		[32mreturn 1;[m
[32m+[m	[32m}[m
[32m+[m	[32mputs("Connection accepted");[m
[32m+[m[41m	[m
[32m+[m	[32m//Receive a message from client[m
[32m+[m	[32mwhile( (read_size = recv(client_sock , client_message , 2000 , 0)) > 0 )[m
[32m+[m	[32m{[m
[32m+[m		[32m//Send the message back to client[m
[32m+[m		[32mwrite(client_sock , client_message , strlen(client_message));[m
[32m+[m	[32m}[m
[32m+[m[41m	[m
[32m+[m	[32mif(read_size == 0)[m
[32m+[m	[32m{[m
[32m+[m		[32mputs("Client disconnected");[m
[32m+[m		[32mfflush(stdout);[m
[32m+[m	[32m}[m
[32m+[m	[32melse if(read_size == -1)[m
[32m+[m	[32m{[m
[32m+[m		[32mperror("recv failed");[m
[32m+[m	[32m}[m
[32m+[m[41m	[m
[32m+[m	[32mreturn 0;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m
