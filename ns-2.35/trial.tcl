#===================================
#     Simulation parameters setup
#===================================
set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11                 ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 50                         ;# max packet in ifq
set val(nn)     8                       ;# number of mobilenodes
set val(rp)     AODV                       ;# routing protocol
set val(x)      727                      ;# X dimension of topography
set val(y)      693                      ;# Y dimension of topography
set val(stop)   45.0                         ;# time of simulation end
set val(energymodel) EnergyModel ;#Energy set up

#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator]

#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)
#Open the NS trace file
set tracefile [open out.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open out.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel

#===================================
#        Nodes Definition        
#===================================
#Create 43 nodes
$ns node-config -adhocRouting  $val(rp) \
                -llType        $val(ll) \
                -macType       $val(mac) \
                -ifqType       $val(ifq) \
                -ifqLen        $val(ifqlen) \
                -antType       $val(ant) \
                -propType      $val(prop) \
                -phyType       $val(netif) \
                -channel       $chan \
		-topoInstance  $topo \
		-energyModel $val(energymodel) \
		-initialEnergy 10 \
		-rxPower 0.5 \
		-txPower 1.0 \
		-idlePower 0.0 \
		-sensePower 0.3 \
                -agentTrace    ON \
                -routerTrace   ON \
                -macTrace      ON \
                -movementTrace ON 
set n(0) [$ns node]
$n(0) set X_ 627
$n(0) set Y_ 328
$n(0) set Z_ 0.0
$ns initial_node_pos $n(0) 30

set n(1) [$ns node]
$n(1) set X_ 67
$n(1) set Y_ 491
$n(1) set Z_ 0.0
$ns initial_node_pos $n(1) 30
set n(2) [$ns node]
$n(2) set X_ 161
$n(2) set Y_ 535
$n(2) set Z_ 0.0
$ns initial_node_pos $n(2) 30
set n(3) [$ns node]
$n(3) set X_ 210
$n(3) set Y_ 437
$n(3) set Z_ 0.0
$ns initial_node_pos $n(3) 30
set n(4) [$ns node]
$n(4) set X_ 190
$n(4) set Y_ 286
$n(4) set Z_ 0.0
$ns initial_node_pos $n(4) 30
set n(5) [$ns node]
$n(5) set X_ 78
$n(5) set Y_ 272
$n(5) set Z_ 0.0
$ns initial_node_pos $n(5) 30
set n(6) [$ns node]
$n(6) set X_ 23
$n(6) set Y_ 190
$n(6) set Z_ 0.0
$ns initial_node_pos $n(6) 30
set n(7) [$ns node]
$n(7) set X_ 28
$n(7) set Y_ 112
$n(7) set Z_ 0.0
$ns initial_node_pos $n(7) 30


#$ns at 0.0 "[$n(1) set ragent_] malicious" 
#===================================
#        Agents Definition        
#===================================
#Setup a TCP connection
set tcp0 [new Agent/TCP]
$ns attach-agent $n(0) $tcp0
set sink9 [new Agent/TCPSink]
$ns attach-agent $n(1) $sink9
$ns connect $tcp0 $sink9
$tcp0 set packetSize_ 1500

#Setup a TCP connection
set tcp1 [new Agent/TCP]
$ns attach-agent $n(5) $tcp1
set sink10 [new Agent/TCPSink]
$ns attach-agent $n(1) $sink10
$ns connect $tcp1 $sink10
$tcp1 set packetSize_ 1500

#Setup a TCP connection
set tcp2 [new Agent/TCP]
$ns attach-agent $n(4) $tcp2
set sink7 [new Agent/TCPSink]
$ns attach-agent $n(1) $sink7
$ns connect $tcp2 $sink7
$tcp2 set packetSize_ 1500

#Setup a TCP connection
set tcp3 [new Agent/TCP]
$ns attach-agent $n(2) $tcp3
set sink12 [new Agent/TCPSink]
$ns attach-agent $n(1) $sink12
$ns connect $tcp3 $sink12
$tcp3 set packetSize_ 1500

#Setup a TCP connection
set tcp4 [new Agent/TCP]
$ns attach-agent $n(6) $tcp4
set sink8 [new Agent/TCPSink]
$ns attach-agent $n(1) $sink8
$ns connect $tcp4 $sink8
$tcp4 set packetSize_ 1500

#Setup a TCP connection
set tcp5 [new Agent/TCP]
$ns attach-agent $n(7) $tcp5
set sink11 [new Agent/TCPSink]
$ns attach-agent $n(1) $sink11
$ns connect $tcp5 $sink11
$tcp5 set packetSize_ 1500

#Setup a TCP connection
set tcp6 [new Agent/TCP]
$ns attach-agent $n(3) $tcp6
set sink13 [new Agent/TCPSink]
$ns attach-agent $n(1) $sink13
$ns connect $tcp6 $sink13
$tcp6 set packetSize_ 1500



#===================================
#        Applications Definition        
#===================================
#Setup a FTP Application over TCP connection
set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0
$ns at 1.0 "$ftp0 start"
$ns at 10.0 "$ftp0 stop"

#Setup a FTP Application over TCP connection
set ftp1 [new Application/FTP]
$ftp1 attach-agent $tcp1
$ns at 1.0 "$ftp1 start"
$ns at 5.0 "$ftp1 stop"

#Setup a FTP Application over TCP connection
set ftp2 [new Application/FTP]
$ftp2 attach-agent $tcp2
$ns at 1.0 "$ftp2 start"
$ns at 2.0 "$ftp2 stop"

#Setup a FTP Application over TCP connection
set ftp3 [new Application/FTP]
$ftp3 attach-agent $tcp6
$ns at 1.0 "$ftp3 start"
$ns at 2.0 "$ftp3 stop"

#Setup a FTP Application over TCP connection
set ftp4 [new Application/FTP]
$ftp4 attach-agent $tcp3
$ns at 1.0 "$ftp4 start"
$ns at 2.0 "$ftp4 stop"

#Setup a FTP Application over TCP connection
set ftp5 [new Application/FTP]
$ftp5 attach-agent $tcp4
$ns at 1.0 "$ftp5 start"
$ns at 2.0 "$ftp5 stop"

#Setup a FTP Application over TCP connection
set ftp6 [new Application/FTP]
$ftp6 attach-agent $tcp5
$ns at 1.0 "$ftp6 start"
$ns at 2.0 "$ftp6 stop"

$ns at 0.0 "[$n(1) set ragent_] malicious" 
#===================================
#        Termination        
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam out.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n($i) reset"
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run
