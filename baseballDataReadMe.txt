{\rtf1\ansi\ansicpg1252\cocoartf2511
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10760\viewh13700\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 ReadMe file by Ryan Brown and Caleb Cramer\
\
Our visual decisions for emphasizing the current team was to increase the stroke size and change the color of the specific team line to match with the corresponding team color. The text at the bottom right of the screen displays a shortened version of the team\'92s name to help inform the viewer what team data is being emphasized. We chose to give all teams (not in focus) a grey color. A viewer is able to distinguish between multiple teams because each team has a unique shade of grey. We were able to do this by incrementing the RGB value by 8.5 units. We used the number 8.5 by dividing the full RGB range by the number of teams (255/30 = 8.5). As for mastery, we learned how to use colorMode() to assign unique colors to each team when being emphasized. We chose to use the primary team colors as the highlight for when a team is selected.}