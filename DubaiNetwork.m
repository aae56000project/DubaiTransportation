% AAE56000, Spring 2019
% Dubai Transport SoS Project
% Milan Bidare, Mateus Feitosa, Alex Kirtley, Sujit Shivaprasad, Thomas Shaw
%
% This script cr eates a Graph Network of the Dubai transportation system
%

%Initiale cell arrays
StationList = {};       % List of all stations input directly
StationListPlus = {};   % List of all stationts with route appended
StationListIndex = {};  % List of station numbers
RouteList = {};         % List of Name of routes
WeightsList = {};       % List of Weights of routes

%Initialize arrays
source = [];            % source edge array
target = [];            % target edge array
weights = [];           % weights array
UniqueNodeIndex = [];   % Unique Node index for metrics
RouteTypeManual = [];   % Defines if route edges will be manually entered

% Initialize Varaibles
SNum = 0;               % integer to increment Lists

%Initialize Asusmptions
Xfer_time = 0;

%Select Hyperloop Configuration
HL_Config = 1;

%plot on/off (plot takes time to generate)
plot_on = 1;
HL6_calculation = 0;

%% ----------- Metro Lines ----------------

% Metro Green line
SNum = SNum + 1;
RouteList{SNum} = 'MetroGreen';
WeightsList{SNum} = [3 2 1 2 2 2 2 2 2 2 2 2 2 2 2 3 3 2 2];
StationList{SNum} = ...
{
'Etisalat'   
'Al Qusais'  
'DAFZ'       
'Al Nahda'   
'Stadium'    
'Al Qiyadah' 
'Abu Hall'   
'Abu Baker Al Siddique'   
'Salah Al Din'  
'Union'
'Baniyas Square'     
'Palm Deira'    
'Al Ras'        
'Al Ghubaiba'   
'Al Fahkli'     
'BurJuman' 
'Oud Metha'     
'DHC'           
'Al Jadaf'      
'Creek'         
};

% Metro Red Line
SNum = SNum + 1;
RouteList{SNum} = 'MetroRed';
WeightsList{SNum} = [4 2 1 2 2 2 3 2 2 2 2 2 1 2 2 5 2 2 2 2 3 2 2 2 3 3 4];
StationList{SNum} = ...
{
'Rashidiya'         
'Emirates'          
'Airport Terminal 3'
'Airport Terminal 1'
'GGICO'             
'Deira City Centre' 
'Al Rigga'          
'Union'  
'BurJuman'   
'ADCB'                 
'Al Jafiliya'          
'World Trade Centre'   
'Emirates Towers'      
'Financial Centre'     
'Burj Khalifa'
'Business Bay'         
'Noor Bank'            
'First Abu Dhabi Bank' 
'Mall of the Emirates' 
'Sharaf DG'            
'Dubai Internet City'  
'Nakheel'              
'DAMAC PROPERTIES'     
'DMCC'                 
'Ibn Battuta'          
'Energy'               
'Danube'               
'UAE Exchange'         
};

%% ----------- Tram Lines ---------------- 

%Tram T01 'Dubai Tram'
SNum = SNum + 1;
RouteList{SNum} = 'DubaiTram';
WeightsList{SNum} = [2 3 3 3 1 2 3 2];
StationList{SNum} = ...
{
'Jumeirah Lakes Towers' 
'Dubai Marina Mall'     
'Dubai Marina'          
'Marina Towers'     
'Mina Seyahi'       
'Media City'        
'Palm Jumeirah'     
'Knowledge Village' 
'Al Sufouh'         
};


%% ------------------------- Local Bus Routes----------------------------

%Bus Route 7
SNum = SNum + 1;
RouteList{SNum} = 'BR7';
WeightsList{SNum} = [1 2 4 6 1 1 1 1 1 1 3 5];
StationList{SNum} = ...
{
'Quoz, J Mart Supermarket'       
'Quoz, Clinic'                   
'Quoz, Dubai Municipality Center'
'Business Bay Metro Bus Stop'    
'Dubai Petroleum Corporation'    
'Wasl, Emirates Bank'            
'Wasl, Road 1'                   
'Wasl Emarat Petrol Station'     
'Jumeira American School'        
'Wasl, Park'                     
'Iranian Hospital'               
'Hudheiba, Road'                 
'Satwa, Bus Station'             
};

%Bus Route 8
SNum = SNum + 1;
RouteList{SNum} = 'BR8';
WeightsList{SNum} = [7 3 2 1 1 3 1 1 1 .1 1 1 1 1 1 .1 4 2 .1 1 1 1 1 1 1 1 1 2 1 1 2 .1 1 2 .1 5 1 1 2 2 1 6];
StationList{SNum} = ...
{
'Gold Souq Bus Station'       
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
'Ibn Battuta Metro Bus Station'   
};

%Bus Route 10
SNum = SNum + 1;
RouteList{SNum} = 'BR10';
WeightsList{SNum} = [4 2 2 2 2 1 3 2 1 5 2 3 15 .1];
StationList{SNum} = ...
{
'Gold Souq Bus Station'    
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
'Al Quoz, Bus Station'    
};

%Bus Route 11a
SNum = SNum + 1;
RouteList{SNum} = 'BR11a';
WeightsList{SNum} = [2 1 2 3 1 1 1 1 1 2 4 5 1 3 1 2 1 1 8 1 2 1 2 2 1 2 1 1 1 2 1 1 1 1 2 1 .1 1 1 1 1 1 .1 1 1 4 1 1 .1 1 1 1 1 1 1 1 1 1 2 .1 2 2 1 1 1 1 1 .1 1 1 2 1];
StationList{SNum} = ...
{
'Gold Souq Bus Station'  
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
'Khawaneej, Womens Association'
'Khawaneej, Al Athbaa Primary School Terminus'
'Khawaneej, Womens Association'
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
};

%Bus Route 12
SNum = SNum + 1;
RouteList{SNum} = 'BR12';
WeightsList{SNum} = [4 1 1 1 1 2 1 1 1 .1 1 1 .1 2 5 1 1 1 1 1 1 1 1 1 .1 1 .1 1 1 1 4 2 1 1 1 1 1 1 2];
StationList{SNum} = ...
{
'Al Ghubaiba Bus Station'   
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
'Safa, Dubai Electricity and Water Authority Sub Station'
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
'First Abu Dhabi Bank Landside Metro Bus Stop'
'Gold & Diamond Park'
'Quoz, Falaknaz'
'Quoz, Ikea Stores'
'Quoz, Nabooda Cars'
'Quoz, Gargash'
'Quoz, Bin Ghaleith Masjid'
'Quoz, Kanoo Machinery Company'
'Al Quoz, Bus Station'      
};

%R15
SNum = SNum + 1;
RouteList{SNum} = 'BR15';
WeightsList{SNum} = [2 1 2 1 1 1 2 4 1 2 1 1 1 1 2 1 1 1 1 .1 2 2 3 6 1 1 .1 1 1 .1 3 1 1];
StationList{SNum} = ...
{
'Al Ghubaiba Bus Station'  
'Falcon Intersection'
'Raffa'
'Rolla'
'Al Fahidi Metro Bus Stop A'
'Al Fahidi Metro Bus Stop B'
'Mankhool, Standard Chartered Bank'
'Sheikh Rashid Road I/S'
'Hudheiba, Turnoff'
'Hana Center'
'Satwa, Masjid'
'Satwa, Clinic'
'Bada?A'
'Satwa, Square'
'Khadri Masjid'
'Bilal Bin Ribah School'
'Satwa, Road'
'Rehabilitation Center'
'Wasl, Emirates Bank'
'Police Training School'
'Jumeira, Post Office'
'Wasl Road, Box Park 1'
'Wasl Road, Box Park 2'
'Hadiqa Street'
'Honda, Training Center'
'Emirates Gas Factory'
'Queen Palace Factory'
'Galadari Printing & Publishing'
'Khaleej Times'
'Quoz, Latifa Bint Hamdan Street'
'Quoz, New Housing Junction'
'Quoz, Al Khail Gate Entrance 1'
'Quoz, Al Khail Gate 1'
'Quoz, Al Khail Gate 2' 
};    

%Bus Route 17
SNum = SNum + 1;
RouteList{SNum} = 'BR17';
WeightsList{SNum} = [4 2 2 2 2 2 1 1 1 1 1 1 1 1 2 1 1 1 2 .1 1 3 1 2 1 1 1 .1 1 3 1 .1 1 1 1 2 1 .1 1 2 .1 2 1];
StationList{SNum} = ...
{
'Sabkha, Bus Station'
'Khaleej Road'
'Hyatt Regency Hotel'
'Khansa School'
'Baraha, Hospital'
'Dubai Hospital'
'Abu Hail, Bin Eid Al Shabi Restaurant 1'
'Abu Hail, Roundabout'
'Hamriya, Port'
'Hamriya'
'Wuhaida, School'
'Hamriya, Clinic'
'Al Mamzar, Shabab Alahli Club'
'Dubai Folklore Theatre'
'Wuhaida, Road'
'Al Nahda, Shabab Alahli Club'
'Stadium Metro Bus Stop'
'Ministry of Information'
'Al Nahda Metro Bus Stop'
'Twar, Union Cooperative Society'
'Dubai Airport Free Zone Metro Bus Stop'
'Twar 1, Emarat Al Mawred'
'DAFZA'
'Twar 1, Emarat Al Mawred'
'Al Khulafaa Al Rashideen Boys School'
'Dubai Grand Hotel'
'Damascus Road 1'
'Damascus Road 2'
'Damascus Road 3'
'Dubai Abattoir'
'Al Qusais, Eppco Vehicle Inspection'
'Muhaisnah 4, Jamal Building'
'Muhaisnah 4, Lootha Building'
'Oxford School'
'Oxford School Gate 4'
'Muhaisnah 4, Awqaf Housings'
'Russian International School'
'Lulu Village'
'UIP School'
'Lebenese Private School 1'
'Muhaisnah 4, Police Colony'
'Muhaisnah 4, Police Colony'
'Dubai Transport, Depot'
'Muhaisnah 4, Wasl Oasis II'
};

%Bus Route 21
SNum = SNum + 1;
RouteList{SNum} = 'BR21';
WeightsList{SNum} = [4 1 1 1 2 1 2 1 1 2 1 2 1 1 2 1 5 2 .1 1 .1 1 .1 2 1 1 1 3 3 1 1 2 1 1 .1 1 1 1 1 1 1 .1 1 1 1 1 3 2 2 1 2 1 1 1 1 2];
StationList{SNum} = ...
{
'Al Ghubaiba Bus Station'
'Falcon Intersection'
'Raffa'
'Rolla'
'Al Fahidi Metro Bus Stop A'
'Four Point Sheraton Hotel'
'BurJuman Metro Bus Stop A'
'BurJuman Metro Bus Stop B'
'Centre Point Shopping Centre'
'ADCB Seaside Metro Bus Stop'
'Department of Health'
'Al Jafiliya Seaside Metro Bus Stop'
'Trade Center Metro Bus Stop'
'White Crown Tower'
'Durrah Tower'
'Emirates Tower Seaside Metro Bus Stop'
'Rostamani Tower'
'Safa, Interchange'
'Quoz, Dubai Municipality Center'
'Quoz, Intersection'
'Quoz, Housing 1'
'Quoz, Housing 2'
'Pepsi Cola Factory'
'Quoz, Yusuf Motors 1'
'Quoz, Cemetery'
'Oasis Center'
'Marine Center'
'Bosch Center'
'Quoz, Unimex'
'Noor Bank Landside Metro Bus Stop'
'Khaleej Times'
'Quoz, Latifa Bint Hamdan Street'
'Quoz, New Housing Junction'
'Oasis Village'
'Quoz, AST Company'
'Joton Paints'
'Rostamani Steel Mills'
'Bartawi Camps'
'ETA Steel Works'
'Emirates Printing Press'
'Emirates Industries'
'Khaleej, Metal Coating'
'Majid Industries'
'Le Meridien Hotel, Accommodation'
'Ducast Factory'
'Bahar Plastic Factory'
'Danways Emarat'
'Quoz Industrial Area 3, Terminus'
'Hilton Jumeria Hotel, Accomodation'
'Golden Neon Corporation'
'Habtoor Equipment Corporation'
'Rigid Construction, Camps'
'Quoz, Emirates Glass'
'Quoz, T. Choithram Stores'
'Quoz, Dynamic Industries'
'Quoz, APEX Concrete Factory'
'Quoz, Clinical Pathology Services'  
};

%Bus Route 22
SNum = SNum + 1;
RouteList{SNum} = 'BR22';
WeightsList{SNum} = [1 6 1 1 2 1 .1 3 1 1 1 2 1 1 .1 2 .1 .1 1 1 1 2];
StationList{SNum} = ...
{
'Deira City Center Bus Station' 
'City Centre Metro Bus Stop A 2'
'Ahli Club'
'Stadium Metro Bus Stop'
'Ministry of Information'
'Sheikh Rashid Colony'
'Emirates Driving Institute'
'Ministry Of Human Resources & Emiratisation'
'Dubai Women?s College'
'Dubai Women?s College 3'
'Dubai Women?s College Main Entrance'
'Al Nahda, Al Ameen Private School'
'Al Nahda, 19A Street 1'
'Al Nahda, Madina Super Market'
'Al Nahda, Emirates College'
'Al Nahda, Canary Bldg'
'Al Nahda 1, Masjid Rada'
'Al Nahda 1, Al Banai'
'Al Nahda 1, Burj Al Nahda'
'Al Nahda 1, Zaafranah'
'Al Nahda 1, Burj Al Noor'
'Al Nahda 1, Terminus 1'
'Al Nahda 1, Terminus 2'   
};

%Bus Route 24
SNum = SNum + 1;
RouteList{SNum} = 'BR24';
WeightsList{SNum} = [0.1 2 2 1 1 1 .1 1 1 .1 9 2 4 1 1 1 4 2 1 1 3 1 2 5 1 1 1 .1 1];
StationList{SNum} = ...
{
'Al Nahda, The Sheffeild Private School' 
'Al Nahda, Zuleikha Hospital'
'Al Nahda, 19A Street 1'
'Al Nahda, Madina Super Market'
'Al Nahda, Emirates College'
'Al Nahda, Canary Bldg'
'Al Nahda 1, Terminus 2'
'Al Nahda 1, Burj Al Noor'
'Al Nahda 1, Terminus 1'
'Nahda 1, Enoc'
'NMC Hospital'
'Garhoud, Intersection'
'Airport Terminal 1, Arrival'
'Emirates Airlines Headquarters'
'Emirates Metro Bus Stop'
'Dubai Municipality Garage'
'Mawakeb School'
'Dubai Festival City, Marks & Spencer'
'Dubai Festival City, IKEA'
'Rebat Street 2'
'Umm Ramool, Enoc'
'Hepworth Plastics'
'Nad Al Hamar Grand Masjid 2'
'Ras Al Khor, Comm. Complex 2'
'International City, Post office 1'
'International City, Rivera Dreams Apartments 1'
'International City, Police Station'
'International City, Persia O02'
'International City, Persia M03'
'International City, Greece K12 Terminus'   
};

%Bus Route 27
SNum = SNum + 1;
RouteList{SNum} = 'BR27';
WeightsList{SNum} = [4,0.1,1,1,1,0.1,3,2,1,2,1,4,4,4,0.1,4,2,1,2,2,10,3];
StationList{SNum} = ...
{
'Gold Souq Bus Station'  
'Al Ras  Metro Bus Stop'
'Al Ras, Public Library'
'Deira, Old Souq'
'Emirates NBD'
'Al Sabkha Marine Bus Stop'
'Deira, Beniyas Road'
'Union Metro Bus Stop D'
'Etisalat Head Office'
'Maktoum Road'
'Clock Tower Roundabout'
'DNATA'
'City Centre Metro Bus Stop A 2'
'Umm Hurair, Road 2'
'Umm Hurair, Road 1'
'Department of Health'
'Al Jafiliya Landside Metro Bus Stop'
'World Trade Centre Hotel'
'Emirates Tower 2'
'Emirates Tower 1'
'Emirates Tower Landside Metro Bus Stop'
'Wasl, Etisalat'
'Burj Khalifa' 
};

%R28
SNum = SNum + 1;
RouteList{SNum} = 'BR28';
WeightsList{SNum} = [7,1,1,2,2,2,1,2,1,1,4,3,1,0.1,1,2,2,1,0.1,2,3];
StationList{SNum} = ...
{
'The Dubai Mall'
'Dubai Petroleum Corporation'   
'Rehabilitation Center'
'Satwa, Road'
'Khadri Masjid'
'Satwa, Square'
'Satwa, Masjid 2'
'Satwa, Post Office'
'Hana Center'
'Hudheiba, Turnoff'
'Hoot, Eppco'
'ADCB Metro Bus Stop Landside'
'Karama, Dubai Municipality Center'
'Karama, Ent.'
'Central Post Office'
'College of Islamic Studies 2'
'Broadcast Interchange'
'Oud Metha Metro Bus Stop'
'Oud Metha Road 1'
'Oud Metha Road 2'
'American Hospital'
'Lamcy ' 
};

