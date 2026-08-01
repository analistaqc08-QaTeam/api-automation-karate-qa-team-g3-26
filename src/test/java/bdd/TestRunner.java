package bdd;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
    @Karate.Test
   Karate test() {return Karate.run().relativeTo(getClass());}

    Karate testLogin() {
        return Karate.run("loginAuth").relativeTo(getClass());
    }

    @Karate.Test
    Karate testRegister() {
        return Karate.run("registerAuth").relativeTo(getClass());
    }
}
