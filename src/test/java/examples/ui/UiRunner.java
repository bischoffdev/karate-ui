package examples.ui;

import com.intuit.karate.junit5.Karate;

class UiRunner {
    
    @Karate.Test
    Karate testUi() {
        return Karate.run("ui");
    }
}
