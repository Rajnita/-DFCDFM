BEGIN {
sent=0;
received=0;
var=argv;
}
{
  if($1=="s" && $4=="AGT" && $3==var)
   {
    sent++;
   }
  else if($1=="r" && $4=="AGT" && $3==var)
   {
     received++;
   }
#printf "$c===%s", $c;

}
END {
#printf "$3===%d", $3;
 printf " -------------------Packet Sent:%d",sent;
 printf "\n Packet Received:%d",received;
 printf "\n Packet Delivery Ratio:%.2f\n",(received/sent);

}
