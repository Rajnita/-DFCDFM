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
set val(nn)     32                        ;# number of mobilenodes
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
		-initialEnergy 1000 \
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
$ns initial_node_pos $n(0) 50

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
set n(8) [$ns node]
$n(8) set X_ 53
$n(8) set Y_ 54
$n(8) set Z_ 0.0
$ns initial_node_pos $n(8) 30
set n(9) [$ns node]
$n(9) set X_ 116
$n(9) set Y_ 69
$n(9) set Z_ 0.0
$ns initial_node_pos $n(9) 30
set n(10) [$ns node]
$n(10) set X_ 207
$n(10) set Y_ 61
$n(10) set Z_ 0.0
$ns initial_node_pos $n(10) 30
set n(11) [$ns node]
$n(11) set X_ 117
$n(11) set Y_ 174
$n(11) set Z_ 0.0
$ns initial_node_pos $n(11) 30
set n(12) [$ns node]
$n(12) set X_ 203
$n(12) set Y_ 185
$n(12) set Z_ 0.0
$ns initial_node_pos $n(12) 30
set n(13) [$ns node]
$n(13) set X_ 294
$n(13) set Y_ 132
$n(13) set Z_ 0.0
$ns initial_node_pos $n(13) 30
set n(14) [$ns node]
$n(14) set X_ 136
$n(14) set Y_ 378
$n(14) set Z_ 0.0
$ns initial_node_pos $n(14) 30
set n(15) [$ns node]
$n(15) set X_ 27
$n(15) set Y_ 329
$n(15) set Z_ 0.0
$ns initial_node_pos $n(15) 30
set n(16) [$ns node]
$n(16) set X_ 4
$n(16) set Y_ 456
$n(16) set Z_ 0.0
$ns initial_node_pos $n(16) 30
set n(17) [$ns node]
$n(17) set X_ 146
$n(17) set Y_ 454
$n(17) set Z_ 0.0
$ns initial_node_pos $n(17) 30
set n(18) [$ns node]
$n(18) set X_ 25
$n(18) set Y_ 545
$n(18) set Z_ 0.0
$ns initial_node_pos $n(18) 30
set n(19) [$ns node]
$n(19) set X_ 275
$n(19) set Y_ 558
$n(19) set Z_ 0.0
$ns initial_node_pos $n(19) 30
set n(20) [$ns node]
$n(20) set X_ 316
$n(20) set Y_ 406
$n(20) set Z_ 0.0
$ns initial_node_pos $n(20) 30
set n(21) [$ns node]
$n(21) set X_ 241
$n(21) set Y_ 338
$n(21) set Z_ 0.0
$ns initial_node_pos $n(21) 30
set n(22) [$ns node]
$n(22) set X_ 304
$n(22) set Y_ 249
$n(22) set Z_ 0.0
$ns initial_node_pos $n(22) 30
set n(23) [$ns node]
$n(23) set X_ 384
$n(23) set Y_ 190
$n(23) set Z_ 0.0
$ns initial_node_pos $n(23) 30
set n(24) [$ns node]
$n(24) set X_ 356
$n(24) set Y_ 60
$n(24) set Z_ 0.0
$ns initial_node_pos $n(24) 30
set n(25) [$ns node]
$n(25) set X_ 283
$n(25) set Y_ 44
$n(25) set Z_ 0.0
$ns initial_node_pos $n(25) 30
set n(26) [$ns node]
$n(26) set X_ 429
$n(26) set Y_ 73
$n(26) set Z_ 0.0
$ns initial_node_pos $n(26) 30
set n(27) [$ns node]
$n(27) set X_ 497
$n(27) set Y_ 46
$n(27) set Z_ 0.0
$ns initial_node_pos $n(27) 30
set n(28) [$ns node]
$n(28) set X_ 471
$n(28) set Y_ 139
$n(28) set Z_ 0.0
$ns initial_node_pos $n(28) 30
set n(29) [$ns node]
$n(29) set X_ 478
$n(29) set Y_ 260
$n(29) set Z_ 0.0
$ns initial_node_pos $n(29) 30
set n(30) [$ns node]
$n(30) set X_ 370
$n(30) set Y_ 299
$n(30) set Z_ 0.0
$ns initial_node_pos $n(30) 30
set n(31) [$ns node]
$n(31) set X_ 417
$n(31) set Y_ 369
$n(31) set Z_ 0.0
$ns initial_node_pos $n(31) 30
#Base Station
$ns at 0.0 "$n(0) add-mark m0 yellow hexagon"
$ns at 0.0 "$n(0) label BaseStation"
$ns at 0.0 "[$n(1) set ragent_] malicious" 
$ns at 10.0 "[$n(5) set ragent_] malicious" 
$ns at 12.0 "[$n(11) set ragent_] malicious" 
$ns at 16.0 "[$n(10) set ragent_] malicious" 
$ns at 17.0 "[$n(17) set ragent_] malicious" 
$ns at 18.0 "[$n(21) set ragent_] malicious" 
$ns at 22.0 "[$n(26) set ragent_] malicious" 
$ns at 27.0 "[$n(22) set ragent_] malicious" 
#Random Generator
proc myRand { min max } {
    set maxFactor [expr [expr $max + 1] - $min]
    set value [expr int([expr rand() * 100])]
    set value [expr [expr $value % $maxFactor] + $min]
return $value
}

