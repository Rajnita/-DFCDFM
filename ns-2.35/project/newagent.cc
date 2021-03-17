#include <stdio.h>
#include <string.h>
#include "agent.h"
#include <aodv/aodv.h>
#include <aodv/aodv_packet.h>
#include <random.h>
#include <aodv/aodv_rtable.h>
#include <cmu-trace.h>
#include <common/mobilenode.h>
#include <mobile/energy-model.h>
#include <iostream>
#include <vector>
#include<fstream>
    #include <sstream>
    #include<string>
#include <algorithm>
#include <math.h>
#include<cmath>
#include<stdlib.h>
#include<stdio.h>
 #include <cstdlib>
      #include <cstring>
          
using namespace std;
int k=4;
FILE *fp;
int cluster[4];
	int oldCluster[4];
	int row[4];
	std::vector< std::vector<int> > groups;
int nn=31;
class TSPAgent : public Agent {
public:
	std::vector<int> traffic; std::vector<int> end;std::vector<int> normal;std::vector<int> dead;
        TSPAgent();
protected:
        int command(int argc, const char*const* argv);
bool isEqual(int a[],int b[],int k);
        void Cluster_Formation(void); //k medoids
	void print_typeofnode();
	//void print_neighbour();
private:
        int    tsp_var1;
        double tsp_var2;
        void   TSPPrivFunc(void);
};

static class TSPAgentClass : public TclClass {
public:
       TSPAgentClass() : TclClass("Agent/TSPAgentOtcl") {}
        TclObject* create(int, const char*const*) {
                return(new TSPAgent());
        }
} class_tsp_agent;

TSPAgent::TSPAgent() : Agent(PT_UDP) {
	//LIST_INIT(&nbhead);
       bind("tsp_var1_otcl", &tsp_var1);
       bind("tsp_var2_otcl", &tsp_var2);
}
int TSPAgent::command(int argc, const char*const* argv) {
      if(argc == 2) {
           if(strcmp(argv[1], "Cluster_Formation") == 0) {
                  Cluster_Formation();
                  return(TCL_OK);
           }
if(strcmp(argv[1], "print_typeofnode") == 0) {
                  print_typeofnode();
                  return(TCL_OK);
           }
      }
     return(Agent::command(argc, argv));
}

void TSPAgent::TSPPrivFunc(void) {
      Tcl& tcl = Tcl::instance();
      tcl.eval("puts \"Message From TSPPrivFunc\"");
      tcl.evalf("puts \"     Area of the Cylinder is = %f\"", tsp_var1*tsp_var2*2*3.14);
}



bool TSPAgent::isEqual(int arr1[], int arr2[], int maxIndex){
	for(int i=0;i<maxIndex;i++)
	{
		if(arr1[i]!=arr2[i])
		return false;
	}
	return true;
}


