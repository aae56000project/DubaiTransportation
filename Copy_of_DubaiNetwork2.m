% AAE56000, Spring 2019
% Dubai Transport SoS Project
% Milan Bidare, Mateus Feitosa, Alex Kirtley, Sujit Shivaprasad, Thomas Shaw
%

%Initiale cell arrays
StationList = {};
WeightsCell = {};
stations = {};

%Initialize arrays
source = [];
target = [];
weights = [];


%% ----------- Metro Lines ----------------

% Metro Green line
WeightsCell{1} = [3 2 1 2 2 2 2 2 2 2 2 2 2 2 2 3 3 2 2];
StationList{1} = ...
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
'Union - Green Line'
'Baniyas Square'     
'Palm Deira'    
'Al Ras'        
'Al Ghubaiba'   
'Al Fahkli'     
'BurJuman - Green Line' 
'Oud Metha'     
'DHC'           
'Al Jadaf'      
'Creek'         
};

% Metro Red Line
WeightsCell{2} = [4 2 1 2 2 2 3 2 2 2 2 2 1 2 2 5 2 2 2 2 3 2 2 2 3 3 4];
StationList{2} = ...
{
'Rashidiya'         
'Emirates'          
'Airport Terminal 3'
'Airport Terminal 1'
'GGICO'             
'Deira City Centre' 
'Al Rigga'          
'Union - Red Line'  
'BurJuman - Red Line'   
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
WeightsCell{3} = [2 3 3 3 1 2 3 2];
StationList{3} = ...
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
WeightsCell{4} = [1 2 4 6 1 1 1 1 1 1 3 5];
StationList{4} = ...
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
WeightsCell{5} = [7 3 2 1 1 3 1 1 1 .1 1 1 1 1 1 .1 4 2 .1 1 1 1 1 1 1 1 1 2 1 1 2 .1 1 2 .1 5 1 1 2 2 1 6];
StationList{5} = ...
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

%10
WeightsCell{6} = [4 2 2 2 2 1 3 2 1 5 2 3 15 .1];
StationList{6} = ...
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

%R11a
WeightsCell{7} = [2 1 2 3 1 1 1 1 1 2 4 5 1 3 1 2 1 1 8 1 2 1 2 2 1 2 1 1 1 2 1 1 1 1 2 1 .1 1 1 1 1 1 .1 1 1 4 1 1 .1 1 1 1 1 1 1 1 1 1 2 .1 2 2 1 1 1 1 1 .1 1 1 2 1];
StationList{7} = ...
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
};

%% -----------------------Error checking-----------------------------------
%check same number of node and weight arrays:
if(length(StationList) ~= length(WeightsCell))
    msg = sprintf('!!! Error: Different number of Node and Weight arrays!!!!')
    error(msg)
end
%Check Node and weight lengths match:
for i=1:length(StationList)
    if(length(StationList{i}) ~= (length(WeightsCell{i})+1))
        msg = sprintf('!!! Error: Node and Weights array length mismatch for index: %i.',i)
        error(msg)
    end
end

%% ----------------------Compile Node lsit -------------------------------
% Find unique nodes to create master list
TotalNodes = vertcat(StationList{:});
UniqueNodes = unique(TotalNodes);
disp(sprintf('Total number of Entered stations are: %i',length(TotalNodes)))
disp(sprintf('Total number of Unique stations are: %i',length(UniqueNodes)))

%create master node list, append station identifier to each station to make
%all unique

for i=1:length(StationList)
    TempList = {}
    for j = 1:length(StationList{i})
        if(ismember(StationList{i}{j},TempList))
            temps = sprintf('%s r%i_2',StationList{i}{j},i);
        else
            temps = sprintf('%s r%i',StationList{i}{j},i);
        end
        TempList = [TempList
                    StationList{i}{j}];
        StationList{i}{j} = temps;                
    end
end
Nodes = sort(vertcat(StationList{:}));

%%--------------------------Create Edges--------------------------------

% cycle through all routes to create connection list
for i=1:length(StationList)
    %forwards route source
    for j = 1:length(StationList{i})-1
        index = find(ismember(UniqueNodes,StationList{i}{j}));
        source = [source index];
    end
    
    %backwards route source
    for j = length(StationList{i}):-1:2
        index = find(ismember(UniqueNodes,StationList{i}{j}));
        source = [source index];        
    end    

    %forwards target source
    for j = 2:length(StationList{i})
        index = find(ismember(UniqueNodes,StationList{i}{j}));
        target = [target index];
    end
    
    %backwards target source
    for j = length(StationList{i})-1:-1:1
        index = find(ismember(UniqueNodes,StationList{i}{j}));
        target = [target index];
    end   
end

% Create Weights matric
for i=1:length(WeightsCell)
    %forward weights
    for j = 1:length(WeightsCell{i})
        weights = [weights WeightsCell{i}(j)];
    end
    %backward weights
    for j = length(WeightsCell{i}):-1:1
        weights = [weights WeightsCell{i}(j)];
    end
end

%%-----------------------Create Route Connections Edges--------------------
%necessary? only if we want 'connection' time
% for i=1:length(StationList)
%     %forwards route source
%     for j = 1:length(StationList{i})-1
%         index = find(ismember(UniqueNodes,StationList{i}{j}));
%         source = [source index];
%     end
%     
%     %backwards route source
%     for j = length(StationList{i}):-1:2
%         index = find(ismember(UniqueNodes,StationList{i}{j}));
%         source = [source index];        
%     end    
% 
%     %forwards target source
%     for j = 2:length(StationList{i})
%         index = find(ismember(UniqueNodes,StationList{i}{j}));
%         target = [target index];
%     end
%     
%     %backwards target source
%     for j = length(StationList{i})-1:-1:1
%         index = find(ismember(UniqueNodes,StationList{i}{j}));
%         target = [target index];
%     end   
% end

%%--------------------------- Create Network -----------------------------
NodeTable = table(UniqueNodes,'VariableNames',{'Name'});
EdgeTable = table([source' target'],weights','VariableNames',{'EndNodes' 'Weight'});

G = digraph(EdgeTable,NodeTable)
h = plot(G)
        
%%--------------------------- Network Metrics -----------------------------

%%shortest path matrix (in minutes, as our weights are travel time)
D = distances(G);
avg_shortest_path = mean2(D)