%Bus Route 31
SNum = SNum + 1;
RouteList{SNum} = 'BR31';
WeightsList{SNum} = [2,5,1,1,2,1,1,1,2,1,5,5,7,2,1,2,2,1,1,2,4,1,0.1,1,2,1,1,1,2,0.1,3,1];
StationList{SNum} = ...
{
'Airport Terminal 2, Departure'
'Airport Terminal 2, Arrival'
'Twar, Cemetery 1'   
'Twar, Cemetery 2'
'Twar 1 - A'
'Ministry of Information'
'Al Nahda Metro Bus Stop'
'Twar, Union Cooperative Society'
'Dubai Airport Free Zone Metro Bus Stop'
'Fortune Plaza Hotel'
'Al Qusais Metro Bus Stop'
'Twar 3, Emirates Cooperative Society'
'Etisalat Metro Bus Station'
'Muhaisnah 1, Intersection'
'Al Mizhir, Islamic School For Training Education 1'
'Muhaisnah (1)-C'
'Muhaisnah 1, Etihad Mall (platform 01)'
'Muhaisnah 1, Etihad Mall (platform 02)'
'Muhaisnah, Dubai Modern School'
'Algeria Street 7'
'Algeria Road 6'
'Algeria Street 5'
'Algeria Street 4'
'Oud Al Muteena 2, A1'
'Oud Al Muteena 2, Masjid'
'Oud Al Muteena 2, B1'
'Oud Al Muteena 2, Emirates Co-op Society'
'Oud Al Muteena 2, C1'
'Oud Al Muteena 2, D'
'Oud Al Muteena 2, E1'
'Oud Al Muteena 2, Grand Masjid'
'Amaan Street 3'
'Oud Al Mateena Roundabout)'
};

%Bus Route 41
SNum = SNum + 1;
RouteList{SNum} = 'BR41';
WeightsList{SNum} = ones(1,13);
StationList{SNum} = ...
{
'Gold Souq Bus Station'
'Naif Intersection'
'Burj Nahar, Intersection'   
'Al Nakhal 1'
'Salah Al Din Metro Bus Stop'
'Reef Mall'
'Muraqqabat, Police Station'
'Abu Baker Al Siddique Metro Bus Stop 1'
'Dubai Scout Mission'
'Al Jadeed Bakery'
'Abu Hail Metro Bus Stop B'
'Traffic Police Department'
'Airport Terminal 2, Departure'
'Airport Terminal 2, Arrival'
};

%Bus Route 44
SNum = SNum + 1;
RouteList{SNum} = 'BR44';
WeightsList{SNum} = [2 1 2 1 2 2 1 4 1 1 2 1 1 1 1 2 2 2 1 1 3 2 1 2 2 7 1 1 1 1 1 1 1 1 4 2 1 .1 1 1];
StationList{SNum} = ...
{
'Al Ghubaiba Bus Station'
'Falcon Intersection'
'Raffa'
'Rolla'
'Al Fahidi Metro Bus Stop A'
'Four Point Sheraton Hotel'
'BurJuman Metro Bus Stop A'
'BurJuman Metro Bus Stop B'
'Saeediya School'
'Karama 2'
'Karama 1'
'Karama, Commercial Center'
'Schools Health Center'
'Karama, Ent.'
'Central Post Office'
'College of Islamic Studies 2'
'Broadcast Interchange'
'Oud Metha Metro Bus Stop'
'Oud Metha Road 1'
'Oud Metha Road 2'
'Wafi City'
'Jaddaf, Police Officers Club'
'Belhasa Driving Center'
'Wasl, Wasl Club'
'Latifa Hospital'
'Police Stadium'
'Dubai Festival City, Marks & Spencer'
'Dubai Festival City, IKEA'
'Dubai Festival City, Festival Centre'
'Dubai Festival City, Marks & Spencer 2'
'Dubai Festival City'
'Rebat Street 1'
'Rebat Street 2'
'Umm Ramool, Enoc'
'Rashidiya, Civil Defence'
'Rashidiya 1'
'Rashidiya, Police Station'
'Al Rashidiya, Street 33A, Al Jahiz'
'Boys School'
'Rashidiya, Street 38'
'Rashidiya Metro Bus Station'
};


%Bus Route 53
SNum = SNum + 1;
RouteList{SNum} = 'BR53';
WeightsList{SNum} = [6,3,2,1,1,1,3,2,13,1,1,1,1,1,1,2,0.1,3,5,2,1,1,1,2,1,0.1,2,1,2,1,2,1,1];
StationList{SNum} = ...
{
'Gold Souq Bus Station'
'Naif Park'
'Deira, Beniyas Square'   
'Memorial Plaza'
'Etisalat Head Office'
'Maktoum Road'
'Clock Tower Roundabout'
'DNATA'
'City Centre Metro Bus Stop A 2'
'Dubai Festival City, Marks & Spencer'
'Dubai Festival City, IKEA'
'Al Badia, Hillside Village A'
'Al Badia residence 1&8,A2'
'Al Badia, Residences'
'Al Badia, Deira International School'
'Al Badia, Entrance'   
'Hepworth Plastics'
'Nad Al Hamar Grand Masjid 2'
'Ras Al Khor, Comm. Complex 2'
'Al Warsan 1, Eppco 1'
'Dubai Textile City Main Gate'
'Dubai Textile City'
'International City, Lake Entrance'
'International City, Morocco'
'International City, China 3'
'International City, China 2'
'International City, Dragon Mart'
'International City, Post office 1'
'International City, Central Business district 1 (platform 1)'
'International City, Central Business district 1 (platform 2)'
'International City, Rivera Dreams Apartments 1'
'International City, Police Station'
'International City, Persia O02'
'International City, Persia M03'
};


%Bus Route 55
SNum = SNum + 1;
RouteList{SNum} = 'BR55';
WeightsList{SNum} = [2,1,1,5,10,1,0.1,1,1,0.1,1,0.1,1,1,2,0.1,1,1,1,1,1,1,1,0.1,7,1,2,1,0.1,1];
StationList{SNum} = ...
{
'Satwa, Bus Station'
'Satwa, Masjid 2'
'Satwa, Post Office'   
'Satwa, Roundabout'
'World Trade Centre Hotel'
'Dubai Country Club'
'Aden Street 1'
'Ras Al Khor 1'
'Ras Al Khor 2'
'Ras Al Khor 3'
'Ras Al Khor 4'
'Ras Al Khor, Customs'
'Ras Al Khor 5'
'Ras Al Khor 6'
'Ras Al Khor 7'
'Ras Al Khor 8'   
'Ras Al Khor 9'
'Ras Al Khor 10'
'Ras Al Khor 11'
'Ras Al Khor, Used Cars Exb. 1'
'Ras Al Khor, Used Cars Exb. 2'
'Ras Al Khor, Ducamz - 1'
'Ras Al Khor, Ducamz  - 2'
'Ras Al Khor, Veg. Mkt. Union Coop. Society'
'Ras Al Khor, Veg. Mkt.'
'International City, Post office 1'
'International City, Rivera Dreams Apartments 1'
'International City, Police Station'
'International City, Persia O02'
'International City, Persia M03 (platform 01)'
'International City, Persia M03 (platform 02)'
};

%Bus Route 61
SNum = SNum + 1;
RouteList{SNum} = 'BR61';
WeightsList{SNum} = [2,3,12,1,5,3,2,2,1,2,1,1,2,2];
StationList{SNum} = ...
{
'Ras Al Khor 1 '
'Ras Al Khor, Terminus'
'Dubai Polo Club'   
'World Trade Centre Hotel'
'Al Jafiliya Landside Metro Bus Stop'
'ADCB Metro Bus Stop Landside'
'Centre Point Shopping Centre'
'BurJuman Metro Bus Stop B'
'BurJuman Metro Bus Stop A'
'Four Point Sheraton Hotel'
'Al Fahidi Metro Bus Stop A'
'Nahda Street'
'Raffa 2'
'Falcon Intersection'
'Al Ghubaiba Bus Station'
};

%Bus Route 61D
SNum = SNum + 1;
RouteList{SNum} = 'BR61D';
WeightsList{SNum} = [3,9,1,7,2,1,6,2,0.1,2,1,2,2,3];
StationList{SNum} = ...
{
'Nad Al Shiba, Clinic'
'Nad Al Shiba, Road'
'Wasl, Wasl Club'   
'Latifa Hospital'
'Oud Metha Road 2'
'Oud Metha Road 1'
'Oud Metha Metro Bus Stop'
'BurJuman Metro Bus Stop C'
'BurJuman Metro Bus Stop A'
'Four Point Sheraton Hotel'
'Al Fahidi Metro Bus Stop A'
'Nahda Street'
'Raffa 2'
'Falcon Intersection'
'Al Ghubaiba Bus Station'
};

%Bus Route 63E
SNum = SNum + 1;
RouteList{SNum} = 'BR63E';
WeightsList{SNum} = [1,1,2,1,1,1,0.1,1,3,2,1,4,2,1,15,1,1,1,1,0.1,1,0.1,1,1,0.1,1,1,0.1,2,2,13,0.1,2,2,1,2];
StationList{SNum} = ...
{
'Al Qusais, Bus Station '
'Al Qusais, Masjid Hamad Abdul Karim'
'Al Qusais, Al Shirawi Labour Camp'   
'Abella Camp'
'Algeria Street 1'
'Algeria Street 2'
'Algeria Street 3'
'Algeria Street 4'
'Algeria Street 5'
'Algeria Road 6'
'Algeria Street 7'
'Muhaisnah, Dubai Modern School'
'Mirdiff, Private School'
'Uptown Mirdif'
'Mirdiff, ETISALAT Tower'
'Ras Al Khor, Veg. Mkt. Main Cars Park'
'Ras Al Khor, Ducamz  - 2'
'Ras Al Khor, Ducamz - 1'   
'Ras Al Khor, Used Cars Exb. 3'
'Ras Al Khor, Used Cars Exb. 1'
'Ras Al Khor 9'
'Ras Al Khor, Tawoon Trans.'
'Ras Al Khor, Mega Star Trdg.'
'Ras Al Khor, Aya Trdg.'
'Ras Al Khor, Rahmani Trdg.'
'Ras Al Khor, Areej Trdg.'
'Ras Al Khor 4'
'Ras Al Khor 3'
'Ras Al Khor 2'
'Ras Al Khor, Terminus'
'Dubai Polo Club'
'Jumeirah University 1, Latifa Bint Hamdan Street'
'Jumeirah University 1 2, Latifa Bint Hamdan Street'
'Oasis Village'
'Al Quoz, AST Company'
'Speedwell Decor'
'Al Quoz, Bus Station'
};

%Bus Route 64
SNum = SNum + 1;
RouteList{SNum} = 'BR64';
WeightsList{SNum} = [4,1,3,1,1,1,2,1,1,1,4,1,2,1,2,1,2,1,2,4,3,1,2,3,1,1,0.1,1,1,2,1,1,1,1,1,1,1,1,2];
StationList{SNum} = ...
{
'Gold Souq Bus Station '
'Naif Intersection'
'Burj Nahar, Intersection'   
'Islamic Institute'
'Rasheed Road'
'Hor Al Anz, Roundabout'
'Hor Al Anz, Turnoff'
'Abu Hail, Clinic'
'Manama'
'Hamriya Shopping Center'
'Ittehad School'
'Al Nahda, Shabab Alahli Club'
'Stadium Metro Bus Stop'
'Ministry of Information'
'Al Nahda Metro Bus Stop'
'Twar, Union Cooperative Society'
'Dubai Airport Free Zone Metro Bus Stop'
'Fortune Plaza Hotel'   
'Al Qusais Metro Bus Stop'
'Beirut Road 2'
'Rashidiya, Village'
'Hepworth Plastics'
'Nad Al Hamar Grand Masjid 2'
'Ras Al Khor, Comm. Complex 2'
'Ras Al Khor, Veg. Mkt.'
'Ras Al Khor, Veg. Mkt. Union Coop. Society'
'Ras Al Khor, Ducamz  - 2'
'Ras Al Khor, Ducamz - 1'
'Ras Al Khor, Used Cars Exb. 3'
'Ras Al Khor, Used Cars Exb. 1'
'Ras Al Khor 9'
'Ras Al Khor, Tawoon Trans.'
'Ras Al Khor, Mega Star Trdg.'
'Ras Al Khor, Aya Trdg.'
'Ras Al Khor, Rahmani Trdg.'
'Ras Al Khor, Areej Trdg.'
'Ras Al Khor 4'
'Ras Al Khor 3'
'Ras Al Khor 2'
'Ras Al Khor, Terminus'
};

%Bus Route 64A
SNum = SNum + 1;
RouteList{SNum} = 'BR64A';
WeightsList{SNum} = [4,2,1,2,1,1,4,2,5,5,5,3,1,1,2,1,2,2,5,3,1,2,2,0.1,1,2,1,3,2,0.1,1,2,1,1];
StationList{SNum} = ...
{
'Gold Souq Bus Station '
'Naif Park'
'Deira, Beniyas Square'   
'Memorial Plaza'
'Etisalat Head Office'
'Maktoum Road'
'Clock Tower Roundabout'
'DNATA'
'Flame Intersection'
'Garhoud, Intersection'
'Cargo Village Gate'
'Airport Terminal 1, Arrival 2'
'Emirates Airlines Headquarters'
'Emirates Metro Bus Stop'
'Dubai Municipality Garage'
'Mawakeb School'
'Al Garhoud, Roads & Transport Authority HQ'   
'Al Garhoud, Al Khaleej National School'
'Al Garhoud, Sheikh Zayed Housing Program'
'Dubai Festival City, Marks & Spencer'
'Dubai Festival City, IKEA'
'Al Badia, Hillside Village A'
'Al Badia residence 1&8,A2'
'Al Badia, Residences'
'Al Badia, Deira International School'
'Al Badia, Entrance'
'Hepworth Plastics'
'Nad Al Hamar Grand Masjid 2'
'Ras Al Khor, Comm. Complex 2'
'Ras Al Khor, Veg. Mkt.'
'Ras Al Khor, Veg. Mkt. Union Coop. Society'
'Ras Al Khor, Ducamz  - 2'
'Ras Al Khor, Ducamz 3'
'Ras Al Khor, WTC Residency'
'Ras Al Khor, Samari Residency'
};

%Bus Route 66
SNum = SNum + 1;
RouteList{SNum} = 'BR66';
WeightsList{SNum} = [3,1,10,3,4,3,6,1,3,2,3,3,2,1,1,2,1,5,1,2,5,1,8,1,2,6,2,1,2,1,2,1,3];
StationList{SNum} = ...
{
'Faqa, Terminus (platform 01) '
'Faqa, Terminus (platform 02)'
'Faqa'   
'Murquab, Interchange'
'Umm Eseley'
'Margham, Interchange'
'Air Force Training School'
'Marmoom Dairy Farm'
'Jazira Poultry Farm'
'Dubai Virtual Reference Station 2'
'Rawdah Poultry Farm'
'Umm Nahad, Interchange'
'Al Ain Rd, Ahazij Underpass'
'Dubai Outlet Mall'
'Menhad'
'International Center For Biosaline Agriculture'
'Academic City, Interchange'   
'Eppco, Muntazah Petrol Station'
'Nad Al Shiba, Interchange 1'
'Nad Al Shiba 2, Main Masjid'
'Dubai Polo Club'
'Wasl, Wasl Club'
'Latifa Hospital'
'Oud Metha Road 2'
'Oud Metha Road 1'
'Oud Metha Metro Bus Stop'
'BurJuman Metro Bus Stop C'
'BurJuman Metro Bus Stop A'
'Four Point Sheraton Hotel'
'Al Fahidi Metro Bus Stop A'
'Nahda Street'
'Raffa 2'
'Falcon Intersection'
'Al Ghubaiba Bus Station'
};

%Bus Route 67
SNum = SNum + 1;
RouteList{SNum} = 'BR67';
WeightsList{SNum} = [0.1,8,7,2,1,2,2,6,6,1,2,2,2,3,2,4,1,3,3,2,0.1,2,1,1,5,1,1,5,1,9,2,1,8,2,1,2,1,2,1,3];
StationList{SNum} = ...
{
'Endurance City Terminus'
'Endurance City'
'Endurance City Gate'   
'Seh as Salam Farm'
'Seh As Shuyeb'
'Hadaybit Stable'
'Nasr Stables'
'Nakheel Stables'
'Tawai Mura Camp'
'Al Lusaili Commercial Center'
'Al Lusaili Masjid'
'Al Lusaili Defence'
'Al Lusaili Intersection'
'Al Lusaili Camel Market'
'Marmoom Dairy Farm'
'Jazira Poultry Farm'
'Dubai Virtual Reference Station 2'
'Rawdah Poultry Farm'
'Umm Nahad, Interchange'
'Al Ain Rd, Ahazij Underpass'
'Dubai Outlet Mall'
'Menhad'
'International Center For Biosaline Agriculture'
'Academic City, Interchange'
'Eppco, Muntazah Petrol Station'
'Nad Al Shiba, Interchange 1'
'Nad Al Shiba 2, Main Masjid'
'Dubai Polo Club'
'Wasl, Wasl Club'
'Latifa Hospital'
'Oud Metha Road 2'
'Oud Metha Road 1'
'Oud Metha Metro Bus Stop'
'BurJuman Metro Bus Stop C'
'BurJuman Metro Bus Stop A'
'Four Point Sheraton Hotel'
'Al Fahidi Metro Bus Stop A'
'Nahda Street'
'Raffa 2'
'Falcon Intersection'
'Al Ghubaiba Bus Station'
};


%Bus Route 81
SNum = SNum + 1;
RouteList{SNum} = 'BR81';
WeightsList{SNum} = [8,1,1,1,1,1,1,4,3,0.1,1,1,2,0.1,2,0.1,1,1,1,2,0.1,2,4];
StationList{SNum} = ...
{
'The Dubai Mall'
'Dubai Petroleum Corporation'
'Wasl, Emirates Bank'   
'Police Training School'
'Jumeira, Post Office'
'Al Arouba Street'
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
'Dubai Police Academy'
'Mall of the Emirates Metro Bus Station'
};

