<%inherit file="base.tpl"/>
<%block name="body">
    <div class="row-oriented-table rtable-2-cols">
        <div class="rtable-cell">Anzahl Mitarbeiter:</div>
        <div class="rtable-cell">${data[0]}</div>
        <div class="rtable-cell">Anzahl Weiterbildungen in Planung:</div>
        <div class="rtable-cell">${data[1]}</div>
        <div class="rtable-cell">Anzahl Weiterbildungen laufend:</div>
        <div class="rtable-cell">${data[2]}</div>
        <div class="rtable-cell">Anzahl Weiterbildungen abgeschlossen:</div>
        <div class="rtable-cell">${data[3]}</div>
    </div>
</%block>