for {set i 1} {$i<$val(nn)} {incr i} {
	$n($i) color green
	$ns at 0.0 "$n($i) color darkgreen"
	$ns at 40.0 "$n($i) color darkgreen"
	$ns at 40.0 "$n($i) label NormalNode"
}

#Packetdrop Nodes
set nm [expr $val(nn)/10]
set ml [list]
for {set i 0} {$i<$nm} {incr i} {
	set mn [myRand 1 31]
	set t [myRand 0 2]
	set pd [open pdlist w]
puts $pd "\t\t\t\t\tDecision Making"
puts $pd "\t~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts $pd "\tPacketDrop\t\t\t\t\tcondition"
puts $pd "\t~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
if {$t==0} {
set f Low
} elseif {$t==1} {
set f Medium
} else {
set f High
}
	while {([lsearch $ml $mn])>=0} {
		set mn [myRand 1 31]
	}
	lappend ml $mn
	foreach pt $ml {
	puts $pd "\t--------------------------------------"
    puts $pd "\t\t$pt\t\t\t\t\t\t$f"
	puts $pd "\t--------------------------------------"
	}
	
}
close $pd

#Battery Fault Nodes
set initialenergy [list]
set ie [myRand 1 31 ]
for {set i 0} {$i<$ie} {incr i} {
set energy [myRand 1 70]
if {$energy<15} {
set t [myRand 0 2]
set bf [open bflist w]
puts $bf "\t\t\t\t\tDecision Making"
puts $bf "\t~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts $bf "\tBatteryFault\t\t\t\tcondition"
puts $bf "\t~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
if {$t==0} {
set g Low
} elseif {$t==1} {
set g Medium
} else {
set g High
}

  lappend initialenergy $energy
  foreach bt $initialenergy {
puts $bf "\t---------------------------------------------"
puts $bf "\t\t$bt\t\t\t\t\t\t$g"
puts $bf "\t---------------------------------------------"
}

 $n($energy) color yellow
 $ns at 30.0 "$n($energy) color yellow"
 $ns at 30.0 "$n($energy) label BatteryFault"
 }
 }
 close $bf