%Bus Route 83
SNum = SNum + 1;
RouteList{SNum} = 'BR83';
WeightsList{SNum} = [1,1,1,1,1,1,0.1,1,1,0.1,3,1,1,1,2,20,9,2,2,1,4,2,0.1,2,1,2,1,1,1,2];
StationList{SNum} = ...
{
'Nakheel Seaside Metro Bus Stop '
'Shatha Tower'
'Al Thuraya Tower'   
'Dubai Media City'
'Dubai Media City, Building 14'
'International Advertising Association Building'
'Infotech, Dubai Internet City'
'Dubai Internet City, Building 9'
'Dubai Internet City, Building 8'
'Dubai Internet City, Building 5'
'Dubai Internet City, Building 1'
'Schlumberger, Dubai Internet City'
'Knowledge Village Main Gate'
'Dubai Knowledge Village Conference Centre'
'Dubai Knowledge Village Block 3'
'Abdulla Omran Taryam Street'
'Al Jafiliya Landside Metro Bus Stop'
'Schools Health Center'
'Karama, Commercial Center'
'Karama 1'
'Karama 2'
'Mankhool, Center Point'
'Mankhool, Street 12A 2'
'Mankhool, Street 12A 1'
'Mankhool, Street 7 1'
'Al Fahidi Metro Bus Stop B'
'Al Fahidi Metro Bus Stop A'
'Nahda Street'
'Raffa 2'
'Falcon Intersection'
'Al Ghubaiba Bus Station'
};

%Bus Route 84
SNum = SNum + 1;
RouteList{SNum} = 'BR84';
WeightsList{SNum} = [1,1,1,1,1,2,2,1,2,1,1,2,0.1,1,3,2,1,1,1,2,1,0.1,2,1,2,1,2,2,1,1,3,1,1,2,5,2,1,2,3];
StationList{SNum} = ...
{
'Al Quoz, Al Khail Gate 1 '
'Al Quoz, Al Khail Gate 2'
'Al Quoz, Al Khail Gate 3'   
'Al Quoz, Emirates Housing Al Khail Gate 2'
'Al Quoz, Gargash Construction Accommodation 2'
'Le Meridien Hotel, Accommodation'
'Ducast Factory'
'Bahar Plastic Factory'
'Danways Emarat'
'Al Quoz Industrial Area 3, Terminus'
'7 Up Staff Accommodation'
'National Cement Corporation, Staff Accommodation'
'Atlas Marine Service'
'Al Quoz, Jumbo Electronics Stores'
'Electro Industrial Corporation'
'Classic Crystal'
'Dubai American Academy'
'Al Barsha A'
'Mall of the Emirates 1'
'Mall of the Emirates 2'
'Al Barsha, Street 23, Dunes Hotel'
'Al Barsha, Al Waseer Compound Villas'
'Al Barsha, Street 23, Noor Center for Training'
'Al Barsha, Mawakeb School'
'Al Barsha, Dubai National School'
'Al Barsha D'
'Al Barsha E'
'Al Barsha Heights, Ramee Guestline Hotel Apartments'
'Al Barsha Heights, Saleh Bin Lahej Building'
'Al Barsha Heights, Mazoon Hotel & Apartments'
'Al Barsha Heights, Mashael Building'
'University of Wollongong , Dubai Internet City'
'Schlumberger, Dubai Internet City'
'Infotech, Dubai Internet City'
'Dubai Media City'
'Mina Al Siyahi, Le Meridien Hotel'
'Jumeira, Royal Meridian'
'Jumeirah Beach Residence Station 1'
'Jumeirah Beach Residence Station 2 (platform 01)'
'Jumeirah Beach Residence Station 2 (platform 02)'
};

%Bus Route 85
SNum = SNum + 1;
RouteList{SNum} = 'BR85';
WeightsList{SNum} = [1,1,1,1,2,1,1,1,1,2,1,1,1,2,1,1,2,2,1,11,0.1,1,0.1,1,0.1,1,0.1,0.1,3,1,1,0.1,1,1];
StationList{SNum} = ...
{
'Discovery Garden 1'
'Discovery Garden 2'
'Discovery Garden 3'
'Discovery Garden 4'
'Discovery Garden 5'
'Discovery Garden 6'
'Discovery Garden 7'
'Discovery Garden 8'
'Discovery Garden 9'
'Discovery Garden, Building No 255'
'Discovery Garden, Street 10'   
'Discovery Garden 11'
'Discovery Garden 12'
'Discovery Garden Pavilion Shopping cente'
'Discovery Garden 13'
'Discovery Garden 14'
'Discovery Garden 15'
'Discovery Garden 16'
'Ibn Battuta  Metro Bus Station'
'Ibn Battuta, Food Court 3'
'Al Thuraya Tower'
'Dubai Media City'
'Dubai Media City, Building 14'
'International Advertising Association Building'
'Infotech, Dubai Internet City'
'Dubai Internet City, Building 9'
'Dubai Internet City, Building 8'
'Dubai Internet City, Building 5'
'Dubai Internet City, Building 1'
'Schlumberger, Dubai Internet City'
'Knowledge Village Main Gate'
'Dubai Knowledge Village Conference Centre'
'Dubai Knowledge Village Block 3'
'Dubai Properties'
'Dubai Internet City Seaside Metro Bus Stop'
};

%Bus Route 88
SNum = SNum + 1;
RouteList{SNum} = 'BR88';
WeightsList{SNum} = [1,1,5,1,2,3,3,1,3,3,1,2,4,4,2,2,1,0.1,1,1,5,2,1,1,1,1,1,2,1,1,1,1,2,1,2,1,0.1,1,1,2,3];
StationList{SNum} = ...
{
'Deira City Center Bus Station '
'City Centre Metro Bus Stop A 2'
'City Centre Metro Bus Stop A'
'College of Islamic Studies'
'Central Post Office'
'Karama, Dubai Municipality Center'
'ADCB Seaside Metro Bus Stop'
'Department of Health'
'Al Jafiliya Seaside Metro Bus Stop'
'Satwa, Roundabout'
'Satwa, Masjid'   
'Satwa, Clinic'
'Hudheiba, Road'
'Wasl, Park'
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
'Abdulla Omran Taryam Street'
'Dubai Internet City Seaside Metro Bus Stop'
};

%Bus Route 91
SNum = SNum + 1;
RouteList{SNum} = 'BR91';
WeightsList{SNum} = [1,1,1,0.1,1,1,0.1,1,1,0.1,1,1,1,2,1,1,2,1,34,5,3,6];
StationList{SNum} = ...
{
'Jebel Ali, Bus Station'
'Gulf Denims Limited'
'Dubai Ports Authority, Staff Quarters'
'Jebel Ali Free Zone, Kanoo Group'
'Jebel Ali Free Zone, Roundabout 12 (platform 01)'
'Jebel Ali Free Zone, Roundabout 12 (platform 02)'
'Jebel Ali Free Zone, Kanoo Group'
'Jebel Ali Free Zone, Roundabout 8'
'Cleveland Bridge Engineering 2'
'Cleveland Bridge Engineering 1'
'Zaher Group'   
'Container Glass Factory'
'Jebel Ali Free Zone, Nafco'
'Jebel Ali Free Zone, Lease Office 5'
'Jebel Ali Free Zone, Roundabout 6'
'Aiwa Gulf Free Zone'
'Jebel Ali Free Zone, Sony'
'Dubai Ports Authority, Free Zone Office'
'Jebel Ali Free Zone, Main Gate'
'Karama, Dubai Municipality Center'
'BurJuman Metro Bus Stop A'
'Al Fahidi Metro Bus Stop A'
'Al Ghubaiba Bus Station'
};

%Bus Route 93 %Cannot find route%

%Bus Route 96
SNum = SNum + 1;
RouteList{SNum} = 'BR96';
WeightsList{SNum} = [1,0.1,1,1,0.1,2,1,2,1,2,1,1,1,1,1,2,3,17,1,3,2,1,2,1,0.1,1,1,4,1,2,1,11,0.1,1,1,1,3];
StationList{SNum} = ...
{
'Al Quoz, Bus Station'
'Queen Palace Factory'
'Galadari Printing & Publishing'
'Khaleej Times'
'Al Quoz, Latifa Bint Hamdan Street'
'Al Quoz, New Housing Junction'
'Oasis Village'
'Al Quoz, AST Company'
'Ahmadya Cont., Labour Camp'
'Qumaish Cont, Labour Camp'
'Al Quoz Industrial Area 3, Terminus'   
'7 Up Staff Accommodation'
'National Cement Corporation, Staff Accommodation'
'Atlas Marine Service'
'Al Quoz, Jumbo Electronics Stores'
'Electro Industrial Corporation'
'Classic Crystal'
'Interchange 4'
'Jebel Ali Industrial Area 1'
'Jebel Ali Industrial Area 2'
'Jebel Ali Industrial Area 4'
'Jebel Ali Industrial Area 5'
'Jebel Ali Industrial Area 6'
'Jebel Ali Industrial Area 7'
'Jebel Ali Industrial Area 8'
'Jebel Ali Industrial Area 11'
'Jebel Ali Industrial Area 6'
'Jebel Ali Industrial Area 5'
'Dutco'
'Amssar Wood Manufacturing'
'Falcon Chemicals'
'Solico'
'Shoba Contracting Labour Camp'
'Depa Contracting Labour Camp'
'Seven Seas Steel Industries'
'Dubai Contracting Labour Camp'
'Insulite Block Factory'
'Dubai Investment Park'
};

%Bus Route 97
SNum = SNum + 1;
RouteList{SNum} = 'BR97';
WeightsList{SNum} = [1,0.1,2,2,1,2,4,39,0.1,2,1];
StationList{SNum} = ...
{
'Al Qusais, Bus Station' 
'Al Qusais, Al Ghurair Labour Camp'
'Al Qusais, Bu Haleeba Contracting Camp'
'Al Qusais, Lamprell Energy Ltd. Labour Accommodation'
'Abella Camp'
'Algeria Street 1'
'Algeria Street 4'
'Tunis Road 1'
'Jebel Ali Industrial Area 1'
'Jebel Ali Industrial Area 2'
'Jebel Ali Industrial Area 12'
'Jebel Ali Industrial Area 7'
};

%Bus Route 98E
SNum = SNum + 1;
RouteList{SNum} = 'BR98E';
WeightsList{SNum} = [2,1,2,3,1,1,0.1,1,8,1,0.1,1,8,1];
StationList{SNum} = ...
{
'Satwa, Bus Station' 
'Satwa, Masjid 2'
'Satwa, Post Office'
'Satwa, Roundabout'
'Trade Center Metro Bus Stop'
'White Crown Tower'
'Durrah Tower'
'Emirates Tower Seaside Metro Bus Stop'
'Rostamani Tower'
'Emirates General Petroleum Corporation'
'Gulf News'
'Dubai Modern School'
'Emarat, Headquarters'
'Honda, Training Center'
'Al Quoz, Bus Station'
};

%Bus Route 99
SNum = SNum + 1;
RouteList{SNum} = 'BR99';
WeightsList{SNum} = [0.1,1,1,1,0.1,1,0.1,1,0.1,3,1,1,1,2,2,2];
StationList{SNum} = ...
{
'UAE Exchange Metro Bus Stop'
'Globalink Westar Shipping Company'
'Lease Offices'
'Barwill Corporation'
'Galaxy International Overseas'
'UAE Exchange Metro Bus Stop'
'Globalink Westar Shipping Company'
'Pharma Care'
'Lucy Switchgear'
'Inter Equipment Company'
'Zaher Group'
'Cleveland Bridge Engineering 1'
'Cleveland Bridge Engineering 2'
'Jebel Ali Free Zone, Roundabout 8'
'Dubai Ports Authority, Staff Quarters'
'Gulf Denims Limited'
'Jebel Ali, Bus Station'

};

%Bus Route 300

%Bus Route 365

%Bus Route 366

%Bus Route 367

%Bus Route D3
SNum = SNum + 1;
RouteList{SNum} = 'D3';
WeightsList{SNum} = [15];
StationList{SNum} = ...
{
'Dubai Design District'
'Dubai Mall Landside Metro Bus Stop'
};

%Bus Route J1
SNum = SNum + 1;
RouteList{SNum} = 'J1';
WeightsList{SNum} = [1,4,1,1,0.1,1,1,9,1,1,1,1,8,1,1,0.1,1];
StationList{SNum} = ...
{
'JVC, Hanover Square'
'JVC, Manhattan Tower'
'JVC, Atlantis S (platform 02)'
'JVC, Atlantis S (platform 01)'
'JVC, Tuscan Residences'
'JVC, Noor Residences'
'JVC, Season Community Autumn'
'JVC, Season Community Summer'
'Al Barsha South 1, Mohammed Bin Rashid Housing C'
'Al Barsha South 1, Aswaaq Mall'
'Al Barsha South 1, DEWA Sub Station'
'Al Barsha South 1, Mohammed Bin Rashid Housing B'
'Al Barsha South 1, Mohammed Bin Rashid Housing A'
'Dubai American Academy'
'Al Barsha A'
'Mall of the Emirates 2'
'Mall of the Emirates, Saleh Bin Lahej Building'
'Mall of the Emirates Metro Bus Station'
};


%----------------------- CBD Bus Routes -----------------------------------
%Bus Route C01
SNum = SNum + 1;
RouteList{SNum} = 'BRC01';
WeightsList{SNum} = [3 1 2 1 .1 2 1 1 1 2 1 1 1 2 5 3 1 1 4 1 2 2 2 1 3 4 4];
StationList{SNum} = ...
{
'Satwa, Bus Station'
'Satwa, Masjid 2'
'Satwa, Post Office'
'Hana Center'
'Hudheiba, Turnoff'
'Hoot, Eppco'
'Sheikh Rashid Road I/S'
'Dubai Real Estate, Headquarters'
'Mankhool, Standard Chartered Bank'
'Rais Center'
'Al Fahidi Metro Bus Stop B'
'Al Fahidi Metro Bus Stop A'
'Nahda Street'
'Raffa 2'
'Falcon Intersection'
'Khaleej Road'
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
'Airport Terminal 3'
};

%Bus Route C03
SNum = SNum + 1;
RouteList{SNum} = 'BRC03';
WeightsList{SNum} = [2 1 3 1 1 1 3 2 1 2 1 2 1 5 3 2 3 3 2 2 1 1 2 1 1 1 1 1 1 2 1 5];
StationList{SNum} = ...
{
'Al Karama Bus Station'
'Karama 1'
'Karama 2'
'Schools Health Center'
'Karama, Ent.'
'Central Post Office'
'College of Islamic Studies 2'
'BurJuman Metro Bus Stop C'
'BurJuman Metro Bus Stop A'
'Four Point Sheraton Hotel'
'Al Fahidi Metro Bus Stop A'
'Nahda Street'
'Raffa 2'
'Falcon Intersection'
'Khaleej Road'
'Naif Intersection'
'Burj Nahar, Intersection'
'Baraha, Eid Musallah'
'Baraha, Street'
'Abu Hail, Post Office'
'Abu Hail, Masjid Al Salam'
'Abu Hail'
'Abu Hail, Masjid Ashram'
'Majid English School'
'Hor Al Anz Street'
'Hor Al Anz, Civil Defence'
'Hor Al Anz Post Office'
'Hor Al Anz 1'
'Hor Al Anz 2'
'Hor Al Anz 3'
'Safiya Housing'
'Omer Bin Al Khattab School'
'Abu Hail Metro Bus Station'
};

%Bus Route C04
SNum = SNum + 1;
RouteList{SNum} = 'BRC04';
WeightsList{SNum} = [4 2 2 3 1 2 .1 3 .1 1 .1 3 2 1 2 3 1 1 .1 1 4 1 1 2];
StationList{SNum} = ...
{
'Gold Souq Bus Station'
'Naif Intersection'
'Burj Nahar, Intersection'
'Al Nakhal 1'
'Union Metro Bus Stop A'
'Etisalat Head Office'
'Maktoum Road'
'Clock Tower Roundabout'
'Oud Metha Metro Bus Stop'
'Oud Metha Road 1'
'Oud Metha Road 2'
'Wafi City'
'Jaddaf, Police Officers Club'
'Belhasa Driving Center'
'Wasl, Wasl Club'
'Latifa Hospital'
'Jaddaf, Police Officers Club'
'Cricket Stadium'
'Jaddaf, Dubai Municipality Officers Recreation Club'
'Garhoud, Dubai Municipality Nursery'
'Al Jaddaf Metro Bus Stop A'
'Creek Metro Bus Stop'
'Al Jaddaf Marine Bus Stop'
'Jaddaf'
'Government Workshop'
};

%Bus Route C05
SNum = SNum + 1;
RouteList{SNum} = 'BRC05';
WeightsList{SNum} = [5 1 1 1 1 1 1 2 1 1 1 1 .1 1 1 2 1 3 2 1 2 4 1 1 4 9];
StationList{SNum} = ...
{
'Al Ghubaiba Bus Station'
'Falcon Intersection'
'Raffa'
'Rolla'
'Al Fahidi Metro Bus Stop A'
'Four Point Sheraton Hotel'
'BurJuman Metro Bus Stop A'
'BurJuman Metro Bus Stop B'
'Saeediya School'
'Karama 2'
'Karama 1'
'Karama, Commercial Center'
'Schools Health Center'
'Karama, Ent.'
'Central Post Office'
'College of Islamic Studies 2'
'BurJuman Metro Bus Stop C'
'Consulate Area'
'Broadcast Interchange'
'British Council'
'Rashid Hospital'
'Dubai Courts 1'
'Maktoum Road'
'Etisalat Head Office'
'Union Metro Bus Stop A'
'Al Nakhal'
'Gold Souq Bus Station'
};

