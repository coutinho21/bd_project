##Imports necessários para raspar os dados da página
import requests
from bs4 import BeautifulSoup
##Import necessário para criação dos dataframes para análise
import pandas as pd
##Import necessário para criar o Profiling
import pandas_profiling as pp
from pandas_profiling import ProfileReport
##Import necessário para criação de gráficos
import matplotlib.pyplot as plt
##Import necessário para trabalhar com data e hora.
import datetime as dtm
from datetime import date as dt
##Import necessário para tratar acentuação
from unicodedata import normalize as nm

mainLink = "https://www.cbf.com.br/futebol-brasileiro/competicoes/campeonato-brasileiro-serie-a/2022"
gamesList = []
goalsList = []

for gn in range(1,381):
    currLink = mainLink + '/' + str(gn)
    req = requests.get(currLink)
    soup = BeautifulSoup(req.content, 'html.parser')
    
    gameNumber = soup.find(class_="color-white block text-1")
    print(gameNumber)


