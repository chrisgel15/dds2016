package poi

import org.joda.time.DateTime
import org.joda.time.Interval

class DecoradorHelper {
	
	static def double elapsedSeconds(DateTime start, DateTime stop) {
		var interval = new Interval(start, stop)
		var long milliseconds = interval.toDurationMillis()
		(milliseconds / 1000 )
	}
	
}