%Bus Route C07
SNum = SNum + 1;
RouteList{SNum} = 'BRC07';
WeightsList{SNum} = [2 .1 2 .1 1 1 .1 1 3 2 1 2 1 3 1 2 1 1 .1 2 2 3 .1 1 .1 1 .1 2 1 2 4 1 1 2 .1 1 1 1 1 3 1 1 1 3 1 1 3 3 .1 1];
StationList{SNum} = ...
{
'Abu Hail Metro Bus Station'
'Omer Bin Al Khattab School'
'Sadda School 1'
'Sadaa School 2'
'Safiya Housing'
'Hor Al Anz 3'
'Hor Al Anz 2'
'Hor Al Anz 4'
'Hor Al Anz 5'
'Abu Hail Road'
'Hamriya, Park'
'Abu Hail, Eppco'
'Abu Hail, Clinic'
'Hor Al Anz, Turnoff'
'Abu Baker Al Siddique Road'
'Deira Sheraton Hotel'
'Mateena Road'
'Mateena, Emirates Cooperative Society'
'Mateena, Ent.'
'Muteena'
'Deira, Fish Roundabout 2'
'Union Metro Bus Stop A'
'Deira, Beniyas Road'
'Al Sabkha Marine Bus Stop'
'Emirates NBD'
'Deira, Old Souq'
'Al Ras, Public Library'
'Al Ras Metro Bus Stop'
'Khaleej Road'
'Hyatt Regency Hotel'
'Palm Deira Metro Bus Stop'
'Falcon Intersection'
'Raffa'
'Rolla'
'Musallah Road, Dubai'
'Fahidi, Roundabout'
'Bastakia'
'British Embassy'
'Al Seef Marine Bus Stop'
'Al Seef Street'
'Broadcast Interchange'
'Oud Metha Metro Bus Stop'
'Oud Metha Road 1'
'Oud Metha Road 2'
'New Modern Pharmacy'
'Dubai Rehabilitation Centre For Disabled'
'Mayo Clinic'
'Creek Park Main Gate'
'Grand Hyatt Hotel'
'DEWA Main Office'
'Wafi Residences'
};

%Bus Route C09
SNum = SNum + 1;
RouteList{SNum} = 'BRC09';
WeightsList{SNum} = [1 1 1 5 .1 1 2 1 2 2 .1 2 2 1 3 .1 1 1 1 1 2 1 3 8 2 1 1 3 3 2];
StationList{SNum} = ...
{
'Hor Al Anz East, Qiyadah Metro Bus Stop'
'Hor Al Anz East, Dar Al Aman Building'
'Hor Al Anz, East Terminus'
'Wuhaida, Road'
'Khabeesi, Old Terminus'
'Dubai Oxygen'
'Kangaroo Plastics'
'Gargash Automobiles'
'Renault Service Center'
'Port Saeed'
'Al Bakhit Center'
'Port Saeed, Masjid'
'Al Rigga Metro Bus Stop A'
'Ghurair City'
'Union Metro Bus Stop A'
'Deira, Beniyas Road'
'Al Sabkha Marine Bus Stop'
'Emirates NBD'
'Deira, Old Souq'
'Al Ras, Public Library'
'Al Ras Metro Bus Stop'
'Khaleej Road'
'Hyatt Regency Hotel'
'Palm Deira Metro Bus Stop'
'Department of Ports & Customs'
'Caltex, Reservoir'
'Dubai Dry Docks'
'Executive Court'
'Mahboubi Clinic'
'Hudheiba, Road'
'Satwa, Bus Station'
};

%Bus Route C10
SNum = SNum + 1;
RouteList{SNum} = 'BRC10';
WeightsList{SNum} = [1 .1 1 1 2 2 2 1 2 1 7 5 3 3 2 6 2 1 1 2 1 2 1 1 2 1 1 2 1 2];
StationList{SNum} = ...
{
'Hamriya Port,Control Tower Terminus'
'Hamriya Port,Container Services'
'Hamriya Port,Sheikh Almar Masjid Roundabout'
'Hamriya Port,Sheikh Almar Masjid'
'Hamriya, Port'
'Abu Hail, Roundabout'
'UAE Athletics Federation'
'Abu Hail Road'
'Hamriya Shopping Center'
'Ittehad School'
'Abu Hail Center'
'City Centre Metro Bus Stop A'
'Al Seef Marine Bus Stop'
'BurJuman Metro Bus Stop B'
'Centre Point Shopping Centre'
'ADCB Seaside Metro Bus Stop'
'Hudheiba, Turnoff'
'Hana Center'
'Al Dhiyafa, Road'
'Jumeira Rotana Hotel'
'Dhiyafa'
'Jumeira, Grand Masjid'
'Jumeira Centre'
'Century Plaza'
'Beach Center'
'Dubai Zoo'
'Mercato Shopping Mall'
'Hassa Bint Al Murr Masjid'
'Al Arouba Street'
'Al Arouba Street'
'Hassa Bint Al Murr Masjid'
};

%Bus Route C14
SNum = SNum + 1;
RouteList{SNum} = 'BRC14';
WeightsList{SNum} = [3 1 2 2 1 2 3 1 1 2 1 3 2 2 2 4 2 2 1 2 1 2 4 1 2 1 .1 2 1 1 1 1 1 3 1 .1 1 1 1];
StationList{SNum} = ...
{
'Al Nahda 1, Sama Residence'
'Al Nahda 1, Mai Tower'
'Al Qusais 1, LuLu Hypermarket'
'Al Nahda, Shabab Alahli Club'
'Wuhaida, Road'
'Dubai Folklore Theatre 2'
'Abu Hail, Masjid 2'
'Manama 2'
'Abu Hail, Clinic'
'Hor Al Anz, Turnoff'
'Abu Baker Al Siddique Road'
'The Center'
'Hamarain Center'
'Al Bakhit Center'
'DNATA'
'City Centre Metro Bus Stop A'
'British Council'
'College of Islamic Studies'
'Central Post Office'
'Karama, Dubai Municipality Center'
'Mankhool, Center Point'
'Kuwait Road'
'Sheikh Rashid Road I/S'
'Hudheiba, Turnoff'
'Hana Center'
'Satwa, Masjid'
'Satwa, Clinic'
'Bada?A'
'Satwa, Square'
'Khadri Masjid'
'Bilal Bin Ribah School'
'Satwa, Road'
'Rehabilitation Center'
'Dubai Petroleum Corporation'
'Mazaya Center'
'Safa, Safest Way'
'Safa, Terminus'
'Safa, Lufthansa'
'Safa, Lufthansa'
'Safa, Terminus'
};

%Bus Route C15
SNum = SNum + 1;
RouteList{SNum} = 'BRC15';
WeightsList{SNum} = [1 .1 1 1 2 1 2 1 2 1 2 1 3 2];
StationList{SNum} = ...
{
'Hamriya Port,Control Tower Terminus'
'Hamriya Port,Container Services'
'Hamriya Port,Sheikh Almar Masjid Roundabout'
'Hamriya Port,Sheikh Almar Masjid'
'Hamriya, Port'
'Abu Hail, Roundabout'
'Abu Hail, Bin Eid Al Shabi Restaurant 2'
'Abu Hail, Post Office'
'Al Baraha Masjid'
'Abu Baker Al Siddique Road'
'The Center'
'Hamarain Center'
'Al Bakhit Center'
'DNATA'
'Deira City Center Bus Station'
};

%Bus Route C18
SNum = SNum + 1;
RouteList{SNum} = 'BRC18';
WeightsList{SNum} = [1 1 1 2 1 2 2 1 .1 3 1 2 3 1 1 1 1 2 2 1 2 8 .1 2 .1 2 1 1 3 3 1 1 3 2];
StationList{SNum} = ...
{
'Sheikh Rashid Colony'
'Emirates Driving Institute'
'Sheikh Rashid Colony 2'
'Dubai Grand Hotel'
'Al Khulafaa Al Rashideen Boys School'
'Dubai Airport Free Zone Metro Bus Stop'
'Al Nahda Metro Bus Stop'
'Ministry of Information'
'Stadium Metro Bus Stop'
'Al Nahda, Shabab Alahli Club'
'Wuhaida, Road'
'Dubai Folklore Theatre 2'
'Abu Hail, Masjid 2'
'Manama 2'
'Abu Hail, Clinic'
'Hor Al Anz, Turnoff'
'Hor Al Anz, Roundabout'
'Rasheed Road'
'Islamic Institute'
'Burj Nahar, Intersection'
'Naif Intersection'
'Palm Deira Metro Bus Stop'
'Falcon Intersection'
'Raffa'
'Rolla'
'Al Fahidi Metro Bus Stop A'
'Four Point Sheraton Hotel'
'BurJuman Metro Bus Stop A'
'BurJuman Metro Bus Stop C'
'Broadcast Interchange'
'Oud Metha Metro Bus Stop'
'Oud Metha Road 1'
'Oud Metha Road 2'
'American Hospital'
'Lamcy Plaza'
};

%Bus Route C19
SNum = SNum + 1;
RouteList{SNum} = 'BRC19';
WeightsList{SNum} = [2 3 1 1 1 1 2 .1 3 1 1 1 1 3 1 .1 1 1 1 1 2];
StationList{SNum} = ...
{
'Deira City Center Bus Station'
'City Centre Metro Bus Stop A 2'
'DNATA'
'Ministry of Environment'
'Al Bakhit Center'
'Hamarain Center'
'Abu Baker Al Siddique Metro Bus Stop 1'
'Dubai Scout Mission'
'Al Jadeed Bakery'
'Al Nahda, Shabab Alahli Club'
'Stadium Metro Bus Stop'
'Ministry of Information'
'Al Nahda Metro Bus Stop'
'Twar, Union Cooperative Society'
'Al Khulafaa Al Rashideen Boys School'
'Dubai Grand Hotel'
'Damascus Road 1'
'Damascus Road 2'
'Damascus Road 3'
'Damascus Road 4'
'Al Qusais Industrial Area'
'Al Qusais Industrial Area,Terminus'
};

%Bus Route C26
SNum = SNum + 1;
RouteList{SNum} = 'BRC26';
WeightsList{SNum} = [3 2 2 1 2 5 4 2 1 1 1 6 5 4 2 3 2 2 3 .1 1 1 1 1 1 2];
StationList{SNum} = ...
{
'Wasl Park Terminus'
'Khadri Masjid'
'Satwa, Square'
'Satwa, Masjid 2'
'Satwa, Post Office'
'Satwa, Roundabout'
'Al Jafiliya Landside Metro Bus Stop'
'ADCB Metro Bus Stop Landside'
'Karama, Dubai Municipality Center'
'Karama, Ent.'
'Central Post Office'
'College of Islamic Studies 2'
'DNATA'
'Traffic Police Department'
'Airport Terminal 2, Departure'
'Airport Terminal 2, Arrival'
'Maria Qibtiya School'
'DAFZA'
'Twar 1, Emarat Al Mawred'
'Al Khulafaa Al Rashideen Boys School'
'Dubai Grand Hotel'
'Damascus Road 1'
'Damascus Road 2'
'Damascus Road 3'
'Damascus Road 4'
'Al Qusais Industrial Area'
'Al Qusais Industrial Area,Terminus'
};

%Bus Route C28
SNum = SNum + 1;
RouteList{SNum} = 'BRC28';
WeightsList{SNum} = [9 1 1 1 1 2 3 1 2 2 2 .1 1 1 1 .1 1 2 1 2 2 2 2 .1 1 .1 .1 1 1 1];
StationList{SNum} = ...
{
'Gold Souq Bus Station'
'Al Ras Metro Bus Stop'
'Deira, Old Souq'
'Emirates NBD'
'Deira, Post Office'
'Deira, Beniyas Square'
'Union Metro Bus Stop C'
'Salah Al Din Metro Bus Stop'
'Reef Mall'
'The Center'
'Abu Baker Al Siddique Road'
'Majid English School'
'Abu Hail, Masjid Ashram'
'Abu Hail'
'Abu Hail, Masjid Al Salam'
'Hamriya, Street'
'Hamriya, Masjid'
'UAE Athletics Federation'
'Wuheida, Street 22'
'Al Wuheida, Ali Bin Abi Talib Masjid'
'Mahlab School'
'Mamzar, Health Center'
'Mamzar'
'Mamzar, Beach 1'
'Mamzar, Beach 2'
'Mamzar, Beach 3'
'Mamzar, Beach 4'
'Mamzar, Beach 5'
'Mamzar, Beach 6'
'Mamzar, Beach 7'
'Mamzar, Beach Park Terminus'
};


%----------------------- Feeder Bus Routes --------------------------------

%Bus Route F3
SNum = SNum + 1;
RouteList{SNum} = 'BRF03';
WeightsList{SNum} = [6 1 1 1 1 1 1 1 1 1 1 1 1 .1 1 1 1 3 1 1 2 1 5 1 11];
StationList{SNum} = ...
{
'Rashidiya Metro Bus Station'
'Muhaisnah 1, Etihad Mall (platform 01)'
'Muhaisnah 1, Etihad Mall (platform 02)'
'Mirdiff, Private School'
'Uptown Mirdif'
'Mirdiff, ETISALAT Tower'
'Mirdiff, Street 15, Elyazia Beauty Center'
'Mirdiff Masjid, Street 15'
'Mirdiff Area, Street 15'
'Mirdiff Area, Street 18B'
'Mirdiff Area, Street 20C'
'Mirdiff Area, Street 29B'
'Mirdiff Area, A 1 Street 12'
'Mirdiff Area, B 1 Street 12'
'Mirdiff Area, Street 65A'
'Mirdiff Area, Street 69B'
'Mirdiff, Grand Masjid'
'Mirdiff, Area 3'
'Mirdiff, Golden Gate Mall, Street 71'
'Mirdiff, Street 60C'
'Mirdiff, Mirdiff Mall, Street 62 B'
'Mirdiff, Mediclinic, Street 47'
'Mirdiff, Private School'
'Muhaisnah 1, Etihad Mall (platform 01)'
'Muhaisnah 1, Etihad Mall (platform 02)'
'Rashidiya Metro Bus Station'
};

%Bus Route F5
SNum = SNum + 1;
RouteList{SNum} = 'BRF05';
WeightsList{SNum} = [7 2 3 4 3 3 1 1 1 1 1];
StationList{SNum} = ...
{
'Rashidiya Metro Bus Station'
'Muhaisnah 1, Intersection'
'Muhaisnah 2, Etisalat Academy'
'Al Mizhir, Islamic School For Training Education 1'
'Mizhar 1, A'
'Al Mizhir 1, Arabian Center'
'Mizhar 1, C'
'Mizhar 1, D'
'Al Mizhar Mall'
'Mizhar 1, F'
'Mizhar 1, G'
'Mizhar 1, Masjid Terminus'
};

%Bus Route F8
SNum = SNum + 1;
RouteList{SNum} = 'BRF08';
WeightsList{SNum} = [1 1 2 0.1 1 1 2 1 2 1 1 2 1 1 1 2 2 2 5 1 1 3 2 1];
StationList{SNum} = ...
{
'Al Nahda, The Sheffeild Private School'
'Al Nahda, Zuleikha Hospital'
'Al Nahda, 19A Street 1'
'Al Nahda, Madina Super Market'
'Al Nahda, Emirates College'
'Al Nahda, Canary Bldg'
'Sahara Center'
'Dubai Carmel School'
'Al Qusais, Public Transport Depot'
'MAN Motors'
'Al Qusais Industrial Area'
'Damascus Road 4'
'Damascus Road 3'
'Damascus Road 2'
'Damascus Road 1'
'Dubai Grand Hotel'
'Twar 1, Emarat Al Mawred'
'DAFZA'
'Emirates Engineering'
'Emirates Metro Bus Stop'
'Dubai Municipality Garage'
'Mawakeb School'
'Dubai Festival City, Marks & Spencer'
'Dubai Festival City, IKEA'
'Dubai Festival City, Festival Centre'
};

%Bus Route F10
SNum = SNum + 1;
RouteList{SNum} = 'BRF10';
WeightsList{SNum} = [5 1 1 4 2 1 2 1 1 1 1 1 0.1 1 1 1 2 1 1 0.1 2 0.1 1 1 0.1 2 1 1];
StationList{SNum} = ...
{
'Rashidiya Metro Bus Station'
'Mirdiff, Private School'
'Mirdiff, Area 1'
'Imam Abu Hanifa Masjid'
'Mirdiff City Centre'
'Downtown Mirdiff Gate 1'
'Downtown Mirdiff Gate 2'
'Al Warqaa Entrance'
'Al Warqaa Masjid'
'Al Warqaa A'
'Al Warqaa B'
'Al Warqaa C'
'Al Warqaa D'
'Al Warqaa, ETISALAT Tower'
'Al Warqaa, Grand Masjid'
'Al Warqaa, Mass Supermarket'
'Al Warqaa E'
'Al Warqaa, La Lune Building'
'Al Warqaa, ASCANA 3 Building'
'Al Warqaa, Charity Tower'
'Al Warqaa Our Own High School'
'Al Warqaa, Sharjah American Intl School'
'Al Warqaa, International Academic School'
'Al Warqaa, Mansoor Sharaf Tower'
'Al Warqaa, Ibrahim Tower'
'Al Warqaa, Desert Group Building 5'
'Al Warqaa G'
'Al Warqaa I'
'Al Warqaa J'
};

%Bus Route F11
SNum = SNum + 1;
RouteList{SNum} = 'BRF11';
WeightsList{SNum} = [1 2 1 1 3 1 2 1 4 1 2 4 1 1 1 1 2];
StationList{SNum} = ...
{
'Financial Center Seaside Metro Bus Stop'
'Wasl, Terminus'
'Ghaya Residence'
'Wasl, Masjid'
'Wasl, School'
'Wasl, Park'
'Iranian Hospital'
'Hudheiba, Road'
'BadaA'
'Satwa, Masjid 2'
'Satwa, Post Office'
'Satwa, Roundabout'
'Trade Center Metro Bus Stop'
'White Crown Tower'
'Durrah Tower'
'Emirates Tower Seaside Metro Bus Stop'
'Rostamani Tower'
'Financial Center Seaside Metro Bus Stop'
};

%Bus Route F12
SNum = SNum + 1;
RouteList{SNum} = 'BRF12';
WeightsList{SNum} = [3 2 1 2 3 3];
StationList{SNum} = ...
{
'Al Jafiliya Seaside Metro Bus Stop'
'Satwa, Roundabout'
'Satwa, Masjid'
'Satwa, Clinic'
'Hudheiba, Road'
'Wasl, Park'
'Wasl Park Terminus'
};

