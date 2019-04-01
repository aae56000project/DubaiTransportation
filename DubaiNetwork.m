% AAE56000, Spring 2019
% Dubai Transport SoS Project
% Milan Bidare, Mateus Feitosa, Alex Kirtley, Sujit Shivaprasad, Thomas Shaw
%

%% ----------- Metro Lines ----------------

% Metro Green line
MetroGreenLine_s = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20];
MetroGreenLine_t = [2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19];
MetroGreenLine_weights = [3 2 1 2 2 2 2 2 2 2 2 2 2 2 2 3 3 2 2 3 2 1 2 2 2 2 2 2 2 2 2 2 2 2 3 3 2 2];
MetroGreenLine_names =  ...
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

% Metro Red Line - 
MetroRedLine_s = [21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48];
MetroRedLine_t = [22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47];
MetroRedLine_weights = [4 2 1 2 2 2 3 2 2 2 2 2 1 2 2 5 2 2 2 2 3 2 2 2 3 3 4 4 2 1 2 2 2 3 2 2 2 2 2 1 2 2 5 2 2 2 2 3 2 2 2 3 3 4];
MetroRedLine_names =  ...
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

%%Metro RedGreen connections
MetroRedGreen_s = [10 28 16 29];
MetroRedGreen_t = [28 10 29 16];
MetroRedGreen_weights = [5 5 5 5];

%%Metro Summation
Metro_s = [MetroRedLine_s MetroGreenLine_s MetroRedGreen_s];
Metro_t = [MetroRedLine_t MetroGreenLine_t MetroRedGreen_t];
Metro_weights = [MetroRedLine_weights MetroGreenLine_weights MetroRedGreen_weights];
Metro_names = [MetroRedLine_names 
               MetroGreenLine_names];
           
%% ----------- Tram Lines ---------------- 

%Tram T01 'Dubai Tram'
TramT01_s = [49 50 51 52 53 54 55 56 50 51 52 53 54 55 56 57];
TramT01_t = [50 51 52 53 54 55 56 57 49 50 51 52 53 54 55 56];
TramT01_weights = [2 3 3 3 1 2 3 2 2 3 3 3 1 2 3 2];
TramT01_names = ...
{
'Jumeirah Lakes Towers' %49
'Dubai Marina Mall'     %50
'Dubai Marina'          %51
'Marina Towers'         %52
'Mina Seyahi'           %53
'Media City'            %54
'Palm Jumeirah'         %55
'Knowledge Village'     %56
'Al Sufouh'             %57
};

%Tram connections
TramConnect_s = [];
TramConnect_t = [];
TramConnect_weights = [];

%Tram Summation
Tram_s = [TramT01_s TramConnect_s];
Tram_t = [TramT01_t TramConnect_t];
Tram_weights = [TramT01_weights TramConnect_weights];
Tram_names = [TramT01_names];

%% ----------- Bus Lines ----------------           

%connection array, append to after each line is added. Only find
%connections from lower node numbers to avoid duplication.
bus_conn_s = [];
bus_conn_t = [];
bus_conn_weights = [];

%R7
br7_s = [58 59 60 61 62 63 64 65 66 67 68 69 59 60 61 62 63 64 65 66 67 68 69 70];
br7_t = [59 60 61 62 63 64 65 66 67 68 69 70 58 59 60 61 62 63 64 65 66 67 68 69];
br7_weights = [1 2 4 6 1 1 1 1 1 1 3 5 1 2 4 6 1 1 1 1 1 1 3 5];
br7_names = ...
{
'Quoz, J Mart Supermarket'          %58
'Quoz, Clinic'                      %59
'Quoz, Dubai Municipality Center'   %60
'Business Bay Metro Bus Stop'       %61
'Dubai Petroleum Corporation'       %62
'Wasl, Emirates Bank'               %63
'Wasl, Road 1'                      %64
'Wasl Emarat Petrol Station'        %65
'Jumeira American School'           %66
'Wasl, Park'                        %67
'Iranian Hospital'                  %68
'Hudheiba, Road'                    %69
'Satwa, Bus Station'                %70
};

%
bus_conn_s = [bus_conn_s];
bus_conn_t = [bus_conn_t];
bus_conn_weights = [bus_conn_weights];

