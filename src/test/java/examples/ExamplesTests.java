package examples;


import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class ExamplesTests {    

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:examples")
            .outputHtmlReport(true)
            .outputCucumberJson(true)
            .parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
