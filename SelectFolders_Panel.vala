using Gtk;

class SelectFolders_Panel: Gtk.Box{

    public SelectFolders_Panel(){
        // Create a vertical box to hold the checkboxes
        GLib.Object (orientation: Gtk.Orientation.VERTICAL, spacing: 10);
        Gtk.ScrolledWindow scrolled_window = new Gtk.ScrolledWindow(null,null);
        scrolled_window.set_size_request(400, 200);
        Box vbox = new Box(Orientation.VERTICAL, 10);
        scrolled_window.add(vbox);
    
        Label heading = new Label("");
        heading.set_markup("<span size='large'><b>Select the files/folders you want to backup</b></span>");
        heading.set_alignment(0,0);
        this.add(heading);
        // Get a list of the folders in the home directory
        string[] folders = list_home_dir();
    
        // Create a checkbox for each folder and add it to the vertical box
        foreach (string folder in folders) {
            CheckButton checkbutton = new CheckButton.with_label(folder);
            vbox.pack_start(checkbutton, false, false, 0);
        }
    
        Button next_button = new Button.with_label("Next");
        // Set the button's position in the bottom right corner of the main window
        next_button.set_halign(Align.END);
        next_button.set_valign(Align.END);

        this.add(scrolled_window);
        this.add(next_button);
        Dashboard.window.add(this);
    }

    public string[] list_home_dir(){
        string[] list = null;
        try {
            Dir dir = Dir.open (Environment.get_home_dir());
            string? name = null;
    
            while ((name = dir.read_name ()) != null) {
                list  += name;
            }
        } catch (FileError err) {
            stderr.printf (err.message);
        }
        return list;
    }
}
