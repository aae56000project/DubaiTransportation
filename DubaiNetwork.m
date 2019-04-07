% AAE56000, Spring 2019
% Dubai Transport SoS Project
% Milan Bidare, Mateus Feitosa, Alex Kirtley, Sujit Shivaprasad, Thomas Shaw
%
% This script creates a Graph Network of the Dubai transportation system
%

%Initiale cell arrays
StationList = {};       % List of all stations input directly
StationListPlus = {};   % List of all stationts with route appended
StationListIndex = {};  % List of station numbers
RouteList = {}          % List of Name of routes
WeightsList = {};       % List of Weights of routes

%Initialize arrays
source = [];            % source edge array
target = [];            % target edge array
weights = [];           % weights array

%Initialize Varaibles
SNum = 0                % integer to increment Lists

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
'Burj Khalifa / Dubai Mall'
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

%% ----------- Bus Lines ----------------      

%R7
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

%R8
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
'Khawaneej, Women�s Association'
'Khawaneej, Al Athbaa Primary School Terminus'
'Khawaneej, Women�s Association'
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

%Bus Route 11b
SNum = SNum + 1;
RouteList{SNum} = 'BR11b';
WeightsList{SNum} = ones(1,54);
StationList{SNum} = ...
{
'Rashidiya Metro Bus Station'
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
'Khawaneej, Women�s Association'
'Khawaneej, Al Athbaa Primary School Terminus'
'Khawaneej, Women�s Association'
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
'Awir, Terminus'
};

%Bus Route 12
SNum = SNum + 1;
RouteList{SNum} = 'BR12';
WeightsList{SNum} = ones(1,41);
StationList{SNum} = ...
{
'Ghubaiba Bus Station'   
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
'Al Quoz, Bus Station'      
};