%Bus Route F13
SNum = SNum + 1;
RouteList{SNum} = 'BRF13';
WeightsList{SNum} = [7 3 2 3];
StationList{SNum} = ...
{
'Dubai Mall Landside Metro Bus Stop'
'The Dubai Mall'
'Burj Khalifa'
'8 Boulevard Walk Tower'
'Dubai Mall Landside Metro Bus Stop'
};

%Bus Route F14
SNum = SNum + 1;
RouteList{SNum} = 'BRF14';
WeightsList{SNum} = [4 2 0.1 1 0 1 1 3 1 0.1 1 2 1 2 1 1 3];
StationList{SNum} = ...
{
'Business Bay Metro Bus Stop Landside'
'Lillian Tower'
'XL Tower'
'U BORA Tower'
'Volante Dubai Tower'
'Mayfair Residency'
'Fairview Residency'
'Clayton Residency'
'Empire Heights Towers'
'Coral Tower'
'Canal Views Hotel Apartments'
'Bay Square 1'
'Burj View central Tower'
'South Ridge Tower'
'Lake Central Tower'
'Clover Bay Tower'
'The Binary Tower'
'Business Bay Metro Bus Stop Landside'
};

%Bus Route F15
SNum = SNum + 1;
RouteList{SNum} = 'BRF15';
WeightsList{SNum} = [2 3 0.1 1 1 2 0.1 2 1 1 2 1 1 1 0.1 2 0.1 2 1 1 1 2 0.1 1 1 1 3 2];
StationList{SNum} = ...
{
'Noor Bank Bus Terminus'
'Noor Bank Landside Metro Bus Stop'
'Khaleej Times'
'Al Quoz, Latifa Bint Hamdan Street'
'Al Quoz, New Housing Junction'
'Al Quoz, Al Khail Gate Entrance 1'
'Al Quoz, Al Khail Gate 1'
'Al Quoz, Al Khail Gate 2'
'Al Quoz, Al Khail Gate 3'
'Al Quoz, Emirates Housing Al Khail Gate 2'
'Al Quoz, Gargash Construction Accommodation 2'
'Majid Industries'
'Khaleej, Metal Coating'
'Emirates Industries'
'Emirates Printing Press'
'ETA Steel Works'
'Bartawi Camps'
'Rostamani Steel Mills'
'Joton Paints'
'Al Quoz, AST Company'
'Oasis Village'
'Al Quoz, New Housing Junction'
'Al Quoz, Latifa Bint Hamdan Street'
'Galadari Printing & Publishing'
'Queen Palace Factory'
'Emirates Gas Factory'
'Honda, Training Center'
'Noor Bank Landside Metro Bus Stop'
'Noor Bank Bus Terminus'
};

%Bus Route F18
SNum = SNum + 1;
RouteList{SNum} = 'BRF18';
WeightsList{SNum} = [1 0.1 2 2 1 3 1 0.1 1];
StationList{SNum} = ...
{
'Oud Metha Metro Station Terminus'
'Oud Metha Road 1'
'Oud Metha Road 2'
'American Hospital'
'Lamcy Plaza'
'Sunrise City Supermarket'
'Nasr Sports Club'
'Rashid Hospital RBT.'
'Oud Metha Metro Bus Stop'
'Oud Metha Metro Station Terminus'
};

%Bus Route F20
SNum = SNum + 1;
RouteList{SNum} = 'BRF20';
WeightsList{SNum} = [1 1 0.1 1 5 1 1 1 1 1 1 2 5 1 0.1 1 1 3];
StationList{SNum} = ...
{
'Business Bay Seaside Metro Bus Stop'
'Emarat, Headquarters 2, Street 35'
'Al Wasl, Street 35, Al Ittihad Health Center'
'Al Wasl, Street 35A'
'Al Wasl, Street 35, Dar Al Bar Society, Donation Centre'
'Safa, Dubai Electricity and Water Authority Sub Station'
'Al Safa 1, Street 19, Jumeirah College'
'Al Safa, Street 8B, Private School'
'Al Safa, Street 13, Al Razi Boys School'
'Al Safa, Street 13A'
'Al Safa, Street 19A'
'Al Safa 1, Street 19, Jumeirah College'
'Safa, Dubai Electricity and Water Authority Sub Station'
'Wasl Road, Box Park 2'
'Al Wasl, Street 35, Dar Al Bar Society, Donation Centre'
'Al Wasl, Street 35A'
'Al Wasl, Street 35, Al Ittihad Health Center'
'Emarat, Headquarters'
'Business Bay Seaside Metro Bus Stop'
};

%Bus Route F21
SNum = SNum + 1;
RouteList{SNum} = 'BRF21';
WeightsList{SNum} = [1 2 1 1 4 1 1 1 1 1 1 1 1 1 1 1 2 1 1 1];
StationList{SNum} = ...
{
'Al Nahda Metro Bus Stop'
'Ministry of Information'
'Stadium Metro Bus Stop'
'Al Nahda 1, DEWA'
'Al Maaref Private School'
'NMC Hospital'
'Al Nahda, Canary Bldg'
'Al Nahda, Emirates College'
'Al Nahda, Madina Super Market'
'Al Nahda, Motawa Bldg'
'Al Noor Building'
'Al Hawai Twin Towers'
'Ahli House'
'Al Shawi Tower'
'Desert Group Building 4'
'Al Nahda, Park 1'
'Al Nahda, Park 2'
'Ministry Of Human Resources & Emiratisation'
'Emirates Driving Institute'
'Sheikh Rashid Colony'
'Al Nahda Metro Bus Stop'
};

%Bus Route F22
SNum = SNum + 1;
RouteList{SNum} = 'BRF22';
WeightsList{SNum} = [1 1 2 2 1 1 2 3];
StationList{SNum} = ...
{
'Stadium Metro Bus Stop'
'Al Nahda 1, DEWA'
'Al Maaref Private School'
'NMC Hospital'
'Sahara Center'
'Dubai Carmel School'
'Al Qusais, Public Transport Depot'
'Al Qusais Industrial Area 3, Masjid Mustaqeem'
'Al Qusais Industrial Area 2, Terminus'
};

%Bus Route F23
SNum = SNum + 1;
RouteList{SNum} = 'BRF23';
WeightsList{SNum} = [2 1 4 1 0.1 1 2 1 1];
StationList{SNum} = ...
{
'Stadium Metro Station 2A'
'Al Nahda 1, DEWA'
'Al Maaref Private School'
'Al Nahda 1, Masjid Rada'
'Al Nahda 1, Al Banai'
'Al Nahda 1, Burj Al Nahda'
'Al Nahda 1, Zaafranah'
'Al Nahda 1, Burj Al Noor'
'Al Nahda 1, Terminus 1'
'Al Nahda 1, Terminus 2'
};

%Bus Route F24
SNum = SNum + 1;
RouteList{SNum} = 'BRF24';
WeightsList{SNum} = [1 1 2 2 1 1 2 1 0.1 2];
StationList{SNum} = ...
{
'Stadium Metro Bus Stop'
'Al Nahda 1, DEWA'
'Al Maaref Private School'
'NMC Hospital'
'Sahara Center'
'Dubai Carmel School'
'Al Qusais, Public Transport Depot'
'Al Qusais Industrial Area 3, Masjid Mustaqeem'
'Al Qusais Depot Entrance'
'Al Qusais Industrial Area 3, Atiq Abdullah Flour Mill'
'Al Qusais Industrial Area 3, Terminus'
};

%Bus Route F25
SNum = SNum + 1;
RouteList{SNum} = 'BRF25';
WeightsList{SNum} = [1 1 1 4 2 1 1 2 2 1 1 1 2 1 2 1 1 1 2 1 1 2 2 1 1 2 2 1 1 2 0.1];
StationList{SNum} = ...
{
'First Abu Dhabi Bank Landside Metro Bus Stop'
'Gold & Diamond Park'
'Al Quoz, Pure Water Filling Company'
'Al Quoz, Dubai Center Driving School'
'Classic Crystal'
'ETA SwitchGear Manufacturing 2'
'ETA Profiles'
'Al Quoz Mall'
'Atlas Marine Service'
'National Cement Corporation, Staff Accommodation'
'7 Up Staff Accommodation'
'Hilton Jumeria Hotel, Accomodation'
'Golden Neon Corporation'
'Habtoor Equipment Corporation'
'Rigid Construction, Camps'
'Al Quoz, Emirates Glass'
'Al Quoz, T. Choithram Stores'
'Al Quoz, Dynamic Industries'
'Al Quoz, APEX Concrete Factory'
'Al Quoz, Clinical Pathology Services'
'Al Quoz, Galaxy Paper Industries'
'Al Quoz, Emirates Glass 2'
'Al Quoz, Al Shamsi Steel Manufacturing Co'
'Atlas Marine Service'
'National Cement Corporation, Staff Accommodation'
'7 Up Staff Accommodation'
'Al Quoz, Al Shirawi Equipment Co'
'Al Quoz, Cemex RMC Topmix'
'Al Quoz, Azzani Ready Mix'
'Al Quoz, Pure Water Filling Company'
'Gold & Diamond Park'
'First Abu Dhabi Bank Landside Metro Bus Stop'
};

%Bus Route F26
SNum = SNum + 1;
RouteList{SNum} = 'BRF26';
WeightsList{SNum} = [2 3 2 2 0.1 1 0.1 1 1 1 1 1 2 1 1 1 1 2 1 2 1 1 1 2 1 2 1 2 0.1 1 2 1];
StationList{SNum} = ...
{
'Noor Bank Bus Terminus'
'Noor Bank Landside Metro Bus Stop'
'Emirates Gas Factory'
'Honda, Training Center'
'Honda, Training Center'
'Al Quoz, Bus Station'
'Queen Palace Factory'
'Masaood Bergum Construction'
'Berger Paints'
'Telas Tech Industrial'
'Speedwell Decor'
'Ahmadya Cont., Labour Camp'
'Qumaish Cont, Labour Camp'
'Al Quoz Industrial Area 3, Terminus'
'Hilton Jumeria Hotel, Accomodation'
'Golden Neon Corporation'
'Al Quoz, Al Habtoor Engineering'
'Al Quoz, Al Qeaim Public Kitchen'
'Al Quoz, T. Choithram Stores'
'Al Quoz, Emirates Glass 2'
'Al Quoz, Al Shamsi Steel Manufacturing Co'
'Al Quoz Mall'
'ETA Profiles'
'ETA SwitchGear Manufacturing'
'Al Quoz, Dubai Center Driving School'
'Al Quoz, Azzani Ready Mix'
'Al Quoz, Cemex RMC Topmix'
'Al Quoz, Gargash'
'Al Quoz, Nabooda Cars'
'Al Quoz, Ikea Stores'
'Al Quoz, Falaknaz'
'Gold & Diamond Park'
'First Abu Dhabi Bank Landside Metro Bus Stop'
};

%Bus Route F29

%Bus Route F30
SNum = SNum + 1;
RouteList{SNum} = 'BRF30';
WeightsList{SNum} = [3 2 2 2 2 9 3 2 2 0.1 1 0.1 1];
StationList{SNum} = ...
{
'Mall of the Emirates Metro Bus Station'
'Al Barsha A'
'Al Barsha, Lulu Supermarket'
'Dubai American Academy'
'Classic Crystal'
'Al Quoz, Clinical Pathology Services'
'Studio City, Operation Office'
'Classic Crystal'
'Dubai American Academy'
'Al Barsha A'
'Mall of the Emirates 1'
'Mall of the Emirates 2'
'Mall of the Emirates, Saleh Bin Lahej Building'
'Mall of the Emirates Metro Bus Station'
};

%Bus Route F31
SNum = SNum + 1;
RouteList{SNum} = 'BRF31';
WeightsList{SNum} = [1 1 1 0.1 2 1 3 2 4 3 1 1 1 1 1 1];
StationList{SNum} = ...
{
'Dubai Internet City Landside Metro Bus Stop'
'Al Barsha Heights, Saleh Bin Lahej Building'
'Al Barsha Heights, Ramee Guestline Hotel Apartments'
'Al Barsha Heights, Minc Apartments'
'Al Barsha Heights, Mashael Building'
'The Greens, Terminus'
'The Greens, Al Sidir'
'Regent International School'
'The Lakes Turnoff'
'Emirates Hills Turnoff'
'The Springs, Entrance gate 5'
'The Meadows, Entrance gate 8'
'The Springs, Entrance gate 4'
'The Meadows, Entrance gate 7'
'The Springs, Entrance gate 3'
'The Meadows, Town Centre'
'The Meadows, Dubai British School'
};

%Bus Route F33
SNum = SNum + 1;
RouteList{SNum} = 'BRF33';
WeightsList{SNum} = [3 1 1 1 1 1 1 1 1 1 1 1 1 1 0.1 2 1 4 1 1 1 1 1 2 0.1 2 1 1 1 2];
StationList{SNum} = ...
{
'Mall of the Emirates Metro Bus Station'
'Mall of the Emirates 1'
'Mall of the Emirates 2'
'Mall of the Emirates, Saleh Bin Lahej Building'
'Sheikh Zayed Service Rd, Coral Boutique Hotel'
'Al Barsha, Habtoor House'
'Al Barsha 1 B'
'Al Barsha, Roots Saloon'
'Al Barsha (3), Street 329 A 1'
'Al Barsha (3), Street 20 A'
'Al Barsha (3), Street 20 B'
'Al Barsha (3), Emirates ID Centre'
'Al Barsha (3), Emirates ID Centre'
'Al Barsha (3), Street 31B A 1'
'Al Barsha (3), Street 31B B 1'
'Al Barsha (3), Bin Lahej Masjid 1, (Street 32B)'
'Al Barsha (3), Street 329 B'
'Al Barsha Mall, Street 24'
'Al Barsha (3), Street 25C A'
'Al Barsha (3), Street 25C B1'
'Al Barsha (3), Street 62'
'Al Barsha (3), Street 42B'
'Al Barsha 2, Street 43, Park 3'
'Al Barsha 2, Street 43 A1'
'Al Barsha Mall, Street 24'
'Al Barsha (3), Street 329 B'
'Al Barsha (3), Street 25C A2'
'Al Barsha, Roots Saloon'
'Al Barsha, Veterinary Clinic'
'Mall of the Emirates, Saleh Bin Lahej Building'
'Mall of the Emirates Metro Bus Station'
};

%Bus Route F43
SNum = SNum + 1;
RouteList{SNum} = 'BRF43';
WeightsList{SNum} = [1 1 2 1 2 1 1 1 1 2 1 1 0.1 2 2 1 1 0.1 2 1 1 1 3];
StationList{SNum} = ...
{
'Ibn Battuta Metro Bus Station'
'Ibn Battuta, Food Court 3'
'Jebel Ali Gardens 1'
'Jebel Ali Gardens 2'
'Jebel Ali Gardens 3'
'Discovery Garden 1'
'Discovery Garden 2'
'Discovery Garden 3'
'Discovery Garden 4'
'Discovery Garden 5'
'Discovery Garden 6'
'Discovery Garden 7'
'Discovery Garden 8'
'Discovery Garden 9'
'Discovery Garden, Building No 255'
'Discovery Garden, Street 10'
'Discovery Garden 11'
'Discovery Garden 12'
'Discovery Garden Pavilion Shopping center'
'Discovery Garden 13'
'Discovery Garden 14'
'Discovery Garden 15'
'Discovery Garden 16'
'Ibn Battuta Metro Bus Station'
};

%Bus Route F44
SNum = SNum + 1;
RouteList{SNum} = 'BRF44';
WeightsList{SNum} = [4 1 1 2 0.1 3 5 1 1 1 1 1 1 2 1 1 1 1 1 1 1 7 2 .1 5 1 2 1 1 6];
StationList{SNum} = ...
{
'Energy Metro Bus Stop Landside'
'Jebel Ali Hotel, Accommodation'
'Muntazah, Lifeline Hospital'
'Dubai Evangelical Church Center'
'Gurunanak Darbar Sikh Temple'
'Jebel Ali Hotel, Accommodation'
'Jebel Ali Gardens, Turnoff'
'Ibn Battuta Metro Bus Station'
'Ibn Battuta, Food Court 3'
'Jebel Ali Gardens 1'
'Jebel Ali Gardens 2'
'Jebel Ali Gardens 3'
'Jebel Ali Gardens 4'
'Jebel Ali Gardens 5'
'Jebel Ali Gardens 6'
'Jebel Ali Gardens 7'
'Jebel Ali Gardens 8'
'Jebel Ali Gardens 9'
'Jebel Ali Gardens 10'
'Jebel Ali Gardens 11'
'Jebel Ali Gardens 12'
'Jebel Ali Gardens 13'
'Ibn Battuta Metro Bus Station'
'Ibn Battuta, Food Court 3'
'Jebel Ali Gardens, Turnoff'
'Jebel Ali Hotel, Accommodation'
'Muntazah, Lifeline Hospital'
'Dubai Evangelical Church Center'
'Gurunanak Darbar Sikh Temple'
'Jebel Ali Hotel, Accommodation'
'Energy Metro Bus Stop Landside'
};

%Bus Route F46
SNum = SNum + 1;
RouteList{SNum} = 'BRF46';
WeightsList{SNum} = [2 1 3 7 0.1 0.1 1 2 1 1 0.1 1 1 1 1 1 1 1 1 0.1 1 2 1 1 0.1];
StationList{SNum} = ...
{
'Ibn Battuta Metro Bus Station'
'Ibn Battuta, Food Court 3'
'Jebel Ali Gardens, Turnoff'
'Jebel Ali Free Zone Authority Interchange'
'The Green Community, AA Building'
'The Green Community, Choithram Supermarket'
'The Green Community, East Gate Entrance'
'The Green Community, West Gate Entrance'
'The Green Community, Falcon House'
'Dubai Investment Park Offices'
'The Green Community, Terrace Apartments'
'The Green Community, AA Building'
'Dubai Lagoon, Nibras International School'
'Dubai Lagoon, Ewan Residence'
'Dubai Lagoon 1'
'Green Planet Industries'
'Pace Food Stuff Trading'
'Arabian Orchard Complex A'
'Arabian Orchard Complex B'
'Arabian Orchard Complex C'
'Arabian Orchard Complex D'
'Dunes Village'
'Fastner World International'
'Dubai Pearl Gypsum Industries'
'DIP, AMB Building'
'DIP, Madina Supermarket Terminus'
};

