package linksharing


class DemoInterceptor {

    boolean before() {
        println "DemoInterceptor"
        true }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