%R15
SNum = SNum + 1;
RouteList{SNum} = 'BR15';
WeightsList{SNum} = ones(1,34);
StationList{SNum} = ...
{
'Ghubaiba Bus Station'  
'Falcon Intersection'
'Raffa'
'Rolla'
'Al Fahidi Metro Bus Stop A'
'Al Fahidi Metro Bus Stop B'
'Mankhool, Standard Chartered'
'Bank'
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
WeightsList{SNum} = ones(1,44);
StationList{SNum} = ...
{
'Sabkha, Bus Station'      % 475
'Gold Souq Bus Station External'
'Gold Souq Bus Station'
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
'Shabab Club'
'Dubai Folklore Theatre'
'Wuhaida, Road'
'Ahli Club'
'Stadium Metro Bus Stop'
'Ministry of Information'
'Al Nahda Metro Bus Stop'
'Twar, Union Cooperative Society'
'Dubai Airport Free Zone Metro Bus Stop'
'Twar 1, Emarat Al Mawred'
'DAFZA'
'Twar 1, Emarat Al Mawred'
'Al Khulafa?a Al Rashideen Boys School'
'Dubai Grand Hotel'
'Damascus Road 1'
'Damascus Road 2'
'Damascus Road 3'
'Dubai Abattoir'
'Qusais, Eppco Vehicle Inspection'
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
WeightsList{SNum} = ones(1,57);
StationList{SNum} = ...
{
'Ghubaiba Bus Station'
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
'Emirates Tower Seaside Metro'
'Bus Stop'
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
WeightsList{SNum} = ones(1,22);
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
WeightsList{SNum} = ones(1,25);
StationList{SNum} = ...
{
'Al Nahda, The Sheffeild Private School' 
'Al Nahda, Zuleikha Hospital'
'Al Nahda, 19A Street 1'
'Al Nahda, Madina Super Market'
'Al Nahda, Emirates College'
'Al Nahda, Canary Bldg'
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
'The Dubai Mall Burj Khalifa, The Palace Hotel' 
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
WeightsList{SNum} = ones(1,34);
StationList{SNum} = ...
{
'Ghubaiba Bus Station'
'Falcon Intersection'
'Raffa 2'   
'Nahda Street'
'Al Fahidi Metro Bus Stop A'
'Four Point Sheraton Hotel'
'BurJuman Metro Bus Stop A'
'BurJuman Metro Bus Stop B'
'Centre Point Shopping Centre'
'Karama 2'
'Karama 1'
'Karama, Commercial Center'
'Schools Health Center'
'Central Post Office'
'College of Islamic Studies'
'Oud Metha Metro Bus Stop'   
'Oud Metha Road 1'
'Oud Metha Road 2'
'Latifa Hospital'
'Wasl, Wasl Club'
'Belhasa Driving Center'
'Jaddaf, Police Officers Club'
'DEWA Main Office'
'Grand Hyatt Hotel'
'Dubai Festival City, Marks & Spencer 2'
'Dubai Festival City, Festival Centre'
'Dubai Festival City, IKEA'
'Rebat Street 2'
'Umm Ramool, Enoc'
'Rashidiya, Village'
'Nadd Al Hamar Road 1'
'Rashidiya 1'
'Rashidiya, Emarat Petrol Station'
'Rashidiya, Police Station'
'Rashidiya Metro Bus Station'
};


%% -----------------------Error checking-----------------------------------
%check same number of node and weight arrays:
if(length(StationList) ~= length(WeightsList))
    msg = sprintf('!!! Error: Different number of Node and Weight arrays!!!!')
    error(msg)
end
%Check Node and weight lengths match:
for i=1:length(StationList)
    if(length(StationList{i}) ~= (length(WeightsList{i})+1))
        msg = sprintf('!!! Error: Node and Weights array length mismatch for index: %i.',i)
        error(msg)
    end
end

%% ----------------------Compile Node lsit -------------------------------
% Find unique nodes to create master list
TotalNodes = vertcat(StationList{:});
UniqueNodes = unique(TotalNodes);

%create master node list, append station identifier to each station to make
%all unique (duplicate node names not allowed)
StationListPlus = StationList;
counter = 1
for i=1:length(StationList)
    TempList = {};
    for j = 1:length(StationList{i})
        if(ismember(StationList{i}{j},TempList))    %some routes have stations more than one time!
            temps = sprintf('%s xr%i_2',StationList{i}{j},i);
        else
            temps = sprintf('%s xr%i',StationList{i}{j},i);
        end
        %create temp list to know if route has already visited station
        TempList = [TempList
                    StationList{i}{j}];
                
        %Update string in cell array
        StationListPlus{i}{j} = temps;
        
        %crete reference to overall index within list
        StationListIndex{i}(j) = counter;
        
        counter = counter + 1; %counter to track index
                
    end
end

%Create one master node cell array
Nodes = vertcat(StationListPlus{:});

%For debug reference, alphabetically sorted master list
NodesSorted = sort(vertcat(StationListPlus{:}));

%%-----------------------Create Route Edges--------------------------------
% Currently assume same to/from route

% cycle through all routes to create connection list
for i=1:length(StationListPlus)
    %forwards route source
    for j = 1:length(StationListPlus{i})-1
        index = find(ismember(Nodes,StationListPlus{i}{j}));
        source = [source index];
    end
    
    %backwards route source
    for j = length(StationListPlus{i}):-1:2
        index = find(ismember(Nodes,StationListPlus{i}{j}));
        source = [source index];        
    end    

    %forwards target source
    for j = 2:length(StationListPlus{i})
        index = find(ismember(Nodes,StationListPlus{i}{j}));
        target = [target index];
    end
    
    %backwards target source
    for j = length(StationListPlus{i})-1:-1:1
        index = find(ismember(Nodes,StationListPlus{i}{j}));
        target = [target index];
    end   
end

% Create Weights matric
for i=1:length(WeightsList)
    %forward weights
    for j = 1:length(WeightsList{i})
        weights = [weights WeightsList{i}(j)];
    end
    %backward weights
    for j = length(WeightsList{i}):-1:1
        weights = [weights WeightsList{i}(j)];
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
                     weightsconn = [weightsconn 5];  %assum 5 minute connection for all Xfers
                 end
             end
         end
     end
end
   
%Sum connections in
source = [source sourceconn];
target = [target targetconn];
weights = [weights weightsconn];

%%--------------------------- Create Network -----------------------------
NodeTable = table(Nodes,'VariableNames',{'Name'});
EdgeTable = table([source' target'],weights','VariableNames',{'EndNodes' 'Weight'});

G = digraph(EdgeTable,NodeTable)
h = plot(G)
        
%%--------------------------- Network Metrics -----------------------------

%Info outputs
disp(sprintf('Total number of routes are: %i',SNum))
disp(sprintf('Total number of Entered stations are: %i',length(TotalNodes)))
disp(sprintf('Total number of Unique stations are: %i',length(UniqueNodes)))
disp(sprintf('Total number of x-route connections: %i',length(sourceconn)))

%%shortest path matrix (in minutes, as our weights are travel time)
D = distances(G);
avg_shortest_path = mean2(D)