%Bus Route F47
SNum = SNum + 1;
RouteList{SNum} = 'BRF47';
WeightsList{SNum} = [3 1 1 1 0.1 2 0.1 1 3 0.1 1 1 1 1 1 1 1 1 2 1 1 2 10 3 1 1 1 1 1 1 1 1 1 2 0.1 1 0.1 1 1 1 0.1 2 1 1 1 1 1 1 1 0.1];
StationList{SNum} = ...
{
'Danube Metro Landside Bus Stop'
'Jebel Ali Industrial Area 1'
'Jebel Ali Industrial Area 2'
'Jebel Ali Industrial Area 4'
'Jebel Ali Industrial Area 5'
'Jebel Ali Industrial Area 6'
'Jebel Ali Industrial Area 7'
'Jebel Ali Industrial Area 8'
'Jebel Ali Industrial Area 11'
'Bustan Macaroni & Noodles Co'
'Royal Engineering Fabrication Company'
'All Metal Industries Foundry L.L.C'
'Jebel Ali Industrial Area, Quality Mix'
'Jebel Ali Industrial Area, Unimix'
'Jebel Ali Industrial Area, ISOFOAM'
'Jebel Ali Industrial Area, DEWA Store'
'Jebel Ali Industrial Area, Etisalat Tower'
'Jebel Ali Industrial Area, National Polystyrene'
'Specialist Services'
'Jebel Ali Industrial Area, Binani Cement Factory'
'Jebel Ali Industrial Area, Four Season Staff Housing'
'Jebel Ali Industrial Area, Dubai Driving Center'
'Jebel Ali Industrial Area, Scientechnic LLC'
'EXPO 2020 Site Office'
'Shoba Contracting Labour Camp'
'Depa Contracting Labour Camp'
'Seven Seas Steel Industries'
'Dubai Contracting Labour Camp'
'Insulite Block Factory'
'Dubai Investment Park'
'Sun Rise Metal Coting'
'Rig Metal Inds'
'Union Residence'
'The Green Community, Falcon House'
'The Green Community, West Gate Entrance'
'The Green Community, East Gate Entrance'
'The Green Community, Main Gate Entrance'
'The Green Community, Choithram Supermarket'
'The Green Community, AA Building'
'Dubai Lagoon, Nibras International School'
'Dubai Lagoon, Ewan Residence'
'Dubai Lagoon 1'
'Green Planet Industries'
'Pace Food Stuff Trading'
'Emirates Code Contracting Labour Camp'
'Petron Emirates Accommodation'
'Dunes Village'
'Fastner World International'
'Dubai Pearl Gypsum Industries'
'DIP, AMB Building'
'DIP, Madina Supermarket Terminus'
};

%Bus Route F48
SNum = SNum + 1;
RouteList{SNum} = 'BRF48';
WeightsList{SNum} = [10 0.1 2 0.1 1 1 1 0.1 1 1 1 0.1 2 1 1 2 1 1 1 1 1 1 1 2 1];
StationList{SNum} = ...
{
'Danube Metro Landside Bus Stop'
'The Green Community, East Gate Entrance'
'The Green Community, West Gate Entrance'
'The Green Community, Falcon House'
'Union Residence'
'Rig Metal Inds'
'Sun Rise Metal Coting'
'Dubai Investment Park'
'Insulite Block Factory'
'Dubai Contracting Labour Camp'
'Seven Seas Steel Industries'
'Depa Contracting Labour Camp'
'Shoba Contracting Labour Camp'
'DIP, Prakash Tradings'
'Can Pack Middle East'
'Green Field Community School'
'Green Planet Industries'
'Pace Food Stuff Trading'
'Emirates Code Contracting Labour Camp'
'Petron Emirates Accommodation'
'Dunes Village'
'Hidayath Stainless Steel'
'DIP, ULMA'
'Dubai Pearl Gypsum Industries'
'DIP, AMB Building'
'DIP, Madina Supermarket Terminus'
};

SNum = SNum + 1;
RouteList{SNum} = 'BRF53';
WeightsList{SNum} = [3 0.1 1 1 0.1 1 1 0.1 0.1 1 1 1 2 1 1 5 1 1 11 0.1 1 0.1 0.1 1 2 1 1 2];
StationList{SNum} = ...
{
'Danube Metro Landside Bus Stop'
'Jebel Ali Industrial Area 1'
'Jebel Ali Industrial Area 2'
'Jebel Ali Industrial Area 4'
'Jebel Ali Industrial Area 5'
'Jebel Ali Industrial Area 6'
'Jebel Ali Industrial Area 7'
'Jebel Ali Industrial Area 8'
'Jebel Ali Industrial Area 11'
'Jebel Ali Industrial Area 6'
'Jebel Ali Industrial Area 5'
'Dutco'
'Amssar Wood Manufacturing'
'Falcon Chemicals'
'Solico'
'Dubai World Central, Headquarter Entrance'
'Dubai World Central, Headquarter'
'Dubai World Central, Headquarter 2'
'Dubai Industrial City Entrance 1'
'Dubai Industrial City 1'
'Dubai Industrial City 2'
'Dubai Industrial City 3'
'Dubai Industrial City 4'
'Dubai Industrial City, Electricity Authority Sub Stn 1'
'Dubai Industrial City'
'Sigma Factory'
'Kanoo Engineering'
'Dubai Industrial City, Labour Village 2'
'Dubai Industrial City, Labour Village 3'
};

% Bus Route F54
SNum = SNum + 1;
RouteList{SNum} = 'BRF54';
WeightsList{SNum} = [1 0.1 1 1 1 1 3 1 1 1 1 0.1 1 1 1 1 0.1 1 1 1 0.1 1 0.1 1 0.1 1 1 0.1 1 1 2 1 0.1 1 1 1 1 1 1 2 3 0.1 1 1 0.1 5];
StationList{SNum} = ...
{
'Danube Metro Seaside Bus Stop'
'Donya Cinema'
'Jebel Ali Free Zone, Training Center'
'Customs Checking Area'
'Jebel Ali Free Zone, Roundabout 5'
'Jebel Ali Free Zone, Sony'
'Jebel Ali Free Zone, Roundabout 6'
'Jebel Ali Free Zone, Lease Office 5'
'Jebel Ali Free Zone, Nafco'
'Container Glass Factory'
'Zaher Group'
'Cleveland Bridge Engineering 1'
'Cleveland Bridge Engineering 2'
'Jebel Ali Free Zone, Roundabout 8'
'Jebel Ali Free Zone, Kanoo Group'
'Jebel Ali Free Zone, Roundabout 12'
'Naboodah Cargo Centre'
'EDGEN MURRAY Steel'
'Jebel Ali Free Zone, N300 Street'
'DCFC Logistic'
'Nestle Free Zone Company'
'Inter Equipment Company'
'Lucy Switchgear'
'Pharma Care'
'Galaxy International Overseas'
'UAE Exchange Metro Bus Stop'
'Globalink Westar Shipping Company'
'Pharma Care'
'Lucy Switchgear'
'Inter Equipment Company'
'Jebel Ali Free Zone, ENOC Petrol Station'
'John Crane Middle East'
'Transworld Group Of Companies'
'CWT Logistics'
'Freight Work'
'Emmerson'
'Jebel Ali Free Zone South Accommodation'
'Summit Steel'
'Mideast Metals'
'Perfect Steel Free Zone Company'
'Naffco Clock Roundabout'
'JEL Corporation'
'Mayur Tradings'
'Al Ras Steel Trading'
'Nuplas Industry Limited'
'Bridgeway Industries'
'Inter Equipment Company'
};


% Bus Route F54A
SNum = SNum + 1;
RouteList{SNum} = 'BRF54A';
WeightsList{SNum} = [1 0.1 1 0.2 3 0.1 1 0.1 1 0.1 1 1 0.1 1 1 1 0.1 1 1];
StationList{SNum} = ...
{
'Nestle Free Zone Company'
'DCFC Logistic'
'Jebel Ali Free Zone, N300 Street'
'EDGEN MURRAY Steel'
'Naboodah Cargo Centre'
'Jebel Ali Free Zone, Roundabout 12'
'Jebel Ali Free Zone, Kanoo Group'
'Jebel Ali Free Zone, Roundabout 8'
'Cleveland Bridge Engineering 2'
'Cleveland Bridge Engineering 1'
'Zaher Group'
'Container Glass Factory'
'Jebel Ali Free Zone, Nafco'
'Jebel Ali Free Zone, Lease Office 5'
'Jebel Ali Free Zone, Roundabout 6'
'Aiwa Gulf Free Zone'
'Jebel Ali Free Zone, Sony'
'BMA Limited'
'Customs Checking Area'
'Danube Metro Seaside Bus Stop'
};

%Bus Route F55
SNum = SNum + 1;
RouteList{SNum} = 'BRF55';
WeightsList{SNum} = [2 1 2 1 0.1 1 4 1 1 5 0.1];
StationList{SNum} = ...
{
'Ibn Battuta Metro Bus Station'
'Ibn Battuta, Food Court 3'
'Jebel Ali Gardens, Turnoff'
'Dubai World Central, Headquarter Entrance'
'Dubai World Central, Headquarter'
'Dubai World Central, Offices Park'
'Dubai World Central, PFF Group'
'Dubai World Central, Freight House'
'Dubai World Central, Cargo Terminal A'
'Dubai World Central, Gate 6'
'Al Maktoum International Airport, Departure'
'Al Maktoum International Airport, Arrivals'
};

%----------------------- Feeder Bus Routes --------------------------------

%Bus Route 13B
SNum = SNum + 1;
RouteList{SNum} = 'BR13B';
WeightsList{SNum} = [2 2 2 4 1 2 3 3 2 1 4 4 1 1 2 2 1 2 1 .1 1 2 1 1 1 2 1 1 3];
StationList{SNum} = ...
{
'Gold Souq Bus Station'
'Hyatt Regency Hotel'
'Murar Jadeed'
'Islamic Institute'
'Hor Al Anz, Turnoff'
'Abu Hail, Clinic'
'Hamriya Shopping Center'
'Abu Hail Center'
'Traffic Police Department'
'Airport Terminal 2, Departure'
'Airport Terminal 2, Arrival'
'DAFZA'
'Al Khulafaa Al Rashideen Boys School'
'Dubai Grand Hotel'
'Damascus Road 1'
'Damascus Road 3'
'Al Qusais Industrial Area'
'Galadari Driving School'
'Al Qusais, Eppco Vehicle Inspection'
'Muhaisnah 4, Jamal Building'
'Muhaisnah 4, Lootha Building'
'Oxford School'
'Muhaisnah 4, New Housing'
'Lebenese Private School 1'
'Public Transport Agency'
'Dubai Transport, Main Office'
'Al Qusais, Al Naboodah Labour Camp'
'Al Qusais, Al Shirawi Labour Camp'
'Al Qusais, Masjid Hamad Abdul Karim'
'Al Qusais, Bus Station'
};

%Bus Route X13
SNum = SNum + 1;
RouteList{SNum} = 'BRX13';
WeightsList{SNum} = [2 1 1 4 3 1 1 2 1 1 1 5 5 5 4 7 1 2 2 2 2 .1 2];
StationList{SNum} = ...
{
'Lulu Village'
'Muhaisnah 4, New Housing'
'Emirates Housing'
'Russian International School'
'Galadari Driving School'
'Al Nahda, The Sheffeild Private School'
'Al Nahda, Zuleikha Hospital'
'Al Nahda, 19A Street 1'
'Al Nahda, Madina Super Market'
'Al Nahda, Emirates College'
'Al Nahda, Canary Bldg'
'NMC Hospital'
'Mahlab School'
'Abu Hail, Clinic'
'Naif Intersection'
'Palm Deira Metro Bus Stop'
'Al Ghubaiba Bus Station'
'Department of Ports & Customs'
'Capital Hotel'
'Hudheiba'
'Al Dhiyafa, Road'
'Satwa, Masjid'
'Satwa, Clinic'
'Satwa, Bus Station'
};

%Bus Route X23
SNum = SNum + 1;
RouteList{SNum} = 'BRX23';
WeightsList{SNum} = [7 2 .1 3 1 6 .1 1 .1 10 2 5 2 5 3 .1 1 2 1 1 .1 2 1 1 1 1 3 1 2];
StationList{SNum} = ...
{
'Gold Souq Bus Station'
'Falcon Intersection'
'Rolla'
'Al Fahidi Metro Bus Stop A'
'BurJuman Metro Bus Stop A'
'BurJuman Metro Bus Stop C'
'Oud Metha Metro Bus Stop'
'Oud Metha Road 1'
'Oud Metha Road 2'
'Wafi City'
'Aden Street 1'
'Ras Al Khor, Terminus'
'Used Car Exhibition'
'Vegetable Market'
'Al Warsan 1, Eppco 1'
'Dubai Textile City Main Gate'
'Dubai Textile City'
'International City, Lake Entrance'
'International City, Morocco'
'International City, China 3'
'International City, China 2'
'International City, Dragon Mart'
'International City, Post office 1'
'International City, Central Business district 1'
'International City, Central Business district 1'
'International City, Rivera Dreams Apartments 1'
'International City, Police Station'
'International City, Persia O02'
'International City, Persia M03'
'International City, Greece K12 Terminus'
};

%Bus Route X25
SNum = SNum + 1;
RouteList{SNum} = 'BRX25';
WeightsList{SNum} = [2 1 3 2 1 2 1 4 2 1 .1 .1 15 3 .1 1 .1 .1 1 1 1 .1 1 4 1 1 5 1 1];
StationList{SNum} = ...
{
'Al Karama Bus Station'
'Karama 1'
'Karama 2'
'Schools Health Center'
'Karama, Dubai Municipality Center'
'Centre Point Shopping Centre'
'BurJuman Metro Bus Stop B'
'BurJuman Metro Bus Stop C'
'Broadcast Interchange'
'Oud Metha Metro Bus Stop'
'Oud Metha Road 1'
'Oud Metha Road 2'
'Wafi City'
'Silicon Oasis Headquarter'
'Blue Tower'
'Gordoba Palace'
'Silicon Oasis 5'
'Silicon Oasis 3'
'Silicon Oasis 2'
'DSO Operation Centre'
'Le Solarium Tower'
'Axis 1 Residence'
'Axis 3 Residence'
'Bin Ghatti Apartments'
'Dubai Academic City 3'
'Dubai Academic City 2'
'Dubai Outsource City, Amity University Dubai'
'Dubai Outsource City, Arab Company'
'Dubai Outsource City, Al Shiba Complex'
'Dubai Outsource City, Royal Bank of Scotland'
};

%Bus Route X28
SNum = SNum + 1;
RouteList{SNum} = 'BRX28';
WeightsList{SNum} = [2 1 1 4 1 2 2 1 1 2 2 2 4 .1 2 2 2 2 2 4 4 3 2 4 1 2 3 3 5 4 3 2 3 2 4 3];
StationList{SNum} = ...
{
'Lulu Village'
'Muhaisnah 4, New Housing'
'Emirates Housing'
'Russian International School'
'Galadari Driving School'
'Al Qusais Industrial Area'
'Damascus Road 3'
'Damascus Road 1'
'Al Khulafaa Al Rashideen Boys School'
'Dubai Airport Free Zone Metro Bus Stop'
'Al Nahda Metro Bus Stop'
'Ministry of Information'
'Al Nahda, Shabab Alahli Club'
'Al Jadeed Bakery'
'Dubai Scout Mission'
'Abu Baker Al Siddique Metro Bus Stop 2'
'Hamarain Center'
'Al Bakhit Center'
'DNATA'
'City Centre Metro Bus Stop A'
'Umm Hurair, Road 1'
'Al Jafiliya Seaside Metro Bus Stop'
'Satwa, Roundabout'
'Al Dhiyafa, Road'
'Dhiyafa'
'Jumeira, Grand Masjid'
'Century Plaza'
'Mercato Shopping Mall'
'Rashid Bin Bakhait Masjid'
'Majlis Al Ghoreifa'
'Dubai Offshore Sailing Club'
'Umm Suqeim, Dubai Municipality Center'
'Umm Suqeim, Library'
'Wild Wadi'
'Burj Al Arab Hotel'
'Abdulla Omran Taryam Street'
'Dubai Internet City Seaside Metro Bus Stop'
};

%Bus Route 91A
SNum = SNum + 1;
RouteList{SNum} = 'BR91A';
WeightsList{SNum} = [2 2 2 4 5 5 28 4 .1 1 1 3 1 .1 2 .1 1 1 1 .1 1 1 1 1 2];
StationList{SNum} = ...
{
'Gold Souq Bus Station'
'Naif Intersection'
'Al Nakhal 1'
'Union Metro Bus Stop A'
'Maktoum Road'
'Umm Hurair, Road 1'
'Al Jafiliya Bus Station'
'Jebel Ali Free Zone, Main Gate'
'Dubai Ports Authority, Free Zone Office'
'Jebel Ali Free Zone, Roundabout 5'
'Jebel Ali Free Zone, Sony'
'Jebel Ali Free Zone, Roundabout 6'
'Jebel Ali Free Zone, Lease Office 5'
'Jebel Ali Free Zone, Nafco'
'Container Glass Factory'
'Zaher Group'
'Cleveland Bridge Engineering 1'
'Cleveland Bridge Engineering 2'
'Jebel Ali Free Zone, Roundabout 8'
'Jebel Ali Free Zone, Kanoo Group'
'Jebel Ali Free Zone, Roundabout 12'
'Jebel Ali Free Zone, Roundabout 12'
'Jebel Ali Free Zone, Kanoo Group'
'Dubai Ports Authority, Staff Quarters'
'Gulf Denims Limited'
'Jebel Ali, Bus Station'
};

