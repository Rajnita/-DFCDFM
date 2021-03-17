#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#define NP 40 /* The number of colony size (employed bees+onlooker bees)*/
#define FoodNumber NP/2 /*The number of food sources equals the half of the colony size*/
#define limit 100  /*A food source which could not be improved through "limit" trials is abandoned by its employed bee*/
#define maxCycle 3000 /*The number of cycles for foraging {a stopping criteria}*/
#define D 50 /* The number of parameters of the problem to be optimized*/
#define lb -5.12 
#define ub 5.12 
#define runtime 30  

double Foods[FoodNumber][D]; 
double f[FoodNumber];  
double fitness[FoodNumber]; 
double trial[FoodNumber]; 
double prob[FoodNumber]; 
double solution [D]; 
double ObjValSol; 
double FitnessSol;
int neighbour, param2change; 
double GlobalMin; 
double GlobalParams[D]; 
double GlobalMins[runtime]; 
double r; 

typedef double (*FunctionCallback)(double sol[D]); 


/*Fitness function*/
double CalculateFitness(double fun)
 {
	 double result=0;
	 if(fun>=0)
	 {
		 result=1/(fun+1);
	 }
	 else
	 {
		 result=1+fabs(fun);
	 }
	 return result;
 }

/*The best food source is memorized*/
void MemorizeBestSource()
{
   int i,j;
    
	for(i=0;i<FoodNumber;i++)
	{
	if (f[i]<GlobalMin)
		{
        GlobalMin=f[i];
        for(j=0;j<D;j++)
           GlobalParams[j]=Foods[i][j];
        }
	}
 }

void init(int index)
{
   int j;
   for (j=0;j<D;j++)
		{
        r = (   (double)rand() / ((double)(RAND_MAX)+(double)(1)) );
        Foods[index][j]=r*(ub-lb)+lb;
		solution[j]=Foods[index][j];
		}
	f[index]=function(solution);
	fitness[index]=CalculateFitness(f[index]);
	trial[index]=0;
}

/*All food sources are initialized */
void initial()
{
	int i;
	for(i=0;i<FoodNumber;i++)
	{
	init(i);
	}
	GlobalMin=f[0];
    for(i=0;i<D;i++)
    GlobalParams[i]=Foods[0][i];


}

void SendEmployedBees()
{
  int i,j;
  /*Employed Bee Phase*/
   for (i=0;i<FoodNumber;i++)
        {
        
        r = ((double)rand() / ((double)(RAND_MAX)+(double)(1)) );
        param2change=(int)(r*D);
        
        
        r = (   (double)rand() / ((double)(RAND_MAX)+(double)(1)) );
        neighbour=(int)(r*FoodNumber);

            
        while(neighbour==i)
        {
        r = (   (double)rand() / ((double)(RAND_MAX)+(double)(1)) );
        neighbour=(int)(r*FoodNumber);
        }
        for(j=0;j<D;j++)
        solution[j]=Foods[i][j];

        /*v_{ij}=x_{ij}+\phi_{ij}*(x_{kj}-x_{ij}) */
        r = (   (double)rand() / ((double)(RAND_MAX)+(double)(1)) );
        solution[param2change]=Foods[i][param2change]+(Foods[i][param2change]-Foods[neighbour][param2change])*(r-0.5)*2;

        
        if (solution[param2change]<lb)
           solution[param2change]=lb;
        if (solution[param2change]>ub)
           solution[param2change]=ub;
        ObjValSol=function(solution);
        FitnessSol=CalculateFitness(ObjValSol);
        
   
        if (FitnessSol>fitness[i])
        {
        
        trial[i]=0;
        for(j=0;j<D;j++)
        Foods[i][j]=solution[j];
        f[i]=ObjValSol;
        fitness[i]=FitnessSol;
        }
        else
        {   /*if the solution i can not be improved, increase its trial counter*/
            trial[i]=trial[i]+1;
        }


        }

        /*end of employed bee phase*/

}


void CalculateProbabilities()
{
     int i;
     double maxfit;
     maxfit=fitness[0];
  for (i=1;i<FoodNumber;i++)
        {
           if (fitness[i]>maxfit)
           maxfit=fitness[i];
        }

 for (i=0;i<FoodNumber;i++)
        {
         prob[i]=(0.9*(fitness[i]/maxfit))+0.1;
        }

}

void SendOnlookerBees()
{

  int i,j,t;
  i=0;
  t=0;
  /*onlooker Bee Phase*/
  while(t<FoodNumber)
        {

        r = ((double)rand() / ((double)(RAND_MAX)+(double)(1)));
        if(r<prob[i]) /*choose a food source depending on its probability to be chosen*/
        {        
        t++;
        r = ((double)rand() / ((double)(RAND_MAX)+(double)(1)));
        param2change=(int)(r*D);
        r = ((double)rand() / ((double)(RAND_MAX)+(double)(1)) );
        neighbour=(int)(r*FoodNumber);
       
        while(neighbour==i)
        {
        r = ((double)rand() / ((double)(RAND_MAX)+(double)(1)) );
        neighbour=(int)(r*FoodNumber);
        }
        for(j=0;j<D;j++)
        solution[j]=Foods[i][j];
        r = ((double)rand() / ((double)(RAND_MAX)+(double)(1)) );
        solution[param2change]=Foods[i][param2change]+(Foods[i][param2change]-Foods[neighbour][param2change])*(r-0.5)*2;

        if (solution[param2change]<lb)
           solution[param2change]=lb;
        if (solution[param2change]>ub)
           solution[param2change]=ub;
        ObjValSol=function(solution);
        FitnessSol=CalculateFitness(ObjValSol);
       
        if (FitnessSol>fitness[i])
        {
                trial[i]=0;
        for(j=0;j<D;j++)
        Foods[i][j]=solution[j];
        f[i]=ObjValSol;
        fitness[i]=FitnessSol;
        }
        else
        {  
            trial[i]=trial[i]+1;
        }
        } 
        i++;
        if (i==FoodNumber)
        i=0;
        }
        


void SendScoutBees()
{
int maxtrialindex,i;
maxtrialindex=0;
for (i=1;i<FoodNumber;i++)
        {
         if (trial[i]>trial[maxtrialindex])
         maxtrialindex=i;
        }
if(trial[maxtrialindex]>=limit)
{
	init(maxtrialindex);
}
}


int main()
{
int iter,run,j;
double mean;
mean=0;
srand(time(NULL));

for(run=0;run<runtime;run++)
{

initial();
MemorizeBestSource();
for (iter=0;iter<maxCycle;iter++)
    {
    SendEmployedBees();
    CalculateProbabilities();
    SendOnlookerBees();
    MemorizeBestSource();
    SendScoutBees();
    }
for(j=0;j<D;j++)
		{
			printf("GlobalParam[%d]: %f\n",j+1,GlobalParams[j]);
		}
printf("%d. run: %e \n",run+1,GlobalMin);
GlobalMins[run]=GlobalMin;
mean=mean+GlobalMin;
}
mean=mean/runtime;
printf("Means of %d runs: %e\n",runtime,mean);

}