#Sensor Circuit Fault Nodes
set sensingfault [list]
set sf [myRand 1 31]
   for {set i 0} {$i<$sf} {incr i} {
   set sensing [myRand 1 70]
   if {$sensing<15} {
    set sk [open sflist w]
puts $sk "\t\t\t\t\tDecision Making"
puts $sk "\t~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts $sk "\tSensorFault\t\t\t\t\tcondition"
puts $sk "\t~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
if {$t==0} {
set h Low
} elseif {$t==1} {
set h Medium
} else {
set h High
}
   lappend sensingfault $sensing
   foreach st $sensingfault {
   set t [myRand 0 2]
   if {$t==0} {
set h Low
} elseif {$t==1} {
set h Medium
} else {
set h High
}
puts $sk "\t--------------------------------------"
puts $sk "\t\t$st\t\t\t\t\t\t$h"
puts $sk "\t--------------------------------------"
}
   $n($sensing) color violet
   $ns at 30.0 "$n($sensing) color violet"
   $ns at 30.0 "$n($sensing) label SensingFault"
}
}
 close $sk


#Neighbor node detection
for {set i 0} {$i<$val(nn)} {incr i} {
	set NL($i) [list]
	set neighborlist($i) [list]
	set x_pos1 [$n($i) set X_]
	set y_pos1 [$n($i) set Y_]
	for {set j 0} {$j<$val(nn)} {incr j} {
		if {$j!=$i} {
			set x_pos2 [$n($j) set X_]
			set y_pos2 [$n($j) set Y_]
			set x_pos [expr $x_pos1-$x_pos2]
			set y_pos [expr $y_pos1-$y_pos2]
			set v [expr $x_pos*$x_pos+$y_pos*$y_pos]
			set d [expr sqrt($v)]
			set nd($i,$j) $d
			puts "Distance from $i to $j:$d"
			if {$d<250} {
				$n($i) add-neighbor $n($j)
				if {$j!=0} {
					lappend neighborlist($i) $j
				}
			}
		} 
	}
	set neighbor1 [$n($i) neighbors]
	foreach nb1 $neighbor1 {
		set now [$ns now]
		puts "The neighbour for node $i are:"
		set idv [$nb1 id]
		puts "$idv"	
		lappend NL($i) $idv
	}
}

#Energy Dissipation Model
set Eelec 1.0
set e [expr 1/[expr pow(10,2)]]
#Energy consumed for single bit
for {set i 1} {$i<$val(nn)} {incr i} {
	foreach nen $neighborlist($i) {
		set ds [expr pow($nd($i,$nen),2)]
		set ETx($i,$nen) [expr $Eelec+($e*$ds)]
		puts "Energy consumed by node $i to transmit single bit information to node $nen:$ETx($i,$nen) mJ"
		set ERx($i,$nen) [expr $Eelec]
		puts "Energy consumed by node $nen to transmit single bit information to node $i:$ERx($i,$nen) mJ"
	}
}

proc lrandom L {
		lindex $L [expr {int(rand()*[llength $L])}]
	}
	
set KB [list 256 512 1024]
puts "Enter the number of bits to be transmitted {$KB}"
set L [gets stdin]

#Distance Based Probabilistic Algorithm
for {set i 1} {$i<$val(nn)} {incr i} {
	set TN($i) [list]
}
#ClusterHead/Single hop Neighbor Node
set ch [open chlist w]
set ClusterheadNodes [list]
for {set i 1} {$i<$val(nn)} {incr i} {
	set Wj($i) [list]
	set pij($i) [expr rand()]
	set Bj($i) [llength $neighborlist($i)]
	set cv [expr $pij($i)*$Bj($i)]
	set swj($i) [llength $Wj($i)]
	set dList [list]
	foreach k $neighborlist($i) {
		lappend dList $nd($k,$i)
	}
	set sdList [lsort -real -increasing $dList]
	set iv 0
	while {($swj($i)<$cv)} {
		set sv 0
		foreach k $neighborlist($i) {
			set dd [expr 250-$nd($k,$i)]
			set sv [expr $sv+$dd]
		}
		set sv [expr int($sv)]
		set x [myRand 0 $sv]
		set wni [lindex $sdList $iv]
		foreach k1 $neighborlist($i) {
			if {$nd($k1,$i)==$wni} {
				set wn $k1
			}
		}
		lappend Wj($i) $wn
		lappend ClusterheadNodes $wn
		lappend TN($wn) $i
		incr iv
		set swj($i) [llength $Wj($i)]
	}
	puts $ch "The clusterhead node of node $i:$Wj($i)\n"
}