/*

void TSPAgent::print_neighbour()
{

AODV_Neighbor *nb = nbhead.lh_first;
for(int id=1;id<31;id++){
 for(; nb; nb = nb->nb_link.le_next) {
  	if(nb->nb_addr == id)
     		printf("\nNeighbour of node %d is %d\n", id,nb->nb_addr);
 }
 }
}*/
/********************CLUSTER*******************/
void TSPAgent::Cluster_Formation(void)
{	
int index;
fp = fopen( "out_file.txt", "w" );
double x_pos,y_pos,x_pos1,y_pos1,x_pos2,y_pos2,total_x,total_y;int cent_x,cent_y;
MobileNode *iNode1,*iNode2;


for(int i=0;i<k;i++)
	{
		cluster[i]=i;
	}
for(int i=0;i<k;i++)
	{
		std::vector<int> newGroup;
		groups.push_back(newGroup);
	}

int iter =1;int loop=0;
double min; int m,s;
double d=0.0; double dsq; double minimum;int minindex;
//do
while(iter<2||loop>0)
{
for(int i=1;i<nn;i++)
{
	for(int j=0;j<k;j++)
	{
		iNode1=(MobileNode *) (Node::get_node_by_address(cluster[j]));
		x_pos1=iNode1->X();
		y_pos1=iNode1->Y();
		iNode2=(MobileNode *) (Node::get_node_by_address(i));
		x_pos2=iNode2->X();
		y_pos2=iNode2->Y();
		dsq=(x_pos2-x_pos1)*(x_pos2-x_pos1)+(y_pos2-y_pos1)*(y_pos2-y_pos1);
		d=sqrt(dsq);
		row[j]=d;
	}
	min=99999.0;
	m=0;
	for(int p=0;p<k;p++)
	{
		if(min>row[p])
		{
			min=row[p];
			m=p;
		}
	}
	 groups[m].push_back(i);

fprintf(fp,"\nNode %d is present in cluster %d\n",i,m);
fprintf(fp,"LIST\t");
for(int i=0;i<groups[m].size();i++)
{
fprintf(fp,"%d\t",groups[m][i]);
}
fprintf(fp,"\n");

}//end for

for(int j=0;j<k;j++)
	{
		s=groups[j].size();
		//printf("Size s : %d",s);
    		if(s!=0)
		{
			oldCluster[j]=cluster[j];
			total_x=0;
			total_y=0;
			//s=groups[j].size();
			for(int y=0;y<groups[j].size();y++)	
			{
				iNode1=(MobileNode *) (Node::get_node_by_address(groups[j][y]));
				x_pos1=iNode1->X();
				y_pos1=iNode1->Y();
				total_x+=x_pos1;
				total_y+=y_pos1;
			}
				cent_x=total_x/s;
				cent_y=total_y/s;
				//printf("centroid of %d cluster is (%f,%f)",j,cent_x,cent_y);


		iNode1=(MobileNode *) (Node::get_node_by_address(oldCluster[j]));
		x_pos1=iNode1->X();
		y_pos1=iNode1->Y();
		dsq=(cent_x-x_pos1)*(cent_x-x_pos1)+(cent_y-y_pos1)*(cent_y-y_pos1);
		minimum=sqrt(dsq);
		minindex=oldCluster[j];
		for(int u=0;u<groups[j].size();u++)	
			{
				iNode1=(MobileNode *) (Node::get_node_by_address(groups[j][u]));
				x_pos1=iNode1->X();
				y_pos1=iNode1->Y();
				dsq=(cent_x-x_pos1)*(cent_x-x_pos1)+(cent_y-y_pos1)*(cent_y-y_pos1);
				d=sqrt(dsq);
				if(d<minimum)
				{
					minimum=d;
					minindex=groups[j][u];
				}
			}//endfor
			
			cluster[j]=minindex;
		}//endif
	} //end for
/*
if(!isEqual(oldCluster,cluster,k))
	{
		for(int i=0;i<k;i++)
		groups[i].clear();
	}
	iter++;
 printf("CLUSTER HEADS\n");

for(int i=0;i<k;i++)
	printf("Node %d",cluster[i]);
printf("ITER: %d",iter);
}while(!isEqual(oldCluster,cluster,k));
*/

//endwhile

	int cond=1;
loop=0;

for(int i=0;i<k;i++)
{
if(cluster[i]!=oldCluster[i])
cond=0;
}

if(cond==0)
{
loop=1;
for(int i=0;i<k;i++)
	groups[i].clear();

}


iter++;
fprintf(fp,"\nCLUSTER HEADS\n");

for(int i=0;i<k;i++)
	fprintf(fp,"Node %d ",cluster[i]);
fprintf(fp,"\n");

}//end while
}



void TSPAgent::print_typeofnode(void)
{
std::ifstream fin("ab.txt");
        std::ofstream fout("output.txt");
        std::string line;
        string str;
float x;
//sscanf(str, "%f", &x);
//x=std::stof(str);


stringstream geek(str);
 
    // The object has the value 12345 and stream
    // it to the integer x
    float y = 0.0;int i=1;
  
            while(!std::getline(fin,line).eof())
{
        str=line.substr(0, line.find_first_of(" ", 0));
	stringstream geek(str);
	geek >> y;
	if(i==31) 
		break;

	if(y>=9)
	{
		fout<<"Node "<<i<<"-"<<"Healthy Node"<<endl;
		normal.push_back(i);
	}
	else if(y>=7 && y<9)  
	{
		fout<<"Node "<<i<<"-"<<"Dispatch Node"<<endl;
		traffic.push_back(i);
	}
	else if(y>=3 && y<7)
	{
		fout<<"Node "<<i<<"-"<<"End Node"<<endl;	
		end.push_back(i);
	}
	else if(y>=0 && y<3)
	{
		fout<<"Node "<<i<<"-"<<"Lifeless Node"<<endl;
		dead.push_back(i);
	}

	//fout<<y<<"\n";
	y=0.0;
i++;
}
fout.close();fin.close();




}


