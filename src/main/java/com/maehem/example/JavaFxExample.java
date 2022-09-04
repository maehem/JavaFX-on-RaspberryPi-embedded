package com.maehem.example;

/*-
 * Example of JavaFX on RaspberryPi in embedded mode with DRM (Direct Rendering).
 * 
 * Licensed under the MIT License
 *
 */

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.stage.Screen;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.control.Button;
import javafx.scene.layout.StackPane;


/**
 * <p>Display a root pane with a button onto the main stage of the JavaFX window.</p>
 */
public class JavaFxExample extends Application {

    @Override
    public void start(Stage stage) throws Exception {
        var bounds = Screen.getPrimary().getBounds();

        StackPane root = new StackPane();
        Button btn = new Button();
        btn.setText("JavaFX says Hello!");
        root.getChildren().add(btn);

        // TODO: Probe reported size of screen and adjust Scene to that size. 
        //Scene scene = new Scene(root, 300, 250);
        Scene scene = new Scene(root, bounds.getWidth(), bounds.getHeight());
	// Title is probably never displayed but we set it anyway.
        stage.setTitle("Example of JavaFX on embedded RaspberryPi");
        stage.setScene(scene);
        stage.show();
    }

    /**
     *
     * @param args array of {@link java.lang.String} objects.
     * @throws java.lang.Exception
     */
    public static void main(String[] args) {
        launch();
    }
}