##
proc equal { arr1 arr2 k } {
	for {set i 1} {$i < $k} { incr i } {
		if($arr($i) != $arr2($i)) {
			return 0
		}	
	}
	return 1
} 
proc min { row k } {
	set min 999
	for {set i 1} {$i < $k} { incr i } {
		if {$min > $row($i) } {
			set min $row($i)
			set m $i 
		}	
	}
	return $m
}
 
proc Clustertask {} {
	global group	
	global n
	global ns
global array names row cluster 
global oldcluster
	#array set row {}
	#array set cluster {}
	#array set oldcluster {}
set cl [open cllist w]
	set k 4
	for { set j 0 } { $j < $k } { incr j } {
		set group($j) [list]
		set cluster($j) $j
#puts $cl "Initial cluster heads $cluster($j)\t"
	}
	#set cluster(0) 1
	#set cluster(1) 4
	#set cluster(2) 7
	#set cluster(3) 23
 
	set iter 1
	set loop 0
	
	while { $iter < 2 || $loop > 0 } {
		for { set i 1 } { $i < 31 } { incr i } {
			   for {set j 0} { $j < $k } { incr j } {		
				set p $cluster($j)
				set x_pos1 [$n($p) set X_]
				set y_pos1 [$n($cluster($j)) set Y_]
				set x_pos2 [$n($i) set X_]
				set y_pos2 [$n($i) set Y_]
				set x_pos [expr $x_pos1-$x_pos2]
				set y_pos [expr $y_pos1-$y_pos2]
				set v [expr $x_pos*$x_pos+$y_pos*$y_pos]
				set d [expr sqrt($v)]
				set row($j) $d	
			   	
				} 

			set min 99999
           		set m 0 
			for { set p 0 } { $p < $k } { incr p }  {
				if { $min > $row($p) }  {
					set min $row($p)
					set m $p 
				#puts " $m m val "
				}	
			}

			#set minindex $m 
			lappend group($m) $i
		   	#$ns trace-annotate " Node $i is present in cluster $m" 
puts $cl " Node $i is present in cluster $m \n"
puts $cl " list $group($m) \n"
#$ns trace-annotate " Node $i is present in cluster $m" 
		}
#end for
	for {set j 0} {$j<$k} {incr j} {

		set l [llength $group($j)]
		puts "length $l"
		if {$l!=0} {
		set oldcluster($j) $cluster($j)
		set total_x 0
		set total_y 0
		foreach u $group($j) {
			set x_pos [$n($u) set X_]
			set y_pos [$n($u) set Y_]
			set total_x [expr $total_x+$x_pos]
			set total_y [expr $total_y+$y_pos]
		}
			set cent_x [expr $total_x/$l]
			set cent_y [expr $total_y/$l]

		

		set x_pos1 [$n($oldcluster($j)) set X_]
		set y_pos1 [$n($oldcluster($j)) set Y_]
		set x_pos [expr $x_pos1-$cent_x]
		set y_pos [expr $y_pos1-$cent_y]
		set v [expr $x_pos*$x_pos+$y_pos*$y_pos]
		set min [expr sqrt($v)]
		set m $oldcluster($j)
		foreach b $group($j) {
			set x_pos1 [$n($b) set X_]
			set y_pos1 [$n($b) set Y_]
			set x_pos [expr $x_pos1-$cent_x]
			set y_pos [expr $y_pos1-$cent_y]
			set v [expr $x_pos*$x_pos+$y_pos*$y_pos]
			set d [expr sqrt($v)]
			if { $min>$d }  {
						set min $d
						set m $b
					}

		}

		set cluster($j) $m
#puts $cl "  New Cluster heads : Node $cluster($j) \n"
	}

}
	#set cond [equal array get oldcluster array get cluster k]
set cond 1
set loop 0
	for {set i 0} {$i < $k} { incr i } {
		if { $oldcluster($i) != $cluster($i) } {
			set cond 0
		}	
	}
	
		if { $cond==0 } {
			set loop 1
			for {set m 0} {$m<$k} {incr m} {
			set group($m) {}
	
			}
		}
		incr iter


puts $cl " Cluster heads : Node $cluster(0)  Node $cluster(1) Node $cluster(2) Node $cluster(3)"
puts $cl "iter : $iter "
	


}
#end while

} 
#end proc

