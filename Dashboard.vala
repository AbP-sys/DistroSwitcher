using Gtk;
using GLib;

class Dashboard {
    public static Gtk.Window window;

    public static int main(string[] args){
        Gtk.init(ref args);
    
        window = new Gtk.Window();
        window.title = "Distro Switcher";
        window.set_default_size(400, 200);
        window.set_border_width(10);
        window.destroy.connect(main_quit);

        var box = new select_OSBox();
        window.show_all();
    
        Gtk.main();
        return 0;
    }
}