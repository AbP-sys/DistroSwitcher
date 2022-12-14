using Gtk;
using GLib;

class Dashboard: Gtk.Window {
    public Dashboard() {
        this.title = "Distro Switcher";
        this.set_default_size(400, 200);
        this.set_border_width(10);
        this.destroy.connect(main_quit);
    }

    public static int main(string[] args){
        Gtk.init(ref args);
    
        var dashboard = new Dashboard();
        var box = new select_OSBox();
        dashboard.add(box);

        dashboard.show_all();
    
        Gtk.main();
        return 0;
    }
}