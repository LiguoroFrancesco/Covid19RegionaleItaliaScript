close all;
clear all;
clc;

url = 'https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-regioni.json';
matrice = jsondecode(urlread(url));

target = input('Inserisci regione (Con la prima lettera maiuscola): ','s')
regione = matrice(strcmp({matrice.denominazione_regione}, target));

sizeRegione = size(regione);
sizeRegione = sizeRegione(1);
for i = 1:sizeRegione
    regione_data(i) = datetime(regione(i).data,'InputFormat','yyyy-MM-dd HH:mm:ss');
end
regione_totcasi = vertcat(regione.totale_casi);
regione_nuoviPos = vertcat(regione.nuovi_attualmente_positivi);

subplot (2,1,1)
plot (regione_data,regione_totcasi,'-o')
title (sprintf('Andamento Integrale %s ', target))
%xlabel('Tempo [Giorni]') 
ylabel('Unità')
grid on
grid minor

subplot (2,1,2)
plot (regione_data,regione_nuoviPos,'-o')
title (sprintf('Andamento Giornaliero %s ', target))
xlabel('Tempo [Giorni]') 
ylabel('Unità')
grid on
grid minor
