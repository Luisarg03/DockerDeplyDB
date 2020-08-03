@ECHO OFF
echo Iniciando deploy...

if not exist "C:\Docker\SQLServerCampaign\volume" mkdir C:\Docker\SQLServerCampaign\volume

timeout 0
docker-compose up -d

timeout 10
docker container ls

timeout 5
echo Creando BD SASCampaign
sqlcmd -S localhost,1433 -U sa -P Password_01 -i C:\Docker\SQLServerCampaign\SASCampaignCreate.sql

timeout 5
echo Creando tablas SASCampaign
sqlcmd -S localhost,1433 -U sa -P Password_01 -i C:\Docker\SQLServerCampaign\SASCampaign_Tables.sql -o C:\Docker\SQLServerCampaign\SASCampaign_Tables.txt

timeout 5
echo Creando Vistas y Procedimientos SASCampaign
sqlcmd -S localhost,1433 -U sa -P Password_01 -i C:\Docker\SQLServerCampaign\SASCampaign_Vw_Sp.sql -o C:\Docker\SQLServerCampaign\SASCampaign_Vw_Sp.txt

timeout 0
echo Deploy finalizado...
pause
