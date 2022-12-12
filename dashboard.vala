using Gtk;
using GLib;

public class CurrentOS: Window {

  public CurrentOS() {
    this.title = "Distro Switcher";
    this.set_default_size(400, 200);
    this.set_border_width(10);
    this.destroy.connect(main_quit);

    Label current_os_label = new Label("");
    current_os_label.set_markup("<span size='xx-large'><b>Current OS:</b></span>");

    Image current_os_icon = new Image();
    current_os_icon.set_from_file("distro_icons/128/128_manjaro.png");


    Label migrate = new Label("Migrate to: ");
    migrate.set_alignment(0,0);

    Button arch_button = new Button.with_label("Arch");
    Button debian_button = new Button.with_label("Debian");
    Button ubuntu_button = new Button.with_label("Ubuntu");

    Box button_box = new Box(Orientation.VERTICAL, 10);
    button_box.add(current_os_label);
    button_box.add(current_os_icon);
    button_box.add(migrate);
    button_box.add(arch_button);
    button_box.add(debian_button);
    button_box.add(ubuntu_button);

    this.add(button_box);
  }
}

int main(string[] args) {
  Gtk.init(ref args);

  CurrentOS current_os = new CurrentOS();
  current_os.show_all();

  Gtk.main();
  return 0;
}