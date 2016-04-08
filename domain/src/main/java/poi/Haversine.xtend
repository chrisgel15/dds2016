package poi

class Haversine {
    
    static int EARTH_RADIUS = 6371

    def static distance(double startLat, double startLong, double endLat, double endLong) {

        var dLat  = Math.toRadians((endLat - startLat))
        var dLong = Math.toRadians((endLong - startLong))
        var startLatToRadians = 0 as double
        var endLatToRadians = 0 as double

        startLatToRadians = Math.toRadians(startLat)
        endLatToRadians   = Math.toRadians(endLat)

        var a = haversin(dLat) + Math.cos(startLatToRadians) * Math.cos(endLatToRadians) * haversin(dLong)
        var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))

        EARTH_RADIUS * c
    }

    def static double haversin(double valor) {
        Math.pow(Math.sin(valor / 2), 2)
    }
}