%R8
br8_s = [71	72	73	74	75	76	77	78	79	80	81	82	83	84	85	86	87	88	89	90	91	92	93	94	95	96	97	98	99	100	101	102	103	104	105	106	107	108	109	110	111	112 72	73	74	75	76	77	78	79	80	81	82	83	84	85	86	87	88	89	90	91	92	93	94	95	96	97	98	99	100	101	102	103	104	105	106	107	108	109	110	111	112	113];
br8_t = [72	73	74	75	76	77	78	79	80	81	82	83	84	85	86	87	88	89	90	91	92	93	94	95	96	97	98	99	100	101	102	103	104	105	106	107	108	109	110	111	112	113 71	72	73	74	75	76	77	78	79	80	81	82	83	84	85	86	87	88	89	90	91	92	93	94	95	96	97	98	99	100	101	102	103	104	105	106	107	108	109	110	111	112];
br8_weights = [7 3 2 1 1 3 1 1 1 .1 1 1 1 1 1 .1 4 2 .1 1 1 1 1 1 1 1 1 2 1 1 2 .1 1 2 .1 5 1 1 2 2 1 6 7 3 2 1 1 3 1 1 1 .1 1 1 1 1 1 .1 4 2 .1 1 1 1 1 1 1 1 1 2 1 1 2 .1 1 2 .1 5 1 1 2 2 1 6];
br8_names = ...
{
'Gold Souq Bus Station'                  %%71
'Ghubaiba Bus Station'
'Department of Ports & Customs'
'Power Gas Station'
'Capital Hotel'
'Hudheiba'
'Dhiyafa'
'Jumeira, Grand Masjid'
'Jumeira Centre'
'Century Plaza'
'Beach Center'
'Dubai Zoo'
'Mercato Shopping Mall'
'Hassa Bint Al Murr Masjid'
'Suhail Bin Jumaa Masjid'
'Rashid Al Hadees Masjid'
'Rashid Bin Bakhait Masjid'
'Majlis Al Ghoreifa'
'Saeed Majid Bil Yoha Masjid'
'Jumeira 3, Masjid'
'Dubai Offshore Sailing Club'
'Manara, Enoc'
'Abu Manara Masjid'
'Umm Suqeim 1'
'Umm Suqeim, Dubai Municipality Center'
'Saeed Bin Huzeim Masjid'
'Umm Suqeim, Library'
'Umm Suqeim, Park'
'Maharba Masjid'
'Wild Wadi'
'Burj Al Arab Hotel'
'Madinat Jumeira'
'King Salman Bin Abdulaziz Al Saud Street 1'
'King Salman Bin Abdulaziz Al Saud Street 2'
'King Salman Bin Abdulaziz Al Saud Street 3'
'Dubai College'
'Royal Mirage Hotel 1'
'The Westin Dubai Mina Seyahi Beach Hotel'
'Mina Al Siyahi, Le Meridien Hotel'
'Jumeira, Royal Meridian'
'Jumeirah Beach Residence Station 1'
'Jumeirah Beach Residence Station 2'
'Ibn Battuta Metro Bus Station'             %113
};

bus_conn_s = [bus_conn_s 12 71 14 72];
bus_conn_t = [bus_conn_t 71 12 72 14];
bus_conn_weights = [bus_conn_weights 5 5 5 5];


%R10
br10_s = [114 115 116 117 118 119 120 121 122 123 124 125 126 127 115 116 117 118 119 120 121 122 123 124 125 126 127 128];
br10_t = [115 116 117 118 119 120 121 122 123 124 125 126 127 128 114 115 116 117 118 119 120 121 122 123 124 125 126 127];
br10_weights = [4 2 2 2 2 1 3 2 1 5 2 3 15 .1 4 2 2 2 2 1 3 2 1 5 2 3 15 .1];
br10_names = ...
{
'Gold Souq Bus Station 2'         %114
'Naif Intersection'
'Burj Nahar, Intersection'
'Al Nakhal 1'
'Salah Al Din Metro Bus Stop'
'Reef Mall'
'Muraqqabat, Police Station'
'Hamarain Center'
'Al Bakhit Center'
'Ministry of Environment'
'British Council'
'Umm Hurair, Road 1'
'Al Jafiliya Bus Station'
'Honda, Training Center'
'Al Quoz, Bus Station'          %128
};

bus_conn_s = [bus_conn_s 12 114 114 71];
bus_conn_t = [bus_conn_t 114 12 71 114];
bus_conn_weights = [bus_conn_weights 5 5 5 5];

