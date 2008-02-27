class DateUtil {
	
	static getDifferenceAsString(millis) {
        def sign = millis < 0 ? -1 : 1
        def secs = (int)Math.abs(millis/1000)
        def sb = new StringBuffer()
        secs -= appendStringField(secs, sign, 'd', 60 * 60 * 24, sb)
        secs -= appendStringField(secs, sign, 'h', 60 * 60, sb)
        secs -= appendStringField(secs, sign, 'm', 60, sb)
        appendStringField(secs, sign, 's', 1, sb)
        return sb.toString().trim()
    }

	private static appendStringField(secs, sign, ch, multiplier, sb) {
	    def whole = (int)(secs / multiplier)
        if (!whole) return 0
        sb << '' + (sign * whole) + ch + ' '
        return whole * multiplier
    }

}