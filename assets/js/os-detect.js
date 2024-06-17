var nVer = navigator.appVersion;
var nAgt = navigator.userAgent;
var browserName  = navigator.appName;
var nameOffset,verOffset,ix;
var OSName="Unknown OS";

if ((verOffset=nAgt.indexOf("OPR"))!=-1) {
  browserName = "Opera";
} else if ((verOffset=nAgt.indexOf("Edg"))!=-1) {
  browserName = "Microsoft Edge";
} else if ((verOffset=nAgt.indexOf("MSIE"))!=-1) {
  browserName = "Microsoft Internet Explorer";
} else if ((verOffset=nAgt.indexOf("Chrome"))!=-1) {
  browserName = "Chrome";
} else if ((verOffset=nAgt.indexOf("Safari"))!=-1) {
  browserName = "Safari";
} else if ((verOffset=nAgt.indexOf("Firefox"))!=-1) {
  browserName = "Firefox";
} else if ( (nameOffset=nAgt.lastIndexOf(' ')+1) < (verOffset=nAgt.lastIndexOf('/'))) {
  browserName = nAgt.substring(nameOffset,verOffset);
  if (browserName.toLowerCase()==browserName.toUpperCase()) {
    browserName = navigator.appName;
  }
}

if (navigator.appVersion.indexOf("Win")!=-1) OSName="Windows";
if (navigator.appVersion.indexOf("Mac")!=-1) OSName="MacOS";
if (navigator.appVersion.indexOf("X11")!=-1) OSName="UNIX";
if (navigator.appVersion.indexOf("Linux")!=-1) OSName="Linux";

function getBrowserName() {
  return browserName;
}

function getOSName() {
  return OSName;
}