%R11a
br11a_s = [];
br11a_t = [];
br11a_weights = [];
br11a_names = ...
{
'Gold Souq Bus Station'         %129
'Naif Intersection'
'Burj Nahar, Intersection'
'Al Nakhal 1'
'Union Metro Bus Stop A'
'Etisalat Head Office'
'Maktoum Road'
'Clock Tower Roundabout'
'DNATA'
'Flame Intersection'
'Garhoud, Intersection'
'Airport Terminal 1, Arrival'
'Emirates Airlines Headquarters'
'Gulf & Safa Diaries'
'Rashidiya, Grand Masjid'
'Rashidiya, Veterinary Clinic'
'Rashidiya, Police Station'
'Al Rashidiya, Street 33A, Al Jahiz Boys School'
'Rashidiya, Street 38'
'Rashidiya Metro Bus Station'
'Mushrif, Eppco'
'Mushrif, Masjid'
'Mushrif, Park'
'Mizhar 2, Turnoff'
'Mushrif, Veterinary Services'
'Khawaneej, Road 1'
'Khawaneej Road 2'
'Khawaneej Roundabout'
'Amardi, Boys School'
'Khawaneej 1'
'Khawaneej, Palace Masjid'
'Faisal Stud'
'Khawaneej, Women’s Association'
'Khawaneej, Al Athbaa Primary School Terminus'
'Khawaneej, Women’s Association'
'Faisal Stud'
'Khawaneej, Palace Masjid'
'Khawaneej 1'
'Amardi, Boys School'
'Khawaneej, Health Center'
'Bin Bisher Farm'
'Khawaneej, Boys School'
'Rawabi Diary, Crossing'
'Orient Irrigation Services'
'Imam Al Shafi Masjid, Amardi'
'Amardi, Road 1'
'Amardi, Road 2'
'Amardi, Road 3'
'Amardi, Road 4'
'Awir, Etisalat'
'Awir, CMC Rounabout'
'Awir, CMC Road 1'
'Awir, Dewa Wells Unit'
'Awir, Palace'
'Awir, Waha School'
'Awir, CMC Road 2'
'Awir, CMC Road 3'
'Awir, CMC Road 4'
'Awir, CMC Masab Bin Umair Masjid'
'Awir, CMC'
'Awir, CMC Masab Bin Umair Masjid'
'Awir, CMC Road 4'
'Awir, CMC Road 3'
'Awir, Waha School'
'Awir, Palace'
'Awir, Dewa Wells Unit'
'Awir, CMC Road 1'
'Awir, Masjid'
'Awir, Boys School'
'Awir, Dubai Municipality Center'
'Awir, Girls School'
'Awir 1'
'Awir, Emirates NBD'                %301
};

%R11b
br11b_s = [];
br11b_t = [];
br11b_weights = [];
br11b_names = ...
{
'Rashidiya Metro Bus Station'       %302
'Mushrif, Eppco'
'Mushrif, Masjid'
'Mushrif, Park'
'Mizhar 2, Turnoff'
'Mushrif, Veterinary Service'
'Khawaneej, Road 1'
'Khawaneej Road 2'
'Khawaneej Roundabout'
'Amardi, Boys School'
'Khawaneej 1'
'Khawaneej, Palace Masjid'
'Faisal Stud'
'Khawaneej, Women’s Association'
'Khawaneej, Al Athbaa Primary School Terminus'
'Khawaneej, Women’s Association'
'Faisal Stud'
'Khawaneej, Palace Masjid'
'Khawaneej 1'
'Amardi, Boys School'
'Khawaneej, Health Center'
'Bin Bisher Farm'
'Khawaneej, Boys School'
'Rawabi Diary, Crossing'
'Orient Irrigation Services'
'Imam Al Shafi Masjid, Amardi'
'Amardi, Road 1'
'Amardi, Road 2'
'Amardi, Road 3'
'Amardi, Road 4'
'Awir, Etisalat'
'Awir, CMC Rounabout'
'Awir, CMC Road 1'
'Awir, Dewa Wells Unit'
'Awir, Palace'
'Awir, Waha School'
'Awir, CMC Road 2'
'Awir, CMC Road 3'
'Awir, CMC Road 4'
'Awir, CMC Masab Bin Umair Masjid'
'Awir, CMC'
'Awir, CMC Masab Bin Umair Masjid'
'Awir, CMC Road 4'
'Awir, CMC Road 3'
'Awir, Waha School'
'Awir, Palace'
'Awir, Dewa Wells Unit'
'Awir, CMC Road 1'
'Awir, Masjid'
'Awir, Boys School'
'Awir, Dubai Municipality Center'
'Awir, Girls School'
'Awir 1'
'Awir, Emirates NBD'
'Awir, Terminus'                    %356
};

