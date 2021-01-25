<%inherit file="base.tpl"/>
<%block name="body">
    <h1>${employee_data[0]}, ${employee_data[1]}, akademische Grade: ${employee_data[2]}, Tätigkeit: ${employee_data[3]}</h1>
    <div class="row-oriented-table rtable-2-cols">
        <!-- Table Head -->
        <div class="rtable-head">Weiterbildung Bezeichnung</div>
        <div class="rtable-head">Status Teilnahme</div>
        % if len(employee_data[4]) > 0:
            <!-- Table Content -->
            % for key in employee_data[4]:
                <div class="rtable-cell">${training_data[key][0]}</div>
                <div class="rtable-cell">${employee_data[4][key]}</div>
            % endfor
        % else:
            <h3>keine</h3>
        % endif
    </div>
    <%
    erfolgreiche_teilnahmen = []
    for key, value in employee_data[4].items():
        if value == "erfolgreich beendet":
            erfolgreiche_teilnahmen.append(key)
    %>
    <div class="row-oriented-table rtable-1-cols">
        <!-- Table Head -->
        <div class="rtable-head">Qualifikationen</div>
        % if len(erfolgreiche_teilnahmen) > 0:
            <!-- Table Content -->
            % for training_id in erfolgreiche_teilnahmen:
                % for qualification in training_data[training_id][6]:
                    <div class="rtable-cell">${qualification}</div>
                % endfor
            % endfor
        % else:
            <h3>keine</h3>
        % endif
    </div>
    <div class="row-oriented-table rtable-1-cols">
        <!-- Table Head -->
        <div class="rtable-head">Zertifikate</div>
        <!-- Table Content -->
        <% num_certificates = 0 %>
        % for training_id in erfolgreiche_teilnahmen:
            % if training_data[training_id][7]:
                <div class="rtable-cell">${training_data[training_id][7][0]}</div>
                <% num_certificates += 1 %>
            % endif
        % endfor
        % if num_certificates == 0:
            <h3>keine</h3>
        % endif
    </div>
    <!-- Page Foot -->
    <div class="row-oriented-table rtable-1-cols">
        <div class="rtable-cell no-border">
            <a class="pseudo-button" href="/list_employees">zurück</a>
        </div>
    </div>
</%block>