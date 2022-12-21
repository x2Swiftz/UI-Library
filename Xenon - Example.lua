--// some docs if u actually wanna use it

create the lib: library.Create(name, nameUnder)
create a tab: lib:Tab(name, iconId)
create a button: tab:Button("name", "description", callback) 
create a toggle: tab:Toggle("name", "description", starting_state, callback) --// returns state true or false
create a dropdown: tab:Dropdown("name", list [table], callback) --// returns selected item in dropdown
create a label: tab:Label(text)
create a slider: tab:Slider(name, min, max, starting_value, callback) --// returns current value
create a keybind: tab:Keybind(name, keybind [enum], blacklisted_keys [table] (THESE ARE IN TEXT NO ENUM EG.. {"A", "B"}), callback) --// only returns a value (new key) when there is a new key selected
create a textbox: tab:TextBox(text, callback) --// returns new text typed in
create a notification: tab:Notification(text)

--// Others
force click a button: button:Click()
update an asset: asset:Update(newvalues)
toggle ui: lib:ToggleUI()