%R12
br12_s = [];
br12_t = [];
br12_weights = [];
br12_names = ...
{
'Ghubaiba Bus Station'              %357
'Department of Ports & Customs'
'Power Gas Station'
'Capital Hotel'
'Hudheiba'
'Mahboubi Clinic'
'Iranian Hospital'
'Wasl, Park'
'Noor Center'
'Jumeira American School'
'Wasl Emarat Petrol Station'
'Wasl, Road 1'
'Police Training School'
'Jumeira, Post Office'
'Wasl Road, Box Park 1'
'Safa, Dubai Electricity and Water'
'Authority Sub Station'
'Safa, Shoping Center'
'Safa, Spinneys'
'Wasl, Road 4'
'Wasl, Rawdhat Al Abraar Masjid'
'Falcon House'
'Wasl, Road 5'
'Ghadeer, Emarat'
'Safa, Veterinary Clinic'
'Wasl, Road 6'
'Wasl, Road 7'
'Thanaya Junction'
'TV Relay Station'
'Umm Sheif'
'Wasl Road, Enoc'
'Umm Suqeim, Etisalat'
'First Abu Dhabi Bank Landside'
'Metro Bus Stop'
'Gold & Diamond Park'
'Quoz, Falaknaz'
'Quoz, Ikea Stores'
'Quoz, Nabooda Cars'
'Quoz, Gargash'
'Quoz, Bin Ghaleith Masjid'
'Quoz, Kanoo Machinery Company'
'Al Quoz, Bus Station'              %398
};

%R13
br13_s = [];
br13_t = [];
br13_weights = [];
br13_names = ...
{
'Gold Souq Bus Station'             %399
'Naif Intersection'
'Burj Nahar, Intersection'
'Al Nakhal 1'
'Salah Al Din Metro Bus Stop'
'Reef Mall'
'Muraqqabat, Police Station'
'Abu Baker Al Siddique Metro Bus Stop 1'
'Dubai Scout Mission'
'Al Jadeed Bakery'
'Ahli Club'
'Stadium Metro Bus Stop'
'Ministry of Information'
'Al Nahda Metro Bus Stop'
'Twar, Union Cooperative Society'
'Dubai Airport Free Zone Metro Bus Stop'
'Fortune Plaza Hotel'
'Al Qusais Metro Bus Stop'
'Qusais, Police Station'
'Qusais, Qutami Al Suweidi Masjid'
'Technical School'
'Qusais, Eppco Vehicle Inspection'
'Russian International School'
'Emirates Housing'
'Muhaisnah 4, New Housing'
'Lebenese Private School 1'
'Public Transport Agency'
'Dubai Transport, Main Office'
'Qusais, Al Naboodah Labour Camp'
'Qusais, Al Shirawi Labour Camp'
'Qusais, Masjid Hamad Abdul Karim'
'Qusais, Bus Station External'
'Qusais, Al Ghurair Labour Camp'
'Qusais, Bu Haleeba Contracting Camp'
'Qusais, Madina Supermarket 2'
'Qusais, Galadari Labour Camp'
'Qusais, Pioneer Labour Camp'
'Qusais, Gargash Labour Camp'
'Qusais, Cemetery 2'
'Qusais, Medical Fitness Centre'
'Qusais, Dubai Municipality Staff Housing 1'    %439
};

%Bus Summation
Bus_s = [br7_s br8_s br10_s bus_conn_s];
Bus_t = [br7_t br8_t br10_t bus_conn_t];
Bus_weights = [br7_weights br8_weights br10_weights bus_conn_weights];
Bus_names = [br7_names 
             br8_names
             br10_names];

%% ----------- Hyperloop Lines ----------------           
           
%R4

%HyperLoop Summation
HL_s = [];
HL_t = [];
HL_weights = [];
HL_names = [];

%% ----------- Build overall Network ----------------   
%%Networks summation
s = [Metro_s Bus_s Tram_s HL_s]';
t = [Metro_t Bus_t Tram_t HL_t]';
weights = [Metro_weights Bus_weights Tram_weights HL_weights]';
names = [Metro_names
         Bus_names
         Tram_names
         HL_names];

NodeTable = table(names,'VariableNames',{'Name'});
EdgeTable = table([s t],weights,'VariableNames',{'EndNodes' 'Weight'});

G = digraph(EdgeTable,NodeTable)
h = plot(G)


%% --------------------------------------------  
%-----------  Network Metrics ----------------   
%---------------------------------------------  

%%shortest path matrix (in minutes, as our weights are travel time)
D = distances(G);
avg_shortest_path = mean2(D)


