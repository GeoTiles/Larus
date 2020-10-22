import csv
import sys
import matplotlib.pyplot as plt

from matplotlib import rc
rc('font',**{'family':'sans-serif','sans-serif':['Computer Modern Roman']})
## for Palatino and other serif fonts use:
#rc('font',**{'family':'serif','serif':['Palatino']})
rc('text', usetex=True)


def number_solved_in_less_than(data, prover_name, bench_name, maxtime):
    return([ len([ row for row in data if int(row['time'])<i and prover_name in row['prover'] and row['result'].strip()=="Proved" and bench_name in row['file']]) for  i in range(1,maxtime)])

def number_of_benches(data, list_of_provers, bench_name):
    l=[len([row for row in data if prover_name in row['prover'].strip() and bench_name in row['file']]) for prover_name in list_of_provers]
    if min(l) != max(l):
        print("Warning not same number of benches for all provers !")
        return(max(l))
    else:
        return(max(l))


def generate_tabular(list_of_provers, bench_names, maxtime):
    original_stdout = sys.stdout
    with open('Figures/'+'tab_results.tex','w') as f:
        sys.stdout = f
        print("""\\documentclass{article}
\\usepackage{booktabs}
\\begin{document}""")
        print("\\begin{tabular}{ll"+"r"*len(bench_names)+"}")
        print("\\toprule")
        print(" &  &  ", end='')
        print(" & ".join(bench_names), end=' \\\\\n')
        print("\\midrule")
        for x in list_of_provers:
            print(x[0].capitalize(),end=" & Total &")
            print(" & ".join([ str(len([row['prover'] for row in data if x[0] in row['prover'] and b in row['file']])) for b in bench_names] ), end=' \\\\\n')
            print("      & Proved & ", end='')
            print(" & ".join([ str(len([row['prover'] for row in data if int(row['time']) <= maxtime and x[0] in row['prover'] and b in row['file']and row['result'].strip()=="Proved"])) for b in bench_names] ), end=' \\\\\n')
            print("      & Failed & ", end='')
            print(" & ".join([ str(len([row['prover'] for row in data if x[0] in row['prover'] and b in row['file'] and (row['result'].strip()=="Failed" or int(row['time']) > maxtime)])) for b in bench_names] ), end=' \\\\\n')
        print("\\bottomrule")
        print("\\end{tabular}")
        print("\\end{document}")
        sys.stdout = original_stdout

def generate_graph(data,filename, list_of_provers_colors, bench_directory, bench_display_name, maxtime):
    for (prover_name,color_name,l_style) in list_of_provers_colors:
        plt.plot(range(1,maxtime), number_solved_in_less_than(data, prover_name, bench_directory, maxtime), color=color_name,linestyle=l_style, label = prover_name.capitalize())
    plt.ylim(1,1.05*number_of_benches(data, map(lambda x:x[0],list_of_provers_colors), bench_directory)) 
    plt.xlim(1,maxtime) 
    plt.xlabel('time in seconds') 
    plt.xscale('log')
    #ax=plt.axes()
    #plt.xaxis.set_major_locator(ticker.FixedLocator([2,4,8,16,32,64,100]))  
    plt.ylabel('number of problem solved') 
   #plt.title('Results about ' + bench_display_name) 
    plt.legend() 
    plt.savefig('Figures/'+filename)
    plt.show()    

def size_from_bench_filename(s):
    pos=s.rfind('/')
    res=s[pos+1:pos+4]
    if res.isdecimal():
        return(int(res))
    else:
        return(-1)

def pairs_size_vs_time(prover_name,maxtime):
    return([(int(row['time']), row['file'], size_from_bench_filename(row['file'])) for row in data 
        if int(row['time']) <= maxtime and 
           size_from_bench_filename(row['file']) != -1 and
           prover_name in row['prover'].strip() and
           row['result'].strip()=="Proved" and 
           "euclid" in row['file']]) 

def pourcentage_proved_vs_size(data,prover_name):
    return(
    [len([ row['file']
    for row in data 
      if prover_name in row['prover'].strip() and
         row['result'].strip()=="Proved" and 
         "euclid" in row['file'] and
         size_from_bench_filename(row['file']) < i
    ])*100/ len([ row['file']
    for row in data 
      if prover_name in row['prover'].strip() and
         "euclid" in row['file'] and
         size_from_bench_filename(row['file']) < i
    ]) for i in range(7,300)])


def generate_graph_size_vs_time(data,filename,provers,maxtime):
    for prover_name,color,style in provers:
        plt.plot(pourcentage_proved_vs_size(data,prover_name),".", color=color, label=prover_name.capitalize() )
    plt.ylabel('percentage proved') 
    plt.xlabel('proofs smaller than') 
    plt.xlim(7,300)
    #plt.title('Percentage of proofs found within 100 seconds vs size of the manual formal proof') 
    plt.legend() 
    plt.savefig("Figures/"+filename)
    plt.show()    


with open('data.csv') as csvfile:
    reader = csv.DictReader(csvfile, delimiter=';')
    data= list( row for row in reader)
with open('data-clprover-variants.csv') as csvfile:
    reader = csv.DictReader(csvfile, delimiter=';')
    data_clprover= list( row for row in reader)
    big_list= [("vampire","green","dashed"),
               ("eprover","darkred",(0, (3, 1, 1, 1, 1, 1))),
               ("iprover","darkgreen",(0,(3,5,1,5))),
               ("nanocop","orange",(0, (3, 10, 1, 10))),
               ("leancop","pink",(0, (3, 1, 1, 1))),
               ("zenon","darkblue","dotted"),
               ("ChewTPTP","purple",(0, (1, 10))),
               ("geo","gold",(0, (3, 5, 1, 5))),
               ("Larus","red","solid"),
               ("Coq-sauto","black",(0,(3,7,4,9))),
               ("Coq-firstorder","gray",(0,(3,4,4,9))),
               ("isabelle","red",(0,(3,10,4,9)))]
    variants= [
               ("Larusursa","yellow",(0, (3, 5, 1, 10))),
               ("Larusstl","green","dashed"),
               ("Larus-i","blue","dotted"),
               ("Laruslia","purple",(0,(1,5,2,5))),
               ("Larusbase","red","solid"),
               ]
    maxtime=100
    generate_graph_size_vs_time(data,"percentage_vs_size.pdf", big_list, maxtime)
    generate_tabular(big_list, ["coherent", "euclid", "col-trans", "crafted-hard"], maxtime)
    generate_graph(data,"col-trans-graph.pdf", big_list, "col-trans", "Col transitivity", maxtime)
    generate_graph(data,"euclid-graph.pdf", big_list, "euclid", "Euclid Book I", maxtime)
    generate_graph(data,"cl-benches-graph.pdf", big_list, "coherent", "Coherent Logic Benches", maxtime)
    generate_graph(data,"crafted-hard-graph.pdf", big_list, "crafted-hard", "Crafted", maxtime)
    generate_graph(data_clprover,"cl-prover-variants.pdf", variants, "euclid", "Euclid benches with different parameters for Larus", maxtime)
