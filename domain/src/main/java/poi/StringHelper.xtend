package poi

class StringHelper {

	def static ComparaStrings(String string1, String string2) {
		string1.toLowerCase().contains(string2.toLowerCase()) || string2.toLowerCase().contains(string1.toLowerCase())
	}

}
