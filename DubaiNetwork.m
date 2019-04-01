% AAE56000, Spring 2019
% Dubai Transport SoS Project
% Milan Bidare, Mateus Feitosa, Alex Kirtley, Sujit Shivaprasad, Thomas Shaw
%

% Tram Green line
TramGreenLine_s = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20];
TramGreenLine_t = [2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19];
TramGreenLineWeights = [3 2 1 2 2 2 2 2 2 2 2 2 2 2 2 3 3 2 2 3 2 1 2 2 2 2 2 2 2 2 2 2 2 2 3 3 2 2];
TramGreenLineName =  ...
{
'Etisalat'      %1
'Al Qusais'     %2
'DAFZ'          %3
'Al Nahda'      %4
'Stadium'       %5
'Al Qiyadah'    %6
'Abu Hall'      %7
'Abu Baker Al Siddique'   %8
'Salah Al Din'  %9
'Union - Green Line' %10
'Baniyas Square' %11    
'Palm Deira'    %12
'Al Ras'        %13
'Al Ghubaiba'   %14
'Al Fahkli'     %15
'BurJuman - Green Line' %16
'Oud Metha'     %17
'DHC'           %18
'Al Jadaf'      %19
'Creek'         %20
};

% Tram Red Line - 
TramRedLine_s = [21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48];
TramRedLine_t = [22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47];
TramRedLineWeights = [4 2 1 2 2 2 3 2 2 2 2 2 1 2 2 5 2 2 2 2 3 2 2 2 3 3 4 4 2 1 2 2 2 3 2 2 2 2 2 1 2 2 5 2 2 2 2 3 2 2 2 3 3 4];
TramRedLineName =  ...
{
'Rashidiya'             %21
'Emirates'              %22
'Airport Terminal 3'    %23
'Airport Terminal 1'    %24
'GGICO'                 %25
'Deira City Centre'     %26
'Al Rigga'              %27 
'Union - Red Line'      %28
'BurJuman - Red Line'   %29
'ADCB'                  %30
'Al Jafiliya'           %31
'World Trade Centre'    %32
'Emirates Towers'       %33
'Financial Centre'      %34
'Burj Khalifa / Dubai Mall' %35
'Business Bay'          %36
'Noor Bank'             %37
'First Abu Dhabi Bank'  %38
'Mall of the Emirates'  %39
'Sharaf DG'             %40
'Dubai Internet City'   %41
'Nakheel'               %42
'DAMAC PROPERTIES'      %43
'DMCC'                  %44
'Ibn Battuta'           %45
'Energy'                %46
'Danube'                %47
'UAE Exchange'          %48
};

%Tram RedGreen connections
TramRedGreen_s = [10 28 16 29];
TramRedGreen_t = [28 10 29 16];
TramRedGreen_weights = [5 5 5 5];


%data summation
s = [TramGreenLine_s TramRedLine_s TramRedGreen_s]';
t = [TramGreenLine_t TramRedLine_t TramRedGreen_t]';
weights = [TramGreenLineWeights TramRedLineWeights TramRedGreen_weights]';
names = [TramGreenLineName
         TramRedLineName];

NodeTable = table(names,'VariableNames',{'Name'});
EdgeTable = table([s t],weights,'VariableNames',{'EndNodes' 'Weight'});

G = digraph(EdgeTable,NodeTable)
h = plot(G)


%%%%%%%%%Metrics

%shortest path matrix (in minutes, as our weights are travel time)
D = distances(G);
avg_shortest_path = mean2(D)


