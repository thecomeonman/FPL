There has been a lot of talk about defenders being better value for
money than midfielders and forwards. I'd written a post about [the
optimal team
configuration](http://thecomeonman.blogspot.com/2014/08/fantasy-football-1-team-composition.html)
a long time ago and since it was only one season of data, I thought I'd
just check it again.

Assumptions 1:

-   I removed Chelsea and Leicester from 15/16 because of how unlikely
    both their performances were. Sure, there are swings in the table
    but those two teams in that season was a little too much. I feel the
    results are more representative without them.
-   Points per match is probably a better metric than total points but
    the historic data doesn't have a mention of matches started so we'll
    have to make do with total points. To minimise the effect, I have
    taken players that played at least 1710 minutes ( 19 matches of 90
    minutes ) and hope that the patterns observed also extend to all the
    players put together.
-   The data exposed is only for players active in the current season.
    This means that players who played in earlier seasons but have since
    left the EPL are not considered in the analysis for their
    respective seasons.
-   Players get their positions changed over seasons. This is too small
    in number to worry about.

### Value for money by position

![](02_-_Optima_files/figure-markdown_strict/SensitivityCorrection-1.png)![](02_-_Optima_files/figure-markdown_strict/SensitivityCorrection-2.png)

If you force a linear relation between price and total points,
goalkeepers, midfielders and forwards seem pretty tight together at
about 15 points per pound, 15 points per pound, and 12 points per pound
respectively. Defense, interestingly, seems to be rising every year with
the last two years being well clear of the other positions. However the
r-square values seem to be much better for midfielders and forwards
indicating that the trend is more reliable for them than defenders or
goalkepers.

In the last season, considering defenders offered much better value per
pound of starting cost than the other positions, it seems it would make
sense to pick expensive defenders and then pick cheaper players in the
other positions. But since the trend in the value per pound is
unreliable, maybe it is safer to pick more midfielders and forwards?

You can poke around in the following charts which offer a more detailed
view into the data. The trends are drawn without the Chelsea and
Leicester players from 15/16 even though they appear on the charts.

![](02_-_Optima_files/figure-markdown_strict/PlayerTypeSensitivity-1.png)![](02_-_Optima_files/figure-markdown_strict/PlayerTypeSensitivity-2.png)![](02_-_Optima_files/figure-markdown_strict/PlayerTypeSensitivity-3.png)![](02_-_Optima_files/figure-markdown_strict/PlayerTypeSensitivity-4.png)

Assumptions 2:

-   Picking one static team at the start of the season which stays
    throughout the year.
-   No captaincy concept.
-   18m set aside for substitutes, which means I can select a team
    costing 82m at most.
-   Players get their positions changed over seasons but for my
    convenience, I'm going to ignore that this happens.

### Optimal team configs

What we care about eventually though is the points total so I tried to
find the best team I could have picked. I then removed all the players
who figure in the best team from the dataset, and picked the next best
team. I picked a total of 5 teams like this.

<table style="width:100%;">
<colgroup>
<col width="6%" />
<col width="24%" />
<col width="23%" />
<col width="23%" />
<col width="23%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">Itern</th>
<th align="center">DEF</th>
<th align="center">FWD</th>
<th align="center">GKP</th>
<th align="center">MID</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">Kyle Walker (26ppp <span class="citation">@5.5</span>), <br>Gary Cahill (30ppp <span class="citation">@6</span>), <br>Marcos Alonso (30ppp <span class="citation">@6</span>)</td>
<td align="center">Romelu Lukaku (25ppp <span class="citation">@9</span>), <br>Joshua King (32ppp <span class="citation">@5.5</span>)</td>
<td align="center">Tom Heaton (33ppp <span class="citation">@4.5</span>)</td>
<td align="center">Alexis Sánchez (24ppp <span class="citation">@11</span>), <br>Gylfi Sigurdsson (24ppp <span class="citation">@7.5</span>), <br>Christian Eriksen (26ppp <span class="citation">@8.5</span>), <br>Bamidele Alli (26ppp <span class="citation">@8.5</span>), <br>Eden Hazard (22ppp <span class="citation">@10</span>)</td>
</tr>
<tr class="even">
<td align="center">2</td>
<td align="center">Gareth McAuley (29ppp <span class="citation">@4.5</span>), <br>César Azpilicueta (28ppp <span class="citation">@6</span>), <br>Leighton Baines (25ppp <span class="citation">@5.5</span>)</td>
<td align="center">Roberto Firmino (21ppp <span class="citation">@8.5</span>), <br>Harry Kane (20ppp <span class="citation">@11</span>), <br>Diego Da Silva Costa (21ppp <span class="citation">@9.5</span>)</td>
<td align="center">Hugo Lloris (26ppp <span class="citation">@5.5</span>)</td>
<td align="center">Philippe Coutinho (21ppp <span class="citation">@8</span>), <br>Kevin De Bruyne (19ppp <span class="citation">@10.5</span>), <br>Heung-Min Son (23ppp <span class="citation">@7.5</span>), <br>Wilfried Zaha (27ppp <span class="citation">@5.5</span>)</td>
</tr>
<tr class="odd">
<td align="center">3</td>
<td align="center">James Milner (21ppp <span class="citation">@6.5</span>), <br>Charlie Daniels (27ppp <span class="citation">@5</span>), <br>Seamus Coleman (24ppp <span class="citation">@5.5</span>)</td>
<td align="center">Sergio Agüero (13ppp <span class="citation">@13</span>), <br>Fernando Llorente (22ppp <span class="citation">@6.5</span>), <br>Jermain Defoe (24ppp <span class="citation">@7</span>)</td>
<td align="center">Thibaut Courtois (26ppp <span class="citation">@5.5</span>)</td>
<td align="center">Mesut Özil (18ppp <span class="citation">@9.5</span>), <br>Georginio Wijnaldum (19ppp <span class="citation">@8</span>), <br>Raheem Sterling (19ppp <span class="citation">@8</span>), <br>Pedro Rodríguez Ledesma (22ppp <span class="citation">@7.5</span>)</td>
</tr>
<tr class="even">
<td align="center">4</td>
<td align="center">Nathaniel Clyne (23ppp <span class="citation">@5.5</span>), <br>David Luiz Moreira Marinho (22ppp <span class="citation">@6</span>), <br>Ashley Williams (25ppp <span class="citation">@5</span>)</td>
<td align="center">Christian Benteke (18ppp <span class="citation">@7.5</span>), <br>Jamie Vardy (16ppp <span class="citation">@10</span>)</td>
<td align="center">David de Gea (25ppp <span class="citation">@5.5</span>)</td>
<td align="center">Adam Lallana (20ppp <span class="citation">@7</span>), <br>Sadio Mané (17ppp <span class="citation">@9</span>), <br>Robert Snodgrass (24ppp <span class="citation">@5.5</span>), <br>Manuel Lanzini (20ppp <span class="citation">@6.5</span>), <br>Ross Barkley (19ppp <span class="citation">@7.5</span>)</td>
</tr>
<tr class="odd">
<td align="center">5</td>
<td align="center">Laurent Koscielny (20ppp <span class="citation">@6</span>), <br>Ryan Bertrand (22ppp <span class="citation">@5.5</span>), <br>Jan Vertonghen (23ppp <span class="citation">@5.5</span>)</td>
<td align="center">Troy Deeney (19ppp <span class="citation">@7</span>), <br>Sam Vokes (20ppp <span class="citation">@6</span>)</td>
<td align="center">Fraser Forster (27ppp <span class="citation">@5</span>)</td>
<td align="center">Theo Walcott (16ppp <span class="citation">@7.5</span>), <br>David Silva (14ppp <span class="citation">@9</span>), <br>Nathan Redmond (21ppp <span class="citation">@6</span>), <br>Etienne Capoue (29ppp <span class="citation">@4.5</span>), <br>Michail Antonio (19ppp <span class="citation">@7</span>)</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col width="5%" />
<col width="9%" />
<col width="10%" />
<col width="10%" />
<col width="10%" />
<col width="10%" />
<col width="10%" />
<col width="8%" />
<col width="8%" />
<col width="8%" />
<col width="8%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">Itern</th>
<th align="center">start_cost</th>
<th align="center">total_points</th>
<th align="center">DEF avg cost</th>
<th align="center">FWD avg cost</th>
<th align="center">GKP avg cost</th>
<th align="center">MID avg cost</th>
<th align="center">DEF count</th>
<th align="center">FWD count</th>
<th align="center">GKP count</th>
<th align="center">MID count</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">82</td>
<td align="center">2157</td>
<td align="center">5.8</td>
<td align="center">7.2</td>
<td align="center">4.5</td>
<td align="center">9.1</td>
<td align="center">3</td>
<td align="center">2</td>
<td align="center">1</td>
<td align="center">5</td>
</tr>
<tr class="even">
<td align="center">2</td>
<td align="center">82</td>
<td align="center">1872</td>
<td align="center">5.3</td>
<td align="center">9.7</td>
<td align="center">5.5</td>
<td align="center">7.9</td>
<td align="center">3</td>
<td align="center">3</td>
<td align="center">1</td>
<td align="center">4</td>
</tr>
<tr class="odd">
<td align="center">3</td>
<td align="center">82</td>
<td align="center">1661</td>
<td align="center">5.7</td>
<td align="center">8.8</td>
<td align="center">5.5</td>
<td align="center">8.2</td>
<td align="center">3</td>
<td align="center">3</td>
<td align="center">1</td>
<td align="center">4</td>
</tr>
<tr class="even">
<td align="center">4</td>
<td align="center">75</td>
<td align="center">1526</td>
<td align="center">5.5</td>
<td align="center">8.8</td>
<td align="center">5.5</td>
<td align="center">7.1</td>
<td align="center">3</td>
<td align="center">2</td>
<td align="center">1</td>
<td align="center">5</td>
</tr>
<tr class="odd">
<td align="center">5</td>
<td align="center">69</td>
<td align="center">1396</td>
<td align="center">5.7</td>
<td align="center">6.5</td>
<td align="center">5</td>
<td align="center">6.8</td>
<td align="center">3</td>
<td align="center">2</td>
<td align="center">1</td>
<td align="center">5</td>
</tr>
</tbody>
</table>

All the teams had 3 at the back but the combination seems to consist of
premium defenders and at least one of the midfielders or forwards being
a mid/low-budget option who is punching above his weight. It isn't easy
to spot these low cost - high points players so being realistic, what if
we remove some of the exceptional performers? I pick exceptional players
as players at least 30 points above what the earlier linear regression
predicts for their starting price.

<table>
<colgroup>
<col width="6%" />
<col width="23%" />
<col width="23%" />
<col width="23%" />
<col width="23%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">Itern</th>
<th align="center">DEF</th>
<th align="center">FWD</th>
<th align="center">GKP</th>
<th align="center">MID</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">James Milner (21ppp <span class="citation">@6.5</span>), <br>Leighton Baines (25ppp <span class="citation">@5.5</span>), <br>Seamus Coleman (24ppp <span class="citation">@5.5</span>)</td>
<td align="center">Roberto Firmino (21ppp <span class="citation">@8.5</span>), <br>Jermain Defoe (24ppp <span class="citation">@7</span>), <br>Diego Da Silva Costa (21ppp <span class="citation">@9.5</span>)</td>
<td align="center">Hugo Lloris (26ppp <span class="citation">@5.5</span>)</td>
<td align="center">Philippe Coutinho (21ppp <span class="citation">@8</span>), <br>Raheem Sterling (19ppp <span class="citation">@8</span>), <br>Kevin De Bruyne (19ppp <span class="citation">@10.5</span>), <br>Pedro Rodríguez Ledesma (22ppp <span class="citation">@7.5</span>)</td>
</tr>
<tr class="even">
<td align="center">2</td>
<td align="center">Nathaniel Clyne (23ppp <span class="citation">@5.5</span>), <br>Jan Vertonghen (23ppp <span class="citation">@5.5</span>), <br>David Luiz Moreira Marinho (22ppp <span class="citation">@6</span>)</td>
<td align="center">Sergio Agüero (13ppp <span class="citation">@13</span>), <br>Fernando Llorente (22ppp <span class="citation">@6.5</span>)</td>
<td align="center">Thibaut Courtois (26ppp <span class="citation">@5.5</span>)</td>
<td align="center">Mesut Özil (18ppp <span class="citation">@9.5</span>), <br>Sadio Mané (17ppp <span class="citation">@9</span>), <br>Georginio Wijnaldum (19ppp <span class="citation">@8</span>), <br>Nathan Redmond (21ppp <span class="citation">@6</span>), <br>Ross Barkley (19ppp <span class="citation">@7.5</span>)</td>
</tr>
<tr class="odd">
<td align="center">3</td>
<td align="center">Laurent Koscielny (20ppp <span class="citation">@6</span>), <br>Ryan Bertrand (22ppp <span class="citation">@5.5</span>), <br>Toby Alderweireld (18ppp <span class="citation">@6.5</span>)</td>
<td align="center">Troy Deeney (19ppp <span class="citation">@7</span>), <br>Christian Benteke (18ppp <span class="citation">@7.5</span>), <br>Jamie Vardy (16ppp <span class="citation">@10</span>)</td>
<td align="center">David de Gea (25ppp <span class="citation">@5.5</span>)</td>
<td align="center">Adam Lallana (20ppp <span class="citation">@7</span>), <br>David Silva (14ppp <span class="citation">@9</span>), <br>Manuel Lanzini (20ppp <span class="citation">@6.5</span>), <br>Michail Antonio (19ppp <span class="citation">@7</span>)</td>
</tr>
<tr class="even">
<td align="center">4</td>
<td align="center">Héctor Bellerín (18ppp <span class="citation">@6.5</span>), <br>Nacho Monreal (19ppp <span class="citation">@6</span>), <br>Antonio Valencia (22ppp <span class="citation">@5.5</span>)</td>
<td align="center">Salomón Rondón (18ppp <span class="citation">@6.5</span>), <br>Sam Vokes (20ppp <span class="citation">@6</span>)</td>
<td align="center">Fraser Forster (27ppp <span class="citation">@5</span>)</td>
<td align="center">Theo Walcott (16ppp <span class="citation">@7.5</span>), <br>Marko Arnautovic (16ppp <span class="citation">@7.5</span>), <br>Cesc Fàbregas (16ppp <span class="citation">@7.5</span>), <br>Kevin Mirallas (18ppp <span class="citation">@6.5</span>), <br>Riyad Mahrez (13ppp <span class="citation">@9.5</span>)</td>
</tr>
<tr class="odd">
<td align="center">5</td>
<td align="center">Dejan Lovren (21ppp <span class="citation">@5</span>), <br>Steve Cook (22ppp <span class="citation">@5</span>), <br>Michael Keane (23ppp <span class="citation">@5</span>)</td>
<td align="center">Olivier Giroud (13ppp <span class="citation">@9</span>), <br>Andre Gray (17ppp <span class="citation">@6.5</span>)</td>
<td align="center">Petr Cech (24ppp <span class="citation">@5.5</span>)</td>
<td align="center">Paul Pogba (14ppp <span class="citation">@8.5</span>), <br>Nacer Chadli (17ppp <span class="citation">@6.5</span>), <br>Matt Phillips (21ppp <span class="citation">@5.5</span>), <br>Willian Borges Da Silva (15ppp <span class="citation">@7.5</span>), <br>Andros Townsend (18ppp <span class="citation">@6.5</span>)</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col width="5%" />
<col width="9%" />
<col width="10%" />
<col width="10%" />
<col width="10%" />
<col width="10%" />
<col width="10%" />
<col width="8%" />
<col width="8%" />
<col width="8%" />
<col width="8%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">Itern</th>
<th align="center">start_cost</th>
<th align="center">total_points</th>
<th align="center">DEF avg cost</th>
<th align="center">FWD avg cost</th>
<th align="center">GKP avg cost</th>
<th align="center">MID avg cost</th>
<th align="center">DEF count</th>
<th align="center">FWD count</th>
<th align="center">GKP count</th>
<th align="center">MID count</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">1</td>
<td align="center">82</td>
<td align="center">1773</td>
<td align="center">5.8</td>
<td align="center">8.3</td>
<td align="center">5.5</td>
<td align="center">8.5</td>
<td align="center">3</td>
<td align="center">3</td>
<td align="center">1</td>
<td align="center">4</td>
</tr>
<tr class="even">
<td align="center">2</td>
<td align="center">82</td>
<td align="center">1591</td>
<td align="center">5.7</td>
<td align="center">9.8</td>
<td align="center">5.5</td>
<td align="center">8</td>
<td align="center">3</td>
<td align="center">2</td>
<td align="center">1</td>
<td align="center">5</td>
</tr>
<tr class="odd">
<td align="center">3</td>
<td align="center">77.5</td>
<td align="center">1461</td>
<td align="center">6</td>
<td align="center">8.2</td>
<td align="center">5.5</td>
<td align="center">7.4</td>
<td align="center">3</td>
<td align="center">3</td>
<td align="center">1</td>
<td align="center">4</td>
</tr>
<tr class="even">
<td align="center">4</td>
<td align="center">74</td>
<td align="center">1326</td>
<td align="center">6</td>
<td align="center">6.2</td>
<td align="center">5</td>
<td align="center">7.7</td>
<td align="center">3</td>
<td align="center">2</td>
<td align="center">1</td>
<td align="center">5</td>
</tr>
<tr class="odd">
<td align="center">5</td>
<td align="center">70.5</td>
<td align="center">1259</td>
<td align="center">5</td>
<td align="center">7.8</td>
<td align="center">5.5</td>
<td align="center">6.9</td>
<td align="center">3</td>
<td align="center">2</td>
<td align="center">1</td>
<td align="center">5</td>
</tr>
</tbody>
</table>

It's still 3 at the back except the defenders seem to be the more
expensive ones. Note that quite a few of the premium players have also
gotten omitted suggesting that the winning teams comprise of exceptional
performers at all price brackets and not just the mid and low price
brackets.

### Conclusion

Even if defenders offer better value for money, it still makes sense to
go for 3 at the back.