##





#Energy Consumed for L bits of information
set el [open enlist w]
set ClusterheadNodes [lsort -unique $ClusterheadNodes]
foreach i $ClusterheadNodes {
	foreach j $TN($i) {
		set EiWij($i) [expr $L*($ETx($i,$j)+$ERx($i,$j))]
		puts $el "Energy Consumed by Transmitter $i:$EiWij($i) mJ\n"
		set EjWij($j) [expr $L*($ETx($j,$i)+$ERx($j,$i))]
		puts $el "Energy Consumed by Receiver node $j:$EjWij($j) mJ\n"
	}
}

#===================================
#        Agents Definition        
#===================================


# Create MyAgent (This will give two warning messages that
set myagent [new Agent/TSPAgentOtcl]

# Set configurable parameters of MyAgent
$myagent set tsp_var1_otcl 2
$myagent set tsp_var2_otcl 6.5ssssssss

# Give a command to MyAgent
$myagent Cluster_Formation
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
$myagent print_typeofnode



proc attach-cbr-traffic {node sink size interval} {
	global ns
	set source [new Agent/UDP]
	$source set class_ 2
	$ns attach-agent $node $source
	set traffic [new Application/Traffic/CBR]
	$traffic set packetSize_ $size
	$traffic set interval_ $interval
	$traffic attach-agent $source
	$ns connect $source $sink
	return $traffic
}
set TSN 0
foreach i $ClusterheadNodes {
	foreach j $TN($i) {
		set Iijt($i,$j) 0
	}
}
set N 10
#Cluster Task
set null1 [new Agent/LossMonitor]
proc ClusterTask {} {
	global N array names NL ml mn array names n ns ClusterheadNodes array names TN null1 array names Iijt TSN
	set timv [$ns now]
	incr TSN
	foreach i $ClusterheadNodes {
		foreach j1 $TN($i) {
			$ns attach-agent $n($j1) $null1
			set cbr [attach-cbr-traffic $n($i) $null1 100 0.05]
			# $ns at $timv "$n($i) label CH"
			$ns at $timv "$n($j1) add-mark m11 hotpink"
			$ns at $timv "$cbr start"
			$ns at $timv "$ns trace-annotate \"The Node $i calculates sensing difference between its neighbour node $j1 at timeslot $timv\""
			$ns at [expr $timv+0.05] "$cbr stop"
			$ns at [expr $timv+0.05] "$n($j1) delete-mark m11"
			set timv [expr $timv+0.05]
		}
		foreach j $TN($i) {
			set nmn 0
			foreach maln $ml {
				if {([lsearch $NL($maln) $j])>=0} {
			
					set nmn 1
				}
			}
			if {([lsearch $ml $j])==-1}  {
				$ns attach-agent $n($i) $null1
				set cbr [attach-cbr-traffic $n($j) $null1 100 0.05]
				$ns at $timv "$n($j) add-mark m12 dodgerblue"
				$ns at $timv "$cbr start"
				$ns at $timv "$ns trace-annotate \"The Neighbour node $j send the sensing information to the node $i at timeslot $timv\""
				$ns at [expr $timv+0.05] "$cbr stop"
				$ns at [expr $timv+0.05] "$n($j) delete-mark m12"
				set timv [expr $timv+0.05]
				set Iijt($i,$j) 1
			} elseif {$nmn==1} {
				set Iijt($i,$j) 0.5
			} else {
				set Iijt($i,$j) 0
			}
		}
	}
	
	}

$ns at 0.0 "ClusterTask"

#$ns at 0.1 "Clustertask"
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
