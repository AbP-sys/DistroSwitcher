using Gtk;

class select_foldersWindow: Dashboard{

    public Gtk.ScrolledWindow scrolled_window;
    public select_foldersWindow(){
        // Create a vertical box to hold the checkboxes
        scrolled_window = new Gtk.ScrolledWindow(null,null);
        Box vbox = new Box(Orientation.VERTICAL, 10);
        scrolled_window.add(vbox);
    
        Label heading = new Label("");
        heading.set_markup("<span size='large'><b>Select the files/folders you want to backup</b></span>");
        heading.set_alignment(0,0);
        vbox.add(heading);
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
        vbox.add(next_button);
        window.add(scrolled_window);
        window.show_all();
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
