<?php
#########################################################
#                            #
#    GiveMeEnergy Projects                #
#    Engine by []==ThoR®                        #
#    Contact:                    #
#    kender@fastwebnet.it                #
#                            #
#########################################################

class estimatedDownloadTime    {

    function downloadTime($Kb,$speed=56)    {
        $speed    = $speed;
        $Kb        = $Kb;
        $txt    = "";
        $time    = ceil($Kb / $speed);
        //    human readable format
        $hours    = (int)floor($time/3600);
        $minutes  = (int)floor($time/60)%60;
        $seconds  = (int)$time%60;

        if ($hours <= 0)    {
            $txt    = "";
        } else {
             $txt    = ($hours == 1)    ? "".$hours." hour" : "".$hours." hours";
        }
        //$txt    .= ($hours > 0 && $minutes > 0 && $seconds > 0)    ? ", " : " and " ;
        $txt    .= ($hours > 0 && $minutes > 0 && $seconds > 0)    ? ", " : "  ";

        $s        = ($minutes > 1)  ? "s" : NULL;
        $txt    .= ($minutes > 0) ? "".$minutes." minute".$s."" : "";  

        $s        = ($seconds > 1) ? "s" : NULL;
        $txt    .= ($txt>0 && $seconds>0) ? " and " : "";

        if ($seconds > 0)    {
            $txt    .= "".$seconds." second".$s."";  
        } elseif(!$txt and $seconds==0)    {
            $txt    = "0 seconds";
        }
        return $txt;
    }

    function conversions( $bytes, $to=NULL )    {
        switch($to)    {
            case 'Kb' :                        //    Kilobit
                $bytes = ($bytes * 8) / 1024;
            break;
            case 'b' :                        //    bit
                $bytes    = $bytes * 8;
            break;
            case 'GB' :                        //    Gigabyte
                $bytes    = $bytes / 1024;
            case 'MB' :                        //    Megabyte
                $bytes    = $bytes / 1024;
            case 'KB' :                        //    Kilobyte
                $bytes    = $bytes / 1024;
            default :                        //    byte
            case "B":                        //    byte
        }
        //unset($bytes,$to);
        return $bytes;
    }

    function getfileSize($path)    {
        if( @file_exists($path) )    {
            $contents    = filesize($path);
            //unset($contents);
        } else {
            trigger_error("File doesn't exist: ".$path."", E_USER_ERROR);
        }
        return $contents;
    }

}        ##    =>    End Class
?> 