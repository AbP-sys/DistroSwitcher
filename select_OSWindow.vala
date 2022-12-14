using Gtk;

class select_OSBox: Gtk.Box{
    public select_OSBox(){
        this.set_orientation(Orientation.VERTICAL);
        this.set_spacing(10);

        Label current_os_label = new Label("");
        current_os_label.set_markup("<span size='xx-large'><b>Current OS:</b></span>");

        Image current_os_icon = new Image();
        current_os_icon.set_from_file("distro_icons/128/128_manjaro.png");


        Label migrate_text = new Label("Migrate to: ");
        migrate_text.set_alignment(0,0);

        Button arch_button = new Button.with_label("Arch");
        Button debian_button = new Button.with_label("Debian");
        Button ubuntu_button = new Button.with_label("Ubuntu");

        arch_button.clicked.connect(open_select_foldersWindow);
        debian_button.clicked.connect(open_select_foldersWindow);
        ubuntu_button.clicked.connect(open_select_foldersWindow);

        this.add(current_os_label);
        this.add(current_os_icon);
        this.add(migrate_text);
        this.add(arch_button);
        this.add(debian_button);
        this.add(ubuntu_button);
    }


    private void open_select_foldersWindow(){
        this.hide();
        var window = new select_foldersWindow();
        //dashboard.add(window);
    }
}