%Bus Route X92
SNum = SNum + 1;
RouteList{SNum} = 'BRX92';
WeightsList{SNum} = [9 1 27 5 .1 2 1 .1 2 1 .1 1 .1 3 1 2 .1 12 .1 1 1 .1 3];
StationList{SNum} = ...
{
'Al Ghubaiba Bus Station'
'Department of Health'
'Al Jafiliya Seaside Metro Bus Stop'
'Jebel Ali Free Zone, Main Gate'
'Jebel Ali Industrial Area 1'
'Jebel Ali Industrial Area 2'
'Jebel Ali Industrial Area 4'
'Jebel Ali Industrial Area 5'
'Jebel Ali Industrial Area 6'
'Jebel Ali Industrial Area 7'
'Jebel Ali Industrial Area 8'
'Jebel Ali Industrial Area 11'
'Jebel Ali Industrial Area 6'
'Jebel Ali Industrial Area 5'
'Dutco'
'Amssar Wood Manufacturing'
'Falcon Chemicals'
'Solico'
'Shoba Contracting Labour Camp'
'Depa Contracting Labour Camp'
'Seven Seas Steel Industries'
'Dubai Contracting Labour Camp'
'Insulite Block Factory'
'Dubai Investment Park'
};

%Bus Route X94
SNum = SNum + 1;
RouteList{SNum} = 'BRX94';
WeightsList{SNum} = [5 2 2 1 5 3 27 1 2 1 1 1 .1 1 .1 1 2 1 2 .1 11 .1 1 .1 1 1];
StationList{SNum} = ...
{
'Gold Souq Bus Station'
'Naif Intersection'
'Al Nakhal 1'
'Union Metro Bus Stop A'
'Maktoum Road'
'Umm Hurair, Road 1'
'Al Jafiliya Bus Station'
'Jebel Ali Industrial Area 1'
'Jebel Ali Industrial Area 2'
'Jebel Ali Industrial Area 4'
'Jebel Ali Industrial Area 5'
'Jebel Ali Industrial Area 6'
'Jebel Ali Industrial Area 7'
'Jebel Ali Industrial Area 8'
'Jebel Ali Industrial Area 11'
'Jebel Ali Industrial Area 6'
'Jebel Ali Industrial Area 5'
'Dutco'
'Amssar Wood Manufacturing'
'Falcon Chemicals'
'Solico'
'Shoba Contracting Labour Camp'
'Depa Contracting Labour Camp'
'Seven Seas Steel Industries'
'Dubai Contracting Labour Camp'
'Insulite Block Factory'
'Dubai Investment Park'
};


%----------------------- Intercity Bus Routes --------------------------------

%Bus Route E16
SNum = SNum + 1;
RouteList{SNum} = 'BRE16';
WeightsList{SNum} = [8 1 1 1 1 6 2 1 0.1 1 2 2 3 1 3 4 1 3 1 2 2 1 1 12 3 7 0.1 7 4 3 6 2 3 1 0.1 2];
StationList{SNum} = ...
{
'Sabkha, Bus Station'
'Al Ras Metro Bus Stop'
'Deira, Old Souq'
'Emirates NBD'
'Al Sabkha Marine Bus Stop'
'Dubai Intercontinental Hotel'
'British Council'
'Oud Metha Metro Bus Stop'
'Oud Metha Road 1'
'Oud Metha Road 2'
'Wafi City'
'Wasl, Wasl Club'
'Oud Metha Road, Emarat, Petrol Station'
'Dubai Country Club'
'Ras Al Khor, DEWA'
'Ras Al Khor, Comm. Complex 2'
'Al Warsan 1, Eppco 1'
'Awir, Sewage Treatment Plant 1'
'Awir Depot 1'
'Al Warsan 3, Civil Defence Training Centre'
'Awir, Wadi Al Shabak Camp'
'Dubai Cultural Sports Club 1'
'Awir, Terminus'
'Awir, New Shabia 1'
'Habab, Roundabout'
'Habab, Reem Emarat Petrol Station'
'Nazwa, Al Jabal Emirates Petrol Station'
'Nazwa, Al Wista Supermarket'
'Ramool Adventure Park'
'Hatta Road Al Rifadah'
'Al Madam, Roundabout'
'Al Madam, Health Care Center'
'Hatta, DM Staff Accommodation'
'Hatta, Hatta Fort Hotel'
'Hatta, Emirates NBD'
'Hatta, Sheikh Khalifa Masjid'
'Hatta, Bus Station'
};

%Bus Route E100
SNum = SNum + 1;
RouteList{SNum} = 'BRE100';
WeightsList{SNum} = [4 11 3];
StationList{SNum} = ...
{
'Al Ghubaiba Bus Station'
'Abu Dhabi, Samha'
'Abu Dhabi, Shahama Village'
'Abu Dhabi, Central Bus Station'
};

%Bus Route E101
SNum = SNum + 1;
RouteList{SNum} = 'BRE101';
WeightsList{SNum} = [16 12 33];
StationList{SNum} = ...
{
'Ibn Battuta Metro Bus Station'
'Abu Dhabi, Samha'
'Abu Dhabi, Shahama Village'
'Abu Dhabi, Central Bus Station'
};

%Bus Route E101
SNum = SNum + 1;
RouteList{SNum} = 'BRE101';
WeightsList{SNum} = [16 12 33];
StationList{SNum} = ...
{
'Ibn Battuta Metro Bus Station'
'Abu Dhabi, Samha'
'Abu Dhabi, Shahama Village'
'Abu Dhabi, Central Bus Station'
};

%Bus Route E201
SNum = SNum + 1;
RouteList{SNum} = 'BRE201';
WeightsList{SNum} = [4 3 6 5 25 54 2 0.1 1];
StationList{SNum} = ...
{
'Al Ghubaiba Bus Station'
'Al Jafiliya Seaside Metro Bus Stop'
'Wasl, Wasl Club'
'Nad Al Shiba, Emirates NBD'
'Marmoom Dairy Farm'
'Faqa, Terminus'
'UAE University Mohammed Ibn Khalifa St'
'Al Madina Petrol Station'
'Al Shiekha Slama Masjid'
'Al Ain Central Bus Station'
};

%Bus Route E301
SNum = SNum + 1;
RouteList{SNum} = 'BRE301';
WeightsList{SNum} = [4 0.1 1];
StationList{SNum} = ...
{
'Al Nahda, Shabab Alahli Club'
'Sharjah, Al Taawun, Dream Tower'
'Sharjah, Al Taawun, Al Amal Tower'
'Sharjah, Al Taawun Terminus'
};

%Bus Route E303
SNum = SNum + 1;
RouteList{SNum} = 'BRE303';
WeightsList{SNum} = [21 3 3 1 1 3 2 3 2];
StationList{SNum} = ...
{
'Union Square Bus Station'
'Sharjah, Ithihad Road, Ansar Mall'
'Sharjah, Ithihad Road - Al Safeer Mall'
'Sharjah, Al Wahda Rd, Subway 1'
'Sharjah, Al Wahda Rd, Al Wahda Center 2'
'Sharjah, Al Wahda Road , City Center 1'
'Sharjah, King Faisl Rd, Jumbo (Sony)'
'Sharjah, King Faisl Rd, Adnoc Petrol Station'
'Sharjah, King Faisl Rd, Gold Souq (Old)'
'Sharjah, Al Jubail Bus Station'
};

%Bus Route E303A
SNum = SNum + 1;
RouteList{SNum} = 'BRE303A';
WeightsList{SNum} = [19 2 2 1 1 3 2 3 2];
StationList{SNum} = ...
{
'Sabkha, Bus Station'
'Sharjah, Ithihad Road, Ansar Mall'
'Sharjah, Ithihad Road - Al Safeer Mall'
'Sharjah, Al Wahda Rd, Subway 1'
'Sharjah, Al Wahda Rd, Al Wahda Center 2'
'Sharjah, Al Wahda Road , City Center 1'
'Sharjah, King Faisl Rd, Jumbo (Sony)'
'Sharjah, King Faisl Rd, Adnoc Petrol Station'
'Sharjah, King Faisl Rd, Gold Souq (Old)'
'Sharjah, Al Jubail Bus Station'
};

%Bus Route E304
SNum = SNum + 1;
RouteList{SNum} = 'BRE304';
WeightsList{SNum} = [13 1 29 3 2 1 1 4 2 3 2];
StationList{SNum} = ...
{
'Satwa, Bus Station'
'Al Karama Bus Station'
'Schools Health Center'
'Sharjah, Ithihad Road, Ansar Mall'
'Sharjah, Ithihad Road - Al Safeer Mall'
'Sharjah, Al Wahda Rd, Subway 1'
'Sharjah, Al Wahda Rd, Al Wahda Center 2'
'Sharjah, Al Wahda Road , City Center 1'
'Sharjah, King Faisl Rd, Jumbo (Sony)'
'Sharjah, King Faisl Rd, Adnoc Petrol Station'
'Sharjah, King Faisl Rd, Gold Souq (Old)'
'Sharjah, Al Jubail Bus Station'
};

%Bus Route E306
SNum = SNum + 1;
RouteList{SNum} = 'BRE306';
WeightsList{SNum} = [5 12 2 2 0.1 1 3 2 2 2];
StationList{SNum} = ...
{
'Al Ghubaiba Bus Station'
'Dubai Hospital'
'Sharjah, Ithihad Road, Ansar Mall'
'Sharjah, Ithihad Road - Al Safeer Mall'
'Sharjah, Al Wahda Rd, Subway 1'
'Sharjah, Al Wahda Rd, Al Wahda Center 2'
'Sharjah, Al Wahda Road , City Center 1'
'Sharjah, King Faisl Rd, Jumbo (Sony)'
'Sharjah, King Faisl Rd, Adnoc Petrol Station'
'Sharjah, King Faisl Rd, Gold Souq (Old)'
'Sharjah, Al Jubail Bus Station'
};

%Bus Route E307
SNum = SNum + 1;
RouteList{SNum} = 'BRE307';
WeightsList{SNum} = [9 2 2 0.1 1 3 1 2 2];
StationList{SNum} = ...
{
'Deira City Center Bus Station'
'Sharjah, Ithihad Road, Ansar Mall'
'Sharjah, Ithihad Road - Al Safeer Mall'
'Sharjah, Al Wahda Rd, Subway 1'
'Sharjah, Al Wahda Rd, Al Wahda Center 2'
'Sharjah, Al Wahda Road , City Center 1'
'Sharjah, King Faisl Rd, Jumbo (Sony)'
'Sharjah, King Faisl Rd, Adnoc Petrol Station'
'Sharjah, King Faisl Rd, Gold Souq (Old)'
'Sharjah, Al Jubail Bus Station'
};

%Bus Route E311
SNum = SNum + 1;
RouteList{SNum} = 'BRE311';
WeightsList{SNum} = [24 2 1 1 1 2 1 0.1 2 1 1 2 2 3 2];
StationList{SNum} = ...
{
'Rashidiya Metro Bus Station'
'Sharjah Industrial, National Paints'
'Sharjah, Maliha Road, 4th Industrial Area Intersection'
'Sharjah, Maliha Road, Sabah Industries'
'Sharjah, Maliha Road, GECO Minerwa'
'Sharjah, Maliha Road, Municipality Office'
'Sharjah, Maliha Road, 2nd Industrial Junction B'
'Sharjah, Maliha Road, 2nd Industrial Junction A'
'Sharjah, Maliha Road, J&P Junction'
'Sharjah, Maliha Road, Maaza Signal Junction A'
'Sharjah, King Faisal Road, Maza Signal Junction'
'Sharjah, King Faisal Road, Bridge'
'Sharjah, King Faisl Rd, Jumbo (Sony)'
'Sharjah, King Faisl Rd, Adnoc Petrol Station'
'Sharjah, King Faisl Rd, Gold Souq (Old)'
'Sharjah, Al Jubail Bus Station'
};

%Bus Route E315
SNum = SNum + 1;
RouteList{SNum} = 'BRE315';
WeightsList{SNum} = [15];
StationList{SNum} = ...
{
'Etisalat Metro Bus Station'
'Sharjah, Al Muwailah Bus Terminal'
};

%Bus Route E316
SNum = SNum + 1;
RouteList{SNum} = 'BRE316';
WeightsList{SNum} = [30 3 1 2 1 2 3];
StationList{SNum} = ...
{
'Rashidiya Metro Bus Station'
'Sharjah, Maliha Road, Manama Supermarket'
'Sharjah, Maliha Road, Apollo Medical'
'Sharjah, Maliha Road, Industrial 17 Exit'
'Sharjah, Maliha Road, ENOC Petrol Station'
'Sharjah, Maliha Road, Sharjah English School'
'Sharjah, Maliha Road, Sharjah Institute of Technology'
'Sharjah, Noaf Airport Road Interchange'
};

%Bus Route E400
SNum = SNum + 1;
RouteList{SNum} = 'BRE400';
WeightsList{SNum} = [37 2 0.1 2];
StationList{SNum} = ...
{
'Union Square Bus Station'
'Ajman, Union National Bank'
'Ajman, Giant Supermarket'
'Ajman, Al Manama Mall'
'Ajman Bus Station'
};

%Bus Route E411
SNum = SNum + 1;
RouteList{SNum} = 'BRE411';
WeightsList{SNum} = [43 7 2 3 3];
StationList{SNum} = ...
{
'Etisalat Metro Bus Station'
'Ajman, Thumbay Hospital'
'Ajman, Crown Palace Hotel'
'Ajman, Rashidiya'
'Ajman, LuLu Hypermarket A'
'Ajman Bus Station'
};

%Bus Route E700
SNum = SNum + 1;
RouteList{SNum} = 'BRE700';
WeightsList{SNum} = [4 5 18 12 1 12 9 5 4 2 2 1 0.1 1];
StationList{SNum} = ...
{
'Union Square Bus Station'
'DNATA'
'Airport Terminal 1, Arrival'
'Sharjah Cement Factory'
'Dhaid, Post Office'
'Dhaid, Central Region Department'
'Thoban ENOC Petrol Station'
'Masafi, Friday Market'
'Masafi, Police Station'
'Fujairah, Ajman University'
'Fujairah Bus Station, External'
'Fujairah, Etisalat'
'Fujairah, Ministry Of Labour'
'Fujairah, Choithrams Supermarket'
'Fujairah'
};

%--------------Global Village & Miracle Garden Bus Routes -----------------

%Bus Route 102
SNum = SNum + 1;
RouteList{SNum} = 'BR102';
WeightsList{SNum} = [30];
StationList{SNum} = ...
{
'Rashidiya Metro Bus Station'
'Global Village'
};

%Bus Route 103
SNum = SNum + 1;
RouteList{SNum} = 'BR103';
WeightsList{SNum} = [15 45];
StationList{SNum} = ...
{
'Union Metro Bus Stop C'
'Rebat Street 2'
'Global Village'
};

%Bus Route 104
SNum = SNum + 1;
RouteList{SNum} = 'BR104';
WeightsList{SNum} = [20 40];
StationList{SNum} = ...
{
'Al Ghubaiba Bus Station'
'Al Jafiliya Seaside Metro Bus Stop'
'Global Village'
};

%Bus Route 105
SNum = SNum + 1;
RouteList{SNum} = 'BR105';
WeightsList{SNum} = [25];
StationList{SNum} = ...
{
'Mall of the Emirates Metro Bus Station'
'Miracle Garden'
};

%Bus Route 106
SNum = SNum + 1;
RouteList{SNum} = 'BR106';
WeightsList{SNum} = [2 1 .1 2 2 26];
StationList{SNum} = ...
{
'Mall of the Emirates Metro Bus Station'
'Al Barsha A'
'Al Barsha, Lulu Supermarket'
'Dubai American Academy'
'Classic Crystal'
'Al Quoz, Clinical Pathology Services'
'Global Village'
};

%--------------------------Forced Connects---------------------------------
%Due to naming convention differents on routes, some stations must 
%be 'force connected'
SNum = SNum + 1;
RouteList{SNum} = 'FJumeriah';
WeightsList{SNum} = [0];
StationList{SNum} = ...
{
'Jumeirah Lakes Towers'
'Jumeirah Beach Residence Station 2'
};

SNum = SNum + 1;
RouteList{SNum} = 'FBusinessBay';
WeightsList{SNum} = [0 0 0];
StationList{SNum} = ...
{
'Business Bay Seaside Metro Bus Stop'
'Business Bay Metro Bus Stop'
'Business Bay'
'Business Bay Metro Bus Stop Landside'
};

SNum = SNum + 1;
RouteList{SNum} = 'FBusinessBay';
WeightsList{SNum} = [0 0];
StationList{SNum} = ...
{
'Emirates Towers'
'Emirates Tower Seaside Metro Bus Stop'
'Emirates Tower Landside Metro Bus Stop'
};

SNum = SNum + 1;
RouteList{SNum} = 'FGouldSouqPalmDeira';
WeightsList{SNum} = [0 0 0];
StationList{SNum} = ...
{
'Palm Deira'
'Palm Deira Metro Bus Stop'
'Emirates Tower Landside Metro Bus Stop'
'Gold Souq Bus Station'
};

%--------------------------HyperLoop Routes--------------------------------

%Configuration 1
if(HL_Config ==1)
    SNum = SNum + 1;
    HLNum = SNum;
    RouteList{SNum} = 'HL1';
    RouteTypeManual(SNum) = 1;    
    WeightsList{SNum} = [];    
    StationList{SNum} = ...
    {
    'Airport Terminal 1'
    'Burj Khalifa'
    };
end

%Configuration 2
if(HL_Config ==2)
    SNum = SNum + 1;
    HLNum = SNum;
    RouteList{SNum} = 'HL2';
    RouteTypeManual(SNum) = 1;   
    WeightsList{SNum} = [];    
    StationList{SNum} = ...
    {
    'Burj Khalifa'  
    'Airport Terminal 1'
    'Al Ghubaiba'
    'Dubai Internet City'
    'Jebel Ali, Bus Station'     %labeled Palm Jebel - not a stop!
    'Al Maktoum International Airport, Arrivals'
    'International City'   
    };
