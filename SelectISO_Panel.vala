using Gtk;

class SelectISO_Panel : Gtk.Box {
    // Declare a text field to display the file path
    Entry filePathField;

    public SelectISO_Panel() {
        // Set up the box
        GLib.Object (orientation: Gtk.Orientation.VERTICAL, spacing: 10);
        // Create a button to open the file chooser dialog
        Label label= new Label("Select the image file of your new OS");
        Button openButton = new Button();
        openButton.set_size_request(50,50);
        openButton.set_image(new Image.from_icon_name("document-open", IconSize.BUTTON));
        openButton.clicked.connect(() => {
            // Create a file chooser dialog
            FileChooserDialog fileChooser = new FileChooserDialog(
                "Select an ISO File",
                Dashboard.window,
                FileChooserAction.OPEN,
                "Cancel", ResponseType.CANCEL,
                "Open", ResponseType.ACCEPT
            );

            // Only show .iso files
            FileFilter filter = new FileFilter();
            filter.add_pattern("*.iso");
            fileChooser.add_filter(filter);

            // Run the dialog and check if the user selected a file
            if (fileChooser.run() == ResponseType.ACCEPT) {
                // Get the selected file
                File file = fileChooser.get_file();
                string fileName = file.get_path();
                // Update the text field with the file path
                filePathField.set_text(fileName);
            }

            fileChooser.destroy();
        });

        // Create a horizontal box to hold the button and text field
        Box box = new Box(Orientation.HORIZONTAL,0);
        // Initialize the text field with an empty string
        filePathField = new Entry();
        box.pack_start(filePathField, true, true, 0);
        box.pack_start(openButton, false, false, 0);

        var FinishButton = new Button.with_label("Finish");
        FinishButton.set_halign(Align.END);
        // Add the box to the window
        this.add(label);
        this.add(box);
        this.add(FinishButton);

        Dashboard.window.add(this);
        Dashboard.window.show_all();

    }
}
