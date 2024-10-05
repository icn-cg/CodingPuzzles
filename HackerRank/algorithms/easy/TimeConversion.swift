func timeConversion(s: String) -> String {
    // Write your code here
        var s = Array(s)
        let hour = Int(String(s[0...1])) ?? 0
        switch s[8]{
                case "A":
                if hour == 12 {
                        return "00" + String(s[2...7])
                }
                return String(s[0...7])
                case "P":
                if hour == 12 {
                        return "12" + String(s[2...7])
                }
                return String(hour + 12) + String(s[2...7])
                default:
                return String(s[0...7])
        }
}