end

%Configuration 3
if(HL_Config ==3)
    SNum = SNum + 1;
    HLNum = SNum;    
    RouteList{SNum} = 'HL3';
    RouteTypeManual(SNum) = 1; 
    WeightsList{SNum} = [];
    StationList{SNum} = ...
    { 
    'Burj Khalifa'  
    'Airport Terminal 1'
    'Al Ghubaiba'
    'Dubai Internet City'
    'Jebel Ali, Bus Station'     %labeled Palm Jebel - not a stop!
    'Al Maktoum International Airport, Arrivals'
    'International City'  
    };
end

%Configuration 4
if(HL_Config ==4)
    SNum = SNum + 1;
    HLNum = SNum;    
    RouteList{SNum} = 'HL4';
    RouteTypeManual(SNum) = 1;     
    WeightsList{SNum} = [];
    StationList{SNum} = ...
    {
    'Burj Khalifa'   
    'Airport Terminal 1'
    'BurJuman'
    'Dubai Internet City'   
    'Al Maktoum International Airport, Arrivals'    
    };
end

%Configuration 5
if(HL_Config ==5)
    SNum = SNum + 1;
    HLNum = SNum;    
    RouteList{SNum} = 'HL5';
    WeightsList{SNum} = [];
    RouteTypeManual(SNum) = 1;     
    StationList{SNum} = ...
    {
    'Airport Terminal 1'
    'BurJuman'
    'Burj Khalifa'   
    'Dubai Internet City'
    'Al Maktoum International Airport, Arrivals'
    'International City'      
    };
end

%Configuration 6
if(HL_Config ==6)
    SNum = SNum + 1;
    HLNum = SNum;    
    RouteList{SNum} = 'HL6';
    RouteTypeManual(SNum) = 1;     
    WeightsList{SNum} = [];
    StationList{SNum} = ...
    {
    'Al Jafiliya Seaside Metro Bus Stop'
    'Honda, Training Center'
    'Jebel Ali Free Zone, Main Gate'
    'Global Village'
    'Rashidiya Metro Bus Station'
    };
end

RouteTypeManual(SNum + 1) = 0; %ensure full array

%% -----------------------Error checking-----------------------------------
%check same number of node and weight arrays:
if(length(StationList) ~= length(WeightsList))
    msg = sprintf('!!! Error: Different number of Node and Weight arrays!!!!')
    error(msg)
end
%Check Node and weight lengths match:
for i=1:length(StationList)
    if(RouteTypeManual ~= 1)
        if(length(StationList{i}) ~= (length(WeightsList{i})+1))
            msg = sprintf('!!! Error: Node and Weights array length mismatch for index: %i Route: %s.',i,RouteList{i})
            error(msg)
        end
    end
end

%% ----------------------Compile Node list -------------------------------
% Find unique nodes to create master list
TotalNodes = vertcat(StationList{:});
UniqueNodes = unique(TotalNodes);

%create master node list, append station identifier to each station to make
%all unique (duplicate node names not allowed)
StationListPlus = StationList;
counter = 1;
for i=1:length(StationList)
    TempList = {};
    for j = 1:length(StationList{i})
        if(ismember(StationList{i}{j},TempList))    %some routes have stations more than one time!
            index = find(ismember(TempList,StationList{i}{j}));
            temps = sprintf('%s xr%i_%i',StationList{i}{j},i,(length(index)+1));
        else
            temps = sprintf('%s xr%i',StationList{i}{j},i);
        end
        %create temp list to know if route has already visited station
        TempList = [TempList
                    StationList{i}{j}];
                
        %Update string in cell array
        StationListPlus{i}{j} = temps;
        
        %create reference to overall index within list
        StationListIndex{i}(j) = counter;
        
        counter = counter + 1; %counter to track index
                
    end
end

%Build Unique Node index (selects first unique node found)
for i = 1:length(UniqueNodes)
    index = find(ismember(TotalNodes,UniqueNodes{i}));
    UniqueNodeIndex = [UniqueNodeIndex index(1)];
end

%Create one master node cell array
Nodes = vertcat(StationListPlus{:});

%For debug reference, alphabetically sorted master list
NodesSorted = sort(vertcat(StationListPlus{:}));

%%-----------------------Create Route Edges--------------------------------
% Currently assume same to/from route

% cycle through all routes to create connection list
for i=1:length(StationListPlus)
    if (RouteTypeManual(i) ~= 1)

        %forwards route source
        for j = 1:length(StationListPlus{i})-1
            index = find(ismember(Nodes,StationListPlus{i}{j}));
            source = [source index];
        end

        %forwards target source
        for j = 2:length(StationListPlus{i})
            index = find(ismember(Nodes,StationListPlus{i}{j}));
            target = [target index];
        end        
        
        %forward weights
        for j = 1:length(WeightsList{i})
            weights = [weights WeightsList{i}(j)];
        end        
        
        %backwards route source
        for j = length(StationListPlus{i}):-1:2
            index = find(ismember(Nodes,StationListPlus{i}{j}));
            source = [source index];        
        end    

        %backwards target source
        for j = length(StationListPlus{i})-1:-1:1
            index = find(ismember(Nodes,StationListPlus{i}{j}));
            target = [target index];
        end   
        
        %backward weights
        for j = length(WeightsList{i}):-1:1
            weights = [weights WeightsList{i}(j)];
        end        
    end
end


%%-----------------------Create Route Connections Edges--------------------
sourceconn = [];
targetconn = [];
weightsconn= [];
% calculate connections between all routes
for i=1:length(StationList)                 %cycle through all routes
     for j = 1:length(StationList{i})        %For each route station
         for k=1:length(StationList)         %cycle through all routes again
             if(i~=k)   %do not cycle through own route
                 index = find(ismember(StationList{k},StationList{i}{j}));
                 for t = 1:length(index)
                     targetconn = [targetconn StationListIndex{k}(index(t))];
                     sourceconn = [sourceconn StationListIndex{i}(j)];
                     weightsconn = [weightsconn Xfer_time];
                 end
             end
         end
     end
end

%%-----------------------Create Hyperloop Manual edges---------------------
sourceHL = [];
targetHL = [];
weightHL = [];
HL_nodes = [];

%HL1
if(HL_Config ==1)
    n1 = find(ismember(Nodes,StationListPlus{HLNum}{1}));   %Airport Terminal 1
    n2 = find(ismember(Nodes,StationListPlus{HLNum}{2}));   %Burj Khalifa
    HL_nodes = [n1 n2];
    sourceHL = [sourceHL n1 n2] ;
    targetHL = [targetHL n2 n1];
    weightHL = [weightHL 1.1 1.1];    
end

%HL2
if(HL_Config==2)
    n1 = find(ismember(Nodes,StationListPlus{HLNum}{1}));   %Burj Khalifa
    n2 = find(ismember(Nodes,StationListPlus{HLNum}{2}));   %Airport Terminal 1
    n3 = find(ismember(Nodes,StationListPlus{HLNum}{3}));   %Al Ghubaiba
    n4 = find(ismember(Nodes,StationListPlus{HLNum}{4}));   %Dubai Internet City
    n5 = find(ismember(Nodes,StationListPlus{HLNum}{5}));   %AJebel Ali, Bus Station
    n6 = find(ismember(Nodes,StationListPlus{HLNum}{6}));   %Al Maktoum International Airport, Arrivals
    n7 = find(ismember(Nodes,StationListPlus{HLNum}{7}));   %International City
    HL_nodes = [n1 n2 n3 n4 n5 n6 n7];
    sourceHL = [sourceHL n1  n1  n1  n1  n1  n1  n2  n2  n2  n3  n3  n3  n4  n4  n4  n5  n5  n5  n6  n6  n6  n7  n7  n7]; 
    targetHL = [targetHL n2  n3  n4  n5  n6  n7  n1  n3  n7  n1  n4  n2  n1  n3  n5  n1  n4  n6  n1  n5  n7  n1  n6  n2];
    weightHL = [weightHL 1.2 1.1 1.0 1.3 2.5 1.0 1.2 0.5 2.0 1.1 0.8 0.5 1.0 0.8 1.5 1.3 1.5 1.0 2.5 1.0 1.0 1.0 1.0 2.0];  
end

%HL3
if(HL_Config==3)
    n1 = find(ismember(Nodes,StationListPlus{HLNum}{1}));   %Burj Khalifa
    n2 = find(ismember(Nodes,StationListPlus{HLNum}{2}));   %Airport Terminal 1
    n3 = find(ismember(Nodes,StationListPlus{HLNum}{3}));   %Al Ghubaiba
    n4 = find(ismember(Nodes,StationListPlus{HLNum}{4}));   %Dubai Internet City
    n5 = find(ismember(Nodes,StationListPlus{HLNum}{5}));   %AJebel Ali, Bus Station
    n6 = find(ismember(Nodes,StationListPlus{HLNum}{6}));   %Al Maktoum International Airport, Arrivals
    n7 = find(ismember(Nodes,StationListPlus{HLNum}{7}));   %'International City' 
    HL_nodes = [n1 n2 n3 n4 n5 n6 n7];
    sourceHL = [sourceHL n1  n1  n1  n1  n1  n1  n2  n3  n4  n5  n6  n7]; 
    targetHL = [targetHL n2  n3  n4  n5  n6  n7  n1  n1  n1  n1  n1  n1]; 
    weightHL = [weightHL 1.2 1.1 1.0 1.3 2.5 1.0 1.2 1.1 1.0 1.3 2.5 1.0];
end

%HL4
if(HL_Config==4)
    n1 = find(ismember(Nodes,StationListPlus{HLNum}{1}));   %Burj Khalifa
    n2 = find(ismember(Nodes,StationListPlus{HLNum}{2}));   %Airport Terminal 1
    n3 = find(ismember(Nodes,StationListPlus{HLNum}{3}));   %BurJuman
    n4 = find(ismember(Nodes,StationListPlus{HLNum}{4}));   %Dubai Internet City
    n5 = find(ismember(Nodes,StationListPlus{HLNum}{5}));   %Al Maktoum International Airport, Arrivals 
    HL_nodes = [n1 n2 n3 n4 n5];
    sourceHL = [sourceHL n1  n1  n1  n1  n2  n3  n4  n5]; 
    targetHL = [targetHL n2  n3  n4  n5  n1  n1  n1  n1];
    weightHL = [weightHL 1.1 0.9 1.3 2.5 1.1 0.9 1.3 2.5];
end

%HL5
if(HL_Config==5)
    n1 = find(ismember(Nodes,StationListPlus{HLNum}{1}));   %Airport Terminal 1
    n2 = find(ismember(Nodes,StationListPlus{HLNum}{2}));   %BurJuman
    n3 = find(ismember(Nodes,StationListPlus{HLNum}{3}));   %Burj Khalifa
    n4 = find(ismember(Nodes,StationListPlus{HLNum}{4}));   %Dubai Internet City
    n5 = find(ismember(Nodes,StationListPlus{HLNum}{5}));   %Al Maktoum International Airport, Arrivals 
    n6 = find(ismember(Nodes,StationListPlus{HLNum}{6}));   %International City
    HL_nodes = [n1 n2 n3 n4 n5 n6];
    sourceHL = [sourceHL n1  n2  n2  n3  n3  n4  n4  n5  n5  n6  n6  n1]; 
    targetHL = [targetHL n2  n1  n3  n2  n4  n3  n5  n4  n6  n5  n1  n6];
    weightHL = [weightHL 0.9 0.9 0.9 0.9 1.3 1.3 1.7 1.7 2.7 2.7 1.1 1.1];
end

%HL6
if(HL_Config==6)
    n1 = find(ismember(Nodes,StationListPlus{HLNum}{1}));   %Al Jafiliya Seaside Metro Bus Stop
    n2 = find(ismember(Nodes,StationListPlus{HLNum}{2}));   %Honda, Training Center
    n3 = find(ismember(Nodes,StationListPlus{HLNum}{3}));   %Jebel Ali Free Zone, Main Gate
    n4 = find(ismember(Nodes,StationListPlus{HLNum}{4}));   %Global Village
    n5 = find(ismember(Nodes,StationListPlus{HLNum}{5}));   %Rashidiya Metro Bus Station

    HL_nodes = [n1 n2 n3 n4 n5];
    sourceHL = [sourceHL n1  n2  n2  n3  n3  n4  n4  n5  n5  n1]; 
    targetHL = [targetHL n2  n1  n3  n2  n4  n3  n5  n4  n1  n5];
    weightHL = [weightHL 1.5 1.5 1.5 1.5 1.5 1.5 2.5 2.5 1.0 1.0];
end

%Sum connections in
source = [source sourceconn sourceHL];
target = [target targetconn targetHL];
weights = [weights weightsconn weightHL];

%%--------------------------- Create Network -----------------------------
NodeTable = table(Nodes,'VariableNames',{'Name'});
EdgeTable = table([source' target'],weights','VariableNames',{'EndNodes' 'Weight'});
G = digraph(EdgeTable,NodeTable)

%%------------------------------ Plotting --------------------------------
% label last node of each route with route name
if(plot_on)
    labelindex=[];
    labelname=[];
    for i=1:length(StationList)
        labelindex = [labelindex StationListIndex{i}(length(StationListIndex{i}))];
        labelname = [labelname RouteList(i)];
    end

    p1 = plot(G)
    title('Dubai Transportation Network')
    %layout(p1,'force')                              % plot layout 'force' creates prettier network plot
    layout(p1,'force3')                            % plot layout 'force' creates prettier network plot
    labelnode(p1,labelindex,labelname)              % create route labels
    highlight(p1,HL_nodes,'NodeColor','r','MarkerSize',10)              % highlights Hyperloop nodes
    highlight(p1,sourceHL,targetHL,'EdgeColor','r','LineWidth',2)      % highlights Hyperloop nodes
end

%%--------------------------- Network Metrics -----------------------------

%Info outputs
disp(sprintf('Total number of routes are: %i',SNum))
disp(sprintf('Total number of Entered stations are: %i',length(TotalNodes)))
disp(sprintf('Total number of Unique stations are: %i',length(UniqueNodes)))
disp(sprintf('Total number of x-route connections: %i',length(sourceconn)))

%%shortest path matrix (in minutes, as our weights are travel time)
D = distances(G,UniqueNodeIndex);
avg_shortest_path = mean2(D)

%node centrality (betweenness)
C = centrality(G,'betweenness');

% Milan's HL6 update Starts Here (this section can be moved, but requires C
% G, and Nodes to be calculated already)
if(HL6_calculation)

    % max betweenness centralities of all nodes
    [maxC, index] = maxk(C, 20); 

    % d matrix = matrix of all shortest paths between the maxC nodes
    for i = 1:20
        for j = 1:20
            [P, tempd] = shortestpath(G,Nodes(index(i)),Nodes(index(j)));
            d(i,j) = tempd; 
        end
    end

    % Remove all unique nodes and store in HighCNodes. 
    % Path lengths (matrix) are in UniqueD
    [UniqueD,ia,ic] = unique(d,'stable','rows'); % keep only unique nodes
    for i = 1:1:max(ic)
        if(UniqueD(i,i) ~= 0)
            UniqueD(:,i) = [];
        end
    end
    if(UniqueD(max(ic),max(ic)) ~= 0)
            UniqueD(:,max(ic)) = [];
    end
    HighCNodes = Nodes(index(ia));
    maxC = maxC(ia);

    % Picking HL nodes that have high Betweenness Centrality and Shortest path 
    for i = 2:1:max(ic)
        minimum(i) = min(UniqueD(1:i-1,i)); % min value of each column
    end
    [d,i] = maxk(minimum,4); % The distance of 4 HL nodes farthest from node 1
    HighCNodes = [HighCNodes(1); HighCNodes(i)]; % These are the 5 nodes that were chosen
end
% Milan's Update stops here

HLCentrality = [];
for i = 1:length(HL_nodes)
    HLCentrality = [HLCentrality C(HL_nodes(i))];
end
avg_HLNode_Centrality = mean(HLCentrality)

%%--------------------------- Pareto Frontier -----------------------------

% Cost of HL
HL0_Cost = 0;
HL1_Cost = 690; % million USD
HL2_Cost = 11300; % million USD
HL3_Cost = 5635; % million USD
HL4_Cost = 3020; % million USD
HL5_Cost = 4850; % million USD
HL6_Cost = 4901; % million USD
HL_Costs = [HL0_Cost, HL1_Cost, HL2_Cost, HL3_Cost, HL4_Cost, HL5_Cost, HL6_Cost];

% Average Shortest Path
HL0_asp = 39.1939; % minutes
HL1_asp = 38.82; % minutes
HL2_asp = 35.68; ; % minutes
HL3_asp = 35.75; % minutes
HL4_asp = 37.46; % minutes
HL5_asp = 37.55; % minutes
HL6_asp = 30.755; % minutes
HL_asps = [HL0_asp, HL1_asp, HL2_asp, HL3_asp, HL4_asp, HL5_asp, HL6_asp];

% HL Nodes average Betweenness Centrality
HL0_BC = 0; % N/A, no HL
HL1_BC = 61053; %
HL2_BC = 112490; % 
HL3_BC = 113750; %
HL4_BC = 72492; % 
HL5_BC = 64080; % 
HL6_BC = 590050; % 
HL_BCs = [HL0_BC, HL1_BC, HL2_BC, HL3_BC, HL4_BC, HL5_BC, HL6_BC];

figure()
hold on
yyaxis left
title('Pareto Frontier');
xlabel('Cost of adding Hyperloop route');
ylabel('Average Shortest Path');
plot(HL_Costs, HL_asps,'o')
hold on
yyaxis right
ylabel('Average Hyperloop Nodes Betweenness Centrality');
plot(HL_Costs, HL_BCs, 'o')


