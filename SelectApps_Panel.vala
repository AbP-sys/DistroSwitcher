using GLib;
using Gtk;

class SelectApps_Panel : Gtk.Box{

    public SelectApps_Panel() {
        // Create the first ScrolledWindow
        GLib.Object (orientation: Gtk.Orientation.VERTICAL, spacing: 10);
        Box scrollwindow_box = new Box(Orientation.HORIZONTAL,0);

        var installed_scrollwindow = new ScrolledWindow(null,null);
        var carryfwd_scrollwindow = new ScrolledWindow(null,null);

        installed_scrollwindow.set_size_request(200, 200);
        carryfwd_scrollwindow.set_size_request(200,200);

        var itemBox = new ListBox ();
        itemBox.set_selection_mode (SelectionMode.SINGLE);
        var i = 0;
        while(i < 5){
            var row = new ListBoxRow ();
            var label = new Label ("app");
            row.add (label);
            itemBox.add (row);
            i++;
        }
        installed_scrollwindow.add(itemBox);
        scrollwindow_box.add(installed_scrollwindow);

        var carryfwd_box = new ListBox ();
        carryfwd_box.set_selection_mode (SelectionMode.SINGLE);
        i = 0;
        while(i < 5){
            var row = new ListBoxRow ();
            var label = new Label ("cfwdapp");
            row.add (label);
            carryfwd_box.add (row);
            i++;
        }
        carryfwd_scrollwindow.add(carryfwd_box);
        scrollwindow_box.add(carryfwd_scrollwindow);

        Box buttonBox = new Box(Orientation.HORIZONTAL,10);

        var leftButton = new Button.from_icon_name ("go-previous-symbolic", IconSize.BUTTON);
        var rightButton = new Button.from_icon_name ("go-next-symbolic", IconSize.BUTTON);


    // Add the buttons to the box container
        buttonBox.add (leftButton);
        buttonBox.add (rightButton);
       
        rightButton.clicked.connect(() => {
            move_btwn_boxes(itemBox,carryfwd_box);
        });

        leftButton.clicked.connect(() => {
            move_btwn_boxes(carryfwd_box,itemBox);
        });

        this.add(scrollwindow_box);
        this.add(buttonBox);

        Dashboard.window.add(this);
        Dashboard.window.show_all();
    }

    void move_btwn_boxes(ListBox box1,ListBox box2){
        var selectedRow = box1.get_selected_row ();
        if (selectedRow != null) {
            box1.remove (selectedRow);
            box2.add (selectedRow);
        }
        box2.unselect_all ();

    }
}