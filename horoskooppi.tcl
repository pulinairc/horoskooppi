# horoskooppi.tcl - Fetches Finnish horoschope from Iltalehti.
# by Roni "rolle" Laukkarinen
# rolle @ irc.quakenet.org, rolle_ @ IRCnet

# Updated when:
set versijonummero "0.2.20171103"
#------------------------------------------------------------------------------------
# Elä herran tähen mäne koskemaan tai taivas putoaa niskaas!
# Paskaa koodia vuodesta 1988.

package require Tcl 8.5
package require http 2.1
package require tdom

bind pub - !horo pub:horo
bind pub - !horoskooppi pub:horo

proc pub:horo { nick uhost hand chan text } { 

    set horoskooppiurl "http://www.iltalehti.fi/horoskooppi/index.shtml" 
    set horosivuhtml [::http::data [::http::geturl $horoskooppiurl]]
    set horohtmlsrc [dom parse -html $horosivuhtml]
    set horohtml [$horohtmlsrc documentElement]

    if {[string trim $text] ne ""} {

        if {[string trim $text] eq "oinas"} { 

            set oinashaku [$horohtml selectNodes {//*[@id="container_keski"]/div/div[3]/p[2]}]
            set oinas [$oinashaku asText]
            putserv "PRIVMSG $chan :$oinas"

        }

        if {[string trim $text] eq "härkä"} { 

            set harkahaku [$horohtml selectNodes {//*[@id="container_keski"]/div/div[3]/p[3]}]
            set harka [$harkahaku asText]
            putserv "PRIVMSG $chan :$harka"

        }

        if {[string trim $text] eq "kaksoset"} { 

            set kaksosethaku [$horohtml selectNodes {//*[@id="container_keski"]/div/div[3]/p[4]}]
            set kaksoset [$kaksosethaku asText]
            putserv "PRIVMSG $chan :$kaksoset"

        }

        if {[string trim $text] eq "rapu"} { 

            set rapuhaku [$horohtml selectNodes {//*[@id="container_keski"]/div/div[3]/p[5]}]
            set rapu [$rapuhaku asText]
            putserv "PRIVMSG $chan :$rapu"

        }

        if {[string trim $text] eq "leijona"} { 

            set leijonahaku [$horohtml selectNodes {//*[@id="container_keski"]/div/div[3]/p[6]}]
            set leijona [$leijonahaku asText]
            putserv "PRIVMSG $chan :$leijona"

        }

        if {[string trim $text] eq "neitsyt"} { 

            set neitsythaku [$horohtml selectNodes {//*[@id="container_keski"]/div/div[3]/p[7]}]
            set neitsyt [$neitsythaku asText]
            putserv "PRIVMSG $chan :$neitsyt"

        }  

        if {[string trim $text] eq "vaaka"} { 

            set vaakahaku [$horohtml selectNodes {//*[@id="container_keski"]/div/div[3]/p[8]}]
            set vaaka [$vaakahaku asText]
            putserv "PRIVMSG $chan :$vaaka"

        }        

        if {[string trim $text] eq "skorpioni"} { 

            set skorpionihaku [$horohtml selectNodes {//*[@id="container_keski"]/div/div[3]/p[9]}]
            set skorpioni [$skorpionihaku asText]
            putserv "PRIVMSG $chan :$skorpioni"

        }     

        if {[string trim $text] eq "jousimies"} { 

            set jousimieshaku [$horohtml selectNodes {//*[@id="container_keski"]/div/div[3]/p[10]}]
            set jousimies [$jousimieshaku asText]
            putserv "PRIVMSG $chan :$jousimies"

        }              

        if {[string trim $text] eq "kauris"} { 

            set kaurishaku [$horohtml selectNodes {//*[@id="container_keski"]/div/div[3]/p[11]}]
            set kauris [$kaurishaku asText]
            putserv "PRIVMSG $chan :$kauris"

        }           

        if {[string trim $text] eq "vesimies"} { 

            set vesimieshaku [$horohtml selectNodes {//*[@id="container_keski"]/div/div[3]/p[12]}]
            set vesimies [$vesimieshaku asText]
            putserv "PRIVMSG $chan :$vesimies"

        }          

        if {[string trim $text] eq "kalat"} { 

            set kalathaku [$horohtml selectNodes {//*[@id="container_keski"]/div/div[3]/p[13]}]
            set kalat [$kalathaku asText]
            putserv "PRIVMSG $chan :$kalat"

        }

    } else {
        
        global horoskooppiurl
        putserv "PRIVMSG $chan :\002!horo\002 horoskoopinnimi (vaihtoehdot: oinas (21.3.-19.4.), härkä (20.4.-20.5.), kaksoset (21.5.-20.6.), rapu (21.6.-22.7.), leijona (23.7.-22.8.), neitsyt (23.8.-22.9.), vaaka (23.9.-23.10.), skorpioni (24.10.-22.11.), jousimies (23.11.-21.1.), kauris (22.12.-19.1.), vesimies (20.1.-19.2.), kalat (20.2.-20.3.))"
    
    }
}

# Kukkuluuruu.
putlog "Rolle's horoskooppi.tcl (version $versijonummero) LOADED!"