<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MOBOMOBO ERROR</title>

<style>


.main {
  background: #fff;
  height: 74vh;
  overflow: hidden;
  display: flex;
  font-family: "Anton", sans-serif;
  justify-content: center;
  align-items: center;
  perspective: 500px;
}

div {
  transform-style: preserve-3d;
}

.sea {
  position: absolute;
  left: -300px;
  top: -300px;
}
.sea .surface {
  position: absolute;
  height: 550px;
  width: 600px;
  background: #2BE3FA;
  overflow: hidden;
  -webkit-animation: surface 13000ms ease-in-out infinite alternate, rotateZ 20000ms linear infinite;
          animation: surface 13000ms ease-in-out infinite alternate, rotateZ 20000ms linear infinite;
}
.sea .surface .inner {
  width: 600px;
  height: 600px;
  animation: rotateZ 20000ms linear infinite reverse;
}

.ship {
  position: absolute;
  top: -15px;
  left: -50px;
  filter: drop-shadow(-30px 40px 0 rgba(0, 0, 0, 0.1));
}
.ship .rotate {
  transform: rotateZ(10deg);
  -webkit-animation: ship 30000ms linear infinite alternate;
          animation: ship 30000ms linear infinite alternate;
}
.ship .human {
  position: absolute;
  top: 0;
  left: 40px;
}
.ship .human .hat {
  position: absolute;
  width: 30px;
  height: 30px;
  background: #F0F09E;
  border-radius: 100%;
  -webkit-animation: hat 1000ms ease-in-out infinite alternate;
          animation: hat 1000ms ease-in-out infinite alternate;
}
.ship .human .hat::before {
  content: "";
  position: absolute;
  top: 7px;
  left: 7px;
  width: 16px;
  height: 16px;
  border: 1px solid #D9845D;
  border-radius: 100%;
  box-sizing: border-box;
  transform: translateZ(5px);
  transform-style: preserve-3d;
}
.ship .human .leg {
  position: absolute;
  width: 20px;
  height: 8px;
  background: #0849A3;
  border-radius: 40%;
}
.ship .human .leg::before {
  content: "";
  position: absolute;
  left: -4px;
  width: 5px;
  height: 7px;
  background: #fff;
  border-radius: 40%;
}
.ship .human .leg.-left {
  top: 16px;
  left: -10px;
  transform: rotateZ(-5deg);
}
.ship .human .leg.-left::before {
  top: 1px;
}
.ship .human .leg.-right {
  top: 6px;
  left: -10px;
  transform: rotateZ(5deg);
}
.ship .human .leg.-right::before {
  top: -1px;
}
.ship .body {
  position: relative;
}
.ship .body .base {
  width: 100px;
  height: 30px;
  background: #D9845D;
  border-radius: 45% 45% 45% 45%;
}
.ship .body .base::before {
  content: "";
  position: absolute;
  top: 2px;
  left: 2px;
  width: 96px;
  height: 26px;
  background: #DEAD5E;
  border-radius: 100%;
  border-radius: 45% 45% 45% 45%;
}
.ship .body .board {
  position: absolute;
  top: 5px;
  width: 10px;
  height: 20px;
  background: #D9845D;
  border-radius: 2px;
}
.ship .body .board.-front {
  right: 20px;
}
.ship .body .board.-back {
  left: 20px;
}
.ship .body .waves {
  position: absolute;
}
.ship .body .waves .wave {
  position: absolute;
  -webkit-animation: wave 2000ms linear infinite;
          animation: wave 2000ms linear infinite;
}
.ship .body .waves .wave .graphic {
  background: #fff;
  -webkit-animation: surface 2000ms ease-in-out infinite alternate, rotateZ 6000ms linear infinite;
          animation: surface 2000ms ease-in-out infinite alternate, rotateZ 6000ms linear infinite;
}
.ship .body .waves .bodywaves .wave:nth-child(1) {
  top: -2px;
  left: 52px;
  -webkit-animation-delay: -3799ms;
          animation-delay: -3799ms;
}
.ship .body .waves .bodywaves .wave:nth-child(1) .graphic {
  width: 10px;
  height: 18px;
}
.ship .body .waves .bodywaves .wave:nth-child(2) {
  top: 16px;
  left: 45px;
  -webkit-animation-delay: -2381ms;
          animation-delay: -2381ms;
}
.ship .body .waves .bodywaves .wave:nth-child(2) .graphic {
  width: 16px;
  height: 11px;
}
.ship .body .waves .bodywaves .wave:nth-child(3) {
  top: 2px;
  left: 45px;
  -webkit-animation-delay: -1834ms;
          animation-delay: -1834ms;
}
.ship .body .waves .bodywaves .wave:nth-child(3) .graphic {
  width: 12px;
  height: 10px;
}
.ship .body .waves .bodywaves .wave:nth-child(4) {
  top: -1px;
  left: 41px;
  -webkit-animation-delay: -3770ms;
          animation-delay: -3770ms;
}
.ship .body .waves .bodywaves .wave:nth-child(4) .graphic {
  width: 17px;
  height: 10px;
}
.ship .body .waves .bodywaves .wave:nth-child(5) {
  top: 3px;
  left: 28px;
  -webkit-animation-delay: -2363ms;
          animation-delay: -2363ms;
}
.ship .body .waves .bodywaves .wave:nth-child(5) .graphic {
  width: 13px;
  height: 12px;
}
.ship .body .waves .bodywaves .wave:nth-child(6) {
  top: 8px;
  left: 46px;
  -webkit-animation-delay: -574ms;
          animation-delay: -574ms;
}
.ship .body .waves .bodywaves .wave:nth-child(6) .graphic {
  width: 17px;
  height: 11px;
}
.ship .body .waves .bodywaves .wave:nth-child(7) {
  top: 10px;
  left: 44px;
  -webkit-animation-delay: -3645ms;
          animation-delay: -3645ms;
}
.ship .body .waves .bodywaves .wave:nth-child(7) .graphic {
  width: 15px;
  height: 16px;
}
.ship .body .waves .bodywaves .wave:nth-child(8) {
  top: 6px;
  left: 25px;
  -webkit-animation-delay: -3472ms;
          animation-delay: -3472ms;
}
.ship .body .waves .bodywaves .wave:nth-child(8) .graphic {
  width: 18px;
  height: 15px;
}
.ship .body .waves .bodywaves .wave:nth-child(9) {
  top: 10px;
  left: 18px;
  -webkit-animation-delay: -2256ms;
          animation-delay: -2256ms;
}
.ship .body .waves .bodywaves .wave:nth-child(9) .graphic {
  width: 9px;
  height: 18px;
}
.ship .body .waves .bodywaves .wave:nth-child(10) {
  top: 6px;
  left: 40px;
  -webkit-animation-delay: -3756ms;
          animation-delay: -3756ms;
}
.ship .body .waves .bodywaves .wave:nth-child(10) .graphic {
  width: 12px;
  height: 15px;
}
.ship .body .waves .bodywaves .wave:nth-child(11) {
  top: -1px;
  left: 33px;
  -webkit-animation-delay: -2834ms;
          animation-delay: -2834ms;
}
.ship .body .waves .bodywaves .wave:nth-child(11) .graphic {
  width: 16px;
  height: 9px;
}
.ship .body .waves .bodywaves .wave:nth-child(12) {
  top: 8px;
  left: 17px;
  -webkit-animation-delay: -706ms;
          animation-delay: -706ms;
}
.ship .body .waves .bodywaves .wave:nth-child(12) .graphic {
  width: 16px;
  height: 15px;
}
.ship .body .waves .bodywaves .wave:nth-child(13) {
  top: 6px;
  left: 14px;
  -webkit-animation-delay: -3096ms;
          animation-delay: -3096ms;
}
.ship .body .waves .bodywaves .wave:nth-child(13) .graphic {
  width: 14px;
  height: 11px;
}
.ship .body .waves .bodywaves .wave:nth-child(14) {
  top: 4px;
  left: 25px;
  -webkit-animation-delay: -3697ms;
          animation-delay: -3697ms;
}
.ship .body .waves .bodywaves .wave:nth-child(14) .graphic {
  width: 12px;
  height: 11px;
}
.ship .body .waves .bodywaves .wave:nth-child(15) {
  top: 13px;
  left: 55px;
  -webkit-animation-delay: -673ms;
          animation-delay: -673ms;
}
.ship .body .waves .bodywaves .wave:nth-child(15) .graphic {
  width: 9px;
  height: 11px;
}
.ship .body .waves .bodywaves .wave:nth-child(16) {
  top: 5px;
  left: 57px;
  -webkit-animation-delay: -3881ms;
          animation-delay: -3881ms;
}
.ship .body .waves .bodywaves .wave:nth-child(16) .graphic {
  width: 17px;
  height: 17px;
}
.ship .body .waves .bodywaves .wave:nth-child(17) {
  top: 2px;
  left: 27px;
  -webkit-animation-delay: -3964ms;
          animation-delay: -3964ms;
}
.ship .body .waves .bodywaves .wave:nth-child(17) .graphic {
  width: 15px;
  height: 14px;
}
.ship .body .waves .bodywaves .wave:nth-child(18) {
  top: 16px;
  left: 36px;
  -webkit-animation-delay: -220ms;
          animation-delay: -220ms;
}
.ship .body .waves .bodywaves .wave:nth-child(18) .graphic {
  width: 10px;
  height: 16px;
}
.ship .body .waves .bodywaves .wave:nth-child(19) {
  top: 2px;
  left: 37px;
  -webkit-animation-delay: -3458ms;
          animation-delay: -3458ms;
}
.ship .body .waves .bodywaves .wave:nth-child(19) .graphic {
  width: 13px;
  height: 16px;
}
.ship .body .waves .bodywaves .wave:nth-child(20) {
  top: 1px;
  left: 55px;
  -webkit-animation-delay: -1595ms;
          animation-delay: -1595ms;
}
.ship .body .waves .bodywaves .wave:nth-child(20) .graphic {
  width: 15px;
  height: 18px;
}
.ship .body .waves .bodywaves .wave:nth-child(21) {
  top: 13px;
  left: 43px;
  -webkit-animation-delay: -3324ms;
          animation-delay: -3324ms;
}
.ship .body .waves .bodywaves .wave:nth-child(21) .graphic {
  width: 17px;
  height: 10px;
}
.ship .body .waves .bodywaves .wave:nth-child(22) {
  top: 10px;
  left: 60px;
  -webkit-animation-delay: -2500ms;
          animation-delay: -2500ms;
}
.ship .body .waves .bodywaves .wave:nth-child(22) .graphic {
  width: 14px;
  height: 15px;
}
.ship .body .waves .bodywaves .wave:nth-child(23) {
  top: 2px;
  left: 56px;
  -webkit-animation-delay: -1032ms;
          animation-delay: -1032ms;
}
.ship .body .waves .bodywaves .wave:nth-child(23) .graphic {
  width: 16px;
  height: 10px;
}
.ship .body .waves .bodywaves .wave:nth-child(24) {
  top: 14px;
  left: 53px;
  -webkit-animation-delay: -2320ms;
          animation-delay: -2320ms;
}
.ship .body .waves .bodywaves .wave:nth-child(24) .graphic {
  width: 18px;
  height: 11px;
}
.ship .body .waves .bodywaves .wave:nth-child(25) {
  top: 15px;
  left: 45px;
  -webkit-animation-delay: -3563ms;
          animation-delay: -3563ms;
}
.ship .body .waves .bodywaves .wave:nth-child(25) .graphic {
  width: 13px;
  height: 18px;
}
.ship .body .waves .bodywaves .wave:nth-child(26) {
  top: 9px;
  left: 54px;
  -webkit-animation-delay: -409ms;
          animation-delay: -409ms;
}
.ship .body .waves .bodywaves .wave:nth-child(26) .graphic {
  width: 18px;
  height: 10px;
}
.ship .body .waves .bodywaves .wave:nth-child(27) {
  top: 14px;
  left: 25px;
  -webkit-animation-delay: -3091ms;
          animation-delay: -3091ms;
}
.ship .body .waves .bodywaves .wave:nth-child(27) .graphic {
  width: 15px;
  height: 15px;
}
.ship .body .waves .bodywaves .wave:nth-child(28) {
  top: -2px;
  left: 23px;
  -webkit-animation-delay: -2010ms;
          animation-delay: -2010ms;
}
.ship .body .waves .bodywaves .wave:nth-child(28) .graphic {
  width: 15px;
  height: 18px;
}
.ship .body .waves .bodywaves .wave:nth-child(29) {
  top: 17px;
  left: 54px;
  -webkit-animation-delay: -2253ms;
          animation-delay: -2253ms;
}
.ship .body .waves .bodywaves .wave:nth-child(29) .graphic {
  width: 9px;
  height: 18px;
}
.ship .body .waves .bodywaves .wave:nth-child(30) {
  top: 4px;
  left: 13px;
  -webkit-animation-delay: -3617ms;
          animation-delay: -3617ms;
}
.ship .body .waves .bodywaves .wave:nth-child(30) .graphic {
  width: 13px;
  height: 10px;
}
.ship .body .waves .bodywaves .wave:nth-child(31) {
  top: -1px;
  left: 31px;
  -webkit-animation-delay: -1730ms;
          animation-delay: -1730ms;
}
.ship .body .waves .bodywaves .wave:nth-child(31) .graphic {
  width: 14px;
  height: 13px;
}
.ship .body .waves .bodywaves .wave:nth-child(32) {
  top: 4px;
  left: 54px;
  -webkit-animation-delay: -132ms;
          animation-delay: -132ms;
}
.ship .body .waves .bodywaves .wave:nth-child(32) .graphic {
  width: 12px;
  height: 12px;
}
.ship .body .waves .bodywaves .wave:nth-child(33) {
  top: 3px;
  left: 23px;
  -webkit-animation-delay: -1921ms;
          animation-delay: -1921ms;
}
.ship .body .waves .bodywaves .wave:nth-child(33) .graphic {
  width: 15px;
  height: 15px;
}
.ship .body .waves .bodywaves .wave:nth-child(34) {
  top: -1px;
  left: 35px;
  -webkit-animation-delay: -3908ms;
          animation-delay: -3908ms;
}
.ship .body .waves .bodywaves .wave:nth-child(34) .graphic {
  width: 12px;
  height: 12px;
}
.ship .body .waves .bodywaves .wave:nth-child(35) {
  top: 11px;
  left: 55px;
  -webkit-animation-delay: -2352ms;
          animation-delay: -2352ms;
}
.ship .body .waves .bodywaves .wave:nth-child(35) .graphic {
  width: 12px;
  height: 9px;
}
.ship .body .waves .bodywaves .wave:nth-child(36) {
  top: -1px;
  left: 48px;
  -webkit-animation-delay: -2746ms;
          animation-delay: -2746ms;
}
.ship .body .waves .bodywaves .wave:nth-child(36) .graphic {
  width: 10px;
  height: 10px;
}
.ship .body .waves .bodywaves .wave:nth-child(37) {
  top: 17px;
  left: 12px;
  -webkit-animation-delay: -2176ms;
          animation-delay: -2176ms;
}
.ship .body .waves .bodywaves .wave:nth-child(37) .graphic {
  width: 16px;
  height: 12px;
}
.ship .body .waves .bodywaves .wave:nth-child(38) {
  top: 12px;
  left: 22px;
  -webkit-animation-delay: -2435ms;
          animation-delay: -2435ms;
}
.ship .body .waves .bodywaves .wave:nth-child(38) .graphic {
  width: 11px;
  height: 18px;
}
.ship .body .waves .bodywaves .wave:nth-child(39) {
  top: 17px;
  left: 31px;
  -webkit-animation-delay: -2961ms;
          animation-delay: -2961ms;
}
.ship .body .waves .bodywaves .wave:nth-child(39) .graphic {
  width: 14px;
  height: 10px;
}
.ship .body .waves .bodywaves .wave:nth-child(40) {
  top: 1px;
  left: 30px;
  -webkit-animation-delay: -3685ms;
          animation-delay: -3685ms;
}
.ship .body .waves .bodywaves .wave:nth-child(40) .graphic {
  width: 18px;
  height: 15px;
}
.ship .body .waves .bodywaves .wave:nth-child(41) {
  top: 11px;
  left: 35px;
  -webkit-animation-delay: -2987ms;
          animation-delay: -2987ms;
}
.ship .body .waves .bodywaves .wave:nth-child(41) .graphic {
  width: 10px;
  height: 13px;
}
.ship .body .waves .bodywaves .wave:nth-child(42) {
  top: 13px;
  left: 56px;
  -webkit-animation-delay: -250ms;
          animation-delay: -250ms;
}
.ship .body .waves .bodywaves .wave:nth-child(42) .graphic {
  width: 12px;
  height: 15px;
}
.ship .body .waves .bodywaves .wave:nth-child(43) {
  top: 3px;
  left: 29px;
  -webkit-animation-delay: -2535ms;
          animation-delay: -2535ms;
}
.ship .body .waves .bodywaves .wave:nth-child(43) .graphic {
  width: 9px;
  height: 12px;
}
.ship .body .waves .bodywaves .wave:nth-child(44) {
  top: 1px;
  left: 24px;
  -webkit-animation-delay: -2093ms;
          animation-delay: -2093ms;
}
.ship .body .waves .bodywaves .wave:nth-child(44) .graphic {
  width: 18px;
  height: 15px;
}
.ship .body .waves .bodywaves .wave:nth-child(45) {
  top: -1px;
  left: 17px;
  -webkit-animation-delay: -2579ms;
          animation-delay: -2579ms;
}
.ship .body .waves .bodywaves .wave:nth-child(45) .graphic {
  width: 9px;
  height: 18px;
}
.ship .body .waves .bodywaves .wave:nth-child(46) {
  top: 16px;
  left: 32px;
  -webkit-animation-delay: -2174ms;
          animation-delay: -2174ms;
}
.ship .body .waves .bodywaves .wave:nth-child(46) .graphic {
  width: 9px;
  height: 16px;
}
.ship .body .waves .bodywaves .wave:nth-child(47) {
  top: 0px;
  left: 44px;
  -webkit-animation-delay: -3956ms;
          animation-delay: -3956ms;
}
.ship .body .waves .bodywaves .wave:nth-child(47) .graphic {
  width: 10px;
  height: 9px;
}
.ship .body .waves .bodywaves .wave:nth-child(48) {
  top: 11px;
  left: 43px;
  -webkit-animation-delay: -729ms;
          animation-delay: -729ms;
}
.ship .body .waves .bodywaves .wave:nth-child(48) .graphic {
  width: 13px;
  height: 9px;
}
.ship .body .waves .bodywaves .wave:nth-child(49) {
  top: 5px;
  left: 52px;
  -webkit-animation-delay: -2279ms;
          animation-delay: -2279ms;
}
.ship .body .waves .bodywaves .wave:nth-child(49) .graphic {
  width: 13px;
  height: 11px;
}
.ship .body .waves .bodywaves .wave:nth-child(50) {
  top: 2px;
  left: 17px;
  -webkit-animation-delay: -2305ms;
          animation-delay: -2305ms;
}
.ship .body .waves .bodywaves .wave:nth-child(50) .graphic {
  width: 14px;
  height: 16px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(1) {
  top: -20px;
  left: 48px;
  -webkit-animation-delay: -1043ms;
          animation-delay: -1043ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(1) .graphic {
  width: 6px;
  height: 10px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(2) {
  top: -12px;
  left: 44px;
  -webkit-animation-delay: -1395ms;
          animation-delay: -1395ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(2) .graphic {
  width: 8px;
  height: 10px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(3) {
  top: -24px;
  left: 50px;
  -webkit-animation-delay: -1359ms;
          animation-delay: -1359ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(3) .graphic {
  width: 7px;
  height: 7px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(4) {
  top: -14px;
  left: 43px;
  -webkit-animation-delay: -1263ms;
          animation-delay: -1263ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(4) .graphic {
  width: 8px;
  height: 9px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(5) {
  top: -23px;
  left: 46px;
  -webkit-animation-delay: -1775ms;
          animation-delay: -1775ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(5) .graphic {
  width: 9px;
  height: 8px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(6) {
  top: -17px;
  left: 44px;
  -webkit-animation-delay: -1111ms;
          animation-delay: -1111ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(6) .graphic {
  width: 7px;
  height: 6px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(7) {
  top: -28px;
  left: 43px;
  -webkit-animation-delay: -1448ms;
          animation-delay: -1448ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(7) .graphic {
  width: 10px;
  height: 7px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(8) {
  top: -11px;
  left: 45px;
  -webkit-animation-delay: -1430ms;
          animation-delay: -1430ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(8) .graphic {
  width: 7px;
  height: 10px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(9) {
  top: -15px;
  left: 43px;
  -webkit-animation-delay: -1053ms;
          animation-delay: -1053ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(9) .graphic {
  width: 8px;
  height: 7px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(10) {
  top: -26px;
  left: 46px;
  -webkit-animation-delay: -1786ms;
          animation-delay: -1786ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(10) .graphic {
  width: 6px;
  height: 8px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(11) {
  top: -21px;
  left: 50px;
  -webkit-animation-delay: -1492ms;
          animation-delay: -1492ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(11) .graphic {
  width: 7px;
  height: 10px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(12) {
  top: -19px;
  left: 48px;
  -webkit-animation-delay: -1409ms;
          animation-delay: -1409ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(12) .graphic {
  width: 8px;
  height: 8px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(13) {
  top: -16px;
  left: 50px;
  -webkit-animation-delay: -1400ms;
          animation-delay: -1400ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(13) .graphic {
  width: 9px;
  height: 8px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(14) {
  top: -25px;
  left: 46px;
  -webkit-animation-delay: -1021ms;
          animation-delay: -1021ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(14) .graphic {
  width: 6px;
  height: 8px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(15) {
  top: -11px;
  left: 43px;
  -webkit-animation-delay: -1505ms;
          animation-delay: -1505ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(15) .graphic {
  width: 9px;
  height: 9px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(16) {
  top: -20px;
  left: 49px;
  -webkit-animation-delay: -1143ms;
          animation-delay: -1143ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(16) .graphic {
  width: 9px;
  height: 8px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(17) {
  top: -10px;
  left: 41px;
  -webkit-animation-delay: -1745ms;
          animation-delay: -1745ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(17) .graphic {
  width: 6px;
  height: 7px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(18) {
  top: -13px;
  left: 42px;
  -webkit-animation-delay: -1670ms;
          animation-delay: -1670ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(18) .graphic {
  width: 10px;
  height: 8px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(19) {
  top: -13px;
  left: 50px;
  -webkit-animation-delay: -1711ms;
          animation-delay: -1711ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(19) .graphic {
  width: 6px;
  height: 9px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(20) {
  top: -15px;
  left: 42px;
  -webkit-animation-delay: -1585ms;
          animation-delay: -1585ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(20) .graphic {
  width: 6px;
  height: 10px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(21) {
  top: -11px;
  left: 47px;
  -webkit-animation-delay: -1327ms;
          animation-delay: -1327ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(21) .graphic {
  width: 10px;
  height: 6px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(22) {
  top: -26px;
  left: 48px;
  -webkit-animation-delay: -1051ms;
          animation-delay: -1051ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(22) .graphic {
  width: 7px;
  height: 6px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(23) {
  top: -28px;
  left: 44px;
  -webkit-animation-delay: -1129ms;
          animation-delay: -1129ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(23) .graphic {
  width: 8px;
  height: 8px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(24) {
  top: -29px;
  left: 46px;
  -webkit-animation-delay: -1791ms;
          animation-delay: -1791ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(24) .graphic {
  width: 10px;
  height: 10px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(25) {
  top: -21px;
  left: 45px;
  -webkit-animation-delay: -1126ms;
          animation-delay: -1126ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(25) .graphic {
  width: 9px;
  height: 10px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(26) {
  top: -22px;
  left: 49px;
  -webkit-animation-delay: -1619ms;
          animation-delay: -1619ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(26) .graphic {
  width: 8px;
  height: 8px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(27) {
  top: -16px;
  left: 45px;
  -webkit-animation-delay: -1709ms;
          animation-delay: -1709ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(27) .graphic {
  width: 8px;
  height: 8px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(28) {
  top: -29px;
  left: 45px;
  -webkit-animation-delay: -1613ms;
          animation-delay: -1613ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(28) .graphic {
  width: 7px;
  height: 8px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(29) {
  top: -12px;
  left: 46px;
  -webkit-animation-delay: -1674ms;
          animation-delay: -1674ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(29) .graphic {
  width: 9px;
  height: 10px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(30) {
  top: -24px;
  left: 46px;
  -webkit-animation-delay: -1544ms;
          animation-delay: -1544ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(30) .graphic {
  width: 9px;
  height: 6px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(31) {
  top: -25px;
  left: 49px;
  -webkit-animation-delay: -1654ms;
          animation-delay: -1654ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(31) .graphic {
  width: 7px;
  height: 10px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(32) {
  top: -26px;
  left: 42px;
  -webkit-animation-delay: -1270ms;
          animation-delay: -1270ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(32) .graphic {
  width: 6px;
  height: 9px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(33) {
  top: -12px;
  left: 47px;
  -webkit-animation-delay: -1751ms;
          animation-delay: -1751ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(33) .graphic {
  width: 6px;
  height: 7px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(34) {
  top: -19px;
  left: 41px;
  -webkit-animation-delay: -1769ms;
          animation-delay: -1769ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(34) .graphic {
  width: 6px;
  height: 10px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(35) {
  top: -17px;
  left: 47px;
  -webkit-animation-delay: -1616ms;
          animation-delay: -1616ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(35) .graphic {
  width: 6px;
  height: 8px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(36) {
  top: -16px;
  left: 48px;
  -webkit-animation-delay: -1054ms;
          animation-delay: -1054ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(36) .graphic {
  width: 6px;
  height: 9px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(37) {
  top: -20px;
  left: 47px;
  -webkit-animation-delay: -1767ms;
          animation-delay: -1767ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(37) .graphic {
  width: 9px;
  height: 7px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(38) {
  top: -18px;
  left: 43px;
  -webkit-animation-delay: -1142ms;
          animation-delay: -1142ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(38) .graphic {
  width: 6px;
  height: 6px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(39) {
  top: -19px;
  left: 46px;
  -webkit-animation-delay: -1717ms;
          animation-delay: -1717ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(39) .graphic {
  width: 7px;
  height: 6px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(40) {
  top: -13px;
  left: 43px;
  -webkit-animation-delay: -1103ms;
          animation-delay: -1103ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(40) .graphic {
  width: 9px;
  height: 7px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(41) {
  top: -18px;
  left: 50px;
  -webkit-animation-delay: -1052ms;
          animation-delay: -1052ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(41) .graphic {
  width: 7px;
  height: 9px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(42) {
  top: -20px;
  left: 41px;
  -webkit-animation-delay: -1491ms;
          animation-delay: -1491ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(42) .graphic {
  width: 8px;
  height: 10px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(43) {
  top: -20px;
  left: 48px;
  -webkit-animation-delay: -1757ms;
          animation-delay: -1757ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(43) .graphic {
  width: 7px;
  height: 8px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(44) {
  top: -26px;
  left: 42px;
  -webkit-animation-delay: -1587ms;
          animation-delay: -1587ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(44) .graphic {
  width: 10px;
  height: 9px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(45) {
  top: -22px;
  left: 43px;
  -webkit-animation-delay: -1775ms;
          animation-delay: -1775ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(45) .graphic {
  width: 9px;
  height: 8px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(46) {
  top: -14px;
  left: 44px;
  -webkit-animation-delay: -1702ms;
          animation-delay: -1702ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(46) .graphic {
  width: 9px;
  height: 10px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(47) {
  top: -23px;
  left: 49px;
  -webkit-animation-delay: -1442ms;
          animation-delay: -1442ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(47) .graphic {
  width: 6px;
  height: 6px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(48) {
  top: -12px;
  left: 44px;
  -webkit-animation-delay: -1762ms;
          animation-delay: -1762ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(48) .graphic {
  width: 7px;
  height: 8px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(49) {
  top: -26px;
  left: 43px;
  -webkit-animation-delay: -1346ms;
          animation-delay: -1346ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(49) .graphic {
  width: 10px;
  height: 6px;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(50) {
  top: -12px;
  left: 50px;
  -webkit-animation-delay: -1773ms;
          animation-delay: -1773ms;
}
.ship .body .waves .oarwaves.-left .wave:nth-child(50) .graphic {
  width: 7px;
  height: 7px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(1) {
  top: 50px;
  left: 46px;
  -webkit-animation-delay: -1200ms;
          animation-delay: -1200ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(1) .graphic {
  width: 6px;
  height: 9px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(2) {
  top: 47px;
  left: 47px;
  -webkit-animation-delay: -1184ms;
          animation-delay: -1184ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(2) .graphic {
  width: 7px;
  height: 7px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(3) {
  top: 36px;
  left: 45px;
  -webkit-animation-delay: -1656ms;
          animation-delay: -1656ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(3) .graphic {
  width: 8px;
  height: 7px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(4) {
  top: 36px;
  left: 46px;
  -webkit-animation-delay: -1492ms;
          animation-delay: -1492ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(4) .graphic {
  width: 9px;
  height: 9px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(5) {
  top: 42px;
  left: 49px;
  -webkit-animation-delay: -1332ms;
          animation-delay: -1332ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(5) .graphic {
  width: 8px;
  height: 8px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(6) {
  top: 37px;
  left: 44px;
  -webkit-animation-delay: -1608ms;
          animation-delay: -1608ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(6) .graphic {
  width: 6px;
  height: 8px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(7) {
  top: 39px;
  left: 46px;
  -webkit-animation-delay: -1231ms;
          animation-delay: -1231ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(7) .graphic {
  width: 6px;
  height: 8px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(8) {
  top: 55px;
  left: 47px;
  -webkit-animation-delay: -1080ms;
          animation-delay: -1080ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(8) .graphic {
  width: 7px;
  height: 9px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(9) {
  top: 43px;
  left: 46px;
  -webkit-animation-delay: -1145ms;
          animation-delay: -1145ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(9) .graphic {
  width: 7px;
  height: 10px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(10) {
  top: 53px;
  left: 43px;
  -webkit-animation-delay: -1272ms;
          animation-delay: -1272ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(10) .graphic {
  width: 7px;
  height: 7px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(11) {
  top: 39px;
  left: 49px;
  -webkit-animation-delay: -1800ms;
          animation-delay: -1800ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(11) .graphic {
  width: 8px;
  height: 6px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(12) {
  top: 38px;
  left: 47px;
  -webkit-animation-delay: -1533ms;
          animation-delay: -1533ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(12) .graphic {
  width: 6px;
  height: 10px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(13) {
  top: 37px;
  left: 46px;
  -webkit-animation-delay: -1210ms;
          animation-delay: -1210ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(13) .graphic {
  width: 10px;
  height: 6px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(14) {
  top: 38px;
  left: 48px;
  -webkit-animation-delay: -1334ms;
          animation-delay: -1334ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(14) .graphic {
  width: 9px;
  height: 6px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(15) {
  top: 52px;
  left: 50px;
  -webkit-animation-delay: -1362ms;
          animation-delay: -1362ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(15) .graphic {
  width: 7px;
  height: 7px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(16) {
  top: 43px;
  left: 50px;
  -webkit-animation-delay: -1478ms;
          animation-delay: -1478ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(16) .graphic {
  width: 8px;
  height: 10px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(17) {
  top: 50px;
  left: 47px;
  -webkit-animation-delay: -1052ms;
          animation-delay: -1052ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(17) .graphic {
  width: 10px;
  height: 8px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(18) {
  top: 47px;
  left: 50px;
  -webkit-animation-delay: -1445ms;
          animation-delay: -1445ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(18) .graphic {
  width: 7px;
  height: 6px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(19) {
  top: 44px;
  left: 48px;
  -webkit-animation-delay: -1383ms;
          animation-delay: -1383ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(19) .graphic {
  width: 6px;
  height: 6px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(20) {
  top: 48px;
  left: 47px;
  -webkit-animation-delay: -1401ms;
          animation-delay: -1401ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(20) .graphic {
  width: 7px;
  height: 7px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(21) {
  top: 49px;
  left: 50px;
  -webkit-animation-delay: -1516ms;
          animation-delay: -1516ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(21) .graphic {
  width: 10px;
  height: 8px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(22) {
  top: 40px;
  left: 44px;
  -webkit-animation-delay: -1204ms;
          animation-delay: -1204ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(22) .graphic {
  width: 6px;
  height: 7px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(23) {
  top: 40px;
  left: 47px;
  -webkit-animation-delay: -1223ms;
          animation-delay: -1223ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(23) .graphic {
  width: 6px;
  height: 6px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(24) {
  top: 41px;
  left: 41px;
  -webkit-animation-delay: -1275ms;
          animation-delay: -1275ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(24) .graphic {
  width: 7px;
  height: 10px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(25) {
  top: 39px;
  left: 44px;
  -webkit-animation-delay: -1030ms;
          animation-delay: -1030ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(25) .graphic {
  width: 6px;
  height: 10px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(26) {
  top: 51px;
  left: 49px;
  -webkit-animation-delay: -1717ms;
          animation-delay: -1717ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(26) .graphic {
  width: 9px;
  height: 10px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(27) {
  top: 39px;
  left: 41px;
  -webkit-animation-delay: -1533ms;
          animation-delay: -1533ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(27) .graphic {
  width: 8px;
  height: 8px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(28) {
  top: 42px;
  left: 46px;
  -webkit-animation-delay: -1634ms;
          animation-delay: -1634ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(28) .graphic {
  width: 7px;
  height: 6px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(29) {
  top: 36px;
  left: 49px;
  -webkit-animation-delay: -1386ms;
          animation-delay: -1386ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(29) .graphic {
  width: 9px;
  height: 9px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(30) {
  top: 45px;
  left: 45px;
  -webkit-animation-delay: -1708ms;
          animation-delay: -1708ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(30) .graphic {
  width: 8px;
  height: 10px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(31) {
  top: 43px;
  left: 49px;
  -webkit-animation-delay: -1767ms;
          animation-delay: -1767ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(31) .graphic {
  width: 7px;
  height: 8px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(32) {
  top: 42px;
  left: 46px;
  -webkit-animation-delay: -1664ms;
          animation-delay: -1664ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(32) .graphic {
  width: 9px;
  height: 6px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(33) {
  top: 49px;
  left: 50px;
  -webkit-animation-delay: -1170ms;
          animation-delay: -1170ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(33) .graphic {
  width: 8px;
  height: 8px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(34) {
  top: 50px;
  left: 47px;
  -webkit-animation-delay: -1653ms;
          animation-delay: -1653ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(34) .graphic {
  width: 6px;
  height: 8px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(35) {
  top: 55px;
  left: 50px;
  -webkit-animation-delay: -1478ms;
          animation-delay: -1478ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(35) .graphic {
  width: 10px;
  height: 10px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(36) {
  top: 50px;
  left: 46px;
  -webkit-animation-delay: -1084ms;
          animation-delay: -1084ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(36) .graphic {
  width: 7px;
  height: 8px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(37) {
  top: 40px;
  left: 50px;
  -webkit-animation-delay: -1059ms;
          animation-delay: -1059ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(37) .graphic {
  width: 8px;
  height: 6px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(38) {
  top: 46px;
  left: 41px;
  -webkit-animation-delay: -1032ms;
          animation-delay: -1032ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(38) .graphic {
  width: 9px;
  height: 9px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(39) {
  top: 48px;
  left: 44px;
  -webkit-animation-delay: -1344ms;
          animation-delay: -1344ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(39) .graphic {
  width: 8px;
  height: 8px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(40) {
  top: 51px;
  left: 47px;
  -webkit-animation-delay: -1316ms;
          animation-delay: -1316ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(40) .graphic {
  width: 7px;
  height: 10px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(41) {
  top: 37px;
  left: 44px;
  -webkit-animation-delay: -1210ms;
          animation-delay: -1210ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(41) .graphic {
  width: 7px;
  height: 10px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(42) {
  top: 51px;
  left: 44px;
  -webkit-animation-delay: -1303ms;
          animation-delay: -1303ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(42) .graphic {
  width: 9px;
  height: 9px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(43) {
  top: 52px;
  left: 45px;
  -webkit-animation-delay: -1510ms;
          animation-delay: -1510ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(43) .graphic {
  width: 6px;
  height: 10px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(44) {
  top: 51px;
  left: 43px;
  -webkit-animation-delay: -1076ms;
          animation-delay: -1076ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(44) .graphic {
  width: 7px;
  height: 6px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(45) {
  top: 54px;
  left: 50px;
  -webkit-animation-delay: -1110ms;
          animation-delay: -1110ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(45) .graphic {
  width: 9px;
  height: 6px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(46) {
  top: 37px;
  left: 45px;
  -webkit-animation-delay: -1277ms;
          animation-delay: -1277ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(46) .graphic {
  width: 10px;
  height: 10px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(47) {
  top: 52px;
  left: 49px;
  -webkit-animation-delay: -1096ms;
          animation-delay: -1096ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(47) .graphic {
  width: 9px;
  height: 6px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(48) {
  top: 48px;
  left: 41px;
  -webkit-animation-delay: -1634ms;
          animation-delay: -1634ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(48) .graphic {
  width: 7px;
  height: 7px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(49) {
  top: 47px;
  left: 50px;
  -webkit-animation-delay: -1428ms;
          animation-delay: -1428ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(49) .graphic {
  width: 10px;
  height: 6px;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(50) {
  top: 55px;
  left: 49px;
  -webkit-animation-delay: -1073ms;
          animation-delay: -1073ms;
}
.ship .body .waves .oarwaves.-right .wave:nth-child(50) .graphic {
  width: 6px;
  height: 6px;
}
.ship .oars {
  position: absolute;
  top: -30px;
  left: 50px;
  transform: translateZ(10px);
}
.ship .oars .graphic {
  position: relative;
  width: 3px;
  height: 40px;
  background: #D9845D;
  -webkit-animation: oarGraphic 1000ms ease-in-out infinite alternate;
          animation: oarGraphic 1000ms ease-in-out infinite alternate;
}
.ship .oars .graphic::before {
  content: "";
  position: absolute;
  top: 0;
  left: -3px;
  width: 9px;
  height: 15px;
  background: #D9845D;
  border-radius: 5px 5px 100% 100%;
}
.ship .oars .oar {
  position: absolute;
  top: 0;
  left: 50%;
}
.ship .oars .oar.-right {
  transform-origin: 50% 45px;
  transform: scaleY(-1);
}
.ship .oars .row {
  position: absolute;
  -webkit-animation: row 1000ms ease-in-out infinite alternate;
          animation: row 1000ms ease-in-out infinite alternate;
  transform-origin: 50% 35px;
}
.ship .oars .depth {
  -webkit-animation: depth 1000ms ease-in-out infinite alternate;
          animation: depth 1000ms ease-in-out infinite alternate;
  transform-origin: 50% 35px;
  -webkit-animation-delay: -500ms;
          animation-delay: -500ms;
}

@-webkit-keyframes surface {
  0% {
    border-radius: 30% 70% 70% 30%/30% 30% 70% 70%;
  }
  25% {
    border-radius: 65% 35% 51% 49%/49% 52% 48% 51%;
  }
  50% {
    border-radius: 42% 58% 28% 72%/65% 34% 66% 35%;
  }
  75% {
    border-radius: 34% 66% 63% 37%/77% 38% 62% 23%;
  }
  100% {
    border-radius: 24% 76% 72% 28%/53% 68% 32% 47%;
  }
}

@keyframes surface {
  0% {
    border-radius: 30% 70% 70% 30%/30% 30% 70% 70%;
  }
  25% {
    border-radius: 65% 35% 51% 49%/49% 52% 48% 51%;
  }
  50% {
    border-radius: 42% 58% 28% 72%/65% 34% 66% 35%;
  }
  75% {
    border-radius: 34% 66% 63% 37%/77% 38% 62% 23%;
  }
  100% {
    border-radius: 24% 76% 72% 28%/53% 68% 32% 47%;
  }
}
@-webkit-keyframes rotateZ {
  0% {
    transform: rotateZ(0deg);
  }
  100% {
    transform: rotateZ(360deg);
  }
}
@keyframes rotateZ {
  0% {
    transform: rotateZ(0deg);
  }
  100% {
    transform: rotateZ(360deg);
  }
}
@-webkit-keyframes ship {
  0% {
    transform: rotateZ(20deg);
  }
  100% {
    transform: rotateZ(-20deg);
  }
}
@keyframes ship {
  0% {
    transform: rotateZ(20deg);
  }
  100% {
    transform: rotateZ(-20deg);
  }
}
@-webkit-keyframes move {
  0% {
    transform: translateX(0);
  }
  100% {
    transform: translateX(5px);
  }
}
@keyframes move {
  0% {
    transform: translateX(0);
  }
  100% {
    transform: translateX(5px);
  }
}
@-webkit-keyframes wave {
  0% {
    transform: translateX(0) scale(0);
  }
  10% {
    transform: translateX(-10px) scale(1);
  }
  100% {
    transform: translateX(-130px) scale(0);
  }
}
@keyframes wave {
  0% {
    transform: translateX(0) scale(0);
  }
  10% {
    transform: translateX(-10px) scale(1);
  }
  100% {
    transform: translateX(-130px) scale(0);
  }
}
@-webkit-keyframes depth {
  0% {
    transform: rotateX(-20deg);
  }
  100% {
    transform: rotateX(50deg);
  }
}
@keyframes depth {
  0% {
    transform: rotateX(-20deg);
  }
  100% {
    transform: rotateX(50deg);
  }
}
@-webkit-keyframes row {
  0% {
    transform: rotateZ(20deg);
  }
  100% {
    transform: rotateZ(-50deg);
  }
}
@keyframes row {
  0% {
    transform: rotateZ(20deg);
  }
  100% {
    transform: rotateZ(-50deg);
  }
}
@-webkit-keyframes oarGraphic {
  0% {
    transform: rotateY(-60deg);
  }
  100% {
    transform: rotateY(-110deg);
  }
}
@keyframes oarGraphic {
  0% {
    transform: rotateY(-60deg);
  }
  100% {
    transform: rotateY(-110deg);
  }
}
@-webkit-keyframes hat {
  0% {
    transform: translateZ(30px) translateX(-5px) rotateY(-20deg);
  }
  100% {
    transform: translateZ(30px) translateX(0) rotateY(20deg);
  }
}
@keyframes hat {
  0% {
    transform: translateZ(30px) translateX(-5px) rotateY(-20deg);
  }
  100% {
    transform: translateZ(30px) translateX(0) rotateY(20deg);
  }
}

@font-face {
    font-family: 'MaruBuri-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/MaruBuri-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.header {
	text-align: center;
	margin: 50px;

}

.error {
	font-family: 'MaruBuri-Regular';
	font-size: 30px;
	
}

.error2 {
	font-family: 'MaruBuri-Regular';
	font-size: 30px;
}

.wrap {
	margin: 0 auto;
	min-width: 1200px;
	min-height: 900px;
}

.btn {
  padding: 0.66em 2.25em;
  text-decoration: none;
  position: relative;
  display: inline-block;
  border: 0;
  outline: 0;
}

.btn:after {
  content: "";
  display: block;
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0.125em;
  left: 0.125em;
  border-bottom: 0.125em solid;
  border-right: 0.125em solid;
}

.btn:active {
  transform: translate(0.125em, 0.125em);
}

.btn:active:after {
  transform: translate(-0.125em, -0.125em);
}


.btn-outline-fill {
  color: #2BE3FA;
  background-color: transparent;
  
}

.btn-outline-fill:after {
  border-color: #2BE3FA;
}

.btn-outline-fill:hover {
  color: #fff;
  background-color: #2BE3FA;
  box-shadow: inset 0 0 0 0.125em transparent;
}

.btn-outline-fill:hover:after {
  border-color: #2BE3FA;
}

.btn:focus {
	outline: none;
}

</style>




</head>

<div class="wrap">
<div class="header">

<h1 class="error">
죄송합니다</h1>

<h1 class="error2">
에러가 발생했습니다
</h1>

<button id="home" class="btn btn-outline-fill" onclick='location.href="/mobo/main";'>무부무부로 돌아가기</button>

</div>


<div class="main">

<div class="summerdream">
  <div class="sea">
    <div class="surface"></div>
  </div>
  <div class="ship">
    <div class="rotate">
      <div class="move">
        <div class="body">
          <div class="waves">
            <div class="bodywaves">
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
            </div>
            <div class="oarwaves -left">
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
            </div>
            <div class="oarwaves -right">
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
              <div class="wave">
                <div class="graphic"></div>
              </div>
            </div>
          </div>
          <div class="base"></div>
          <div class="board -front"></div>
          <div class="board -back"></div>
        </div>
        <div class="oars">
          <div class="oar -left">
            <div class="row -left">
              <div class="depth -left">
                <div class="graphic -left"></div>
              </div>
            </div>
          </div>
          <div class="oar -right">
            <div class="row -right">
              <div class="depth -right">
                <div class="graphic -right"></div>
              </div>
            </div>
          </div>
        </div>
        <div class="human">
          <div class="legs">
            <div class="leg -left"></div>
            <div class="leg -right"></div>
          </div>
          <div class="hat"></div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
</div>



