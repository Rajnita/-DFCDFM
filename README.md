# -DFCDFM
**Distributed Fault Node Detection and Classification using Fuzzy Logic and Management Scheme for Wireless Sensor Networks
Abstract:**
A number of sensor nodes varying from hundreds to thousands are deployed forming Wireless Sensor Network (WSN) is deployed over an area to monitor harsh and unpredictable environmental conditions like forest fires, floods, man-made disasters etc. Due to the unavoidable harsh conditions of the surroundings and resource constraints like battery power, the probability of network failure rises. The components of a sensor node like transmitter circuit, receiver circuit, sensor interface might cease to work. Several consequences like loss of communication links between the nodes, disturbance to the network topology might occur due to the occurrence of these faults. Identifying the faults and recovering from the failures are crucial to increase the quality of service of the network. The traditional methods of fault detection adopt centralized approach where fault detection might not happen if the centralized fault detector fails. The fault nodes are rather discarded in the traditional methods. To address these issues, we propose a Distributed Fault node Detection and Classification using Fuzzy logic and Management scheme (DFCDFM) for Wireless Sensor Network (WSN). The nodes are classified using fuzzy logic according to the fault status. The type of node is determined by the fuzzy inference system according to designated membership functions. Further, a management scheme that involves the reuse of some type of fault nodes are provided. A routing scheme based on bee inspired algorithms is adopted in the management scheme. An optimized routing path is obtained using the routing scheme based on bee inspired algorithm.
___________________________________________________________________________________________________________________________________________________________________________________
NS2
IF YOU ARE NEW TO NS2 KINDLY READ "NS2 INSTALATION HELP FILE.DOC" TO KNOW HOW TO INSALL THE SOFTWARE
1) Copy the folder inside the Source Code folder given and then paste ito C:Cygwin:Home:Administrator:ns-allinone-2.28:ns-2.28
2) Run project.tcl from "ns-2.35/project".
The code regarding the ns2 is in zip file ns-2.35 under the location "ns-2.35/project".
Certain changes are made in ns-2.35/aodv.cc and aodv.h

MATLAB

The file proj.fis is the code for fuzzy inference engine and proj.m is the matlab file. The file "fuzzy.xls" contains the input for an instance. The file "ab.txt" contains the output values which are then given as input in ns2.
