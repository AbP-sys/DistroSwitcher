using Gtk;

class select_OSBox: Dashboard{
    Box buttonBox;
    public select_OSBox(){
        buttonBox = new Box(Orientation.VERTICAL,10);

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

        buttonBox.add(current_os_label);
        buttonBox.add(current_os_icon);
        buttonBox.add(migrate_text);
        buttonBox.add(arch_button);
        buttonBox.add(debian_button);
        buttonBox.add(ubuntu_button);
        window.add(buttonBox);
    }


    void open_select_foldersWindow(){
        window.remove(buttonBox);
        var folder_window = new select_foldersWindow();
    }
}