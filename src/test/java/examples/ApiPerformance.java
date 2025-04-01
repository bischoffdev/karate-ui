package examples;

import io.gatling.javaapi.core.ScenarioBuilder;
import io.gatling.javaapi.core.Simulation;

import static com.intuit.karate.gatling.javaapi.KarateDsl.karateFeature;
import static io.gatling.javaapi.core.CoreDsl.rampUsers;
import static io.gatling.javaapi.core.CoreDsl.scenario;

public class ApiPerformance extends Simulation {

  public ApiPerformance() {
    ScenarioBuilder main = scenario("main")
        .exec(karateFeature(
            "classpath:examples/coffeecart/01_api.feature"));
    setUp(main.injectOpen(
        rampUsers(100)
            .during(20)));
  }
}