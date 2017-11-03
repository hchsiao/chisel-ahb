`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif

module CtlPath(
  input         clock,
  input         reset,
  input         io_dmem_resp_valid,
  input  [31:0] io_dat_dec_inst,
  input         io_dat_exe_br_eq,
  input         io_dat_exe_br_lt,
  input         io_dat_exe_br_ltu,
  input  [3:0]  io_dat_exe_br_type,
  input         io_dat_mem_ctrl_dmem_val,
  input         io_dat_csr_eret,
  output        io_ctl_dec_stall,
  output        io_ctl_full_stall,
  output [1:0]  io_ctl_exe_pc_sel,
  output [3:0]  io_ctl_br_type,
  output        io_ctl_if_kill,
  output        io_ctl_dec_kill,
  output [1:0]  io_ctl_op1_sel,
  output [2:0]  io_ctl_op2_sel,
  output [3:0]  io_ctl_alu_fun,
  output [1:0]  io_ctl_wb_sel,
  output        io_ctl_rf_wen,
  output        io_ctl_mem_val,
  output [1:0]  io_ctl_mem_fcn,
  output [2:0]  io_ctl_mem_typ,
  output [2:0]  io_ctl_csr_cmd,
  output        io_ctl_fencei,
  output        io_ctl_pipeline_kill,
  output        io_ctl_mem_exception
);
  wire [31:0] _T_175;
  wire  _T_176;
  wire  _T_180;
  wire  _T_184;
  wire  _T_188;
  wire  _T_192;
  wire  _T_196;
  wire  _T_200;
  wire  _T_204;
  wire [31:0] _T_207;
  wire  _T_208;
  wire  _T_212;
  wire  _T_216;
  wire  _T_220;
  wire  _T_224;
  wire  _T_228;
  wire  _T_232;
  wire  _T_236;
  wire [31:0] _T_239;
  wire  _T_240;
  wire  _T_244;
  wire  _T_248;
  wire [31:0] _T_251;
  wire  _T_252;
  wire  _T_256;
  wire  _T_260;
  wire  _T_264;
  wire  _T_268;
  wire  _T_272;
  wire  _T_276;
  wire  _T_280;
  wire  _T_284;
  wire  _T_288;
  wire  _T_292;
  wire  _T_296;
  wire  _T_300;
  wire  _T_304;
  wire  _T_308;
  wire  _T_312;
  wire  _T_316;
  wire  _T_320;
  wire  _T_324;
  wire  _T_328;
  wire  _T_332;
  wire  _T_336;
  wire  _T_340;
  wire  _T_344;
  wire  _T_348;
  wire  _T_352;
  wire  _T_356;
  wire  _T_360;
  wire  _T_364;
  wire  _T_368;
  wire  _T_372;
  wire  _T_374;
  wire  _T_375;
  wire  _T_376;
  wire  _T_377;
  wire  _T_378;
  wire  _T_379;
  wire  _T_380;
  wire  _T_381;
  wire  _T_382;
  wire  _T_383;
  wire  _T_384;
  wire  _T_385;
  wire  _T_386;
  wire  _T_387;
  wire  _T_388;
  wire  _T_389;
  wire  _T_390;
  wire  _T_391;
  wire  _T_392;
  wire  _T_393;
  wire  _T_394;
  wire  _T_395;
  wire  _T_396;
  wire  _T_397;
  wire  _T_398;
  wire  _T_399;
  wire  _T_400;
  wire  _T_401;
  wire  _T_402;
  wire  _T_403;
  wire  _T_404;
  wire  _T_405;
  wire  _T_406;
  wire  _T_407;
  wire  _T_408;
  wire  _T_409;
  wire  _T_410;
  wire  _T_411;
  wire  _T_412;
  wire  _T_413;
  wire  _T_414;
  wire  _T_415;
  wire  _T_416;
  wire  _T_417;
  wire  _T_418;
  wire  _T_419;
  wire  _T_420;
  wire  _T_421;
  wire  cs_val_inst;
  wire [3:0] _T_435;
  wire [3:0] _T_436;
  wire [3:0] _T_437;
  wire [3:0] _T_438;
  wire [3:0] _T_439;
  wire [3:0] _T_440;
  wire [3:0] _T_441;
  wire [3:0] _T_442;
  wire [3:0] _T_443;
  wire [3:0] _T_444;
  wire [3:0] _T_445;
  wire [3:0] _T_446;
  wire [3:0] _T_447;
  wire [3:0] _T_448;
  wire [3:0] _T_449;
  wire [3:0] _T_450;
  wire [3:0] _T_451;
  wire [3:0] _T_452;
  wire [3:0] _T_453;
  wire [3:0] _T_454;
  wire [3:0] _T_455;
  wire [3:0] _T_456;
  wire [3:0] _T_457;
  wire [3:0] _T_458;
  wire [3:0] _T_459;
  wire [3:0] _T_460;
  wire [3:0] _T_461;
  wire [3:0] _T_462;
  wire [3:0] _T_463;
  wire [3:0] _T_464;
  wire [3:0] _T_465;
  wire [3:0] _T_466;
  wire [3:0] _T_467;
  wire [3:0] _T_468;
  wire [3:0] _T_469;
  wire [3:0] _T_470;
  wire [3:0] cs_br_type;
  wire [1:0] _T_478;
  wire [1:0] _T_479;
  wire [1:0] _T_480;
  wire [1:0] _T_481;
  wire [1:0] _T_482;
  wire [1:0] _T_483;
  wire [1:0] _T_484;
  wire [1:0] _T_485;
  wire [1:0] _T_486;
  wire [1:0] _T_487;
  wire [1:0] _T_488;
  wire [1:0] _T_489;
  wire [1:0] _T_490;
  wire [1:0] _T_491;
  wire [1:0] _T_492;
  wire [1:0] _T_493;
  wire [1:0] _T_494;
  wire [1:0] _T_495;
  wire [1:0] _T_496;
  wire [1:0] _T_497;
  wire [1:0] _T_498;
  wire [1:0] _T_499;
  wire [1:0] _T_500;
  wire [1:0] _T_501;
  wire [1:0] _T_502;
  wire [1:0] _T_503;
  wire [1:0] _T_504;
  wire [1:0] _T_505;
  wire [1:0] _T_506;
  wire [1:0] _T_507;
  wire [1:0] _T_508;
  wire [1:0] _T_509;
  wire [1:0] _T_510;
  wire [1:0] _T_511;
  wire [1:0] _T_512;
  wire [1:0] _T_513;
  wire [1:0] _T_514;
  wire [1:0] _T_515;
  wire [1:0] _T_516;
  wire [1:0] _T_517;
  wire [1:0] _T_518;
  wire [1:0] _T_519;
  wire [1:0] cs_op1_sel;
  wire [2:0] _T_533;
  wire [2:0] _T_534;
  wire [2:0] _T_535;
  wire [2:0] _T_536;
  wire [2:0] _T_537;
  wire [2:0] _T_538;
  wire [2:0] _T_539;
  wire [2:0] _T_540;
  wire [2:0] _T_541;
  wire [2:0] _T_542;
  wire [2:0] _T_543;
  wire [2:0] _T_544;
  wire [2:0] _T_545;
  wire [2:0] _T_546;
  wire [2:0] _T_547;
  wire [2:0] _T_548;
  wire [2:0] _T_549;
  wire [2:0] _T_550;
  wire [2:0] _T_551;
  wire [2:0] _T_552;
  wire [2:0] _T_553;
  wire [2:0] _T_554;
  wire [2:0] _T_555;
  wire [2:0] _T_556;
  wire [2:0] _T_557;
  wire [2:0] _T_558;
  wire [2:0] _T_559;
  wire [2:0] _T_560;
  wire [2:0] _T_561;
  wire [2:0] _T_562;
  wire [2:0] _T_563;
  wire [2:0] _T_564;
  wire [2:0] _T_565;
  wire [2:0] _T_566;
  wire [2:0] _T_567;
  wire [2:0] _T_568;
  wire [2:0] cs_op2_sel;
  wire  _T_577;
  wire  _T_578;
  wire  _T_579;
  wire  _T_580;
  wire  _T_581;
  wire  _T_582;
  wire  _T_583;
  wire  _T_584;
  wire  _T_585;
  wire  _T_586;
  wire  _T_587;
  wire  _T_588;
  wire  _T_589;
  wire  _T_590;
  wire  _T_591;
  wire  _T_592;
  wire  _T_593;
  wire  _T_594;
  wire  _T_595;
  wire  _T_596;
  wire  _T_597;
  wire  _T_598;
  wire  _T_599;
  wire  _T_600;
  wire  _T_601;
  wire  _T_602;
  wire  _T_603;
  wire  _T_604;
  wire  _T_605;
  wire  _T_606;
  wire  _T_607;
  wire  _T_608;
  wire  _T_609;
  wire  _T_610;
  wire  _T_611;
  wire  _T_612;
  wire  _T_613;
  wire  _T_614;
  wire  _T_615;
  wire  _T_616;
  wire  _T_617;
  wire  cs_rs1_oen;
  wire  _T_637;
  wire  _T_638;
  wire  _T_639;
  wire  _T_640;
  wire  _T_641;
  wire  _T_642;
  wire  _T_643;
  wire  _T_644;
  wire  _T_645;
  wire  _T_646;
  wire  _T_647;
  wire  _T_648;
  wire  _T_649;
  wire  _T_650;
  wire  _T_651;
  wire  _T_652;
  wire  _T_653;
  wire  _T_654;
  wire  _T_655;
  wire  _T_656;
  wire  _T_657;
  wire  _T_658;
  wire  _T_659;
  wire  _T_660;
  wire  _T_661;
  wire  _T_662;
  wire  _T_663;
  wire  _T_664;
  wire  _T_665;
  wire  _T_666;
  wire  cs_rs2_oen;
  wire [3:0] _T_674;
  wire [3:0] _T_675;
  wire [3:0] _T_676;
  wire [3:0] _T_677;
  wire [3:0] _T_678;
  wire [3:0] _T_679;
  wire [3:0] _T_680;
  wire [3:0] _T_681;
  wire [3:0] _T_682;
  wire [3:0] _T_683;
  wire [3:0] _T_684;
  wire [3:0] _T_685;
  wire [3:0] _T_686;
  wire [3:0] _T_687;
  wire [3:0] _T_688;
  wire [3:0] _T_689;
  wire [3:0] _T_690;
  wire [3:0] _T_691;
  wire [3:0] _T_692;
  wire [3:0] _T_693;
  wire [3:0] _T_694;
  wire [3:0] _T_695;
  wire [3:0] _T_696;
  wire [3:0] _T_697;
  wire [3:0] _T_698;
  wire [3:0] _T_699;
  wire [3:0] _T_700;
  wire [3:0] _T_701;
  wire [3:0] _T_702;
  wire [3:0] _T_703;
  wire [3:0] _T_704;
  wire [3:0] _T_705;
  wire [3:0] _T_706;
  wire [3:0] _T_707;
  wire [3:0] _T_708;
  wire [3:0] _T_709;
  wire [3:0] _T_710;
  wire [3:0] _T_711;
  wire [3:0] _T_712;
  wire [3:0] _T_713;
  wire [3:0] _T_714;
  wire [3:0] _T_715;
  wire [3:0] cs0_0;
  wire [1:0] _T_723;
  wire [1:0] _T_724;
  wire [1:0] _T_725;
  wire [1:0] _T_726;
  wire [1:0] _T_727;
  wire [1:0] _T_728;
  wire [1:0] _T_729;
  wire [1:0] _T_730;
  wire [1:0] _T_731;
  wire [1:0] _T_732;
  wire [1:0] _T_733;
  wire [1:0] _T_734;
  wire [1:0] _T_735;
  wire [1:0] _T_736;
  wire [1:0] _T_737;
  wire [1:0] _T_738;
  wire [1:0] _T_739;
  wire [1:0] _T_740;
  wire [1:0] _T_741;
  wire [1:0] _T_742;
  wire [1:0] _T_743;
  wire [1:0] _T_744;
  wire [1:0] _T_745;
  wire [1:0] _T_746;
  wire [1:0] _T_747;
  wire [1:0] _T_748;
  wire [1:0] _T_749;
  wire [1:0] _T_750;
  wire [1:0] _T_751;
  wire [1:0] _T_752;
  wire [1:0] _T_753;
  wire [1:0] _T_754;
  wire [1:0] _T_755;
  wire [1:0] _T_756;
  wire [1:0] _T_757;
  wire [1:0] _T_758;
  wire [1:0] _T_759;
  wire [1:0] _T_760;
  wire [1:0] _T_761;
  wire [1:0] _T_762;
  wire [1:0] _T_763;
  wire [1:0] _T_764;
  wire [1:0] cs0_1;
  wire  _T_778;
  wire  _T_779;
  wire  _T_780;
  wire  _T_781;
  wire  _T_782;
  wire  _T_783;
  wire  _T_784;
  wire  _T_785;
  wire  _T_786;
  wire  _T_787;
  wire  _T_788;
  wire  _T_789;
  wire  _T_790;
  wire  _T_791;
  wire  _T_792;
  wire  _T_793;
  wire  _T_794;
  wire  _T_795;
  wire  _T_796;
  wire  _T_797;
  wire  _T_798;
  wire  _T_799;
  wire  _T_800;
  wire  _T_801;
  wire  _T_802;
  wire  _T_803;
  wire  _T_804;
  wire  _T_805;
  wire  _T_806;
  wire  _T_807;
  wire  _T_808;
  wire  _T_809;
  wire  _T_810;
  wire  _T_811;
  wire  _T_812;
  wire  _T_813;
  wire  cs0_2;
  wire  _T_815;
  wire  _T_816;
  wire  _T_817;
  wire  _T_818;
  wire  _T_819;
  wire  _T_820;
  wire  _T_821;
  wire  _T_822;
  wire  _T_823;
  wire  _T_824;
  wire  _T_825;
  wire  _T_826;
  wire  _T_827;
  wire  _T_828;
  wire  _T_829;
  wire  _T_830;
  wire  _T_831;
  wire  _T_832;
  wire  _T_833;
  wire  _T_834;
  wire  _T_835;
  wire  _T_836;
  wire  _T_837;
  wire  _T_838;
  wire  _T_839;
  wire  _T_840;
  wire  _T_841;
  wire  _T_842;
  wire  _T_843;
  wire  _T_844;
  wire  _T_845;
  wire  _T_846;
  wire  _T_847;
  wire  _T_848;
  wire  _T_849;
  wire  _T_850;
  wire  _T_851;
  wire  _T_852;
  wire  _T_853;
  wire  _T_854;
  wire  _T_855;
  wire  _T_856;
  wire  _T_857;
  wire  _T_858;
  wire  _T_859;
  wire  _T_860;
  wire  _T_861;
  wire  _T_862;
  wire  cs0_3;
  wire  _T_906;
  wire  _T_907;
  wire  _T_908;
  wire  _T_909;
  wire  _T_910;
  wire  _T_911;
  wire  cs0_4;
  wire [2:0] _T_954;
  wire [2:0] _T_955;
  wire [2:0] _T_956;
  wire [2:0] _T_957;
  wire [2:0] _T_958;
  wire [2:0] _T_959;
  wire [2:0] _T_960;
  wire [2:0] cs0_5;
  wire [2:0] _T_964;
  wire [2:0] _T_965;
  wire [2:0] _T_966;
  wire [2:0] _T_967;
  wire [2:0] _T_968;
  wire [2:0] _T_969;
  wire [2:0] _T_970;
  wire [2:0] _T_971;
  wire [2:0] _T_972;
  wire [2:0] _T_973;
  wire [2:0] _T_974;
  wire [2:0] _T_975;
  wire [2:0] _T_976;
  wire [2:0] _T_977;
  wire [2:0] _T_978;
  wire [2:0] _T_979;
  wire [2:0] _T_980;
  wire [2:0] _T_981;
  wire [2:0] _T_982;
  wire [2:0] _T_983;
  wire [2:0] _T_984;
  wire [2:0] _T_985;
  wire [2:0] _T_986;
  wire [2:0] _T_987;
  wire [2:0] _T_988;
  wire [2:0] _T_989;
  wire [2:0] _T_990;
  wire [2:0] _T_991;
  wire [2:0] _T_992;
  wire [2:0] _T_993;
  wire [2:0] _T_994;
  wire [2:0] _T_995;
  wire [2:0] _T_996;
  wire [2:0] _T_997;
  wire [2:0] _T_998;
  wire [2:0] _T_999;
  wire [2:0] _T_1000;
  wire [2:0] _T_1001;
  wire [2:0] _T_1002;
  wire [2:0] _T_1003;
  wire [2:0] _T_1004;
  wire [2:0] _T_1005;
  wire [2:0] _T_1006;
  wire [2:0] _T_1007;
  wire [2:0] _T_1008;
  wire [2:0] _T_1009;
  wire [2:0] cs0_6;
  wire  _T_1012;
  wire  _T_1013;
  wire  _T_1014;
  wire  _T_1015;
  wire  _T_1016;
  wire  _T_1017;
  wire  _T_1018;
  wire  _T_1019;
  wire  _T_1020;
  wire  _T_1021;
  wire  _T_1022;
  wire  _T_1023;
  wire  _T_1024;
  wire  _T_1025;
  wire  _T_1026;
  wire  _T_1027;
  wire  _T_1028;
  wire  _T_1029;
  wire  _T_1030;
  wire  _T_1031;
  wire  _T_1032;
  wire  _T_1033;
  wire  _T_1034;
  wire  _T_1035;
  wire  _T_1036;
  wire  _T_1037;
  wire  _T_1038;
  wire  _T_1039;
  wire  _T_1040;
  wire  _T_1041;
  wire  _T_1042;
  wire  _T_1043;
  wire  _T_1044;
  wire  _T_1045;
  wire  _T_1046;
  wire  _T_1047;
  wire  _T_1048;
  wire  _T_1049;
  wire  _T_1050;
  wire  _T_1051;
  wire  _T_1052;
  wire  _T_1053;
  wire  _T_1054;
  wire  _T_1055;
  wire  _T_1056;
  wire  _T_1057;
  wire  _T_1058;
  wire  cs0_7;
  wire  _T_1059;
  wire  _T_1060;
  wire  _T_1062;
  wire [1:0] _T_1063;
  wire  _T_1064;
  wire [1:0] _T_1065;
  wire  _T_1066;
  wire  _T_1068;
  wire [1:0] _T_1069;
  wire  _T_1070;
  wire  _T_1072;
  wire [1:0] _T_1073;
  wire  _T_1074;
  wire [1:0] _T_1075;
  wire  _T_1076;
  wire [1:0] _T_1077;
  wire  _T_1078;
  wire  _T_1079;
  wire [1:0] _T_1080;
  wire [1:0] _T_1081;
  wire [1:0] _T_1082;
  wire [1:0] _T_1083;
  wire [1:0] _T_1084;
  wire [1:0] _T_1085;
  wire [1:0] _T_1086;
  wire [1:0] _T_1087;
  wire [1:0] _T_1088;
  wire [1:0] ctrl_exe_pc_sel;
  wire  _T_1089;
  wire  _T_1093;
  reg  _T_1095;
  reg [31:0] _RAND_0;
  wire  ifkill;
  wire  _T_1096;
  wire  dec_exception;
  wire  stall;
  wire [4:0] dec_rs1_addr;
  wire [4:0] dec_rs2_addr;
  wire [4:0] dec_wbaddr;
  wire  dec_rs1_oen;
  wire  dec_rs2_oen;
  reg [4:0] exe_reg_wbaddr;
  reg [31:0] _RAND_1;
  reg  exe_reg_exception;
  reg [31:0] _RAND_2;
  reg  exe_reg_is_csr;
  reg [31:0] _RAND_3;
  wire  full_stall;
  wire  _T_1117;
  wire  _T_1119;
  wire  _T_1120;
  wire  _T_1125;
  wire  _T_1126;
  wire  _T_1127;
  wire [4:0] _GEN_0;
  wire  _GEN_2;
  wire  _GEN_3;
  wire  _T_1130;
  wire [4:0] _GEN_4;
  wire  _GEN_6;
  wire  _GEN_7;
  wire [4:0] _GEN_8;
  wire  _GEN_10;
  wire  _GEN_11;
  reg  exe_inst_is_load;
  reg [31:0] _RAND_4;
  wire  _T_1139;
  wire  _T_1140;
  wire  _GEN_12;
  wire  _T_1141;
  wire  _T_1142;
  wire  _T_1144;
  wire  _T_1145;
  wire  _T_1146;
  wire  _T_1147;
  wire  _T_1148;
  wire  _T_1151;
  wire  _T_1152;
  wire  _T_1153;
  wire  _T_1154;
  wire  _T_1157;
  wire  _T_1159;
  wire  _T_1160;
  wire  _T_1162;
  reg  _T_1165;
  reg [31:0] _RAND_5;
  wire  _T_1166;
  reg  _T_1168;
  reg [31:0] _RAND_6;
  wire  _T_1169;
  wire  _T_1170;
  wire  _T_1171;
  wire  _T_1173;
  wire  csr_ren;
  wire [2:0] _T_1174;
  assign _T_175 = io_dat_dec_inst & 32'h707f;
  assign _T_176 = 32'h2003 == _T_175;
  assign _T_180 = 32'h3 == _T_175;
  assign _T_184 = 32'h4003 == _T_175;
  assign _T_188 = 32'h1003 == _T_175;
  assign _T_192 = 32'h5003 == _T_175;
  assign _T_196 = 32'h2023 == _T_175;
  assign _T_200 = 32'h23 == _T_175;
  assign _T_204 = 32'h1023 == _T_175;
  assign _T_207 = io_dat_dec_inst & 32'h7f;
  assign _T_208 = 32'h17 == _T_207;
  assign _T_212 = 32'h37 == _T_207;
  assign _T_216 = 32'h13 == _T_175;
  assign _T_220 = 32'h7013 == _T_175;
  assign _T_224 = 32'h6013 == _T_175;
  assign _T_228 = 32'h4013 == _T_175;
  assign _T_232 = 32'h2013 == _T_175;
  assign _T_236 = 32'h3013 == _T_175;
  assign _T_239 = io_dat_dec_inst & 32'hfc00707f;
  assign _T_240 = 32'h1013 == _T_239;
  assign _T_244 = 32'h40005013 == _T_239;
  assign _T_248 = 32'h5013 == _T_239;
  assign _T_251 = io_dat_dec_inst & 32'hfe00707f;
  assign _T_252 = 32'h1033 == _T_251;
  assign _T_256 = 32'h33 == _T_251;
  assign _T_260 = 32'h40000033 == _T_251;
  assign _T_264 = 32'h2033 == _T_251;
  assign _T_268 = 32'h3033 == _T_251;
  assign _T_272 = 32'h7033 == _T_251;
  assign _T_276 = 32'h6033 == _T_251;
  assign _T_280 = 32'h4033 == _T_251;
  assign _T_284 = 32'h40005033 == _T_251;
  assign _T_288 = 32'h5033 == _T_251;
  assign _T_292 = 32'h6f == _T_207;
  assign _T_296 = 32'h67 == _T_175;
  assign _T_300 = 32'h63 == _T_175;
  assign _T_304 = 32'h1063 == _T_175;
  assign _T_308 = 32'h5063 == _T_175;
  assign _T_312 = 32'h7063 == _T_175;
  assign _T_316 = 32'h4063 == _T_175;
  assign _T_320 = 32'h6063 == _T_175;
  assign _T_324 = 32'h5073 == _T_175;
  assign _T_328 = 32'h6073 == _T_175;
  assign _T_332 = 32'h1073 == _T_175;
  assign _T_336 = 32'h2073 == _T_175;
  assign _T_340 = 32'h3073 == _T_175;
  assign _T_344 = 32'h7073 == _T_175;
  assign _T_348 = 32'h73 == io_dat_dec_inst;
  assign _T_352 = 32'h30200073 == io_dat_dec_inst;
  assign _T_356 = 32'h7b200073 == io_dat_dec_inst;
  assign _T_360 = 32'h100073 == io_dat_dec_inst;
  assign _T_364 = 32'h10500073 == io_dat_dec_inst;
  assign _T_368 = 32'h100f == _T_175;
  assign _T_372 = 32'hf == _T_175;
  assign _T_374 = _T_368 ? 1'h1 : _T_372;
  assign _T_375 = _T_364 ? 1'h1 : _T_374;
  assign _T_376 = _T_360 ? 1'h1 : _T_375;
  assign _T_377 = _T_356 ? 1'h1 : _T_376;
  assign _T_378 = _T_352 ? 1'h1 : _T_377;
  assign _T_379 = _T_348 ? 1'h1 : _T_378;
  assign _T_380 = _T_344 ? 1'h1 : _T_379;
  assign _T_381 = _T_340 ? 1'h1 : _T_380;
  assign _T_382 = _T_336 ? 1'h1 : _T_381;
  assign _T_383 = _T_332 ? 1'h1 : _T_382;
  assign _T_384 = _T_328 ? 1'h1 : _T_383;
  assign _T_385 = _T_324 ? 1'h1 : _T_384;
  assign _T_386 = _T_320 ? 1'h1 : _T_385;
  assign _T_387 = _T_316 ? 1'h1 : _T_386;
  assign _T_388 = _T_312 ? 1'h1 : _T_387;
  assign _T_389 = _T_308 ? 1'h1 : _T_388;
  assign _T_390 = _T_304 ? 1'h1 : _T_389;
  assign _T_391 = _T_300 ? 1'h1 : _T_390;
  assign _T_392 = _T_296 ? 1'h1 : _T_391;
  assign _T_393 = _T_292 ? 1'h1 : _T_392;
  assign _T_394 = _T_288 ? 1'h1 : _T_393;
  assign _T_395 = _T_284 ? 1'h1 : _T_394;
  assign _T_396 = _T_280 ? 1'h1 : _T_395;
  assign _T_397 = _T_276 ? 1'h1 : _T_396;
  assign _T_398 = _T_272 ? 1'h1 : _T_397;
  assign _T_399 = _T_268 ? 1'h1 : _T_398;
  assign _T_400 = _T_264 ? 1'h1 : _T_399;
  assign _T_401 = _T_260 ? 1'h1 : _T_400;
  assign _T_402 = _T_256 ? 1'h1 : _T_401;
  assign _T_403 = _T_252 ? 1'h1 : _T_402;
  assign _T_404 = _T_248 ? 1'h1 : _T_403;
  assign _T_405 = _T_244 ? 1'h1 : _T_404;
  assign _T_406 = _T_240 ? 1'h1 : _T_405;
  assign _T_407 = _T_236 ? 1'h1 : _T_406;
  assign _T_408 = _T_232 ? 1'h1 : _T_407;
  assign _T_409 = _T_228 ? 1'h1 : _T_408;
  assign _T_410 = _T_224 ? 1'h1 : _T_409;
  assign _T_411 = _T_220 ? 1'h1 : _T_410;
  assign _T_412 = _T_216 ? 1'h1 : _T_411;
  assign _T_413 = _T_212 ? 1'h1 : _T_412;
  assign _T_414 = _T_208 ? 1'h1 : _T_413;
  assign _T_415 = _T_204 ? 1'h1 : _T_414;
  assign _T_416 = _T_200 ? 1'h1 : _T_415;
  assign _T_417 = _T_196 ? 1'h1 : _T_416;
  assign _T_418 = _T_192 ? 1'h1 : _T_417;
  assign _T_419 = _T_188 ? 1'h1 : _T_418;
  assign _T_420 = _T_184 ? 1'h1 : _T_419;
  assign _T_421 = _T_180 ? 1'h1 : _T_420;
  assign cs_val_inst = _T_176 ? 1'h1 : _T_421;
  assign _T_435 = _T_320 ? 4'h6 : 4'h0;
  assign _T_436 = _T_316 ? 4'h5 : _T_435;
  assign _T_437 = _T_312 ? 4'h4 : _T_436;
  assign _T_438 = _T_308 ? 4'h3 : _T_437;
  assign _T_439 = _T_304 ? 4'h1 : _T_438;
  assign _T_440 = _T_300 ? 4'h2 : _T_439;
  assign _T_441 = _T_296 ? 4'h8 : _T_440;
  assign _T_442 = _T_292 ? 4'h7 : _T_441;
  assign _T_443 = _T_288 ? 4'h0 : _T_442;
  assign _T_444 = _T_284 ? 4'h0 : _T_443;
  assign _T_445 = _T_280 ? 4'h0 : _T_444;
  assign _T_446 = _T_276 ? 4'h0 : _T_445;
  assign _T_447 = _T_272 ? 4'h0 : _T_446;
  assign _T_448 = _T_268 ? 4'h0 : _T_447;
  assign _T_449 = _T_264 ? 4'h0 : _T_448;
  assign _T_450 = _T_260 ? 4'h0 : _T_449;
  assign _T_451 = _T_256 ? 4'h0 : _T_450;
  assign _T_452 = _T_252 ? 4'h0 : _T_451;
  assign _T_453 = _T_248 ? 4'h0 : _T_452;
  assign _T_454 = _T_244 ? 4'h0 : _T_453;
  assign _T_455 = _T_240 ? 4'h0 : _T_454;
  assign _T_456 = _T_236 ? 4'h0 : _T_455;
  assign _T_457 = _T_232 ? 4'h0 : _T_456;
  assign _T_458 = _T_228 ? 4'h0 : _T_457;
  assign _T_459 = _T_224 ? 4'h0 : _T_458;
  assign _T_460 = _T_220 ? 4'h0 : _T_459;
  assign _T_461 = _T_216 ? 4'h0 : _T_460;
  assign _T_462 = _T_212 ? 4'h0 : _T_461;
  assign _T_463 = _T_208 ? 4'h0 : _T_462;
  assign _T_464 = _T_204 ? 4'h0 : _T_463;
  assign _T_465 = _T_200 ? 4'h0 : _T_464;
  assign _T_466 = _T_196 ? 4'h0 : _T_465;
  assign _T_467 = _T_192 ? 4'h0 : _T_466;
  assign _T_468 = _T_188 ? 4'h0 : _T_467;
  assign _T_469 = _T_184 ? 4'h0 : _T_468;
  assign _T_470 = _T_180 ? 4'h0 : _T_469;
  assign cs_br_type = _T_176 ? 4'h0 : _T_470;
  assign _T_478 = _T_344 ? 2'h2 : 2'h0;
  assign _T_479 = _T_340 ? 2'h0 : _T_478;
  assign _T_480 = _T_336 ? 2'h0 : _T_479;
  assign _T_481 = _T_332 ? 2'h0 : _T_480;
  assign _T_482 = _T_328 ? 2'h2 : _T_481;
  assign _T_483 = _T_324 ? 2'h2 : _T_482;
  assign _T_484 = _T_320 ? 2'h0 : _T_483;
  assign _T_485 = _T_316 ? 2'h0 : _T_484;
  assign _T_486 = _T_312 ? 2'h0 : _T_485;
  assign _T_487 = _T_308 ? 2'h0 : _T_486;
  assign _T_488 = _T_304 ? 2'h0 : _T_487;
  assign _T_489 = _T_300 ? 2'h0 : _T_488;
  assign _T_490 = _T_296 ? 2'h0 : _T_489;
  assign _T_491 = _T_292 ? 2'h0 : _T_490;
  assign _T_492 = _T_288 ? 2'h0 : _T_491;
  assign _T_493 = _T_284 ? 2'h0 : _T_492;
  assign _T_494 = _T_280 ? 2'h0 : _T_493;
  assign _T_495 = _T_276 ? 2'h0 : _T_494;
  assign _T_496 = _T_272 ? 2'h0 : _T_495;
  assign _T_497 = _T_268 ? 2'h0 : _T_496;
  assign _T_498 = _T_264 ? 2'h0 : _T_497;
  assign _T_499 = _T_260 ? 2'h0 : _T_498;
  assign _T_500 = _T_256 ? 2'h0 : _T_499;
  assign _T_501 = _T_252 ? 2'h0 : _T_500;
  assign _T_502 = _T_248 ? 2'h0 : _T_501;
  assign _T_503 = _T_244 ? 2'h0 : _T_502;
  assign _T_504 = _T_240 ? 2'h0 : _T_503;
  assign _T_505 = _T_236 ? 2'h0 : _T_504;
  assign _T_506 = _T_232 ? 2'h0 : _T_505;
  assign _T_507 = _T_228 ? 2'h0 : _T_506;
  assign _T_508 = _T_224 ? 2'h0 : _T_507;
  assign _T_509 = _T_220 ? 2'h0 : _T_508;
  assign _T_510 = _T_216 ? 2'h0 : _T_509;
  assign _T_511 = _T_212 ? 2'h0 : _T_510;
  assign _T_512 = _T_208 ? 2'h1 : _T_511;
  assign _T_513 = _T_204 ? 2'h0 : _T_512;
  assign _T_514 = _T_200 ? 2'h0 : _T_513;
  assign _T_515 = _T_196 ? 2'h0 : _T_514;
  assign _T_516 = _T_192 ? 2'h0 : _T_515;
  assign _T_517 = _T_188 ? 2'h0 : _T_516;
  assign _T_518 = _T_184 ? 2'h0 : _T_517;
  assign _T_519 = _T_180 ? 2'h0 : _T_518;
  assign cs_op1_sel = _T_176 ? 2'h0 : _T_519;
  assign _T_533 = _T_320 ? 3'h3 : 3'h0;
  assign _T_534 = _T_316 ? 3'h3 : _T_533;
  assign _T_535 = _T_312 ? 3'h3 : _T_534;
  assign _T_536 = _T_308 ? 3'h3 : _T_535;
  assign _T_537 = _T_304 ? 3'h3 : _T_536;
  assign _T_538 = _T_300 ? 3'h3 : _T_537;
  assign _T_539 = _T_296 ? 3'h1 : _T_538;
  assign _T_540 = _T_292 ? 3'h5 : _T_539;
  assign _T_541 = _T_288 ? 3'h0 : _T_540;
  assign _T_542 = _T_284 ? 3'h0 : _T_541;
  assign _T_543 = _T_280 ? 3'h0 : _T_542;
  assign _T_544 = _T_276 ? 3'h0 : _T_543;
  assign _T_545 = _T_272 ? 3'h0 : _T_544;
  assign _T_546 = _T_268 ? 3'h0 : _T_545;
  assign _T_547 = _T_264 ? 3'h0 : _T_546;
  assign _T_548 = _T_260 ? 3'h0 : _T_547;
  assign _T_549 = _T_256 ? 3'h0 : _T_548;
  assign _T_550 = _T_252 ? 3'h0 : _T_549;
  assign _T_551 = _T_248 ? 3'h1 : _T_550;
  assign _T_552 = _T_244 ? 3'h1 : _T_551;
  assign _T_553 = _T_240 ? 3'h1 : _T_552;
  assign _T_554 = _T_236 ? 3'h1 : _T_553;
  assign _T_555 = _T_232 ? 3'h1 : _T_554;
  assign _T_556 = _T_228 ? 3'h1 : _T_555;
  assign _T_557 = _T_224 ? 3'h1 : _T_556;
  assign _T_558 = _T_220 ? 3'h1 : _T_557;
  assign _T_559 = _T_216 ? 3'h1 : _T_558;
  assign _T_560 = _T_212 ? 3'h4 : _T_559;
  assign _T_561 = _T_208 ? 3'h4 : _T_560;
  assign _T_562 = _T_204 ? 3'h2 : _T_561;
  assign _T_563 = _T_200 ? 3'h2 : _T_562;
  assign _T_564 = _T_196 ? 3'h2 : _T_563;
  assign _T_565 = _T_192 ? 3'h1 : _T_564;
  assign _T_566 = _T_188 ? 3'h1 : _T_565;
  assign _T_567 = _T_184 ? 3'h1 : _T_566;
  assign _T_568 = _T_180 ? 3'h1 : _T_567;
  assign cs_op2_sel = _T_176 ? 3'h1 : _T_568;
  assign _T_577 = _T_340 ? 1'h1 : _T_344;
  assign _T_578 = _T_336 ? 1'h1 : _T_577;
  assign _T_579 = _T_332 ? 1'h1 : _T_578;
  assign _T_580 = _T_328 ? 1'h1 : _T_579;
  assign _T_581 = _T_324 ? 1'h1 : _T_580;
  assign _T_582 = _T_320 ? 1'h1 : _T_581;
  assign _T_583 = _T_316 ? 1'h1 : _T_582;
  assign _T_584 = _T_312 ? 1'h1 : _T_583;
  assign _T_585 = _T_308 ? 1'h1 : _T_584;
  assign _T_586 = _T_304 ? 1'h1 : _T_585;
  assign _T_587 = _T_300 ? 1'h1 : _T_586;
  assign _T_588 = _T_296 ? 1'h1 : _T_587;
  assign _T_589 = _T_292 ? 1'h0 : _T_588;
  assign _T_590 = _T_288 ? 1'h1 : _T_589;
  assign _T_591 = _T_284 ? 1'h1 : _T_590;
  assign _T_592 = _T_280 ? 1'h1 : _T_591;
  assign _T_593 = _T_276 ? 1'h1 : _T_592;
  assign _T_594 = _T_272 ? 1'h1 : _T_593;
  assign _T_595 = _T_268 ? 1'h1 : _T_594;
  assign _T_596 = _T_264 ? 1'h1 : _T_595;
  assign _T_597 = _T_260 ? 1'h1 : _T_596;
  assign _T_598 = _T_256 ? 1'h1 : _T_597;
  assign _T_599 = _T_252 ? 1'h1 : _T_598;
  assign _T_600 = _T_248 ? 1'h1 : _T_599;
  assign _T_601 = _T_244 ? 1'h1 : _T_600;
  assign _T_602 = _T_240 ? 1'h1 : _T_601;
  assign _T_603 = _T_236 ? 1'h1 : _T_602;
  assign _T_604 = _T_232 ? 1'h1 : _T_603;
  assign _T_605 = _T_228 ? 1'h1 : _T_604;
  assign _T_606 = _T_224 ? 1'h1 : _T_605;
  assign _T_607 = _T_220 ? 1'h1 : _T_606;
  assign _T_608 = _T_216 ? 1'h1 : _T_607;
  assign _T_609 = _T_212 ? 1'h0 : _T_608;
  assign _T_610 = _T_208 ? 1'h0 : _T_609;
  assign _T_611 = _T_204 ? 1'h1 : _T_610;
  assign _T_612 = _T_200 ? 1'h1 : _T_611;
  assign _T_613 = _T_196 ? 1'h1 : _T_612;
  assign _T_614 = _T_192 ? 1'h1 : _T_613;
  assign _T_615 = _T_188 ? 1'h1 : _T_614;
  assign _T_616 = _T_184 ? 1'h1 : _T_615;
  assign _T_617 = _T_180 ? 1'h1 : _T_616;
  assign cs_rs1_oen = _T_176 ? 1'h1 : _T_617;
  assign _T_637 = _T_296 ? 1'h0 : _T_587;
  assign _T_638 = _T_292 ? 1'h0 : _T_637;
  assign _T_639 = _T_288 ? 1'h1 : _T_638;
  assign _T_640 = _T_284 ? 1'h1 : _T_639;
  assign _T_641 = _T_280 ? 1'h1 : _T_640;
  assign _T_642 = _T_276 ? 1'h1 : _T_641;
  assign _T_643 = _T_272 ? 1'h1 : _T_642;
  assign _T_644 = _T_268 ? 1'h1 : _T_643;
  assign _T_645 = _T_264 ? 1'h1 : _T_644;
  assign _T_646 = _T_260 ? 1'h1 : _T_645;
  assign _T_647 = _T_256 ? 1'h1 : _T_646;
  assign _T_648 = _T_252 ? 1'h1 : _T_647;
  assign _T_649 = _T_248 ? 1'h0 : _T_648;
  assign _T_650 = _T_244 ? 1'h0 : _T_649;
  assign _T_651 = _T_240 ? 1'h0 : _T_650;
  assign _T_652 = _T_236 ? 1'h0 : _T_651;
  assign _T_653 = _T_232 ? 1'h0 : _T_652;
  assign _T_654 = _T_228 ? 1'h0 : _T_653;
  assign _T_655 = _T_224 ? 1'h0 : _T_654;
  assign _T_656 = _T_220 ? 1'h0 : _T_655;
  assign _T_657 = _T_216 ? 1'h0 : _T_656;
  assign _T_658 = _T_212 ? 1'h0 : _T_657;
  assign _T_659 = _T_208 ? 1'h0 : _T_658;
  assign _T_660 = _T_204 ? 1'h1 : _T_659;
  assign _T_661 = _T_200 ? 1'h1 : _T_660;
  assign _T_662 = _T_196 ? 1'h1 : _T_661;
  assign _T_663 = _T_192 ? 1'h0 : _T_662;
  assign _T_664 = _T_188 ? 1'h0 : _T_663;
  assign _T_665 = _T_184 ? 1'h0 : _T_664;
  assign _T_666 = _T_180 ? 1'h0 : _T_665;
  assign cs_rs2_oen = _T_176 ? 1'h0 : _T_666;
  assign _T_674 = _T_344 ? 4'ha : 4'h0;
  assign _T_675 = _T_340 ? 4'ha : _T_674;
  assign _T_676 = _T_336 ? 4'ha : _T_675;
  assign _T_677 = _T_332 ? 4'ha : _T_676;
  assign _T_678 = _T_328 ? 4'ha : _T_677;
  assign _T_679 = _T_324 ? 4'ha : _T_678;
  assign _T_680 = _T_320 ? 4'h0 : _T_679;
  assign _T_681 = _T_316 ? 4'h0 : _T_680;
  assign _T_682 = _T_312 ? 4'h0 : _T_681;
  assign _T_683 = _T_308 ? 4'h0 : _T_682;
  assign _T_684 = _T_304 ? 4'h0 : _T_683;
  assign _T_685 = _T_300 ? 4'h0 : _T_684;
  assign _T_686 = _T_296 ? 4'h0 : _T_685;
  assign _T_687 = _T_292 ? 4'h0 : _T_686;
  assign _T_688 = _T_288 ? 4'h3 : _T_687;
  assign _T_689 = _T_284 ? 4'h4 : _T_688;
  assign _T_690 = _T_280 ? 4'h7 : _T_689;
  assign _T_691 = _T_276 ? 4'h6 : _T_690;
  assign _T_692 = _T_272 ? 4'h5 : _T_691;
  assign _T_693 = _T_268 ? 4'h9 : _T_692;
  assign _T_694 = _T_264 ? 4'h8 : _T_693;
  assign _T_695 = _T_260 ? 4'h1 : _T_694;
  assign _T_696 = _T_256 ? 4'h0 : _T_695;
  assign _T_697 = _T_252 ? 4'h2 : _T_696;
  assign _T_698 = _T_248 ? 4'h3 : _T_697;
  assign _T_699 = _T_244 ? 4'h4 : _T_698;
  assign _T_700 = _T_240 ? 4'h2 : _T_699;
  assign _T_701 = _T_236 ? 4'h9 : _T_700;
  assign _T_702 = _T_232 ? 4'h8 : _T_701;
  assign _T_703 = _T_228 ? 4'h7 : _T_702;
  assign _T_704 = _T_224 ? 4'h6 : _T_703;
  assign _T_705 = _T_220 ? 4'h5 : _T_704;
  assign _T_706 = _T_216 ? 4'h0 : _T_705;
  assign _T_707 = _T_212 ? 4'hb : _T_706;
  assign _T_708 = _T_208 ? 4'h0 : _T_707;
  assign _T_709 = _T_204 ? 4'h0 : _T_708;
  assign _T_710 = _T_200 ? 4'h0 : _T_709;
  assign _T_711 = _T_196 ? 4'h0 : _T_710;
  assign _T_712 = _T_192 ? 4'h0 : _T_711;
  assign _T_713 = _T_188 ? 4'h0 : _T_712;
  assign _T_714 = _T_184 ? 4'h0 : _T_713;
  assign _T_715 = _T_180 ? 4'h0 : _T_714;
  assign cs0_0 = _T_176 ? 4'h0 : _T_715;
  assign _T_723 = _T_344 ? 2'h3 : 2'h0;
  assign _T_724 = _T_340 ? 2'h3 : _T_723;
  assign _T_725 = _T_336 ? 2'h3 : _T_724;
  assign _T_726 = _T_332 ? 2'h3 : _T_725;
  assign _T_727 = _T_328 ? 2'h3 : _T_726;
  assign _T_728 = _T_324 ? 2'h3 : _T_727;
  assign _T_729 = _T_320 ? 2'h0 : _T_728;
  assign _T_730 = _T_316 ? 2'h0 : _T_729;
  assign _T_731 = _T_312 ? 2'h0 : _T_730;
  assign _T_732 = _T_308 ? 2'h0 : _T_731;
  assign _T_733 = _T_304 ? 2'h0 : _T_732;
  assign _T_734 = _T_300 ? 2'h0 : _T_733;
  assign _T_735 = _T_296 ? 2'h2 : _T_734;
  assign _T_736 = _T_292 ? 2'h2 : _T_735;
  assign _T_737 = _T_288 ? 2'h0 : _T_736;
  assign _T_738 = _T_284 ? 2'h0 : _T_737;
  assign _T_739 = _T_280 ? 2'h0 : _T_738;
  assign _T_740 = _T_276 ? 2'h0 : _T_739;
  assign _T_741 = _T_272 ? 2'h0 : _T_740;
  assign _T_742 = _T_268 ? 2'h0 : _T_741;
  assign _T_743 = _T_264 ? 2'h0 : _T_742;
  assign _T_744 = _T_260 ? 2'h0 : _T_743;
  assign _T_745 = _T_256 ? 2'h0 : _T_744;
  assign _T_746 = _T_252 ? 2'h0 : _T_745;
  assign _T_747 = _T_248 ? 2'h0 : _T_746;
  assign _T_748 = _T_244 ? 2'h0 : _T_747;
  assign _T_749 = _T_240 ? 2'h0 : _T_748;
  assign _T_750 = _T_236 ? 2'h0 : _T_749;
  assign _T_751 = _T_232 ? 2'h0 : _T_750;
  assign _T_752 = _T_228 ? 2'h0 : _T_751;
  assign _T_753 = _T_224 ? 2'h0 : _T_752;
  assign _T_754 = _T_220 ? 2'h0 : _T_753;
  assign _T_755 = _T_216 ? 2'h0 : _T_754;
  assign _T_756 = _T_212 ? 2'h0 : _T_755;
  assign _T_757 = _T_208 ? 2'h0 : _T_756;
  assign _T_758 = _T_204 ? 2'h0 : _T_757;
  assign _T_759 = _T_200 ? 2'h0 : _T_758;
  assign _T_760 = _T_196 ? 2'h0 : _T_759;
  assign _T_761 = _T_192 ? 2'h1 : _T_760;
  assign _T_762 = _T_188 ? 2'h1 : _T_761;
  assign _T_763 = _T_184 ? 2'h1 : _T_762;
  assign _T_764 = _T_180 ? 2'h1 : _T_763;
  assign cs0_1 = _T_176 ? 2'h1 : _T_764;
  assign _T_778 = _T_320 ? 1'h0 : _T_581;
  assign _T_779 = _T_316 ? 1'h0 : _T_778;
  assign _T_780 = _T_312 ? 1'h0 : _T_779;
  assign _T_781 = _T_308 ? 1'h0 : _T_780;
  assign _T_782 = _T_304 ? 1'h0 : _T_781;
  assign _T_783 = _T_300 ? 1'h0 : _T_782;
  assign _T_784 = _T_296 ? 1'h1 : _T_783;
  assign _T_785 = _T_292 ? 1'h1 : _T_784;
  assign _T_786 = _T_288 ? 1'h1 : _T_785;
  assign _T_787 = _T_284 ? 1'h1 : _T_786;
  assign _T_788 = _T_280 ? 1'h1 : _T_787;
  assign _T_789 = _T_276 ? 1'h1 : _T_788;
  assign _T_790 = _T_272 ? 1'h1 : _T_789;
  assign _T_791 = _T_268 ? 1'h1 : _T_790;
  assign _T_792 = _T_264 ? 1'h1 : _T_791;
  assign _T_793 = _T_260 ? 1'h1 : _T_792;
  assign _T_794 = _T_256 ? 1'h1 : _T_793;
  assign _T_795 = _T_252 ? 1'h1 : _T_794;
  assign _T_796 = _T_248 ? 1'h1 : _T_795;
  assign _T_797 = _T_244 ? 1'h1 : _T_796;
  assign _T_798 = _T_240 ? 1'h1 : _T_797;
  assign _T_799 = _T_236 ? 1'h1 : _T_798;
  assign _T_800 = _T_232 ? 1'h1 : _T_799;
  assign _T_801 = _T_228 ? 1'h1 : _T_800;
  assign _T_802 = _T_224 ? 1'h1 : _T_801;
  assign _T_803 = _T_220 ? 1'h1 : _T_802;
  assign _T_804 = _T_216 ? 1'h1 : _T_803;
  assign _T_805 = _T_212 ? 1'h1 : _T_804;
  assign _T_806 = _T_208 ? 1'h1 : _T_805;
  assign _T_807 = _T_204 ? 1'h0 : _T_806;
  assign _T_808 = _T_200 ? 1'h0 : _T_807;
  assign _T_809 = _T_196 ? 1'h0 : _T_808;
  assign _T_810 = _T_192 ? 1'h1 : _T_809;
  assign _T_811 = _T_188 ? 1'h1 : _T_810;
  assign _T_812 = _T_184 ? 1'h1 : _T_811;
  assign _T_813 = _T_180 ? 1'h1 : _T_812;
  assign cs0_2 = _T_176 ? 1'h1 : _T_813;
  assign _T_815 = _T_368 ? 1'h0 : _T_372;
  assign _T_816 = _T_364 ? 1'h0 : _T_815;
  assign _T_817 = _T_360 ? 1'h0 : _T_816;
  assign _T_818 = _T_356 ? 1'h0 : _T_817;
  assign _T_819 = _T_352 ? 1'h0 : _T_818;
  assign _T_820 = _T_348 ? 1'h0 : _T_819;
  assign _T_821 = _T_344 ? 1'h0 : _T_820;
  assign _T_822 = _T_340 ? 1'h0 : _T_821;
  assign _T_823 = _T_336 ? 1'h0 : _T_822;
  assign _T_824 = _T_332 ? 1'h0 : _T_823;
  assign _T_825 = _T_328 ? 1'h0 : _T_824;
  assign _T_826 = _T_324 ? 1'h0 : _T_825;
  assign _T_827 = _T_320 ? 1'h0 : _T_826;
  assign _T_828 = _T_316 ? 1'h0 : _T_827;
  assign _T_829 = _T_312 ? 1'h0 : _T_828;
  assign _T_830 = _T_308 ? 1'h0 : _T_829;
  assign _T_831 = _T_304 ? 1'h0 : _T_830;
  assign _T_832 = _T_300 ? 1'h0 : _T_831;
  assign _T_833 = _T_296 ? 1'h0 : _T_832;
  assign _T_834 = _T_292 ? 1'h0 : _T_833;
  assign _T_835 = _T_288 ? 1'h0 : _T_834;
  assign _T_836 = _T_284 ? 1'h0 : _T_835;
  assign _T_837 = _T_280 ? 1'h0 : _T_836;
  assign _T_838 = _T_276 ? 1'h0 : _T_837;
  assign _T_839 = _T_272 ? 1'h0 : _T_838;
  assign _T_840 = _T_268 ? 1'h0 : _T_839;
  assign _T_841 = _T_264 ? 1'h0 : _T_840;
  assign _T_842 = _T_260 ? 1'h0 : _T_841;
  assign _T_843 = _T_256 ? 1'h0 : _T_842;
  assign _T_844 = _T_252 ? 1'h0 : _T_843;
  assign _T_845 = _T_248 ? 1'h0 : _T_844;
  assign _T_846 = _T_244 ? 1'h0 : _T_845;
  assign _T_847 = _T_240 ? 1'h0 : _T_846;
  assign _T_848 = _T_236 ? 1'h0 : _T_847;
  assign _T_849 = _T_232 ? 1'h0 : _T_848;
  assign _T_850 = _T_228 ? 1'h0 : _T_849;
  assign _T_851 = _T_224 ? 1'h0 : _T_850;
  assign _T_852 = _T_220 ? 1'h0 : _T_851;
  assign _T_853 = _T_216 ? 1'h0 : _T_852;
  assign _T_854 = _T_212 ? 1'h0 : _T_853;
  assign _T_855 = _T_208 ? 1'h0 : _T_854;
  assign _T_856 = _T_204 ? 1'h1 : _T_855;
  assign _T_857 = _T_200 ? 1'h1 : _T_856;
  assign _T_858 = _T_196 ? 1'h1 : _T_857;
  assign _T_859 = _T_192 ? 1'h1 : _T_858;
  assign _T_860 = _T_188 ? 1'h1 : _T_859;
  assign _T_861 = _T_184 ? 1'h1 : _T_860;
  assign _T_862 = _T_180 ? 1'h1 : _T_861;
  assign cs0_3 = _T_176 ? 1'h1 : _T_862;
  assign _T_906 = _T_200 ? 1'h1 : _T_204;
  assign _T_907 = _T_196 ? 1'h1 : _T_906;
  assign _T_908 = _T_192 ? 1'h0 : _T_907;
  assign _T_909 = _T_188 ? 1'h0 : _T_908;
  assign _T_910 = _T_184 ? 1'h0 : _T_909;
  assign _T_911 = _T_180 ? 1'h0 : _T_910;
  assign cs0_4 = _T_176 ? 1'h0 : _T_911;
  assign _T_954 = _T_204 ? 3'h2 : 3'h0;
  assign _T_955 = _T_200 ? 3'h1 : _T_954;
  assign _T_956 = _T_196 ? 3'h3 : _T_955;
  assign _T_957 = _T_192 ? 3'h6 : _T_956;
  assign _T_958 = _T_188 ? 3'h2 : _T_957;
  assign _T_959 = _T_184 ? 3'h5 : _T_958;
  assign _T_960 = _T_180 ? 3'h1 : _T_959;
  assign cs0_5 = _T_176 ? 3'h3 : _T_960;
  assign _T_964 = _T_360 ? 3'h4 : 3'h0;
  assign _T_965 = _T_356 ? 3'h4 : _T_964;
  assign _T_966 = _T_352 ? 3'h4 : _T_965;
  assign _T_967 = _T_348 ? 3'h4 : _T_966;
  assign _T_968 = _T_344 ? 3'h3 : _T_967;
  assign _T_969 = _T_340 ? 3'h3 : _T_968;
  assign _T_970 = _T_336 ? 3'h2 : _T_969;
  assign _T_971 = _T_332 ? 3'h1 : _T_970;
  assign _T_972 = _T_328 ? 3'h2 : _T_971;
  assign _T_973 = _T_324 ? 3'h1 : _T_972;
  assign _T_974 = _T_320 ? 3'h0 : _T_973;
  assign _T_975 = _T_316 ? 3'h0 : _T_974;
  assign _T_976 = _T_312 ? 3'h0 : _T_975;
  assign _T_977 = _T_308 ? 3'h0 : _T_976;
  assign _T_978 = _T_304 ? 3'h0 : _T_977;
  assign _T_979 = _T_300 ? 3'h0 : _T_978;
  assign _T_980 = _T_296 ? 3'h0 : _T_979;
  assign _T_981 = _T_292 ? 3'h0 : _T_980;
  assign _T_982 = _T_288 ? 3'h0 : _T_981;
  assign _T_983 = _T_284 ? 3'h0 : _T_982;
  assign _T_984 = _T_280 ? 3'h0 : _T_983;
  assign _T_985 = _T_276 ? 3'h0 : _T_984;
  assign _T_986 = _T_272 ? 3'h0 : _T_985;
  assign _T_987 = _T_268 ? 3'h0 : _T_986;
  assign _T_988 = _T_264 ? 3'h0 : _T_987;
  assign _T_989 = _T_260 ? 3'h0 : _T_988;
  assign _T_990 = _T_256 ? 3'h0 : _T_989;
  assign _T_991 = _T_252 ? 3'h0 : _T_990;
  assign _T_992 = _T_248 ? 3'h0 : _T_991;
  assign _T_993 = _T_244 ? 3'h0 : _T_992;
  assign _T_994 = _T_240 ? 3'h0 : _T_993;
  assign _T_995 = _T_236 ? 3'h0 : _T_994;
  assign _T_996 = _T_232 ? 3'h0 : _T_995;
  assign _T_997 = _T_228 ? 3'h0 : _T_996;
  assign _T_998 = _T_224 ? 3'h0 : _T_997;
  assign _T_999 = _T_220 ? 3'h0 : _T_998;
  assign _T_1000 = _T_216 ? 3'h0 : _T_999;
  assign _T_1001 = _T_212 ? 3'h0 : _T_1000;
  assign _T_1002 = _T_208 ? 3'h0 : _T_1001;
  assign _T_1003 = _T_204 ? 3'h0 : _T_1002;
  assign _T_1004 = _T_200 ? 3'h0 : _T_1003;
  assign _T_1005 = _T_196 ? 3'h0 : _T_1004;
  assign _T_1006 = _T_192 ? 3'h0 : _T_1005;
  assign _T_1007 = _T_188 ? 3'h0 : _T_1006;
  assign _T_1008 = _T_184 ? 3'h0 : _T_1007;
  assign _T_1009 = _T_180 ? 3'h0 : _T_1008;
  assign cs0_6 = _T_176 ? 3'h0 : _T_1009;
  assign _T_1012 = _T_364 ? 1'h0 : _T_368;
  assign _T_1013 = _T_360 ? 1'h0 : _T_1012;
  assign _T_1014 = _T_356 ? 1'h0 : _T_1013;
  assign _T_1015 = _T_352 ? 1'h0 : _T_1014;
  assign _T_1016 = _T_348 ? 1'h0 : _T_1015;
  assign _T_1017 = _T_344 ? 1'h0 : _T_1016;
  assign _T_1018 = _T_340 ? 1'h0 : _T_1017;
  assign _T_1019 = _T_336 ? 1'h0 : _T_1018;
  assign _T_1020 = _T_332 ? 1'h0 : _T_1019;
  assign _T_1021 = _T_328 ? 1'h0 : _T_1020;
  assign _T_1022 = _T_324 ? 1'h0 : _T_1021;
  assign _T_1023 = _T_320 ? 1'h0 : _T_1022;
  assign _T_1024 = _T_316 ? 1'h0 : _T_1023;
  assign _T_1025 = _T_312 ? 1'h0 : _T_1024;
  assign _T_1026 = _T_308 ? 1'h0 : _T_1025;
  assign _T_1027 = _T_304 ? 1'h0 : _T_1026;
  assign _T_1028 = _T_300 ? 1'h0 : _T_1027;
  assign _T_1029 = _T_296 ? 1'h0 : _T_1028;
  assign _T_1030 = _T_292 ? 1'h0 : _T_1029;
  assign _T_1031 = _T_288 ? 1'h0 : _T_1030;
  assign _T_1032 = _T_284 ? 1'h0 : _T_1031;
  assign _T_1033 = _T_280 ? 1'h0 : _T_1032;
  assign _T_1034 = _T_276 ? 1'h0 : _T_1033;
  assign _T_1035 = _T_272 ? 1'h0 : _T_1034;
  assign _T_1036 = _T_268 ? 1'h0 : _T_1035;
  assign _T_1037 = _T_264 ? 1'h0 : _T_1036;
  assign _T_1038 = _T_260 ? 1'h0 : _T_1037;
  assign _T_1039 = _T_256 ? 1'h0 : _T_1038;
  assign _T_1040 = _T_252 ? 1'h0 : _T_1039;
  assign _T_1041 = _T_248 ? 1'h0 : _T_1040;
  assign _T_1042 = _T_244 ? 1'h0 : _T_1041;
  assign _T_1043 = _T_240 ? 1'h0 : _T_1042;
  assign _T_1044 = _T_236 ? 1'h0 : _T_1043;
  assign _T_1045 = _T_232 ? 1'h0 : _T_1044;
  assign _T_1046 = _T_228 ? 1'h0 : _T_1045;
  assign _T_1047 = _T_224 ? 1'h0 : _T_1046;
  assign _T_1048 = _T_220 ? 1'h0 : _T_1047;
  assign _T_1049 = _T_216 ? 1'h0 : _T_1048;
  assign _T_1050 = _T_212 ? 1'h0 : _T_1049;
  assign _T_1051 = _T_208 ? 1'h0 : _T_1050;
  assign _T_1052 = _T_204 ? 1'h0 : _T_1051;
  assign _T_1053 = _T_200 ? 1'h0 : _T_1052;
  assign _T_1054 = _T_196 ? 1'h0 : _T_1053;
  assign _T_1055 = _T_192 ? 1'h0 : _T_1054;
  assign _T_1056 = _T_188 ? 1'h0 : _T_1055;
  assign _T_1057 = _T_184 ? 1'h0 : _T_1056;
  assign _T_1058 = _T_180 ? 1'h0 : _T_1057;
  assign cs0_7 = _T_176 ? 1'h0 : _T_1058;
  assign _T_1059 = io_dat_exe_br_type == 4'h0;
  assign _T_1060 = io_dat_exe_br_type == 4'h1;
  assign _T_1062 = io_dat_exe_br_eq == 1'h0;
  assign _T_1063 = _T_1062 ? 2'h1 : 2'h0;
  assign _T_1064 = io_dat_exe_br_type == 4'h2;
  assign _T_1065 = io_dat_exe_br_eq ? 2'h1 : 2'h0;
  assign _T_1066 = io_dat_exe_br_type == 4'h3;
  assign _T_1068 = io_dat_exe_br_lt == 1'h0;
  assign _T_1069 = _T_1068 ? 2'h1 : 2'h0;
  assign _T_1070 = io_dat_exe_br_type == 4'h4;
  assign _T_1072 = io_dat_exe_br_ltu == 1'h0;
  assign _T_1073 = _T_1072 ? 2'h1 : 2'h0;
  assign _T_1074 = io_dat_exe_br_type == 4'h5;
  assign _T_1075 = io_dat_exe_br_lt ? 2'h1 : 2'h0;
  assign _T_1076 = io_dat_exe_br_type == 4'h6;
  assign _T_1077 = io_dat_exe_br_ltu ? 2'h1 : 2'h0;
  assign _T_1078 = io_dat_exe_br_type == 4'h7;
  assign _T_1079 = io_dat_exe_br_type == 4'h8;
  assign _T_1080 = _T_1079 ? 2'h2 : 2'h0;
  assign _T_1081 = _T_1078 ? 2'h1 : _T_1080;
  assign _T_1082 = _T_1076 ? _T_1077 : _T_1081;
  assign _T_1083 = _T_1074 ? _T_1075 : _T_1082;
  assign _T_1084 = _T_1070 ? _T_1073 : _T_1083;
  assign _T_1085 = _T_1066 ? _T_1069 : _T_1084;
  assign _T_1086 = _T_1064 ? _T_1065 : _T_1085;
  assign _T_1087 = _T_1060 ? _T_1063 : _T_1086;
  assign _T_1088 = _T_1059 ? 2'h0 : _T_1087;
  assign ctrl_exe_pc_sel = io_ctl_pipeline_kill ? 2'h3 : _T_1088;
  assign _T_1089 = ctrl_exe_pc_sel != 2'h0;
  assign _T_1093 = _T_1089 | cs0_7;
  assign ifkill = _T_1093 | _T_1095;
  assign _T_1096 = io_dat_csr_eret | io_ctl_mem_exception;
  assign dec_exception = cs_val_inst == 1'h0;
  assign dec_rs1_addr = io_dat_dec_inst[19:15];
  assign dec_rs2_addr = io_dat_dec_inst[24:20];
  assign dec_wbaddr = io_dat_dec_inst[11:7];
  assign dec_rs1_oen = _T_1089 ? 1'h0 : cs_rs1_oen;
  assign dec_rs2_oen = _T_1089 ? 1'h0 : cs_rs2_oen;
  assign _T_1117 = stall == 1'h0;
  assign _T_1119 = full_stall == 1'h0;
  assign _T_1120 = _T_1117 & _T_1119;
  assign _T_1125 = cs0_6 != 3'h0;
  assign _T_1126 = cs0_6 != 3'h4;
  assign _T_1127 = _T_1125 & _T_1126;
  assign _GEN_0 = _T_1089 ? 5'h0 : dec_wbaddr;
  assign _GEN_2 = _T_1089 ? 1'h0 : _T_1127;
  assign _GEN_3 = _T_1089 ? 1'h0 : dec_exception;
  assign _T_1130 = stall & _T_1119;
  assign _GEN_4 = _T_1130 ? 5'h0 : exe_reg_wbaddr;
  assign _GEN_6 = _T_1130 ? 1'h0 : exe_reg_is_csr;
  assign _GEN_7 = _T_1130 ? 1'h0 : exe_reg_exception;
  assign _GEN_8 = _T_1120 ? _GEN_0 : _GEN_4;
  assign _GEN_10 = _T_1120 ? _GEN_2 : _GEN_6;
  assign _GEN_11 = _T_1120 ? _GEN_3 : _GEN_7;
  assign _T_1139 = cs0_4 == 1'h0;
  assign _T_1140 = cs0_3 & _T_1139;
  assign _GEN_12 = _T_1119 ? _T_1140 : exe_inst_is_load;
  assign _T_1141 = exe_reg_wbaddr == dec_rs1_addr;
  assign _T_1142 = exe_inst_is_load & _T_1141;
  assign _T_1144 = exe_reg_wbaddr != 5'h0;
  assign _T_1145 = _T_1142 & _T_1144;
  assign _T_1146 = _T_1145 & dec_rs1_oen;
  assign _T_1147 = exe_reg_wbaddr == dec_rs2_addr;
  assign _T_1148 = exe_inst_is_load & _T_1147;
  assign _T_1151 = _T_1148 & _T_1144;
  assign _T_1152 = _T_1151 & dec_rs2_oen;
  assign _T_1153 = _T_1146 | _T_1152;
  assign _T_1154 = _T_1153 | exe_reg_is_csr;
  assign _T_1157 = io_dat_mem_ctrl_dmem_val & io_dmem_resp_valid;
  assign _T_1159 = io_dat_mem_ctrl_dmem_val == 1'h0;
  assign _T_1160 = _T_1157 | _T_1159;
  assign _T_1162 = _T_1160 == 1'h0;
  assign _T_1166 = cs0_7 | _T_1165;
  assign _T_1169 = cs0_6 == 3'h2;
  assign _T_1170 = cs0_6 == 3'h3;
  assign _T_1171 = _T_1169 | _T_1170;
  assign _T_1173 = dec_rs1_addr == 5'h0;
  assign csr_ren = _T_1171 & _T_1173;
  assign _T_1174 = csr_ren ? 3'h5 : cs0_6;
  assign io_ctl_dec_stall = stall;
  assign io_ctl_full_stall = full_stall;
  assign io_ctl_exe_pc_sel = ctrl_exe_pc_sel;
  assign io_ctl_br_type = cs_br_type;
  assign io_ctl_if_kill = ifkill;
  assign io_ctl_dec_kill = _T_1089;
  assign io_ctl_op1_sel = cs_op1_sel;
  assign io_ctl_op2_sel = cs_op2_sel;
  assign io_ctl_alu_fun = cs0_0;
  assign io_ctl_wb_sel = cs0_1;
  assign io_ctl_rf_wen = cs0_2;
  assign io_ctl_mem_val = cs0_3;
  assign io_ctl_mem_fcn = {{1'd0}, cs0_4};
  assign io_ctl_mem_typ = cs0_5;
  assign io_ctl_csr_cmd = _T_1174;
  assign io_ctl_fencei = _T_1166;
  assign io_ctl_pipeline_kill = _T_1096;
  assign io_ctl_mem_exception = _T_1168;
  assign stall = _T_1154;
  assign full_stall = _T_1162;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  _T_1095 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  exe_reg_wbaddr = _RAND_1[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  exe_reg_exception = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  exe_reg_is_csr = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  exe_inst_is_load = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  _T_1165 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  _T_1168 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (_T_176) begin
      _T_1095 <= 1'h0;
    end else begin
      if (_T_180) begin
        _T_1095 <= 1'h0;
      end else begin
        if (_T_184) begin
          _T_1095 <= 1'h0;
        end else begin
          if (_T_188) begin
            _T_1095 <= 1'h0;
          end else begin
            if (_T_192) begin
              _T_1095 <= 1'h0;
            end else begin
              if (_T_196) begin
                _T_1095 <= 1'h0;
              end else begin
                if (_T_200) begin
                  _T_1095 <= 1'h0;
                end else begin
                  if (_T_204) begin
                    _T_1095 <= 1'h0;
                  end else begin
                    if (_T_208) begin
                      _T_1095 <= 1'h0;
                    end else begin
                      if (_T_212) begin
                        _T_1095 <= 1'h0;
                      end else begin
                        if (_T_216) begin
                          _T_1095 <= 1'h0;
                        end else begin
                          if (_T_220) begin
                            _T_1095 <= 1'h0;
                          end else begin
                            if (_T_224) begin
                              _T_1095 <= 1'h0;
                            end else begin
                              if (_T_228) begin
                                _T_1095 <= 1'h0;
                              end else begin
                                if (_T_232) begin
                                  _T_1095 <= 1'h0;
                                end else begin
                                  if (_T_236) begin
                                    _T_1095 <= 1'h0;
                                  end else begin
                                    if (_T_240) begin
                                      _T_1095 <= 1'h0;
                                    end else begin
                                      if (_T_244) begin
                                        _T_1095 <= 1'h0;
                                      end else begin
                                        if (_T_248) begin
                                          _T_1095 <= 1'h0;
                                        end else begin
                                          if (_T_252) begin
                                            _T_1095 <= 1'h0;
                                          end else begin
                                            if (_T_256) begin
                                              _T_1095 <= 1'h0;
                                            end else begin
                                              if (_T_260) begin
                                                _T_1095 <= 1'h0;
                                              end else begin
                                                if (_T_264) begin
                                                  _T_1095 <= 1'h0;
                                                end else begin
                                                  if (_T_268) begin
                                                    _T_1095 <= 1'h0;
                                                  end else begin
                                                    if (_T_272) begin
                                                      _T_1095 <= 1'h0;
                                                    end else begin
                                                      if (_T_276) begin
                                                        _T_1095 <= 1'h0;
                                                      end else begin
                                                        if (_T_280) begin
                                                          _T_1095 <= 1'h0;
                                                        end else begin
                                                          if (_T_284) begin
                                                            _T_1095 <= 1'h0;
                                                          end else begin
                                                            if (_T_288) begin
                                                              _T_1095 <= 1'h0;
                                                            end else begin
                                                              if (_T_292) begin
                                                                _T_1095 <= 1'h0;
                                                              end else begin
                                                                if (_T_296) begin
                                                                  _T_1095 <= 1'h0;
                                                                end else begin
                                                                  if (_T_300) begin
                                                                    _T_1095 <= 1'h0;
                                                                  end else begin
                                                                    if (_T_304) begin
                                                                      _T_1095 <= 1'h0;
                                                                    end else begin
                                                                      if (_T_308) begin
                                                                        _T_1095 <= 1'h0;
                                                                      end else begin
                                                                        if (_T_312) begin
                                                                          _T_1095 <= 1'h0;
                                                                        end else begin
                                                                          if (_T_316) begin
                                                                            _T_1095 <= 1'h0;
                                                                          end else begin
                                                                            if (_T_320) begin
                                                                              _T_1095 <= 1'h0;
                                                                            end else begin
                                                                              if (_T_324) begin
                                                                                _T_1095 <= 1'h0;
                                                                              end else begin
                                                                                if (_T_328) begin
                                                                                  _T_1095 <= 1'h0;
                                                                                end else begin
                                                                                  if (_T_332) begin
                                                                                    _T_1095 <= 1'h0;
                                                                                  end else begin
                                                                                    if (_T_336) begin
                                                                                      _T_1095 <= 1'h0;
                                                                                    end else begin
                                                                                      if (_T_340) begin
                                                                                        _T_1095 <= 1'h0;
                                                                                      end else begin
                                                                                        if (_T_344) begin
                                                                                          _T_1095 <= 1'h0;
                                                                                        end else begin
                                                                                          if (_T_348) begin
                                                                                            _T_1095 <= 1'h0;
                                                                                          end else begin
                                                                                            if (_T_352) begin
                                                                                              _T_1095 <= 1'h0;
                                                                                            end else begin
                                                                                              if (_T_356) begin
                                                                                                _T_1095 <= 1'h0;
                                                                                              end else begin
                                                                                                if (_T_360) begin
                                                                                                  _T_1095 <= 1'h0;
                                                                                                end else begin
                                                                                                  if (_T_364) begin
                                                                                                    _T_1095 <= 1'h0;
                                                                                                  end else begin
                                                                                                    _T_1095 <= _T_368;
                                                                                                  end
                                                                                                end
                                                                                              end
                                                                                            end
                                                                                          end
                                                                                        end
                                                                                      end
                                                                                    end
                                                                                  end
                                                                                end
                                                                              end
                                                                            end
                                                                          end
                                                                        end
                                                                      end
                                                                    end
                                                                  end
                                                                end
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (_T_1120) begin
      if (_T_1089) begin
        exe_reg_wbaddr <= 5'h0;
      end else begin
        exe_reg_wbaddr <= dec_wbaddr;
      end
    end else begin
      if (_T_1130) begin
        exe_reg_wbaddr <= 5'h0;
      end
    end
    if (reset) begin
      exe_reg_exception <= 1'h0;
    end else begin
      if (_T_1120) begin
        if (_T_1089) begin
          exe_reg_exception <= 1'h0;
        end else begin
          exe_reg_exception <= dec_exception;
        end
      end else begin
        if (_T_1130) begin
          exe_reg_exception <= 1'h0;
        end
      end
    end
    if (reset) begin
      exe_reg_is_csr <= 1'h0;
    end else begin
      if (_T_1120) begin
        if (_T_1089) begin
          exe_reg_is_csr <= 1'h0;
        end else begin
          exe_reg_is_csr <= _T_1127;
        end
      end else begin
        if (_T_1130) begin
          exe_reg_is_csr <= 1'h0;
        end
      end
    end
    if (reset) begin
      exe_inst_is_load <= 1'h0;
    end else begin
      if (_T_1119) begin
        exe_inst_is_load <= _T_1140;
      end
    end
    if (reset | _T_176) begin // inject: init fencei to 0
      _T_1165 <= 1'h0;
    end else begin
      if (_T_180) begin
        _T_1165 <= 1'h0;
      end else begin
        if (_T_184) begin
          _T_1165 <= 1'h0;
        end else begin
          if (_T_188) begin
            _T_1165 <= 1'h0;
          end else begin
            if (_T_192) begin
              _T_1165 <= 1'h0;
            end else begin
              if (_T_196) begin
                _T_1165 <= 1'h0;
              end else begin
                if (_T_200) begin
                  _T_1165 <= 1'h0;
                end else begin
                  if (_T_204) begin
                    _T_1165 <= 1'h0;
                  end else begin
                    if (_T_208) begin
                      _T_1165 <= 1'h0;
                    end else begin
                      if (_T_212) begin
                        _T_1165 <= 1'h0;
                      end else begin
                        if (_T_216) begin
                          _T_1165 <= 1'h0;
                        end else begin
                          if (_T_220) begin
                            _T_1165 <= 1'h0;
                          end else begin
                            if (_T_224) begin
                              _T_1165 <= 1'h0;
                            end else begin
                              if (_T_228) begin
                                _T_1165 <= 1'h0;
                              end else begin
                                if (_T_232) begin
                                  _T_1165 <= 1'h0;
                                end else begin
                                  if (_T_236) begin
                                    _T_1165 <= 1'h0;
                                  end else begin
                                    if (_T_240) begin
                                      _T_1165 <= 1'h0;
                                    end else begin
                                      if (_T_244) begin
                                        _T_1165 <= 1'h0;
                                      end else begin
                                        if (_T_248) begin
                                          _T_1165 <= 1'h0;
                                        end else begin
                                          if (_T_252) begin
                                            _T_1165 <= 1'h0;
                                          end else begin
                                            if (_T_256) begin
                                              _T_1165 <= 1'h0;
                                            end else begin
                                              if (_T_260) begin
                                                _T_1165 <= 1'h0;
                                              end else begin
                                                if (_T_264) begin
                                                  _T_1165 <= 1'h0;
                                                end else begin
                                                  if (_T_268) begin
                                                    _T_1165 <= 1'h0;
                                                  end else begin
                                                    if (_T_272) begin
                                                      _T_1165 <= 1'h0;
                                                    end else begin
                                                      if (_T_276) begin
                                                        _T_1165 <= 1'h0;
                                                      end else begin
                                                        if (_T_280) begin
                                                          _T_1165 <= 1'h0;
                                                        end else begin
                                                          if (_T_284) begin
                                                            _T_1165 <= 1'h0;
                                                          end else begin
                                                            if (_T_288) begin
                                                              _T_1165 <= 1'h0;
                                                            end else begin
                                                              if (_T_292) begin
                                                                _T_1165 <= 1'h0;
                                                              end else begin
                                                                if (_T_296) begin
                                                                  _T_1165 <= 1'h0;
                                                                end else begin
                                                                  if (_T_300) begin
                                                                    _T_1165 <= 1'h0;
                                                                  end else begin
                                                                    if (_T_304) begin
                                                                      _T_1165 <= 1'h0;
                                                                    end else begin
                                                                      if (_T_308) begin
                                                                        _T_1165 <= 1'h0;
                                                                      end else begin
                                                                        if (_T_312) begin
                                                                          _T_1165 <= 1'h0;
                                                                        end else begin
                                                                          if (_T_316) begin
                                                                            _T_1165 <= 1'h0;
                                                                          end else begin
                                                                            if (_T_320) begin
                                                                              _T_1165 <= 1'h0;
                                                                            end else begin
                                                                              if (_T_324) begin
                                                                                _T_1165 <= 1'h0;
                                                                              end else begin
                                                                                if (_T_328) begin
                                                                                  _T_1165 <= 1'h0;
                                                                                end else begin
                                                                                  if (_T_332) begin
                                                                                    _T_1165 <= 1'h0;
                                                                                  end else begin
                                                                                    if (_T_336) begin
                                                                                      _T_1165 <= 1'h0;
                                                                                    end else begin
                                                                                      if (_T_340) begin
                                                                                        _T_1165 <= 1'h0;
                                                                                      end else begin
                                                                                        if (_T_344) begin
                                                                                          _T_1165 <= 1'h0;
                                                                                        end else begin
                                                                                          if (_T_348) begin
                                                                                            _T_1165 <= 1'h0;
                                                                                          end else begin
                                                                                            if (_T_352) begin
                                                                                              _T_1165 <= 1'h0;
                                                                                            end else begin
                                                                                              if (_T_356) begin
                                                                                                _T_1165 <= 1'h0;
                                                                                              end else begin
                                                                                                if (_T_360) begin
                                                                                                  _T_1165 <= 1'h0;
                                                                                                end else begin
                                                                                                  if (_T_364) begin
                                                                                                    _T_1165 <= 1'h0;
                                                                                                  end else begin
                                                                                                    _T_1165 <= _T_368;
                                                                                                  end
                                                                                                end
                                                                                              end
                                                                                            end
                                                                                          end
                                                                                        end
                                                                                      end
                                                                                    end
                                                                                  end
                                                                                end
                                                                              end
                                                                            end
                                                                          end
                                                                        end
                                                                      end
                                                                    end
                                                                  end
                                                                end
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    _T_1168 <= reset ? 0 : exe_reg_exception; // inject: init io.ctl.mem_exception to 0
  end
endmodule
module RegisterFile(
  input         clock,
  input reset, // inject : reset RF
  input  [4:0]  io_rs1_addr,
  output [31:0] io_rs1_data,
  input  [4:0]  io_rs2_addr,
  output [31:0] io_rs2_data,
  input  [4:0]  io_dm_addr,
  output [31:0] io_dm_rdata,
  input  [31:0] io_dm_wdata,
  input  [4:0]  io_waddr,
  input  [31:0] io_wdata,
  input         io_wen
);
  reg [31:0] mem [0:31];
  reg [31:0] _RAND_0;
  wire [31:0] regfile__T_25_data;
  wire [4:0] regfile__T_25_addr;
  wire [31:0] regfile__T_30_data;
  wire [4:0] regfile__T_30_addr;
  wire [31:0] regfile__T_35_data;
  wire [4:0] regfile__T_35_addr;
  wire [31:0] regfile__T_18_data;
  wire [4:0] regfile__T_18_addr;
  wire  regfile__T_18_mask;
  wire  regfile__T_18_en;
  wire [31:0] regfile__T_22_data;
  wire [4:0] regfile__T_22_addr;
  wire  regfile__T_22_mask;
  wire  regfile__T_22_en;
  wire  _T_16;
  wire  _T_17;
  wire  _T_20;
  wire  _T_24;
  wire [31:0] _T_27;
  wire  _T_29;
  wire [31:0] _T_32;
  wire [31:0] _T_37;
  assign regfile__T_25_addr = io_rs1_addr;
  assign regfile__T_25_data = mem[regfile__T_25_addr];
  assign regfile__T_30_addr = io_rs2_addr;
  assign regfile__T_30_data = mem[regfile__T_30_addr];
  assign regfile__T_35_addr = io_dm_addr;
  assign regfile__T_35_data = mem[regfile__T_35_addr];
  assign regfile__T_18_data = io_wdata;
  assign regfile__T_18_addr = io_waddr;
  assign regfile__T_18_mask = _T_17;
  assign regfile__T_18_en = _T_17;
  assign regfile__T_22_data = io_dm_wdata;
  assign regfile__T_22_addr = io_dm_addr;
  assign regfile__T_22_mask = _T_20;
  assign regfile__T_22_en = _T_20;
  assign _T_16 = io_waddr != 5'h0;
  assign _T_17 = io_wen & _T_16;
  assign _T_20 = io_dm_addr != 5'h0;
  assign _T_24 = io_rs1_addr != 5'h0;
  assign _T_27 = _T_24 ? regfile__T_25_data : 32'h0;
  assign _T_29 = io_rs2_addr != 5'h0;
  assign _T_32 = _T_29 ? regfile__T_30_data : 32'h0;
  assign _T_37 = _T_20 ? regfile__T_35_data : 32'h0;
  assign io_rs1_data = _T_27;
  assign io_rs2_data = _T_32;
  assign io_dm_rdata = _T_37;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _RAND_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    mem[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  end
`endif // RANDOMIZE
integer i;
  always @(posedge clock) begin
    if(reset) begin // inject: reset RF
      for(i = 0; i < 32; i=i+1)
        mem[i] <= 0;
    end else begin
    if(regfile__T_18_en & regfile__T_18_mask) begin
      mem[regfile__T_18_addr] <= regfile__T_18_data;
    end
    if(regfile__T_22_en & regfile__T_22_mask) begin
      mem[regfile__T_22_addr] <= regfile__T_22_data;
    end end
  end
endmodule
module CSRFile(
  input         clock,
  input         reset,
  input  [2:0]  io_rw_cmd,
  output [31:0] io_rw_rdata,
  input  [31:0] io_rw_wdata,
  output        io_eret,
  input  [11:0] io_decode_csr,
  output        io_status_debug,
  output [1:0]  io_status_prv,
  output        io_status_sd,
  output [7:0]  io_status_zero1,
  output        io_status_tsr,
  output        io_status_tw,
  output        io_status_tvm,
  output        io_status_mxr,
  output        io_status_sum,
  output        io_status_mprv,
  output [1:0]  io_status_xs,
  output [1:0]  io_status_fs,
  output [1:0]  io_status_mpp,
  output [1:0]  io_status_hpp,
  output        io_status_spp,
  output        io_status_mpie,
  output        io_status_hpie,
  output        io_status_spie,
  output        io_status_upie,
  output        io_status_mie,
  output        io_status_hie,
  output        io_status_sie,
  output        io_status_uie,
  output [31:0] io_evec,
  input         io_exception,
  input         io_retire,
  input  [31:0] io_pc,
  output [31:0] io_time
);
  reg [1:0] reg_mstatus_prv;
  reg [31:0] _RAND_0;
  reg  reg_mstatus_mpie;
  reg [31:0] _RAND_1;
  reg  reg_mstatus_mie;
  reg [31:0] _RAND_2;
  reg [31:0] reg_mepc;
  reg [31:0] _RAND_3;
  reg [31:0] reg_mcause;
  reg [31:0] _RAND_4;
  reg [31:0] reg_mtval;
  reg [31:0] _RAND_5;
  reg [31:0] reg_mscratch;
  reg [31:0] _RAND_6;
  reg [31:0] reg_medeleg;
  reg [31:0] _RAND_7;
  reg  reg_mip_mtip;
  reg [31:0] _RAND_8;
  reg  reg_mip_msip;
  reg [31:0] _RAND_9;
  reg  reg_mie_mtip;
  reg [31:0] _RAND_10;
  reg  reg_mie_msip;
  reg [31:0] _RAND_11;
  reg [5:0] _T_174;
  reg [31:0] _RAND_12;
  wire [6:0] _T_175;
  reg [57:0] _T_178;
  reg [63:0] _RAND_13;
  wire  _T_179;
  wire [58:0] _T_181;
  wire [57:0] _T_182;
  wire [57:0] _GEN_0;
  wire [63:0] _T_183;
  reg [5:0] _T_186;
  reg [31:0] _RAND_14;
  wire [5:0] _GEN_153;
  wire [6:0] _T_187;
  reg [57:0] _T_190;
  reg [63:0] _RAND_15;
  wire  _T_191;
  wire [58:0] _T_193;
  wire [57:0] _T_194;
  wire [57:0] _GEN_1;
  wire [63:0] _T_195;
  reg [39:0] _T_198;
  reg [63:0] _RAND_16;
  wire [40:0] _T_199;
  reg [39:0] _T_201;
  reg [63:0] _RAND_17;
  wire [40:0] _T_202;
  reg [39:0] _T_204;
  reg [63:0] _RAND_18;
  wire [40:0] _T_205;
  reg [39:0] _T_207;
  reg [63:0] _RAND_19;
  wire [40:0] _T_208;
  reg [39:0] _T_210;
  reg [63:0] _RAND_20;
  wire [40:0] _T_211;
  reg [39:0] _T_213;
  reg [63:0] _RAND_21;
  wire [40:0] _T_214;
  reg [39:0] _T_216;
  reg [63:0] _RAND_22;
  wire [40:0] _T_217;
  reg [39:0] _T_219;
  reg [63:0] _RAND_23;
  wire [40:0] _T_220;
  reg [39:0] _T_222;
  reg [63:0] _RAND_24;
  wire [40:0] _T_223;
  reg [39:0] _T_225;
  reg [63:0] _RAND_25;
  wire [40:0] _T_226;
  reg [39:0] _T_228;
  reg [63:0] _RAND_26;
  wire [40:0] _T_229;
  reg [39:0] _T_231;
  reg [63:0] _RAND_27;
  wire [40:0] _T_232;
  reg [39:0] _T_234;
  reg [63:0] _RAND_28;
  wire [40:0] _T_235;
  reg [39:0] _T_237;
  reg [63:0] _RAND_29;
  wire [40:0] _T_238;
  reg [39:0] _T_240;
  reg [63:0] _RAND_30;
  wire [40:0] _T_241;
  reg [39:0] _T_243;
  reg [63:0] _RAND_31;
  wire [40:0] _T_244;
  reg [39:0] _T_246;
  reg [63:0] _RAND_32;
  wire [40:0] _T_247;
  reg [39:0] _T_249;
  reg [63:0] _RAND_33;
  wire [40:0] _T_250;
  reg [39:0] _T_252;
  reg [63:0] _RAND_34;
  wire [40:0] _T_253;
  reg [39:0] _T_255;
  reg [63:0] _RAND_35;
  wire [40:0] _T_256;
  reg [39:0] _T_258;
  reg [63:0] _RAND_36;
  wire [40:0] _T_259;
  reg [39:0] _T_261;
  reg [63:0] _RAND_37;
  wire [40:0] _T_262;
  reg [39:0] _T_264;
  reg [63:0] _RAND_38;
  wire [40:0] _T_265;
  reg [39:0] _T_267;
  reg [63:0] _RAND_39;
  wire [40:0] _T_268;
  reg [39:0] _T_270;
  reg [63:0] _RAND_40;
  wire [40:0] _T_271;
  reg [39:0] _T_273;
  reg [63:0] _RAND_41;
  wire [40:0] _T_274;
  reg [39:0] _T_276;
  reg [63:0] _RAND_42;
  wire [40:0] _T_277;
  reg [39:0] _T_279;
  reg [63:0] _RAND_43;
  wire [40:0] _T_280;
  reg [39:0] _T_282;
  reg [63:0] _RAND_44;
  wire [40:0] _T_283;
  reg [39:0] _T_285;
  reg [63:0] _RAND_45;
  wire [40:0] _T_286;
  reg [39:0] _T_288;
  reg [63:0] _RAND_46;
  wire [40:0] _T_289;
  reg [39:0] _T_291;
  reg [63:0] _RAND_47;
  wire [40:0] _T_292;
  wire [1:0] new_prv;
  reg [31:0] reg_dpc;
  reg [31:0] _RAND_48;
  reg [31:0] reg_dscratch;
  reg [31:0] _RAND_49;
  reg  reg_dcsr_ebreakm;
  reg [31:0] _RAND_50;
  reg  reg_dcsr_step;
  reg [31:0] _RAND_51;
  wire  system_insn;
  wire  _T_408;
  wire  _T_410;
  wire  cpu_ren;
  wire [1:0] _T_411;
  wire [1:0] _T_412;
  wire [2:0] _T_413;
  wire [4:0] _T_414;
  wire [1:0] _T_415;
  wire [2:0] _T_416;
  wire [3:0] _T_417;
  wire [4:0] _T_418;
  wire [7:0] _T_419;
  wire [12:0] _T_420;
  wire [2:0] _T_421;
  wire [4:0] _T_422;
  wire [1:0] _T_423;
  wire [2:0] _T_424;
  wire [7:0] _T_425;
  wire [8:0] _T_426;
  wire [9:0] _T_427;
  wire [2:0] _T_428;
  wire [3:0] _T_429;
  wire [13:0] _T_430;
  wire [21:0] _T_431;
  wire [34:0] read_mstatus;
  wire [1:0] _T_439;
  wire [3:0] _T_440;
  wire [1:0] _T_442;
  wire [3:0] _T_443;
  wire [7:0] _T_444;
  wire [15:0] _T_452;
  wire [1:0] _T_454;
  wire [3:0] _T_455;
  wire [1:0] _T_457;
  wire [3:0] _T_458;
  wire [7:0] _T_459;
  wire [15:0] _T_467;
  wire [2:0] _T_468;
  wire [4:0] _T_469;
  wire [10:0] _T_473;
  wire [12:0] _T_477;
  wire [16:0] _T_479;
  wire [20:0] _T_480;
  wire [31:0] _T_481;
  wire  _T_485;
  wire  _T_487;
  wire  _T_489;
  wire  _T_495;
  wire  _T_497;
  wire  _T_499;
  wire  _T_501;
  wire  _T_503;
  wire  _T_505;
  wire  _T_507;
  wire  _T_509;
  wire  _T_511;
  wire  _T_515;
  wire  _T_517;
  wire  _T_519;
  wire  _T_521;
  wire  _T_523;
  wire  _T_525;
  wire  _T_527;
  wire  _T_529;
  wire  _T_531;
  wire  _T_533;
  wire  _T_535;
  wire  _T_537;
  wire  _T_539;
  wire  _T_541;
  wire  _T_543;
  wire  _T_545;
  wire  _T_547;
  wire  _T_549;
  wire  _T_551;
  wire  _T_553;
  wire  _T_555;
  wire  _T_557;
  wire  _T_559;
  wire  _T_561;
  wire  _T_563;
  wire  _T_565;
  wire  _T_567;
  wire  _T_569;
  wire  _T_571;
  wire  _T_573;
  wire  _T_575;
  wire  _T_577;
  wire  _T_579;
  wire  _T_581;
  wire  _T_583;
  wire  _T_585;
  wire  _T_587;
  wire  _T_589;
  wire  _T_591;
  wire  _T_593;
  wire  _T_595;
  wire  _T_597;
  wire  _T_599;
  wire  _T_601;
  wire  _T_603;
  wire  _T_605;
  wire  _T_607;
  wire  _T_609;
  wire  _T_611;
  wire  _T_613;
  wire  _T_615;
  wire  _T_617;
  wire  _T_619;
  wire  _T_621;
  wire  _T_623;
  wire  _T_625;
  wire  _T_627;
  wire  _T_629;
  wire  _T_631;
  wire  _T_633;
  wire  _T_635;
  wire  _T_637;
  wire  _T_639;
  wire  _T_641;
  wire  _T_643;
  wire  _T_645;
  wire  _T_647;
  wire  _T_649;
  wire  _T_651;
  wire  _T_653;
  wire [1:0] _T_654;
  wire  priv_sufficient;
  wire [1:0] _T_655;
  wire [1:0] _T_656;
  wire  read_only;
  wire  _T_658;
  wire  _T_659;
  wire  cpu_wen;
  wire  _T_661;
  wire  wen;
  wire  _T_662;
  wire  _T_663;
  wire  _T_664;
  wire [31:0] _T_666;
  wire [31:0] _T_667;
  wire [31:0] _T_670;
  wire [31:0] _T_671;
  wire [31:0] wdata;
  wire [2:0] _T_673;
  wire [7:0] opcode;
  wire  _T_674;
  wire  insn_call;
  wire  _T_675;
  wire  insn_break;
  wire  _T_676;
  wire  _T_677;
  wire  insn_ret;
  wire  _T_960;
  wire  _T_961;
  wire [31:0] _GEN_2;
  wire [31:0] _GEN_4;
  wire [1:0] _T_964;
  wire  _T_966;
  wire  _T_968;
  wire  _T_970;
  wire  _T_973;
  wire  _T_974;
  wire [1:0] _GEN_6;
  wire [31:0] _GEN_8;
  wire  _T_978;
  wire  _T_979;
  wire  _GEN_9;
  wire  _GEN_10;
  wire [1:0] _GEN_11;
  wire [31:0] _GEN_12;
  wire [3:0] _GEN_154;
  wire [4:0] _T_983;
  wire [3:0] _T_984;
  wire [31:0] _GEN_13;
  wire [31:0] _GEN_14;
  wire [31:0] _GEN_15;
  wire [31:0] _GEN_16;
  wire [63:0] _T_989;
  wire [63:0] _T_991;
  wire [15:0] _T_993;
  wire [8:0] _T_999;
  wire [34:0] _T_1001;
  wire [8:0] _T_1003;
  wire [15:0] _T_1005;
  wire [15:0] _T_1007;
  wire [31:0] _T_1009;
  wire [31:0] _T_1011;
  wire [31:0] _T_1013;
  wire [31:0] _T_1015;
  wire [31:0] _T_1019;
  wire [31:0] _T_1021;
  wire [31:0] _T_1023;
  wire [31:0] _T_1025;
  wire [39:0] _T_1027;
  wire [39:0] _T_1029;
  wire [39:0] _T_1031;
  wire [39:0] _T_1033;
  wire [39:0] _T_1035;
  wire [39:0] _T_1037;
  wire [39:0] _T_1039;
  wire [39:0] _T_1041;
  wire [39:0] _T_1043;
  wire [39:0] _T_1045;
  wire [39:0] _T_1047;
  wire [39:0] _T_1049;
  wire [39:0] _T_1051;
  wire [39:0] _T_1053;
  wire [39:0] _T_1055;
  wire [39:0] _T_1057;
  wire [39:0] _T_1059;
  wire [39:0] _T_1061;
  wire [39:0] _T_1063;
  wire [39:0] _T_1065;
  wire [39:0] _T_1067;
  wire [39:0] _T_1069;
  wire [39:0] _T_1071;
  wire [39:0] _T_1073;
  wire [39:0] _T_1075;
  wire [39:0] _T_1077;
  wire [39:0] _T_1079;
  wire [39:0] _T_1081;
  wire [39:0] _T_1083;
  wire [39:0] _T_1085;
  wire [39:0] _T_1087;
  wire [39:0] _T_1089;
  wire [39:0] _T_1091;
  wire [39:0] _T_1093;
  wire [39:0] _T_1095;
  wire [39:0] _T_1097;
  wire [39:0] _T_1099;
  wire [39:0] _T_1101;
  wire [39:0] _T_1103;
  wire [39:0] _T_1105;
  wire [39:0] _T_1107;
  wire [39:0] _T_1109;
  wire [39:0] _T_1111;
  wire [39:0] _T_1113;
  wire [39:0] _T_1115;
  wire [39:0] _T_1117;
  wire [39:0] _T_1119;
  wire [39:0] _T_1121;
  wire [39:0] _T_1123;
  wire [39:0] _T_1125;
  wire [39:0] _T_1127;
  wire [39:0] _T_1129;
  wire [39:0] _T_1131;
  wire [39:0] _T_1133;
  wire [39:0] _T_1135;
  wire [39:0] _T_1137;
  wire [39:0] _T_1139;
  wire [39:0] _T_1141;
  wire [39:0] _T_1143;
  wire [39:0] _T_1145;
  wire [39:0] _T_1147;
  wire [39:0] _T_1149;
  wire [39:0] _T_1151;
  wire [39:0] _T_1153;
  wire [63:0] _T_1158;
  wire [63:0] _GEN_155;
  wire [63:0] _T_1159;
  wire [63:0] _GEN_156;
  wire [63:0] _T_1162;
  wire [63:0] _GEN_157;
  wire [63:0] _T_1163;
  wire [63:0] _GEN_158;
  wire [63:0] _T_1164;
  wire [63:0] _GEN_159;
  wire [63:0] _T_1165;
  wire [63:0] _GEN_160;
  wire [63:0] _T_1166;
  wire [63:0] _GEN_161;
  wire [63:0] _T_1167;
  wire [63:0] _GEN_162;
  wire [63:0] _T_1168;
  wire [63:0] _GEN_163;
  wire [63:0] _T_1169;
  wire [63:0] _GEN_164;
  wire [63:0] _T_1170;
  wire [63:0] _GEN_165;
  wire [63:0] _T_1172;
  wire [63:0] _GEN_166;
  wire [63:0] _T_1173;
  wire [63:0] _GEN_167;
  wire [63:0] _T_1174;
  wire [63:0] _GEN_168;
  wire [63:0] _T_1175;
  wire [63:0] _GEN_169;
  wire [63:0] _T_1176;
  wire [63:0] _GEN_170;
  wire [63:0] _T_1177;
  wire [63:0] _GEN_171;
  wire [63:0] _T_1178;
  wire [63:0] _GEN_172;
  wire [63:0] _T_1179;
  wire [63:0] _GEN_173;
  wire [63:0] _T_1180;
  wire [63:0] _GEN_174;
  wire [63:0] _T_1181;
  wire [63:0] _GEN_175;
  wire [63:0] _T_1182;
  wire [63:0] _GEN_176;
  wire [63:0] _T_1183;
  wire [63:0] _GEN_177;
  wire [63:0] _T_1184;
  wire [63:0] _GEN_178;
  wire [63:0] _T_1185;
  wire [63:0] _GEN_179;
  wire [63:0] _T_1186;
  wire [63:0] _GEN_180;
  wire [63:0] _T_1187;
  wire [63:0] _GEN_181;
  wire [63:0] _T_1188;
  wire [63:0] _GEN_182;
  wire [63:0] _T_1189;
  wire [63:0] _GEN_183;
  wire [63:0] _T_1190;
  wire [63:0] _GEN_184;
  wire [63:0] _T_1191;
  wire [63:0] _GEN_185;
  wire [63:0] _T_1192;
  wire [63:0] _GEN_186;
  wire [63:0] _T_1193;
  wire [63:0] _GEN_187;
  wire [63:0] _T_1194;
  wire [63:0] _GEN_188;
  wire [63:0] _T_1195;
  wire [63:0] _GEN_189;
  wire [63:0] _T_1196;
  wire [63:0] _GEN_190;
  wire [63:0] _T_1197;
  wire [63:0] _GEN_191;
  wire [63:0] _T_1198;
  wire [63:0] _GEN_192;
  wire [63:0] _T_1199;
  wire [63:0] _GEN_193;
  wire [63:0] _T_1200;
  wire [63:0] _GEN_194;
  wire [63:0] _T_1201;
  wire [63:0] _GEN_195;
  wire [63:0] _T_1202;
  wire [63:0] _GEN_196;
  wire [63:0] _T_1203;
  wire [63:0] _GEN_197;
  wire [63:0] _T_1204;
  wire [63:0] _GEN_198;
  wire [63:0] _T_1205;
  wire [63:0] _GEN_199;
  wire [63:0] _T_1206;
  wire [63:0] _GEN_200;
  wire [63:0] _T_1207;
  wire [63:0] _GEN_201;
  wire [63:0] _T_1208;
  wire [63:0] _GEN_202;
  wire [63:0] _T_1209;
  wire [63:0] _GEN_203;
  wire [63:0] _T_1210;
  wire [63:0] _GEN_204;
  wire [63:0] _T_1211;
  wire [63:0] _GEN_205;
  wire [63:0] _T_1212;
  wire [63:0] _GEN_206;
  wire [63:0] _T_1213;
  wire [63:0] _GEN_207;
  wire [63:0] _T_1214;
  wire [63:0] _GEN_208;
  wire [63:0] _T_1215;
  wire [63:0] _GEN_209;
  wire [63:0] _T_1216;
  wire [63:0] _GEN_210;
  wire [63:0] _T_1217;
  wire [63:0] _GEN_211;
  wire [63:0] _T_1218;
  wire [63:0] _GEN_212;
  wire [63:0] _T_1219;
  wire [63:0] _GEN_213;
  wire [63:0] _T_1220;
  wire [63:0] _GEN_214;
  wire [63:0] _T_1221;
  wire [63:0] _GEN_215;
  wire [63:0] _T_1222;
  wire [63:0] _GEN_216;
  wire [63:0] _T_1223;
  wire [63:0] _GEN_217;
  wire [63:0] _T_1224;
  wire [63:0] _GEN_218;
  wire [63:0] _T_1225;
  wire [63:0] _GEN_219;
  wire [63:0] _T_1226;
  wire [63:0] _GEN_220;
  wire [63:0] _T_1227;
  wire [63:0] _GEN_221;
  wire [63:0] _T_1228;
  wire [63:0] _GEN_222;
  wire [63:0] _T_1229;
  wire [63:0] _GEN_223;
  wire [63:0] _T_1230;
  wire [63:0] _GEN_224;
  wire [63:0] _T_1231;
  wire [63:0] _GEN_225;
  wire [63:0] _T_1232;
  wire [63:0] _GEN_226;
  wire [63:0] _T_1233;
  wire [63:0] _GEN_227;
  wire [63:0] _T_1234;
  wire [63:0] _GEN_228;
  wire [63:0] _T_1235;
  wire [63:0] _GEN_229;
  wire [63:0] _T_1236;
  wire [63:0] _GEN_230;
  wire [63:0] _T_1237;
  wire [63:0] _GEN_231;
  wire [63:0] _T_1238;
  wire [63:0] _GEN_232;
  wire [63:0] _T_1239;
  wire [63:0] _T_1243;
  wire  _T_1246_ebreakm;
  wire  _T_1246_step;
  wire [31:0] _T_1248;
  wire  _T_1250;
  wire  _T_1260;
  wire  _GEN_17;
  wire  _GEN_18;
  wire  _T_1266_mpie;
  wire  _T_1266_mie;
  wire [34:0] _T_1268;
  wire  _T_1272;
  wire  _T_1276;
  wire  _GEN_19;
  wire  _GEN_20;
  wire  _T_1294_msip;
  wire [15:0] _T_1296;
  wire  _T_1300;
  wire  _GEN_21;
  wire  _T_1315_mtip;
  wire  _T_1315_msip;
  wire [15:0] _T_1317;
  wire  _T_1321;
  wire  _T_1325;
  wire  _GEN_22;
  wire  _GEN_23;
  wire [7:0] _T_1334;
  wire [31:0] _T_1335;
  wire [39:0] _T_1336;
  wire [40:0] _GEN_24;
  wire [7:0] _T_1337;
  wire [39:0] _T_1338;
  wire [40:0] _GEN_25;
  wire [31:0] _T_1340;
  wire [39:0] _T_1341;
  wire [40:0] _GEN_26;
  wire [7:0] _T_1342;
  wire [39:0] _T_1343;
  wire [40:0] _GEN_27;
  wire [31:0] _T_1345;
  wire [39:0] _T_1346;
  wire [40:0] _GEN_28;
  wire [7:0] _T_1347;
  wire [39:0] _T_1348;
  wire [40:0] _GEN_29;
  wire [31:0] _T_1350;
  wire [39:0] _T_1351;
  wire [40:0] _GEN_30;
  wire [7:0] _T_1352;
  wire [39:0] _T_1353;
  wire [40:0] _GEN_31;
  wire [31:0] _T_1355;
  wire [39:0] _T_1356;
  wire [40:0] _GEN_32;
  wire [7:0] _T_1357;
  wire [39:0] _T_1358;
  wire [40:0] _GEN_33;
  wire [31:0] _T_1360;
  wire [39:0] _T_1361;
  wire [40:0] _GEN_34;
  wire [7:0] _T_1362;
  wire [39:0] _T_1363;
  wire [40:0] _GEN_35;
  wire [31:0] _T_1365;
  wire [39:0] _T_1366;
  wire [40:0] _GEN_36;
  wire [7:0] _T_1367;
  wire [39:0] _T_1368;
  wire [40:0] _GEN_37;
  wire [31:0] _T_1370;
  wire [39:0] _T_1371;
  wire [40:0] _GEN_38;
  wire [7:0] _T_1372;
  wire [39:0] _T_1373;
  wire [40:0] _GEN_39;
  wire [31:0] _T_1375;
  wire [39:0] _T_1376;
  wire [40:0] _GEN_40;
  wire [7:0] _T_1377;
  wire [39:0] _T_1378;
  wire [40:0] _GEN_41;
  wire [31:0] _T_1380;
  wire [39:0] _T_1381;
  wire [40:0] _GEN_42;
  wire [7:0] _T_1382;
  wire [39:0] _T_1383;
  wire [40:0] _GEN_43;
  wire [31:0] _T_1385;
  wire [39:0] _T_1386;
  wire [40:0] _GEN_44;
  wire [7:0] _T_1387;
  wire [39:0] _T_1388;
  wire [40:0] _GEN_45;
  wire [31:0] _T_1390;
  wire [39:0] _T_1391;
  wire [40:0] _GEN_46;
  wire [7:0] _T_1392;
  wire [39:0] _T_1393;
  wire [40:0] _GEN_47;
  wire [31:0] _T_1395;
  wire [39:0] _T_1396;
  wire [40:0] _GEN_48;
  wire [7:0] _T_1397;
  wire [39:0] _T_1398;
  wire [40:0] _GEN_49;
  wire [31:0] _T_1400;
  wire [39:0] _T_1401;
  wire [40:0] _GEN_50;
  wire [7:0] _T_1402;
  wire [39:0] _T_1403;
  wire [40:0] _GEN_51;
  wire [31:0] _T_1405;
  wire [39:0] _T_1406;
  wire [40:0] _GEN_52;
  wire [7:0] _T_1407;
  wire [39:0] _T_1408;
  wire [40:0] _GEN_53;
  wire [31:0] _T_1410;
  wire [39:0] _T_1411;
  wire [40:0] _GEN_54;
  wire [7:0] _T_1412;
  wire [39:0] _T_1413;
  wire [40:0] _GEN_55;
  wire [31:0] _T_1415;
  wire [39:0] _T_1416;
  wire [40:0] _GEN_56;
  wire [7:0] _T_1417;
  wire [39:0] _T_1418;
  wire [40:0] _GEN_57;
  wire [31:0] _T_1420;
  wire [39:0] _T_1421;
  wire [40:0] _GEN_58;
  wire [7:0] _T_1422;
  wire [39:0] _T_1423;
  wire [40:0] _GEN_59;
  wire [31:0] _T_1425;
  wire [39:0] _T_1426;
  wire [40:0] _GEN_60;
  wire [7:0] _T_1427;
  wire [39:0] _T_1428;
  wire [40:0] _GEN_61;
  wire [31:0] _T_1430;
  wire [39:0] _T_1431;
  wire [40:0] _GEN_62;
  wire [7:0] _T_1432;
  wire [39:0] _T_1433;
  wire [40:0] _GEN_63;
  wire [31:0] _T_1435;
  wire [39:0] _T_1436;
  wire [40:0] _GEN_64;
  wire [7:0] _T_1437;
  wire [39:0] _T_1438;
  wire [40:0] _GEN_65;
  wire [31:0] _T_1440;
  wire [39:0] _T_1441;
  wire [40:0] _GEN_66;
  wire [7:0] _T_1442;
  wire [39:0] _T_1443;
  wire [40:0] _GEN_67;
  wire [31:0] _T_1445;
  wire [39:0] _T_1446;
  wire [40:0] _GEN_68;
  wire [7:0] _T_1447;
  wire [39:0] _T_1448;
  wire [40:0] _GEN_69;
  wire [31:0] _T_1450;
  wire [39:0] _T_1451;
  wire [40:0] _GEN_70;
  wire [7:0] _T_1452;
  wire [39:0] _T_1453;
  wire [40:0] _GEN_71;
  wire [31:0] _T_1455;
  wire [39:0] _T_1456;
  wire [40:0] _GEN_72;
  wire [7:0] _T_1457;
  wire [39:0] _T_1458;
  wire [40:0] _GEN_73;
  wire [31:0] _T_1460;
  wire [39:0] _T_1461;
  wire [40:0] _GEN_74;
  wire [7:0] _T_1462;
  wire [39:0] _T_1463;
  wire [40:0] _GEN_75;
  wire [31:0] _T_1465;
  wire [39:0] _T_1466;
  wire [40:0] _GEN_76;
  wire [7:0] _T_1467;
  wire [39:0] _T_1468;
  wire [40:0] _GEN_77;
  wire [31:0] _T_1470;
  wire [39:0] _T_1471;
  wire [40:0] _GEN_78;
  wire [7:0] _T_1472;
  wire [39:0] _T_1473;
  wire [40:0] _GEN_79;
  wire [31:0] _T_1475;
  wire [39:0] _T_1476;
  wire [40:0] _GEN_80;
  wire [7:0] _T_1477;
  wire [39:0] _T_1478;
  wire [40:0] _GEN_81;
  wire [31:0] _T_1480;
  wire [39:0] _T_1481;
  wire [40:0] _GEN_82;
  wire [7:0] _T_1482;
  wire [39:0] _T_1483;
  wire [40:0] _GEN_83;
  wire [31:0] _T_1485;
  wire [39:0] _T_1486;
  wire [40:0] _GEN_84;
  wire [7:0] _T_1487;
  wire [39:0] _T_1488;
  wire [40:0] _GEN_85;
  wire [31:0] _T_1490;
  wire [39:0] _T_1491;
  wire [40:0] _GEN_86;
  wire [7:0] _T_1492;
  wire [39:0] _T_1493;
  wire [40:0] _GEN_87;
  wire [31:0] _T_1495;
  wire [63:0] _T_1496;
  wire [57:0] _T_1497;
  wire [63:0] _GEN_88;
  wire [57:0] _GEN_89;
  wire [31:0] _T_1498;
  wire [63:0] _T_1499;
  wire [57:0] _T_1500;
  wire [63:0] _GEN_90;
  wire [57:0] _GEN_91;
  wire [31:0] _T_1502;
  wire [63:0] _T_1503;
  wire [57:0] _T_1504;
  wire [63:0] _GEN_92;
  wire [57:0] _GEN_93;
  wire [31:0] _T_1505;
  wire [63:0] _T_1506;
  wire [57:0] _T_1507;
  wire [63:0] _GEN_94;
  wire [57:0] _GEN_95;
  wire [31:0] _GEN_96;
  wire [31:0] _GEN_97;
  wire [31:0] _T_1510;
  wire [34:0] _GEN_233;
  wire [34:0] _T_1512;
  wire [34:0] _GEN_98;
  wire [31:0] _GEN_99;
  wire [31:0] _T_1514;
  wire [31:0] _GEN_100;
  wire [31:0] _GEN_101;
  wire [31:0] _GEN_102;
  wire  _GEN_103;
  wire  _GEN_104;
  wire  _GEN_105;
  wire  _GEN_106;
  wire  _GEN_107;
  wire  _GEN_108;
  wire  _GEN_109;
  wire [40:0] _GEN_110;
  wire [40:0] _GEN_111;
  wire [40:0] _GEN_112;
  wire [40:0] _GEN_113;
  wire [40:0] _GEN_114;
  wire [40:0] _GEN_115;
  wire [40:0] _GEN_116;
  wire [40:0] _GEN_117;
  wire [40:0] _GEN_118;
  wire [40:0] _GEN_119;
  wire [40:0] _GEN_120;
  wire [40:0] _GEN_121;
  wire [40:0] _GEN_122;
  wire [40:0] _GEN_123;
  wire [40:0] _GEN_124;
  wire [40:0] _GEN_125;
  wire [40:0] _GEN_126;
  wire [40:0] _GEN_127;
  wire [40:0] _GEN_128;
  wire [40:0] _GEN_129;
  wire [40:0] _GEN_130;
  wire [40:0] _GEN_131;
  wire [40:0] _GEN_132;
  wire [40:0] _GEN_133;
  wire [40:0] _GEN_134;
  wire [40:0] _GEN_135;
  wire [40:0] _GEN_136;
  wire [40:0] _GEN_137;
  wire [40:0] _GEN_138;
  wire [40:0] _GEN_139;
  wire [40:0] _GEN_140;
  wire [40:0] _GEN_141;
  wire [63:0] _GEN_142;
  wire [57:0] _GEN_143;
  wire [63:0] _GEN_144;
  wire [57:0] _GEN_145;
  wire [31:0] _GEN_146;
  wire [31:0] _GEN_147;
  wire [34:0] _GEN_148;
  wire [31:0] _GEN_149;
  wire [31:0] _GEN_150;
  wire [31:0] _GEN_151;
  wire [31:0] _GEN_152;
  assign _T_175 = _T_174 + 6'h1;
  assign _T_179 = _T_175[6];
  assign _T_181 = _T_178 + 58'h1;
  assign _T_182 = _T_181[57:0];
  assign _GEN_0 = _T_179 ? _T_182 : _T_178;
  assign _T_183 = {_T_178,_T_174};
  assign _GEN_153 = {{5'd0}, io_retire};
  assign _T_187 = _T_186 + _GEN_153;
  assign _T_191 = _T_187[6];
  assign _T_193 = _T_190 + 58'h1;
  assign _T_194 = _T_193[57:0];
  assign _GEN_1 = _T_191 ? _T_194 : _T_190;
  assign _T_195 = {_T_190,_T_186};
  assign _T_199 = _T_198 + 40'h0;
  assign _T_202 = _T_201 + 40'h0;
  assign _T_205 = _T_204 + 40'h0;
  assign _T_208 = _T_207 + 40'h0;
  assign _T_211 = _T_210 + 40'h0;
  assign _T_214 = _T_213 + 40'h0;
  assign _T_217 = _T_216 + 40'h0;
  assign _T_220 = _T_219 + 40'h0;
  assign _T_223 = _T_222 + 40'h0;
  assign _T_226 = _T_225 + 40'h0;
  assign _T_229 = _T_228 + 40'h0;
  assign _T_232 = _T_231 + 40'h0;
  assign _T_235 = _T_234 + 40'h0;
  assign _T_238 = _T_237 + 40'h0;
  assign _T_241 = _T_240 + 40'h0;
  assign _T_244 = _T_243 + 40'h0;
  assign _T_247 = _T_246 + 40'h0;
  assign _T_250 = _T_249 + 40'h0;
  assign _T_253 = _T_252 + 40'h0;
  assign _T_256 = _T_255 + 40'h0;
  assign _T_259 = _T_258 + 40'h0;
  assign _T_262 = _T_261 + 40'h0;
  assign _T_265 = _T_264 + 40'h0;
  assign _T_268 = _T_267 + 40'h0;
  assign _T_271 = _T_270 + 40'h0;
  assign _T_274 = _T_273 + 40'h0;
  assign _T_277 = _T_276 + 40'h0;
  assign _T_280 = _T_279 + 40'h0;
  assign _T_283 = _T_282 + 40'h0;
  assign _T_286 = _T_285 + 40'h0;
  assign _T_289 = _T_288 + 40'h0;
  assign _T_292 = _T_291 + 40'h0;
  assign system_insn = io_rw_cmd == 3'h4;
  assign _T_408 = io_rw_cmd != 3'h0;
  assign _T_410 = system_insn == 1'h0;
  assign cpu_ren = _T_408 & _T_410;
  assign _T_411 = {io_status_sie,io_status_uie};
  assign _T_412 = {io_status_upie,io_status_mie};
  assign _T_413 = {_T_412,io_status_hie};
  assign _T_414 = {_T_413,_T_411};
  assign _T_415 = {io_status_mpie,io_status_hpie};
  assign _T_416 = {_T_415,io_status_spie};
  assign _T_417 = {io_status_mpp,io_status_hpp};
  assign _T_418 = {_T_417,io_status_spp};
  assign _T_419 = {_T_418,_T_416};
  assign _T_420 = {_T_419,_T_414};
  assign _T_421 = {io_status_mprv,io_status_xs};
  assign _T_422 = {_T_421,io_status_fs};
  assign _T_423 = {io_status_tvm,io_status_mxr};
  assign _T_424 = {_T_423,io_status_sum};
  assign _T_425 = {_T_424,_T_422};
  assign _T_426 = {io_status_zero1,io_status_tsr};
  assign _T_427 = {_T_426,io_status_tw};
  assign _T_428 = {io_status_debug,io_status_prv};
  assign _T_429 = {_T_428,io_status_sd};
  assign _T_430 = {_T_429,_T_427};
  assign _T_431 = {_T_430,_T_425};
  assign read_mstatus = {_T_431,_T_420};
  assign _T_439 = {reg_mip_msip,1'h0};
  assign _T_440 = {_T_439,2'h0};
  assign _T_442 = {reg_mip_mtip,1'h0};
  assign _T_443 = {_T_442,2'h0};
  assign _T_444 = {_T_443,_T_440};
  assign _T_452 = {8'h0,_T_444};
  assign _T_454 = {reg_mie_msip,1'h0};
  assign _T_455 = {_T_454,2'h0};
  assign _T_457 = {reg_mie_mtip,1'h0};
  assign _T_458 = {_T_457,2'h0};
  assign _T_459 = {_T_458,_T_455};
  assign _T_467 = {8'h0,_T_459};
  assign _T_468 = {2'h0,reg_dcsr_step};
  assign _T_469 = {_T_468,2'h3};
  assign _T_473 = {6'h0,_T_469};
  assign _T_477 = {12'h0,reg_dcsr_ebreakm};
  assign _T_479 = {4'h4,_T_477};
  assign _T_480 = {_T_479,4'h0};
  assign _T_481 = {_T_480,_T_473};
  assign _T_485 = io_decode_csr == 12'hb00;
  assign _T_487 = io_decode_csr == 12'hb02;
  assign _T_489 = io_decode_csr == 12'hf13;
  assign _T_495 = io_decode_csr == 12'h301;
  assign _T_497 = io_decode_csr == 12'h300;
  assign _T_499 = io_decode_csr == 12'h305;
  assign _T_501 = io_decode_csr == 12'h344;
  assign _T_503 = io_decode_csr == 12'h304;
  assign _T_505 = io_decode_csr == 12'h340;
  assign _T_507 = io_decode_csr == 12'h341;
  assign _T_509 = io_decode_csr == 12'h343;
  assign _T_511 = io_decode_csr == 12'h342;
  assign _T_515 = io_decode_csr == 12'h7b0;
  assign _T_517 = io_decode_csr == 12'h7b1;
  assign _T_519 = io_decode_csr == 12'h7b2;
  assign _T_521 = io_decode_csr == 12'h302;
  assign _T_523 = io_decode_csr == 12'hb03;
  assign _T_525 = io_decode_csr == 12'hb83;
  assign _T_527 = io_decode_csr == 12'hb04;
  assign _T_529 = io_decode_csr == 12'hb84;
  assign _T_531 = io_decode_csr == 12'hb05;
  assign _T_533 = io_decode_csr == 12'hb85;
  assign _T_535 = io_decode_csr == 12'hb06;
  assign _T_537 = io_decode_csr == 12'hb86;
  assign _T_539 = io_decode_csr == 12'hb07;
  assign _T_541 = io_decode_csr == 12'hb87;
  assign _T_543 = io_decode_csr == 12'hb08;
  assign _T_545 = io_decode_csr == 12'hb88;
  assign _T_547 = io_decode_csr == 12'hb09;
  assign _T_549 = io_decode_csr == 12'hb89;
  assign _T_551 = io_decode_csr == 12'hb0a;
  assign _T_553 = io_decode_csr == 12'hb8a;
  assign _T_555 = io_decode_csr == 12'hb0b;
  assign _T_557 = io_decode_csr == 12'hb8b;
  assign _T_559 = io_decode_csr == 12'hb0c;
  assign _T_561 = io_decode_csr == 12'hb8c;
  assign _T_563 = io_decode_csr == 12'hb0d;
  assign _T_565 = io_decode_csr == 12'hb8d;
  assign _T_567 = io_decode_csr == 12'hb0e;
  assign _T_569 = io_decode_csr == 12'hb8e;
  assign _T_571 = io_decode_csr == 12'hb0f;
  assign _T_573 = io_decode_csr == 12'hb8f;
  assign _T_575 = io_decode_csr == 12'hb10;
  assign _T_577 = io_decode_csr == 12'hb90;
  assign _T_579 = io_decode_csr == 12'hb11;
  assign _T_581 = io_decode_csr == 12'hb91;
  assign _T_583 = io_decode_csr == 12'hb12;
  assign _T_585 = io_decode_csr == 12'hb92;
  assign _T_587 = io_decode_csr == 12'hb13;
  assign _T_589 = io_decode_csr == 12'hb93;
  assign _T_591 = io_decode_csr == 12'hb14;
  assign _T_593 = io_decode_csr == 12'hb94;
  assign _T_595 = io_decode_csr == 12'hb15;
  assign _T_597 = io_decode_csr == 12'hb95;
  assign _T_599 = io_decode_csr == 12'hb16;
  assign _T_601 = io_decode_csr == 12'hb96;
  assign _T_603 = io_decode_csr == 12'hb17;
  assign _T_605 = io_decode_csr == 12'hb97;
  assign _T_607 = io_decode_csr == 12'hb18;
  assign _T_609 = io_decode_csr == 12'hb98;
  assign _T_611 = io_decode_csr == 12'hb19;
  assign _T_613 = io_decode_csr == 12'hb99;
  assign _T_615 = io_decode_csr == 12'hb1a;
  assign _T_617 = io_decode_csr == 12'hb9a;
  assign _T_619 = io_decode_csr == 12'hb1b;
  assign _T_621 = io_decode_csr == 12'hb9b;
  assign _T_623 = io_decode_csr == 12'hb1c;
  assign _T_625 = io_decode_csr == 12'hb9c;
  assign _T_627 = io_decode_csr == 12'hb1d;
  assign _T_629 = io_decode_csr == 12'hb9d;
  assign _T_631 = io_decode_csr == 12'hb1e;
  assign _T_633 = io_decode_csr == 12'hb9e;
  assign _T_635 = io_decode_csr == 12'hb1f;
  assign _T_637 = io_decode_csr == 12'hb9f;
  assign _T_639 = io_decode_csr == 12'hb20;
  assign _T_641 = io_decode_csr == 12'hba0;
  assign _T_643 = io_decode_csr == 12'hb21;
  assign _T_645 = io_decode_csr == 12'hba1;
  assign _T_647 = io_decode_csr == 12'hb22;
  assign _T_649 = io_decode_csr == 12'hba2;
  assign _T_651 = io_decode_csr == 12'hb80;
  assign _T_653 = io_decode_csr == 12'hb82;
  assign _T_654 = io_decode_csr[9:8];
  assign priv_sufficient = reg_mstatus_prv >= _T_654;
  assign _T_655 = io_decode_csr[11:10];
  assign _T_656 = ~ _T_655;
  assign read_only = _T_656 == 2'h0;
  assign _T_658 = io_rw_cmd != 3'h5;
  assign _T_659 = cpu_ren & _T_658;
  assign cpu_wen = _T_659 & priv_sufficient;
  assign _T_661 = read_only == 1'h0;
  assign wen = cpu_wen & _T_661;
  assign _T_662 = io_rw_cmd == 3'h2;
  assign _T_663 = io_rw_cmd == 3'h3;
  assign _T_664 = _T_662 | _T_663;
  assign _T_666 = _T_664 ? io_rw_rdata : 32'h0;
  assign _T_667 = _T_666 | io_rw_wdata;
  assign _T_670 = _T_663 ? io_rw_wdata : 32'h0;
  assign _T_671 = ~ _T_670;
  assign wdata = _T_667 & _T_671;
  assign _T_673 = io_decode_csr[2:0];
  assign opcode = 8'h1 << _T_673;
  assign _T_674 = opcode[0];
  assign insn_call = system_insn & _T_674;
  assign _T_675 = opcode[1];
  assign insn_break = system_insn & _T_675;
  assign _T_676 = opcode[2];
  assign _T_677 = system_insn & _T_676;
  assign insn_ret = _T_677 & priv_sufficient;
  assign _T_960 = insn_call | insn_break;
  assign _T_961 = _T_960 | insn_ret;
  assign _GEN_2 = io_exception ? 32'h2 : reg_mcause;
  assign _GEN_4 = io_exception ? io_pc : reg_mepc;
  assign _T_964 = insn_ret + io_exception;
  assign _T_966 = _T_964 <= 2'h1;
  assign _T_968 = _T_966 | reset;
  assign _T_970 = _T_968 == 1'h0;
  assign _T_973 = io_decode_csr[10];
  assign _T_974 = insn_ret & _T_973;
  assign _GEN_6 = _T_974 ? 2'h3 : reg_mstatus_prv;
  assign _GEN_8 = _T_974 ? reg_dpc : 32'h80000004;
  assign _T_978 = _T_973 == 1'h0;
  assign _T_979 = insn_ret & _T_978;
  assign _GEN_9 = _T_979 ? reg_mstatus_mpie : reg_mstatus_mie;
  assign _GEN_10 = _T_979 ? 1'h1 : reg_mstatus_mpie;
  assign _GEN_11 = _T_979 ? 2'h3 : _GEN_6;
  assign _GEN_12 = _T_979 ? reg_mepc : _GEN_8;
  assign _GEN_154 = {{2'd0}, reg_mstatus_prv};
  assign _T_983 = _GEN_154 + 4'h8;
  assign _T_984 = _T_983[3:0];
  assign _GEN_13 = insn_call ? 32'h80000004 : _GEN_12;
  assign _GEN_14 = insn_call ? {{28'd0}, _T_984} : _GEN_2;
  assign _GEN_15 = insn_break ? 32'h80000004 : _GEN_13;
  assign _GEN_16 = insn_break ? 32'h3 : _GEN_14;
  assign _T_989 = _T_485 ? _T_183 : 64'h0;
  assign _T_991 = _T_487 ? _T_195 : 64'h0;
  assign _T_993 = _T_489 ? 16'h8000 : 16'h0;
  assign _T_999 = _T_495 ? 9'h100 : 9'h0;
  assign _T_1001 = _T_497 ? read_mstatus : 35'h0;
  assign _T_1003 = _T_499 ? 9'h100 : 9'h0;
  assign _T_1005 = _T_501 ? _T_452 : 16'h0;
  assign _T_1007 = _T_503 ? _T_467 : 16'h0;
  assign _T_1009 = _T_505 ? reg_mscratch : 32'h0;
  assign _T_1011 = _T_507 ? reg_mepc : 32'h0;
  assign _T_1013 = _T_509 ? reg_mtval : 32'h0;
  assign _T_1015 = _T_511 ? reg_mcause : 32'h0;
  assign _T_1019 = _T_515 ? _T_481 : 32'h0;
  assign _T_1021 = _T_517 ? reg_dpc : 32'h0;
  assign _T_1023 = _T_519 ? reg_dscratch : 32'h0;
  assign _T_1025 = _T_521 ? reg_medeleg : 32'h0;
  assign _T_1027 = _T_523 ? _T_198 : 40'h0;
  assign _T_1029 = _T_525 ? _T_198 : 40'h0;
  assign _T_1031 = _T_527 ? _T_201 : 40'h0;
  assign _T_1033 = _T_529 ? _T_201 : 40'h0;
  assign _T_1035 = _T_531 ? _T_204 : 40'h0;
  assign _T_1037 = _T_533 ? _T_204 : 40'h0;
  assign _T_1039 = _T_535 ? _T_207 : 40'h0;
  assign _T_1041 = _T_537 ? _T_207 : 40'h0;
  assign _T_1043 = _T_539 ? _T_210 : 40'h0;
  assign _T_1045 = _T_541 ? _T_210 : 40'h0;
  assign _T_1047 = _T_543 ? _T_213 : 40'h0;
  assign _T_1049 = _T_545 ? _T_213 : 40'h0;
  assign _T_1051 = _T_547 ? _T_216 : 40'h0;
  assign _T_1053 = _T_549 ? _T_216 : 40'h0;
  assign _T_1055 = _T_551 ? _T_219 : 40'h0;
  assign _T_1057 = _T_553 ? _T_219 : 40'h0;
  assign _T_1059 = _T_555 ? _T_222 : 40'h0;
  assign _T_1061 = _T_557 ? _T_222 : 40'h0;
  assign _T_1063 = _T_559 ? _T_225 : 40'h0;
  assign _T_1065 = _T_561 ? _T_225 : 40'h0;
  assign _T_1067 = _T_563 ? _T_228 : 40'h0;
  assign _T_1069 = _T_565 ? _T_228 : 40'h0;
  assign _T_1071 = _T_567 ? _T_231 : 40'h0;
  assign _T_1073 = _T_569 ? _T_231 : 40'h0;
  assign _T_1075 = _T_571 ? _T_234 : 40'h0;
  assign _T_1077 = _T_573 ? _T_234 : 40'h0;
  assign _T_1079 = _T_575 ? _T_237 : 40'h0;
  assign _T_1081 = _T_577 ? _T_237 : 40'h0;
  assign _T_1083 = _T_579 ? _T_240 : 40'h0;
  assign _T_1085 = _T_581 ? _T_240 : 40'h0;
  assign _T_1087 = _T_583 ? _T_243 : 40'h0;
  assign _T_1089 = _T_585 ? _T_243 : 40'h0;
  assign _T_1091 = _T_587 ? _T_246 : 40'h0;
  assign _T_1093 = _T_589 ? _T_246 : 40'h0;
  assign _T_1095 = _T_591 ? _T_249 : 40'h0;
  assign _T_1097 = _T_593 ? _T_249 : 40'h0;
  assign _T_1099 = _T_595 ? _T_252 : 40'h0;
  assign _T_1101 = _T_597 ? _T_252 : 40'h0;
  assign _T_1103 = _T_599 ? _T_255 : 40'h0;
  assign _T_1105 = _T_601 ? _T_255 : 40'h0;
  assign _T_1107 = _T_603 ? _T_258 : 40'h0;
  assign _T_1109 = _T_605 ? _T_258 : 40'h0;
  assign _T_1111 = _T_607 ? _T_261 : 40'h0;
  assign _T_1113 = _T_609 ? _T_261 : 40'h0;
  assign _T_1115 = _T_611 ? _T_264 : 40'h0;
  assign _T_1117 = _T_613 ? _T_264 : 40'h0;
  assign _T_1119 = _T_615 ? _T_267 : 40'h0;
  assign _T_1121 = _T_617 ? _T_267 : 40'h0;
  assign _T_1123 = _T_619 ? _T_270 : 40'h0;
  assign _T_1125 = _T_621 ? _T_270 : 40'h0;
  assign _T_1127 = _T_623 ? _T_273 : 40'h0;
  assign _T_1129 = _T_625 ? _T_273 : 40'h0;
  assign _T_1131 = _T_627 ? _T_276 : 40'h0;
  assign _T_1133 = _T_629 ? _T_276 : 40'h0;
  assign _T_1135 = _T_631 ? _T_279 : 40'h0;
  assign _T_1137 = _T_633 ? _T_279 : 40'h0;
  assign _T_1139 = _T_635 ? _T_282 : 40'h0;
  assign _T_1141 = _T_637 ? _T_282 : 40'h0;
  assign _T_1143 = _T_639 ? _T_285 : 40'h0;
  assign _T_1145 = _T_641 ? _T_285 : 40'h0;
  assign _T_1147 = _T_643 ? _T_288 : 40'h0;
  assign _T_1149 = _T_645 ? _T_288 : 40'h0;
  assign _T_1151 = _T_647 ? _T_291 : 40'h0;
  assign _T_1153 = _T_649 ? _T_291 : 40'h0;
  assign _T_1158 = _T_989 | _T_991;
  assign _GEN_155 = {{48'd0}, _T_993};
  assign _T_1159 = _T_1158 | _GEN_155;
  assign _GEN_156 = {{55'd0}, _T_999};
  assign _T_1162 = _T_1159 | _GEN_156;
  assign _GEN_157 = {{29'd0}, _T_1001};
  assign _T_1163 = _T_1162 | _GEN_157;
  assign _GEN_158 = {{55'd0}, _T_1003};
  assign _T_1164 = _T_1163 | _GEN_158;
  assign _GEN_159 = {{48'd0}, _T_1005};
  assign _T_1165 = _T_1164 | _GEN_159;
  assign _GEN_160 = {{48'd0}, _T_1007};
  assign _T_1166 = _T_1165 | _GEN_160;
  assign _GEN_161 = {{32'd0}, _T_1009};
  assign _T_1167 = _T_1166 | _GEN_161;
  assign _GEN_162 = {{32'd0}, _T_1011};
  assign _T_1168 = _T_1167 | _GEN_162;
  assign _GEN_163 = {{32'd0}, _T_1013};
  assign _T_1169 = _T_1168 | _GEN_163;
  assign _GEN_164 = {{32'd0}, _T_1015};
  assign _T_1170 = _T_1169 | _GEN_164;
  assign _GEN_165 = {{32'd0}, _T_1019};
  assign _T_1172 = _T_1170 | _GEN_165;
  assign _GEN_166 = {{32'd0}, _T_1021};
  assign _T_1173 = _T_1172 | _GEN_166;
  assign _GEN_167 = {{32'd0}, _T_1023};
  assign _T_1174 = _T_1173 | _GEN_167;
  assign _GEN_168 = {{32'd0}, _T_1025};
  assign _T_1175 = _T_1174 | _GEN_168;
  assign _GEN_169 = {{24'd0}, _T_1027};
  assign _T_1176 = _T_1175 | _GEN_169;
  assign _GEN_170 = {{24'd0}, _T_1029};
  assign _T_1177 = _T_1176 | _GEN_170;
  assign _GEN_171 = {{24'd0}, _T_1031};
  assign _T_1178 = _T_1177 | _GEN_171;
  assign _GEN_172 = {{24'd0}, _T_1033};
  assign _T_1179 = _T_1178 | _GEN_172;
  assign _GEN_173 = {{24'd0}, _T_1035};
  assign _T_1180 = _T_1179 | _GEN_173;
  assign _GEN_174 = {{24'd0}, _T_1037};
  assign _T_1181 = _T_1180 | _GEN_174;
  assign _GEN_175 = {{24'd0}, _T_1039};
  assign _T_1182 = _T_1181 | _GEN_175;
  assign _GEN_176 = {{24'd0}, _T_1041};
  assign _T_1183 = _T_1182 | _GEN_176;
  assign _GEN_177 = {{24'd0}, _T_1043};
  assign _T_1184 = _T_1183 | _GEN_177;
  assign _GEN_178 = {{24'd0}, _T_1045};
  assign _T_1185 = _T_1184 | _GEN_178;
  assign _GEN_179 = {{24'd0}, _T_1047};
  assign _T_1186 = _T_1185 | _GEN_179;
  assign _GEN_180 = {{24'd0}, _T_1049};
  assign _T_1187 = _T_1186 | _GEN_180;
  assign _GEN_181 = {{24'd0}, _T_1051};
  assign _T_1188 = _T_1187 | _GEN_181;
  assign _GEN_182 = {{24'd0}, _T_1053};
  assign _T_1189 = _T_1188 | _GEN_182;
  assign _GEN_183 = {{24'd0}, _T_1055};
  assign _T_1190 = _T_1189 | _GEN_183;
  assign _GEN_184 = {{24'd0}, _T_1057};
  assign _T_1191 = _T_1190 | _GEN_184;
  assign _GEN_185 = {{24'd0}, _T_1059};
  assign _T_1192 = _T_1191 | _GEN_185;
  assign _GEN_186 = {{24'd0}, _T_1061};
  assign _T_1193 = _T_1192 | _GEN_186;
  assign _GEN_187 = {{24'd0}, _T_1063};
  assign _T_1194 = _T_1193 | _GEN_187;
  assign _GEN_188 = {{24'd0}, _T_1065};
  assign _T_1195 = _T_1194 | _GEN_188;
  assign _GEN_189 = {{24'd0}, _T_1067};
  assign _T_1196 = _T_1195 | _GEN_189;
  assign _GEN_190 = {{24'd0}, _T_1069};
  assign _T_1197 = _T_1196 | _GEN_190;
  assign _GEN_191 = {{24'd0}, _T_1071};
  assign _T_1198 = _T_1197 | _GEN_191;
  assign _GEN_192 = {{24'd0}, _T_1073};
  assign _T_1199 = _T_1198 | _GEN_192;
  assign _GEN_193 = {{24'd0}, _T_1075};
  assign _T_1200 = _T_1199 | _GEN_193;
  assign _GEN_194 = {{24'd0}, _T_1077};
  assign _T_1201 = _T_1200 | _GEN_194;
  assign _GEN_195 = {{24'd0}, _T_1079};
  assign _T_1202 = _T_1201 | _GEN_195;
  assign _GEN_196 = {{24'd0}, _T_1081};
  assign _T_1203 = _T_1202 | _GEN_196;
  assign _GEN_197 = {{24'd0}, _T_1083};
  assign _T_1204 = _T_1203 | _GEN_197;
  assign _GEN_198 = {{24'd0}, _T_1085};
  assign _T_1205 = _T_1204 | _GEN_198;
  assign _GEN_199 = {{24'd0}, _T_1087};
  assign _T_1206 = _T_1205 | _GEN_199;
  assign _GEN_200 = {{24'd0}, _T_1089};
  assign _T_1207 = _T_1206 | _GEN_200;
  assign _GEN_201 = {{24'd0}, _T_1091};
  assign _T_1208 = _T_1207 | _GEN_201;
  assign _GEN_202 = {{24'd0}, _T_1093};
  assign _T_1209 = _T_1208 | _GEN_202;
  assign _GEN_203 = {{24'd0}, _T_1095};
  assign _T_1210 = _T_1209 | _GEN_203;
  assign _GEN_204 = {{24'd0}, _T_1097};
  assign _T_1211 = _T_1210 | _GEN_204;
  assign _GEN_205 = {{24'd0}, _T_1099};
  assign _T_1212 = _T_1211 | _GEN_205;
  assign _GEN_206 = {{24'd0}, _T_1101};
  assign _T_1213 = _T_1212 | _GEN_206;
  assign _GEN_207 = {{24'd0}, _T_1103};
  assign _T_1214 = _T_1213 | _GEN_207;
  assign _GEN_208 = {{24'd0}, _T_1105};
  assign _T_1215 = _T_1214 | _GEN_208;
  assign _GEN_209 = {{24'd0}, _T_1107};
  assign _T_1216 = _T_1215 | _GEN_209;
  assign _GEN_210 = {{24'd0}, _T_1109};
  assign _T_1217 = _T_1216 | _GEN_210;
  assign _GEN_211 = {{24'd0}, _T_1111};
  assign _T_1218 = _T_1217 | _GEN_211;
  assign _GEN_212 = {{24'd0}, _T_1113};
  assign _T_1219 = _T_1218 | _GEN_212;
  assign _GEN_213 = {{24'd0}, _T_1115};
  assign _T_1220 = _T_1219 | _GEN_213;
  assign _GEN_214 = {{24'd0}, _T_1117};
  assign _T_1221 = _T_1220 | _GEN_214;
  assign _GEN_215 = {{24'd0}, _T_1119};
  assign _T_1222 = _T_1221 | _GEN_215;
  assign _GEN_216 = {{24'd0}, _T_1121};
  assign _T_1223 = _T_1222 | _GEN_216;
  assign _GEN_217 = {{24'd0}, _T_1123};
  assign _T_1224 = _T_1223 | _GEN_217;
  assign _GEN_218 = {{24'd0}, _T_1125};
  assign _T_1225 = _T_1224 | _GEN_218;
  assign _GEN_219 = {{24'd0}, _T_1127};
  assign _T_1226 = _T_1225 | _GEN_219;
  assign _GEN_220 = {{24'd0}, _T_1129};
  assign _T_1227 = _T_1226 | _GEN_220;
  assign _GEN_221 = {{24'd0}, _T_1131};
  assign _T_1228 = _T_1227 | _GEN_221;
  assign _GEN_222 = {{24'd0}, _T_1133};
  assign _T_1229 = _T_1228 | _GEN_222;
  assign _GEN_223 = {{24'd0}, _T_1135};
  assign _T_1230 = _T_1229 | _GEN_223;
  assign _GEN_224 = {{24'd0}, _T_1137};
  assign _T_1231 = _T_1230 | _GEN_224;
  assign _GEN_225 = {{24'd0}, _T_1139};
  assign _T_1232 = _T_1231 | _GEN_225;
  assign _GEN_226 = {{24'd0}, _T_1141};
  assign _T_1233 = _T_1232 | _GEN_226;
  assign _GEN_227 = {{24'd0}, _T_1143};
  assign _T_1234 = _T_1233 | _GEN_227;
  assign _GEN_228 = {{24'd0}, _T_1145};
  assign _T_1235 = _T_1234 | _GEN_228;
  assign _GEN_229 = {{24'd0}, _T_1147};
  assign _T_1236 = _T_1235 | _GEN_229;
  assign _GEN_230 = {{24'd0}, _T_1149};
  assign _T_1237 = _T_1236 | _GEN_230;
  assign _GEN_231 = {{24'd0}, _T_1151};
  assign _T_1238 = _T_1237 | _GEN_231;
  assign _GEN_232 = {{24'd0}, _T_1153};
  assign _T_1239 = _T_1238 | _GEN_232;
  assign _T_1250 = _T_1248[2];
  assign _T_1260 = _T_1248[15];
  assign _GEN_17 = _T_515 ? _T_1246_step : reg_dcsr_step;
  assign _GEN_18 = _T_515 ? _T_1246_ebreakm : reg_dcsr_ebreakm;
  assign _T_1272 = _T_1268[3];
  assign _T_1276 = _T_1268[7];
  assign _GEN_19 = _T_497 ? _T_1266_mie : _GEN_9;
  assign _GEN_20 = _T_497 ? _T_1266_mpie : _GEN_10;
  assign _T_1300 = _T_1296[3];
  assign _GEN_21 = _T_501 ? _T_1294_msip : reg_mip_msip;
  assign _T_1321 = _T_1317[3];
  assign _T_1325 = _T_1317[7];
  assign _GEN_22 = _T_503 ? _T_1315_msip : reg_mie_msip;
  assign _GEN_23 = _T_503 ? _T_1315_mtip : reg_mie_mtip;
  assign _T_1334 = wdata[7:0];
  assign _T_1335 = _T_198[31:0];
  assign _T_1336 = {_T_1334,_T_1335};
  assign _GEN_24 = _T_525 ? {{1'd0}, _T_1336} : _T_199;
  assign _T_1337 = _T_198[39:32];
  assign _T_1338 = {_T_1337,wdata};
  assign _GEN_25 = _T_523 ? {{1'd0}, _T_1338} : _GEN_24;
  assign _T_1340 = _T_201[31:0];
  assign _T_1341 = {_T_1334,_T_1340};
  assign _GEN_26 = _T_529 ? {{1'd0}, _T_1341} : _T_202;
  assign _T_1342 = _T_201[39:32];
  assign _T_1343 = {_T_1342,wdata};
  assign _GEN_27 = _T_527 ? {{1'd0}, _T_1343} : _GEN_26;
  assign _T_1345 = _T_204[31:0];
  assign _T_1346 = {_T_1334,_T_1345};
  assign _GEN_28 = _T_533 ? {{1'd0}, _T_1346} : _T_205;
  assign _T_1347 = _T_204[39:32];
  assign _T_1348 = {_T_1347,wdata};
  assign _GEN_29 = _T_531 ? {{1'd0}, _T_1348} : _GEN_28;
  assign _T_1350 = _T_207[31:0];
  assign _T_1351 = {_T_1334,_T_1350};
  assign _GEN_30 = _T_537 ? {{1'd0}, _T_1351} : _T_208;
  assign _T_1352 = _T_207[39:32];
  assign _T_1353 = {_T_1352,wdata};
  assign _GEN_31 = _T_535 ? {{1'd0}, _T_1353} : _GEN_30;
  assign _T_1355 = _T_210[31:0];
  assign _T_1356 = {_T_1334,_T_1355};
  assign _GEN_32 = _T_541 ? {{1'd0}, _T_1356} : _T_211;
  assign _T_1357 = _T_210[39:32];
  assign _T_1358 = {_T_1357,wdata};
  assign _GEN_33 = _T_539 ? {{1'd0}, _T_1358} : _GEN_32;
  assign _T_1360 = _T_213[31:0];
  assign _T_1361 = {_T_1334,_T_1360};
  assign _GEN_34 = _T_545 ? {{1'd0}, _T_1361} : _T_214;
  assign _T_1362 = _T_213[39:32];
  assign _T_1363 = {_T_1362,wdata};
  assign _GEN_35 = _T_543 ? {{1'd0}, _T_1363} : _GEN_34;
  assign _T_1365 = _T_216[31:0];
  assign _T_1366 = {_T_1334,_T_1365};
  assign _GEN_36 = _T_549 ? {{1'd0}, _T_1366} : _T_217;
  assign _T_1367 = _T_216[39:32];
  assign _T_1368 = {_T_1367,wdata};
  assign _GEN_37 = _T_547 ? {{1'd0}, _T_1368} : _GEN_36;
  assign _T_1370 = _T_219[31:0];
  assign _T_1371 = {_T_1334,_T_1370};
  assign _GEN_38 = _T_553 ? {{1'd0}, _T_1371} : _T_220;
  assign _T_1372 = _T_219[39:32];
  assign _T_1373 = {_T_1372,wdata};
  assign _GEN_39 = _T_551 ? {{1'd0}, _T_1373} : _GEN_38;
  assign _T_1375 = _T_222[31:0];
  assign _T_1376 = {_T_1334,_T_1375};
  assign _GEN_40 = _T_557 ? {{1'd0}, _T_1376} : _T_223;
  assign _T_1377 = _T_222[39:32];
  assign _T_1378 = {_T_1377,wdata};
  assign _GEN_41 = _T_555 ? {{1'd0}, _T_1378} : _GEN_40;
  assign _T_1380 = _T_225[31:0];
  assign _T_1381 = {_T_1334,_T_1380};
  assign _GEN_42 = _T_561 ? {{1'd0}, _T_1381} : _T_226;
  assign _T_1382 = _T_225[39:32];
  assign _T_1383 = {_T_1382,wdata};
  assign _GEN_43 = _T_559 ? {{1'd0}, _T_1383} : _GEN_42;
  assign _T_1385 = _T_228[31:0];
  assign _T_1386 = {_T_1334,_T_1385};
  assign _GEN_44 = _T_565 ? {{1'd0}, _T_1386} : _T_229;
  assign _T_1387 = _T_228[39:32];
  assign _T_1388 = {_T_1387,wdata};
  assign _GEN_45 = _T_563 ? {{1'd0}, _T_1388} : _GEN_44;
  assign _T_1390 = _T_231[31:0];
  assign _T_1391 = {_T_1334,_T_1390};
  assign _GEN_46 = _T_569 ? {{1'd0}, _T_1391} : _T_232;
  assign _T_1392 = _T_231[39:32];
  assign _T_1393 = {_T_1392,wdata};
  assign _GEN_47 = _T_567 ? {{1'd0}, _T_1393} : _GEN_46;
  assign _T_1395 = _T_234[31:0];
  assign _T_1396 = {_T_1334,_T_1395};
  assign _GEN_48 = _T_573 ? {{1'd0}, _T_1396} : _T_235;
  assign _T_1397 = _T_234[39:32];
  assign _T_1398 = {_T_1397,wdata};
  assign _GEN_49 = _T_571 ? {{1'd0}, _T_1398} : _GEN_48;
  assign _T_1400 = _T_237[31:0];
  assign _T_1401 = {_T_1334,_T_1400};
  assign _GEN_50 = _T_577 ? {{1'd0}, _T_1401} : _T_238;
  assign _T_1402 = _T_237[39:32];
  assign _T_1403 = {_T_1402,wdata};
  assign _GEN_51 = _T_575 ? {{1'd0}, _T_1403} : _GEN_50;
  assign _T_1405 = _T_240[31:0];
  assign _T_1406 = {_T_1334,_T_1405};
  assign _GEN_52 = _T_581 ? {{1'd0}, _T_1406} : _T_241;
  assign _T_1407 = _T_240[39:32];
  assign _T_1408 = {_T_1407,wdata};
  assign _GEN_53 = _T_579 ? {{1'd0}, _T_1408} : _GEN_52;
  assign _T_1410 = _T_243[31:0];
  assign _T_1411 = {_T_1334,_T_1410};
  assign _GEN_54 = _T_585 ? {{1'd0}, _T_1411} : _T_244;
  assign _T_1412 = _T_243[39:32];
  assign _T_1413 = {_T_1412,wdata};
  assign _GEN_55 = _T_583 ? {{1'd0}, _T_1413} : _GEN_54;
  assign _T_1415 = _T_246[31:0];
  assign _T_1416 = {_T_1334,_T_1415};
  assign _GEN_56 = _T_589 ? {{1'd0}, _T_1416} : _T_247;
  assign _T_1417 = _T_246[39:32];
  assign _T_1418 = {_T_1417,wdata};
  assign _GEN_57 = _T_587 ? {{1'd0}, _T_1418} : _GEN_56;
  assign _T_1420 = _T_249[31:0];
  assign _T_1421 = {_T_1334,_T_1420};
  assign _GEN_58 = _T_593 ? {{1'd0}, _T_1421} : _T_250;
  assign _T_1422 = _T_249[39:32];
  assign _T_1423 = {_T_1422,wdata};
  assign _GEN_59 = _T_591 ? {{1'd0}, _T_1423} : _GEN_58;
  assign _T_1425 = _T_252[31:0];
  assign _T_1426 = {_T_1334,_T_1425};
  assign _GEN_60 = _T_597 ? {{1'd0}, _T_1426} : _T_253;
  assign _T_1427 = _T_252[39:32];
  assign _T_1428 = {_T_1427,wdata};
  assign _GEN_61 = _T_595 ? {{1'd0}, _T_1428} : _GEN_60;
  assign _T_1430 = _T_255[31:0];
  assign _T_1431 = {_T_1334,_T_1430};
  assign _GEN_62 = _T_601 ? {{1'd0}, _T_1431} : _T_256;
  assign _T_1432 = _T_255[39:32];
  assign _T_1433 = {_T_1432,wdata};
  assign _GEN_63 = _T_599 ? {{1'd0}, _T_1433} : _GEN_62;
  assign _T_1435 = _T_258[31:0];
  assign _T_1436 = {_T_1334,_T_1435};
  assign _GEN_64 = _T_605 ? {{1'd0}, _T_1436} : _T_259;
  assign _T_1437 = _T_258[39:32];
  assign _T_1438 = {_T_1437,wdata};
  assign _GEN_65 = _T_603 ? {{1'd0}, _T_1438} : _GEN_64;
  assign _T_1440 = _T_261[31:0];
  assign _T_1441 = {_T_1334,_T_1440};
  assign _GEN_66 = _T_609 ? {{1'd0}, _T_1441} : _T_262;
  assign _T_1442 = _T_261[39:32];
  assign _T_1443 = {_T_1442,wdata};
  assign _GEN_67 = _T_607 ? {{1'd0}, _T_1443} : _GEN_66;
  assign _T_1445 = _T_264[31:0];
  assign _T_1446 = {_T_1334,_T_1445};
  assign _GEN_68 = _T_613 ? {{1'd0}, _T_1446} : _T_265;
  assign _T_1447 = _T_264[39:32];
  assign _T_1448 = {_T_1447,wdata};
  assign _GEN_69 = _T_611 ? {{1'd0}, _T_1448} : _GEN_68;
  assign _T_1450 = _T_267[31:0];
  assign _T_1451 = {_T_1334,_T_1450};
  assign _GEN_70 = _T_617 ? {{1'd0}, _T_1451} : _T_268;
  assign _T_1452 = _T_267[39:32];
  assign _T_1453 = {_T_1452,wdata};
  assign _GEN_71 = _T_615 ? {{1'd0}, _T_1453} : _GEN_70;
  assign _T_1455 = _T_270[31:0];
  assign _T_1456 = {_T_1334,_T_1455};
  assign _GEN_72 = _T_621 ? {{1'd0}, _T_1456} : _T_271;
  assign _T_1457 = _T_270[39:32];
  assign _T_1458 = {_T_1457,wdata};
  assign _GEN_73 = _T_619 ? {{1'd0}, _T_1458} : _GEN_72;
  assign _T_1460 = _T_273[31:0];
  assign _T_1461 = {_T_1334,_T_1460};
  assign _GEN_74 = _T_625 ? {{1'd0}, _T_1461} : _T_274;
  assign _T_1462 = _T_273[39:32];
  assign _T_1463 = {_T_1462,wdata};
  assign _GEN_75 = _T_623 ? {{1'd0}, _T_1463} : _GEN_74;
  assign _T_1465 = _T_276[31:0];
  assign _T_1466 = {_T_1334,_T_1465};
  assign _GEN_76 = _T_629 ? {{1'd0}, _T_1466} : _T_277;
  assign _T_1467 = _T_276[39:32];
  assign _T_1468 = {_T_1467,wdata};
  assign _GEN_77 = _T_627 ? {{1'd0}, _T_1468} : _GEN_76;
  assign _T_1470 = _T_279[31:0];
  assign _T_1471 = {_T_1334,_T_1470};
  assign _GEN_78 = _T_633 ? {{1'd0}, _T_1471} : _T_280;
  assign _T_1472 = _T_279[39:32];
  assign _T_1473 = {_T_1472,wdata};
  assign _GEN_79 = _T_631 ? {{1'd0}, _T_1473} : _GEN_78;
  assign _T_1475 = _T_282[31:0];
  assign _T_1476 = {_T_1334,_T_1475};
  assign _GEN_80 = _T_637 ? {{1'd0}, _T_1476} : _T_283;
  assign _T_1477 = _T_282[39:32];
  assign _T_1478 = {_T_1477,wdata};
  assign _GEN_81 = _T_635 ? {{1'd0}, _T_1478} : _GEN_80;
  assign _T_1480 = _T_285[31:0];
  assign _T_1481 = {_T_1334,_T_1480};
  assign _GEN_82 = _T_641 ? {{1'd0}, _T_1481} : _T_286;
  assign _T_1482 = _T_285[39:32];
  assign _T_1483 = {_T_1482,wdata};
  assign _GEN_83 = _T_639 ? {{1'd0}, _T_1483} : _GEN_82;
  assign _T_1485 = _T_288[31:0];
  assign _T_1486 = {_T_1334,_T_1485};
  assign _GEN_84 = _T_645 ? {{1'd0}, _T_1486} : _T_289;
  assign _T_1487 = _T_288[39:32];
  assign _T_1488 = {_T_1487,wdata};
  assign _GEN_85 = _T_643 ? {{1'd0}, _T_1488} : _GEN_84;
  assign _T_1490 = _T_291[31:0];
  assign _T_1491 = {_T_1334,_T_1490};
  assign _GEN_86 = _T_649 ? {{1'd0}, _T_1491} : _T_292;
  assign _T_1492 = _T_291[39:32];
  assign _T_1493 = {_T_1492,wdata};
  assign _GEN_87 = _T_647 ? {{1'd0}, _T_1493} : _GEN_86;
  assign _T_1495 = _T_183[31:0];
  assign _T_1496 = {wdata,_T_1495};
  assign _T_1497 = _T_1496[63:6];
  assign _GEN_88 = _T_651 ? _T_1496 : {{57'd0}, _T_175};
  assign _GEN_89 = _T_651 ? _T_1497 : _GEN_0;
  assign _T_1498 = _T_183[63:32];
  assign _T_1499 = {_T_1498,wdata};
  assign _T_1500 = _T_1499[63:6];
  assign _GEN_90 = _T_485 ? _T_1499 : _GEN_88;
  assign _GEN_91 = _T_485 ? _T_1500 : _GEN_89;
  assign _T_1502 = _T_195[31:0];
  assign _T_1503 = {wdata,_T_1502};
  assign _T_1504 = _T_1503[63:6];
  assign _GEN_92 = _T_653 ? _T_1503 : {{57'd0}, _T_187};
  assign _GEN_93 = _T_653 ? _T_1504 : _GEN_1;
  assign _T_1505 = _T_195[63:32];
  assign _T_1506 = {_T_1505,wdata};
  assign _T_1507 = _T_1506[63:6];
  assign _GEN_94 = _T_487 ? _T_1506 : _GEN_92;
  assign _GEN_95 = _T_487 ? _T_1507 : _GEN_93;
  assign _GEN_96 = _T_517 ? wdata : reg_dpc;
  assign _GEN_97 = _T_519 ? wdata : reg_dscratch;
  assign _T_1510 = wdata >> 2'h2;
  assign _GEN_233 = {{3'd0}, _T_1510};
  assign _T_1512 = _GEN_233 << 2'h2;
  assign _GEN_98 = _T_507 ? _T_1512 : {{3'd0}, _GEN_4};
  assign _GEN_99 = _T_505 ? wdata : reg_mscratch;
  assign _T_1514 = wdata & 32'h8000001f;
  assign _GEN_100 = _T_511 ? _T_1514 : _GEN_16;
  assign _GEN_101 = _T_509 ? wdata : reg_mtval;
  assign _GEN_102 = _T_521 ? wdata : reg_medeleg;
  assign _GEN_103 = wen ? _GEN_17 : reg_dcsr_step;
  assign _GEN_104 = wen ? _GEN_18 : reg_dcsr_ebreakm;
  assign _GEN_105 = wen ? _GEN_19 : _GEN_9;
  assign _GEN_106 = wen ? _GEN_20 : _GEN_10;
  assign _GEN_107 = wen ? _GEN_21 : reg_mip_msip;
  assign _GEN_108 = wen ? _GEN_22 : reg_mie_msip;
  assign _GEN_109 = wen ? _GEN_23 : reg_mie_mtip;
  assign _GEN_110 = wen ? _GEN_25 : _T_199;
  assign _GEN_111 = wen ? _GEN_27 : _T_202;
  assign _GEN_112 = wen ? _GEN_29 : _T_205;
  assign _GEN_113 = wen ? _GEN_31 : _T_208;
  assign _GEN_114 = wen ? _GEN_33 : _T_211;
  assign _GEN_115 = wen ? _GEN_35 : _T_214;
  assign _GEN_116 = wen ? _GEN_37 : _T_217;
  assign _GEN_117 = wen ? _GEN_39 : _T_220;
  assign _GEN_118 = wen ? _GEN_41 : _T_223;
  assign _GEN_119 = wen ? _GEN_43 : _T_226;
  assign _GEN_120 = wen ? _GEN_45 : _T_229;
  assign _GEN_121 = wen ? _GEN_47 : _T_232;
  assign _GEN_122 = wen ? _GEN_49 : _T_235;
  assign _GEN_123 = wen ? _GEN_51 : _T_238;
  assign _GEN_124 = wen ? _GEN_53 : _T_241;
  assign _GEN_125 = wen ? _GEN_55 : _T_244;
  assign _GEN_126 = wen ? _GEN_57 : _T_247;
  assign _GEN_127 = wen ? _GEN_59 : _T_250;
  assign _GEN_128 = wen ? _GEN_61 : _T_253;
  assign _GEN_129 = wen ? _GEN_63 : _T_256;
  assign _GEN_130 = wen ? _GEN_65 : _T_259;
  assign _GEN_131 = wen ? _GEN_67 : _T_262;
  assign _GEN_132 = wen ? _GEN_69 : _T_265;
  assign _GEN_133 = wen ? _GEN_71 : _T_268;
  assign _GEN_134 = wen ? _GEN_73 : _T_271;
  assign _GEN_135 = wen ? _GEN_75 : _T_274;
  assign _GEN_136 = wen ? _GEN_77 : _T_277;
  assign _GEN_137 = wen ? _GEN_79 : _T_280;
  assign _GEN_138 = wen ? _GEN_81 : _T_283;
  assign _GEN_139 = wen ? _GEN_83 : _T_286;
  assign _GEN_140 = wen ? _GEN_85 : _T_289;
  assign _GEN_141 = wen ? _GEN_87 : _T_292;
  assign _GEN_142 = wen ? _GEN_90 : {{57'd0}, _T_175};
  assign _GEN_143 = wen ? _GEN_91 : _GEN_0;
  assign _GEN_144 = wen ? _GEN_94 : {{57'd0}, _T_187};
  assign _GEN_145 = wen ? _GEN_95 : _GEN_1;
  assign _GEN_146 = wen ? _GEN_96 : reg_dpc;
  assign _GEN_147 = wen ? _GEN_97 : reg_dscratch;
  assign _GEN_148 = wen ? _GEN_98 : {{3'd0}, _GEN_4};
  assign _GEN_149 = wen ? _GEN_99 : reg_mscratch;
  assign _GEN_150 = wen ? _GEN_100 : _GEN_16;
  assign _GEN_151 = wen ? _GEN_101 : reg_mtval;
  assign _GEN_152 = wen ? _GEN_102 : reg_medeleg;
  assign io_rw_rdata = _T_1243[31:0];
  assign io_eret = _T_961;
  assign io_status_debug = 1'h0;
  assign io_status_prv = reg_mstatus_prv;
  assign io_status_sd = 1'h0;
  assign io_status_zero1 = 8'h0;
  assign io_status_tsr = 1'h0;
  assign io_status_tw = 1'h0;
  assign io_status_tvm = 1'h0;
  assign io_status_mxr = 1'h0;
  assign io_status_sum = 1'h0;
  assign io_status_mprv = 1'h0;
  assign io_status_xs = 2'h0;
  assign io_status_fs = 2'h0;
  assign io_status_mpp = 2'h3;
  assign io_status_hpp = 2'h0;
  assign io_status_spp = 1'h0;
  assign io_status_mpie = reg_mstatus_mpie;
  assign io_status_hpie = 1'h0;
  assign io_status_spie = 1'h0;
  assign io_status_upie = 1'h0;
  assign io_status_mie = reg_mstatus_mie;
  assign io_status_hie = 1'h0;
  assign io_status_sie = 1'h0;
  assign io_status_uie = 1'h0;
  assign io_evec = _GEN_15;
  assign io_time = _T_183[31:0];
  assign new_prv = _GEN_11;
  assign _T_1243 = _T_1239;
  assign _T_1246_ebreakm = _T_1260;
  assign _T_1246_step = _T_1250;
  assign _T_1248 = wdata;
  assign _T_1266_mpie = _T_1276;
  assign _T_1266_mie = _T_1272;
  assign _T_1268 = {{3'd0}, wdata};
  assign _T_1294_msip = _T_1300;
  assign _T_1296 = wdata[15:0];
  assign _T_1315_mtip = _T_1325;
  assign _T_1315_msip = _T_1321;
  assign _T_1317 = wdata[15:0];
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  reg_mstatus_prv = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  reg_mstatus_mpie = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  reg_mstatus_mie = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  reg_mepc = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  reg_mcause = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  reg_mtval = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  reg_mscratch = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  reg_medeleg = _RAND_7[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  reg_mip_mtip = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  reg_mip_msip = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  reg_mie_mtip = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  reg_mie_msip = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  _T_174 = _RAND_12[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {2{$random}};
  _T_178 = _RAND_13[57:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  _T_186 = _RAND_14[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {2{$random}};
  _T_190 = _RAND_15[57:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {2{$random}};
  _T_198 = _RAND_16[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {2{$random}};
  _T_201 = _RAND_17[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {2{$random}};
  _T_204 = _RAND_18[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {2{$random}};
  _T_207 = _RAND_19[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {2{$random}};
  _T_210 = _RAND_20[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {2{$random}};
  _T_213 = _RAND_21[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {2{$random}};
  _T_216 = _RAND_22[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {2{$random}};
  _T_219 = _RAND_23[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {2{$random}};
  _T_222 = _RAND_24[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {2{$random}};
  _T_225 = _RAND_25[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {2{$random}};
  _T_228 = _RAND_26[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {2{$random}};
  _T_231 = _RAND_27[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {2{$random}};
  _T_234 = _RAND_28[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {2{$random}};
  _T_237 = _RAND_29[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {2{$random}};
  _T_240 = _RAND_30[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {2{$random}};
  _T_243 = _RAND_31[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {2{$random}};
  _T_246 = _RAND_32[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {2{$random}};
  _T_249 = _RAND_33[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {2{$random}};
  _T_252 = _RAND_34[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {2{$random}};
  _T_255 = _RAND_35[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {2{$random}};
  _T_258 = _RAND_36[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {2{$random}};
  _T_261 = _RAND_37[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {2{$random}};
  _T_264 = _RAND_38[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {2{$random}};
  _T_267 = _RAND_39[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {2{$random}};
  _T_270 = _RAND_40[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {2{$random}};
  _T_273 = _RAND_41[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {2{$random}};
  _T_276 = _RAND_42[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_43 = {2{$random}};
  _T_279 = _RAND_43[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_44 = {2{$random}};
  _T_282 = _RAND_44[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_45 = {2{$random}};
  _T_285 = _RAND_45[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_46 = {2{$random}};
  _T_288 = _RAND_46[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_47 = {2{$random}};
  _T_291 = _RAND_47[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_48 = {1{$random}};
  reg_dpc = _RAND_48[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_49 = {1{$random}};
  reg_dscratch = _RAND_49[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_50 = {1{$random}};
  reg_dcsr_ebreakm = _RAND_50[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_51 = {1{$random}};
  reg_dcsr_step = _RAND_51[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      reg_mstatus_prv <= 2'h3;
    end else begin
      reg_mstatus_prv <= new_prv;
    end
    if (reset) begin
      reg_mstatus_mpie <= 1'h0;
    end else begin
      if (wen) begin
        if (_T_497) begin
          reg_mstatus_mpie <= _T_1266_mpie;
        end else begin
          if (_T_979) begin
            reg_mstatus_mpie <= 1'h1;
          end
        end
      end else begin
        if (_T_979) begin
          reg_mstatus_mpie <= 1'h1;
        end
      end
    end
    if (reset) begin
      reg_mstatus_mie <= 1'h0;
    end else begin
      if (wen) begin
        if (_T_497) begin
          reg_mstatus_mie <= _T_1266_mie;
        end else begin
          if (_T_979) begin
            reg_mstatus_mie <= reg_mstatus_mpie;
          end
        end
      end else begin
        if (_T_979) begin
          reg_mstatus_mie <= reg_mstatus_mpie;
        end
      end
    end
    reg_mepc <= _GEN_148[31:0];
    if (wen) begin
      if (_T_511) begin
        reg_mcause <= _T_1514;
      end else begin
        if (insn_break) begin
          reg_mcause <= 32'h3;
        end else begin
          if (insn_call) begin
            reg_mcause <= {{28'd0}, _T_984};
          end else begin
            if (io_exception) begin
              reg_mcause <= 32'h2;
            end
          end
        end
      end
    end else begin
      if (insn_break) begin
        reg_mcause <= 32'h3;
      end else begin
        if (insn_call) begin
          reg_mcause <= {{28'd0}, _T_984};
        end else begin
          if (io_exception) begin
            reg_mcause <= 32'h2;
          end
        end
      end
    end
    if (wen) begin
      if (_T_509) begin
        reg_mtval <= wdata;
      end
    end
    if (wen) begin
      if (_T_505) begin
        reg_mscratch <= wdata;
      end
    end
    if (wen) begin
      if (_T_521) begin
        reg_medeleg <= wdata;
      end
    end
    if (reset) begin
      reg_mip_mtip <= 1'h0;
    end else begin
      reg_mip_mtip <= 1'h1;
    end
    if (reset) begin
      reg_mip_msip <= 1'h0;
    end else begin
      if (wen) begin
        if (_T_501) begin
          reg_mip_msip <= _T_1294_msip;
        end
      end
    end
    if (reset) begin
      reg_mie_mtip <= 1'h0;
    end else begin
      if (wen) begin
        if (_T_503) begin
          reg_mie_mtip <= _T_1315_mtip;
        end
      end
    end
    if (reset) begin
      reg_mie_msip <= 1'h0;
    end else begin
      if (wen) begin
        if (_T_503) begin
          reg_mie_msip <= _T_1315_msip;
        end
      end
    end
    if (reset) begin
      _T_174 <= 6'h0;
    end else begin
      _T_174 <= _GEN_142[5:0];
    end
    if (reset) begin
      _T_178 <= 58'h0;
    end else begin
      if (wen) begin
        if (_T_485) begin
          _T_178 <= _T_1500;
        end else begin
          if (_T_651) begin
            _T_178 <= _T_1497;
          end else begin
            if (_T_179) begin
              _T_178 <= _T_182;
            end
          end
        end
      end else begin
        if (_T_179) begin
          _T_178 <= _T_182;
        end
      end
    end
    if (reset) begin
      _T_186 <= 6'h0;
    end else begin
      _T_186 <= _GEN_144[5:0];
    end
    if (reset) begin
      _T_190 <= 58'h0;
    end else begin
      if (wen) begin
        if (_T_487) begin
          _T_190 <= _T_1507;
        end else begin
          if (_T_653) begin
            _T_190 <= _T_1504;
          end else begin
            if (_T_191) begin
              _T_190 <= _T_194;
            end
          end
        end
      end else begin
        if (_T_191) begin
          _T_190 <= _T_194;
        end
      end
    end
    _T_198 <= _GEN_110[39:0];
    _T_201 <= _GEN_111[39:0];
    _T_204 <= _GEN_112[39:0];
    _T_207 <= _GEN_113[39:0];
    _T_210 <= _GEN_114[39:0];
    _T_213 <= _GEN_115[39:0];
    _T_216 <= _GEN_116[39:0];
    _T_219 <= _GEN_117[39:0];
    _T_222 <= _GEN_118[39:0];
    _T_225 <= _GEN_119[39:0];
    _T_228 <= _GEN_120[39:0];
    _T_231 <= _GEN_121[39:0];
    _T_234 <= _GEN_122[39:0];
    _T_237 <= _GEN_123[39:0];
    _T_240 <= _GEN_124[39:0];
    _T_243 <= _GEN_125[39:0];
    _T_246 <= _GEN_126[39:0];
    _T_249 <= _GEN_127[39:0];
    _T_252 <= _GEN_128[39:0];
    _T_255 <= _GEN_129[39:0];
    _T_258 <= _GEN_130[39:0];
    _T_261 <= _GEN_131[39:0];
    _T_264 <= _GEN_132[39:0];
    _T_267 <= _GEN_133[39:0];
    _T_270 <= _GEN_134[39:0];
    _T_273 <= _GEN_135[39:0];
    _T_276 <= _GEN_136[39:0];
    _T_279 <= _GEN_137[39:0];
    _T_282 <= _GEN_138[39:0];
    _T_285 <= _GEN_139[39:0];
    _T_288 <= _GEN_140[39:0];
    _T_291 <= _GEN_141[39:0];
    if (wen) begin
      if (_T_517) begin
        reg_dpc <= wdata;
      end
    end
    if (wen) begin
      if (_T_519) begin
        reg_dscratch <= wdata;
      end
    end
    if (reset) begin
      reg_dcsr_ebreakm <= 1'h0;
    end else begin
      if (wen) begin
        if (_T_515) begin
          reg_dcsr_ebreakm <= _T_1246_ebreakm;
        end
      end
    end
    if (reset) begin
      reg_dcsr_step <= 1'h0;
    end else begin
      if (wen) begin
        if (_T_515) begin
          reg_dcsr_step <= _T_1246_step;
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_970) begin
          $fwrite(32'h80000002,"Assertion failed: these conditions must be mutually exclusive\n    at csr.scala:290 assert(PopCount(insn_ret :: io.exception :: Nil) <= 1, \"these conditions must be mutually exclusive\")\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_970) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module CPU(
  input         clock,
  input         reset,
  output [31:0] io_imem_req_bits_addr,
  input  [31:0] io_imem_resp_bits_data,
  output        io_dmem_req_valid,
  output [31:0] io_dmem_req_bits_addr,
  output [31:0] io_dmem_req_bits_data,
  output        io_dmem_req_bits_fcn,
  output [2:0]  io_dmem_req_bits_typ,
  input         io_dmem_resp_valid,
  input  [31:0] io_dmem_resp_bits_data
);
  wire  c_clock;
  wire  c_reset;
  wire  c_io_dmem_resp_valid;
  wire [31:0] c_io_dat_dec_inst;
  wire  c_io_dat_exe_br_eq;
  wire  c_io_dat_exe_br_lt;
  wire  c_io_dat_exe_br_ltu;
  wire [3:0] c_io_dat_exe_br_type;
  wire  c_io_dat_mem_ctrl_dmem_val;
  wire  c_io_dat_csr_eret;
  wire  c_io_ctl_dec_stall;
  wire  c_io_ctl_full_stall;
  wire [1:0] c_io_ctl_exe_pc_sel;
  wire [3:0] c_io_ctl_br_type;
  wire  c_io_ctl_if_kill;
  wire  c_io_ctl_dec_kill;
  wire [1:0] c_io_ctl_op1_sel;
  wire [2:0] c_io_ctl_op2_sel;
  wire [3:0] c_io_ctl_alu_fun;
  wire [1:0] c_io_ctl_wb_sel;
  wire  c_io_ctl_rf_wen;
  wire  c_io_ctl_mem_val;
  wire [1:0] c_io_ctl_mem_fcn;
  wire [2:0] c_io_ctl_mem_typ;
  wire [2:0] c_io_ctl_csr_cmd;
  wire  c_io_ctl_fencei;
  wire  c_io_ctl_pipeline_kill;
  wire  c_io_ctl_mem_exception;
  wire  d_io_ctl_dec_stall;
  wire  d_io_ctl_full_stall;
  wire [1:0] d_io_ctl_exe_pc_sel;
  wire [3:0] d_io_ctl_br_type;
  wire  d_io_ctl_if_kill;
  wire  d_io_ctl_dec_kill;
  wire [1:0] d_io_ctl_op1_sel;
  wire [2:0] d_io_ctl_op2_sel;
  wire [3:0] d_io_ctl_alu_fun;
  wire [1:0] d_io_ctl_wb_sel;
  wire  d_io_ctl_rf_wen;
  wire  d_io_ctl_mem_val;
  wire [1:0] d_io_ctl_mem_fcn;
  wire [2:0] d_io_ctl_mem_typ;
  wire [2:0] d_io_ctl_csr_cmd;
  wire  d_io_ctl_fencei;
  wire  d_io_ctl_pipeline_kill;
  wire  d_io_ctl_mem_exception;
  wire [31:0] d_io_dat_dec_inst;
  wire  d_io_dat_exe_br_eq;
  wire  d_io_dat_exe_br_lt;
  wire  d_io_dat_exe_br_ltu;
  wire [3:0] d_io_dat_exe_br_type;
  wire  d_io_dat_mem_ctrl_dmem_val;
  wire  d_io_dat_csr_eret;
  CtlPath c (
    .clock(c_clock),
    .reset(c_reset),
    .io_dmem_resp_valid(c_io_dmem_resp_valid),
    .io_dat_dec_inst(c_io_dat_dec_inst),
    .io_dat_exe_br_eq(c_io_dat_exe_br_eq),
    .io_dat_exe_br_lt(c_io_dat_exe_br_lt),
    .io_dat_exe_br_ltu(c_io_dat_exe_br_ltu),
    .io_dat_exe_br_type(c_io_dat_exe_br_type),
    .io_dat_mem_ctrl_dmem_val(c_io_dat_mem_ctrl_dmem_val),
    .io_dat_csr_eret(c_io_dat_csr_eret),
    .io_ctl_dec_stall(c_io_ctl_dec_stall),
    .io_ctl_full_stall(c_io_ctl_full_stall),
    .io_ctl_exe_pc_sel(c_io_ctl_exe_pc_sel),
    .io_ctl_br_type(c_io_ctl_br_type),
    .io_ctl_if_kill(c_io_ctl_if_kill),
    .io_ctl_dec_kill(c_io_ctl_dec_kill),
    .io_ctl_op1_sel(c_io_ctl_op1_sel),
    .io_ctl_op2_sel(c_io_ctl_op2_sel),
    .io_ctl_alu_fun(c_io_ctl_alu_fun),
    .io_ctl_wb_sel(c_io_ctl_wb_sel),
    .io_ctl_rf_wen(c_io_ctl_rf_wen),
    .io_ctl_mem_val(c_io_ctl_mem_val),
    .io_ctl_mem_fcn(c_io_ctl_mem_fcn),
    .io_ctl_mem_typ(c_io_ctl_mem_typ),
    .io_ctl_csr_cmd(c_io_ctl_csr_cmd),
    .io_ctl_fencei(c_io_ctl_fencei),
    .io_ctl_pipeline_kill(c_io_ctl_pipeline_kill),
    .io_ctl_mem_exception(c_io_ctl_mem_exception)
  );
  // inject data path
  wire         io_ctl_dec_stall;
  wire         io_ctl_full_stall;
  wire  [1:0]  io_ctl_exe_pc_sel;
  wire  [3:0]  io_ctl_br_type;
  wire         io_ctl_if_kill;
  wire         io_ctl_dec_kill;
  wire  [1:0]  io_ctl_op1_sel;
  wire  [2:0]  io_ctl_op2_sel;
  wire  [3:0]  io_ctl_alu_fun;
  wire  [1:0]  io_ctl_wb_sel;
  wire         io_ctl_rf_wen;
  wire         io_ctl_mem_val;
  wire  [1:0]  io_ctl_mem_fcn;
  wire  [2:0]  io_ctl_mem_typ;
  wire  [2:0]  io_ctl_csr_cmd;
  wire         io_ctl_fencei;
  wire         io_ctl_pipeline_kill;
  wire         io_ctl_mem_exception;
  wire [31:0] io_dat_dec_inst;
  wire        io_dat_exe_br_eq;
  wire        io_dat_exe_br_lt;
  wire        io_dat_exe_br_ltu;
  wire [3:0]  io_dat_exe_br_type;
  wire        io_dat_mem_ctrl_dmem_val;
  wire        io_dat_csr_eret;
  reg [31:0] if_reg_pc;
  reg [31:0] _RAND_0;
  reg [31:0] dec_reg_inst;
  reg [31:0] _RAND_1;
  reg [31:0] dec_reg_pc;
  reg [31:0] _RAND_2;
  reg [31:0] exe_reg_inst;
  reg [31:0] _RAND_3;
  reg [31:0] exe_reg_pc;
  reg [31:0] _RAND_4;
  reg [4:0] exe_reg_wbaddr;
  reg [31:0] _RAND_5;
  reg [31:0] exe_alu_op1;
  reg [31:0] _RAND_6;
  reg [31:0] brjmp_offset;
  reg [31:0] _RAND_7;
  reg [31:0] exe_reg_rs2_data;
  reg [31:0] _RAND_8;
  reg [3:0] exe_reg_ctrl_br_type;
  reg [31:0] _RAND_9;
  reg [3:0] exe_reg_ctrl_alu_fun;
  reg [31:0] _RAND_10;
  reg [1:0] exe_reg_ctrl_wb_sel;
  reg [31:0] _RAND_11;
  reg  exe_reg_ctrl_rf_wen;
  reg [31:0] _RAND_12;
  reg  exe_reg_ctrl_mem_val;
  reg [31:0] _RAND_13;
  reg  exe_reg_ctrl_mem_fcn;
  reg [31:0] _RAND_14;
  reg [2:0] exe_reg_ctrl_mem_typ;
  reg [31:0] _RAND_15;
  reg [2:0] exe_reg_ctrl_csr_cmd;
  reg [31:0] _RAND_16;
  reg [31:0] mem_reg_pc;
  reg [31:0] _RAND_17;
  reg [31:0] mem_reg_inst;
  reg [31:0] _RAND_18;
  reg [31:0] mem_reg_alu_out;
  reg [31:0] _RAND_19;
  reg [4:0] mem_reg_wbaddr;
  reg [31:0] _RAND_20;
  reg [31:0] mem_reg_rs2_data;
  reg [31:0] _RAND_21;
  reg  mem_reg_ctrl_rf_wen;
  reg [31:0] _RAND_22;
  reg  mem_reg_ctrl_mem_val;
  reg [31:0] _RAND_23;
  reg  mem_reg_ctrl_mem_fcn;
  reg [31:0] _RAND_24;
  reg [2:0] mem_reg_ctrl_mem_typ;
  reg [31:0] _RAND_25;
  reg [1:0] mem_reg_ctrl_wb_sel;
  reg [31:0] _RAND_26;
  reg [2:0] mem_reg_ctrl_csr_cmd;
  reg [31:0] _RAND_27;
  reg [4:0] wb_reg_wbaddr;
  reg [31:0] _RAND_28;
  reg [31:0] wb_reg_wbdata;
  reg [31:0] _RAND_29;
  reg  wb_reg_ctrl_rf_wen;
  reg [31:0] _RAND_30;
  wire [31:0] if_pc_next;
  wire [31:0] exe_brjmp_target;
  wire [31:0] exe_jump_reg_target;
  wire [31:0] exception_target;
  wire  _T_161;
  wire  _T_163;
  wire  _T_164;
  wire  _T_165;
  wire [31:0] _GEN_0;
  wire [32:0] _T_167;
  wire [31:0] if_pc_plus4;
  wire  _T_168;
  wire  _T_169;
  wire  _T_170;
  wire [31:0] _T_171;
  wire [31:0] _T_172;
  wire [31:0] _T_173;
  wire  _T_175;
  wire  _T_178;
  wire  _T_181;
  wire  _T_183;
  wire  _T_184;
  wire [31:0] _GEN_1;
  wire [31:0] _GEN_2;
  wire [31:0] _GEN_3;
  wire [31:0] _GEN_4;
  wire [31:0] _GEN_5;
  wire [31:0] _GEN_6;
  wire [4:0] dec_rs1_addr;
  wire [4:0] dec_rs2_addr;
  wire [4:0] dec_wbaddr;
  wire  regfile_clock;
  wire [4:0] regfile_io_rs1_addr;
  wire [31:0] regfile_io_rs1_data;
  wire [4:0] regfile_io_rs2_addr;
  wire [31:0] regfile_io_rs2_data;
  wire [4:0] regfile_io_dm_addr;
  wire [31:0] regfile_io_dm_rdata;
  wire [31:0] regfile_io_dm_wdata;
  wire [4:0] regfile_io_waddr;
  wire [31:0] regfile_io_wdata;
  wire  regfile_io_wen;
  wire [11:0] imm_itype;
  wire [6:0] _T_190;
  wire [11:0] imm_stype;
  wire  _T_192;
  wire  _T_193;
  wire [5:0] _T_194;
  wire [3:0] _T_195;
  wire [9:0] _T_196;
  wire [1:0] _T_197;
  wire [11:0] imm_sbtype;
  wire [19:0] imm_utype;
  wire [7:0] _T_199;
  wire  _T_200;
  wire [9:0] _T_201;
  wire [10:0] _T_202;
  wire [8:0] _T_203;
  wire [19:0] imm_ujtype;
  wire [31:0] imm_z;
  wire  _T_210;
  wire [19:0] _T_214;
  wire [31:0] imm_itype_sext;
  wire  _T_215;
  wire [19:0] _T_219;
  wire [31:0] imm_stype_sext;
  wire  _T_220;
  wire [18:0] _T_224;
  wire [30:0] _T_226;
  wire [31:0] imm_sbtype_sext;
  wire [31:0] imm_utype_sext;
  wire  _T_232;
  wire [10:0] _T_236;
  wire [30:0] _T_238;
  wire [31:0] imm_ujtype_sext;
  wire  _T_240;
  wire  _T_241;
  wire  _T_242;
  wire  _T_243;
  wire  _T_244;
  wire  _T_245;
  wire [31:0] _T_246;
  wire [31:0] _T_247;
  wire [31:0] _T_248;
  wire [31:0] _T_249;
  wire [31:0] _T_250;
  wire [31:0] dec_alu_op2;
  wire [31:0] exe_alu_out;
  wire [31:0] mem_wbdata;
  wire [31:0] dec_op1_data;
  wire [31:0] dec_op2_data;
  wire [31:0] dec_rs2_data;
  wire  _T_256;
  wire  _T_257;
  wire  _T_258;
  wire  _T_260;
  wire  _T_261;
  wire  _T_262;
  wire  _T_263;
  wire  _T_266;
  wire  _T_267;
  wire  _T_268;
  wire  _T_271;
  wire  _T_272;
  wire [31:0] _T_273;
  wire [31:0] _T_274;
  wire [31:0] _T_275;
  wire [31:0] _T_276;
  wire [31:0] _T_277;
  wire  _T_278;
  wire  _T_280;
  wire  _T_281;
  wire  _T_282;
  wire  _T_284;
  wire  _T_285;
  wire  _T_288;
  wire  _T_289;
  wire  _T_291;
  wire  _T_292;
  wire  _T_295;
  wire  _T_296;
  wire  _T_298;
  wire [31:0] _T_299;
  wire [31:0] _T_300;
  wire [31:0] _T_301;
  wire [31:0] _T_317;
  wire [31:0] _T_318;
  wire [31:0] _T_319;
  wire  _T_322;
  wire  _T_323;
  wire [31:0] _GEN_7;
  wire [4:0] _GEN_8;
  wire  _GEN_9;
  wire  _GEN_10;
  wire [1:0] _GEN_11;
  wire [2:0] _GEN_12;
  wire [3:0] _GEN_13;
  wire [2:0] _GEN_14;
  wire [31:0] _GEN_15;
  wire [31:0] _GEN_18;
  wire [31:0] _GEN_19;
  wire [31:0] _GEN_20;
  wire [3:0] _GEN_22;
  wire [1:0] _GEN_23;
  wire [31:0] _GEN_24;
  wire [4:0] _GEN_25;
  wire  _GEN_26;
  wire  _GEN_27;
  wire [1:0] _GEN_28;
  wire [2:0] _GEN_29;
  wire [3:0] _GEN_30;
  wire [2:0] _GEN_31;
  wire [31:0] _GEN_32;
  wire [4:0] _GEN_33;
  wire  _GEN_34;
  wire  _GEN_35;
  wire [1:0] _GEN_36;
  wire [2:0] _GEN_37;
  wire [3:0] _GEN_38;
  wire [31:0] _GEN_39;
  wire [31:0] _GEN_42;
  wire [31:0] _GEN_43;
  wire [31:0] _GEN_44;
  wire [3:0] _GEN_46;
  wire [1:0] _GEN_47;
  wire [2:0] _GEN_48;
  wire [4:0] alu_shamt;
  wire [32:0] _T_335;
  wire [31:0] exe_adder_out;
  wire  _T_337;
  wire  _T_338;
  wire [32:0] _T_339;
  wire [32:0] _T_340;
  wire [31:0] _T_341;
  wire  _T_342;
  wire [31:0] _T_343;
  wire  _T_344;
  wire [31:0] _T_345;
  wire  _T_346;
  wire [31:0] _T_347;
  wire  _T_348;
  wire [31:0] _T_349;
  wire [31:0] _T_350;
  wire  _T_351;
  wire  _T_352;
  wire  _T_353;
  wire  _T_354;
  wire [62:0] _GEN_82;
  wire [62:0] _T_355;
  wire [31:0] _T_356;
  wire  _T_357;
  wire [31:0] _T_359;
  wire [31:0] _T_360;
  wire  _T_361;
  wire [31:0] _T_362;
  wire  _T_363;
  wire  _T_364;
  wire [31:0] _T_365;
  wire [31:0] _T_366;
  wire [31:0] _T_367;
  wire [31:0] _T_368;
  wire [31:0] _T_369;
  wire [31:0] _T_370;
  wire [31:0] _T_371;
  wire [31:0] _T_372;
  wire [31:0] _T_373;
  wire [31:0] _T_374;
  wire [31:0] _T_375;
  wire [31:0] _T_376;
  wire [32:0] _T_377;
  wire [31:0] _T_378;
  wire [32:0] _T_380;
  wire [31:0] exe_pc_plus4;
  wire  _T_387;
  wire [31:0] _T_388;
  wire [31:0] _GEN_49;
  wire [31:0] _GEN_50;
  wire [31:0] _GEN_51;
  wire [4:0] _GEN_52;
  wire [31:0] _GEN_57;
  wire  _GEN_58;
  wire  _GEN_59;
  wire  _GEN_60;
  wire [2:0] _GEN_61;
  wire [1:0] _GEN_62;
  wire [2:0] _GEN_63;
  wire [31:0] _GEN_64;
  wire  _GEN_65;
  wire  _GEN_66;
  wire [2:0] _GEN_67;
  wire [31:0] _GEN_68;
  wire [31:0] _GEN_69;
  wire [4:0] _GEN_70;
  wire [31:0] _GEN_75;
  wire  _GEN_76;
  wire [2:0] _GEN_77;
  wire [1:0] _GEN_78;
  wire  csr_clock;
  wire  csr_reset;
  wire [2:0] csr_io_rw_cmd;
  wire [31:0] csr_io_rw_rdata;
  wire [31:0] csr_io_rw_wdata;
  wire  csr_io_eret;
  wire [11:0] csr_io_decode_csr;
  wire  csr_io_status_debug;
  wire [1:0] csr_io_status_prv;
  wire  csr_io_status_sd;
  wire [7:0] csr_io_status_zero1;
  wire  csr_io_status_tsr;
  wire  csr_io_status_tw;
  wire  csr_io_status_tvm;
  wire  csr_io_status_mxr;
  wire  csr_io_status_sum;
  wire  csr_io_status_mprv;
  wire [1:0] csr_io_status_xs;
  wire [1:0] csr_io_status_fs;
  wire [1:0] csr_io_status_mpp;
  wire [1:0] csr_io_status_hpp;
  wire  csr_io_status_spp;
  wire  csr_io_status_mpie;
  wire  csr_io_status_hpie;
  wire  csr_io_status_spie;
  wire  csr_io_status_upie;
  wire  csr_io_status_mie;
  wire  csr_io_status_hie;
  wire  csr_io_status_sie;
  wire  csr_io_status_uie;
  wire [31:0] csr_io_evec;
  wire  csr_io_exception;
  wire  csr_io_retire;
  wire [31:0] csr_io_pc;
  wire [31:0] csr_io_time;
  wire [11:0] _T_389;
  wire  _T_394;
  wire  _T_455;
  wire  _T_456;
  wire  _T_457;
  wire  _T_458;
  wire [31:0] _T_459;
  wire [31:0] _T_460;
  wire [31:0] _T_461;
  wire [31:0] _T_462;
  wire  _T_466;
  wire [4:0] _GEN_79;
  wire [31:0] _GEN_80;
  wire  _GEN_81;
  wire  _T_468;
  wire [31:0] _T_470;
  wire  _T_471;
  wire  _T_472;
  wire [31:0] _T_473;
  reg [31:0] _T_475;
  reg [31:0] _RAND_31;
  reg [31:0] _T_477;
  reg [31:0] _RAND_32;
  reg [31:0] _T_479;
  reg [31:0] _RAND_33;
  wire [7:0] _T_482;
  wire [7:0] _T_485;
  wire [7:0] _T_489;
  wire [7:0] _T_490;
  wire  _T_498;
  wire [7:0] _T_504;
  wire [7:0] _T_505;
  wire [7:0] _T_506;
  wire [7:0] _T_507;
  wire [7:0] _T_510;
  wire [31:0] _T_511;
  wire  _T_514;
  RegisterFile RF1 (
    .clock(regfile_clock),
    .reset(reset),
    .io_rs1_addr(regfile_io_rs1_addr),
    .io_rs1_data(regfile_io_rs1_data),
    .io_rs2_addr(regfile_io_rs2_addr),
    .io_rs2_data(regfile_io_rs2_data),
    .io_dm_addr(regfile_io_dm_addr),
    .io_dm_rdata(regfile_io_dm_rdata),
    .io_dm_wdata(regfile_io_dm_wdata),
    .io_waddr(regfile_io_waddr),
    .io_wdata(regfile_io_wdata),
    .io_wen(regfile_io_wen)
  );
  CSRFile csr (
    .clock(csr_clock),
    .reset(csr_reset),
    .io_rw_cmd(csr_io_rw_cmd),
    .io_rw_rdata(csr_io_rw_rdata),
    .io_rw_wdata(csr_io_rw_wdata),
    .io_eret(csr_io_eret),
    .io_decode_csr(csr_io_decode_csr),
    .io_status_debug(csr_io_status_debug),
    .io_status_prv(csr_io_status_prv),
    .io_status_sd(csr_io_status_sd),
    .io_status_zero1(csr_io_status_zero1),
    .io_status_tsr(csr_io_status_tsr),
    .io_status_tw(csr_io_status_tw),
    .io_status_tvm(csr_io_status_tvm),
    .io_status_mxr(csr_io_status_mxr),
    .io_status_sum(csr_io_status_sum),
    .io_status_mprv(csr_io_status_mprv),
    .io_status_xs(csr_io_status_xs),
    .io_status_fs(csr_io_status_fs),
    .io_status_mpp(csr_io_status_mpp),
    .io_status_hpp(csr_io_status_hpp),
    .io_status_spp(csr_io_status_spp),
    .io_status_mpie(csr_io_status_mpie),
    .io_status_hpie(csr_io_status_hpie),
    .io_status_spie(csr_io_status_spie),
    .io_status_upie(csr_io_status_upie),
    .io_status_mie(csr_io_status_mie),
    .io_status_hie(csr_io_status_hie),
    .io_status_sie(csr_io_status_sie),
    .io_status_uie(csr_io_status_uie),
    .io_evec(csr_io_evec),
    .io_exception(csr_io_exception),
    .io_retire(csr_io_retire),
    .io_pc(csr_io_pc),
    .io_time(csr_io_time)
  );
  assign _T_161 = io_ctl_dec_stall == 1'h0;
  assign _T_163 = io_ctl_full_stall == 1'h0;
  assign _T_164 = _T_161 & _T_163;
  assign _T_165 = _T_164 | io_ctl_pipeline_kill;
  assign _GEN_0 = _T_165 ? if_pc_next : if_reg_pc;
  assign _T_167 = if_reg_pc + 32'h4;
  assign if_pc_plus4 = _T_167[31:0];
  assign _T_168 = io_ctl_exe_pc_sel == 2'h0;
  assign _T_169 = io_ctl_exe_pc_sel == 2'h1;
  assign _T_170 = io_ctl_exe_pc_sel == 2'h2;
  assign _T_171 = _T_170 ? exe_jump_reg_target : exception_target;
  assign _T_172 = _T_169 ? exe_brjmp_target : _T_171;
  assign _T_173 = _T_168 ? if_pc_plus4 : _T_172;
  assign _T_175 = io_ctl_fencei & _T_168;
  assign _T_178 = _T_175 & _T_161;
  assign _T_181 = _T_178 & _T_163;
  assign _T_183 = io_ctl_pipeline_kill == 1'h0;
  assign _T_184 = _T_181 & _T_183;
  assign _GEN_1 = _T_184 ? if_reg_pc : _T_173;
  assign _GEN_2 = io_ctl_if_kill ? 32'h4033 : io_imem_resp_bits_data;
  assign _GEN_3 = _T_164 ? _GEN_2 : dec_reg_inst;
  assign _GEN_4 = _T_164 ? if_reg_pc : dec_reg_pc;
  assign _GEN_5 = io_ctl_pipeline_kill ? 32'h4033 : _GEN_3;
  assign _GEN_6 = io_ctl_pipeline_kill ? dec_reg_pc : _GEN_4;
  assign dec_rs1_addr = dec_reg_inst[19:15];
  assign dec_rs2_addr = dec_reg_inst[24:20];
  assign dec_wbaddr = dec_reg_inst[11:7];
  assign imm_itype = dec_reg_inst[31:20];
  assign _T_190 = dec_reg_inst[31:25];
  assign imm_stype = {_T_190,dec_wbaddr};
  assign _T_192 = dec_reg_inst[31];
  assign _T_193 = dec_reg_inst[7];
  assign _T_194 = dec_reg_inst[30:25];
  assign _T_195 = dec_reg_inst[11:8];
  assign _T_196 = {_T_194,_T_195};
  assign _T_197 = {_T_192,_T_193};
  assign imm_sbtype = {_T_197,_T_196};
  assign imm_utype = dec_reg_inst[31:12];
  assign _T_199 = dec_reg_inst[19:12];
  assign _T_200 = dec_reg_inst[20];
  assign _T_201 = dec_reg_inst[30:21];
  assign _T_202 = {_T_200,_T_201};
  assign _T_203 = {_T_192,_T_199};
  assign imm_ujtype = {_T_203,_T_202};
  assign imm_z = {27'h0,dec_rs1_addr};
  assign _T_210 = imm_itype[11];
  assign _T_214 = _T_210 ? 20'hfffff : 20'h0;
  assign imm_itype_sext = {_T_214,imm_itype};
  assign _T_215 = imm_stype[11];
  assign _T_219 = _T_215 ? 20'hfffff : 20'h0;
  assign imm_stype_sext = {_T_219,imm_stype};
  assign _T_220 = imm_sbtype[11];
  assign _T_224 = _T_220 ? 19'h7ffff : 19'h0;
  assign _T_226 = {_T_224,imm_sbtype};
  assign imm_sbtype_sext = {_T_226,1'h0};
  assign imm_utype_sext = {imm_utype,12'h0};
  assign _T_232 = imm_ujtype[19];
  assign _T_236 = _T_232 ? 11'h7ff : 11'h0;
  assign _T_238 = {_T_236,imm_ujtype};
  assign imm_ujtype_sext = {_T_238,1'h0};
  assign _T_240 = io_ctl_op2_sel == 3'h0;
  assign _T_241 = io_ctl_op2_sel == 3'h1;
  assign _T_242 = io_ctl_op2_sel == 3'h2;
  assign _T_243 = io_ctl_op2_sel == 3'h3;
  assign _T_244 = io_ctl_op2_sel == 3'h4;
  assign _T_245 = io_ctl_op2_sel == 3'h5;
  assign _T_246 = _T_245 ? imm_ujtype_sext : 32'h0;
  assign _T_247 = _T_244 ? imm_utype_sext : _T_246;
  assign _T_248 = _T_243 ? imm_sbtype_sext : _T_247;
  assign _T_249 = _T_242 ? imm_stype_sext : _T_248;
  assign _T_250 = _T_241 ? imm_itype_sext : _T_249;
  assign dec_alu_op2 = _T_240 ? regfile_io_rs2_data : _T_250;
  assign _T_256 = io_ctl_op1_sel == 2'h2;
  assign _T_257 = io_ctl_op1_sel == 2'h1;
  assign _T_258 = exe_reg_wbaddr == dec_rs1_addr;
  assign _T_260 = dec_rs1_addr != 5'h0;
  assign _T_261 = _T_258 & _T_260;
  assign _T_262 = _T_261 & exe_reg_ctrl_rf_wen;
  assign _T_263 = mem_reg_wbaddr == dec_rs1_addr;
  assign _T_266 = _T_263 & _T_260;
  assign _T_267 = _T_266 & mem_reg_ctrl_rf_wen;
  assign _T_268 = wb_reg_wbaddr == dec_rs1_addr;
  assign _T_271 = _T_268 & _T_260;
  assign _T_272 = _T_271 & wb_reg_ctrl_rf_wen;
  assign _T_273 = _T_272 ? wb_reg_wbdata : regfile_io_rs1_data;
  assign _T_274 = _T_267 ? mem_wbdata : _T_273;
  assign _T_275 = _T_262 ? exe_alu_out : _T_274;
  assign _T_276 = _T_257 ? dec_reg_pc : _T_275;
  assign _T_277 = _T_256 ? imm_z : _T_276;
  assign _T_278 = exe_reg_wbaddr == dec_rs2_addr;
  assign _T_280 = dec_rs2_addr != 5'h0;
  assign _T_281 = _T_278 & _T_280;
  assign _T_282 = _T_281 & exe_reg_ctrl_rf_wen;
  assign _T_284 = _T_282 & _T_240;
  assign _T_285 = mem_reg_wbaddr == dec_rs2_addr;
  assign _T_288 = _T_285 & _T_280;
  assign _T_289 = _T_288 & mem_reg_ctrl_rf_wen;
  assign _T_291 = _T_289 & _T_240;
  assign _T_292 = wb_reg_wbaddr == dec_rs2_addr;
  assign _T_295 = _T_292 & _T_280;
  assign _T_296 = _T_295 & wb_reg_ctrl_rf_wen;
  assign _T_298 = _T_296 & _T_240;
  assign _T_299 = _T_298 ? wb_reg_wbdata : dec_alu_op2;
  assign _T_300 = _T_291 ? mem_wbdata : _T_299;
  assign _T_301 = _T_284 ? exe_alu_out : _T_300;
  assign _T_317 = _T_296 ? wb_reg_wbdata : regfile_io_rs2_data;
  assign _T_318 = _T_289 ? mem_wbdata : _T_317;
  assign _T_319 = _T_282 ? exe_alu_out : _T_318;
  assign _T_322 = io_ctl_dec_stall & _T_163;
  assign _T_323 = _T_322 | io_ctl_pipeline_kill;
  assign _GEN_7 = io_ctl_dec_kill ? 32'h4033 : dec_reg_inst;
  assign _GEN_8 = io_ctl_dec_kill ? 5'h0 : dec_wbaddr;
  assign _GEN_9 = io_ctl_dec_kill ? 1'h0 : io_ctl_rf_wen;
  assign _GEN_10 = io_ctl_dec_kill ? 1'h0 : io_ctl_mem_val;
  assign _GEN_11 = io_ctl_dec_kill ? 2'h0 : io_ctl_mem_fcn;
  assign _GEN_12 = io_ctl_dec_kill ? 3'h0 : io_ctl_csr_cmd;
  assign _GEN_13 = io_ctl_dec_kill ? 4'h0 : io_ctl_br_type;
  assign _GEN_14 = io_ctl_dec_kill ? exe_reg_ctrl_mem_typ : io_ctl_mem_typ;
  assign _GEN_15 = _T_164 ? dec_reg_pc : exe_reg_pc;
  assign _GEN_18 = _T_164 ? dec_op1_data : exe_alu_op1;
  assign _GEN_19 = _T_164 ? dec_op2_data : brjmp_offset;
  assign _GEN_20 = _T_164 ? dec_rs2_data : exe_reg_rs2_data;
  assign _GEN_22 = _T_164 ? io_ctl_alu_fun : exe_reg_ctrl_alu_fun;
  assign _GEN_23 = _T_164 ? io_ctl_wb_sel : exe_reg_ctrl_wb_sel;
  assign _GEN_24 = _T_164 ? _GEN_7 : exe_reg_inst;
  assign _GEN_25 = _T_164 ? _GEN_8 : exe_reg_wbaddr;
  assign _GEN_26 = _T_164 ? _GEN_9 : exe_reg_ctrl_rf_wen;
  assign _GEN_27 = _T_164 ? _GEN_10 : exe_reg_ctrl_mem_val;
  assign _GEN_28 = _T_164 ? _GEN_11 : {{1'd0}, exe_reg_ctrl_mem_fcn};
  assign _GEN_29 = _T_164 ? _GEN_12 : exe_reg_ctrl_csr_cmd;
  assign _GEN_30 = _T_164 ? _GEN_13 : exe_reg_ctrl_br_type;
  assign _GEN_31 = _T_164 ? _GEN_14 : exe_reg_ctrl_mem_typ;
  assign _GEN_32 = _T_323 ? 32'h4033 : _GEN_24;
  assign _GEN_33 = _T_323 ? 5'h0 : _GEN_25;
  assign _GEN_34 = _T_323 ? 1'h0 : _GEN_26;
  assign _GEN_35 = _T_323 ? 1'h0 : _GEN_27;
  assign _GEN_36 = _T_323 ? 2'h0 : _GEN_28;
  assign _GEN_37 = _T_323 ? 3'h0 : _GEN_29;
  assign _GEN_38 = _T_323 ? 4'h0 : _GEN_30;
  assign _GEN_39 = _T_323 ? exe_reg_pc : _GEN_15;
  assign _GEN_42 = _T_323 ? exe_alu_op1 : _GEN_18;
  assign _GEN_43 = _T_323 ? brjmp_offset : _GEN_19;
  assign _GEN_44 = _T_323 ? exe_reg_rs2_data : _GEN_20;
  assign _GEN_46 = _T_323 ? exe_reg_ctrl_alu_fun : _GEN_22;
  assign _GEN_47 = _T_323 ? exe_reg_ctrl_wb_sel : _GEN_23;
  assign _GEN_48 = _T_323 ? exe_reg_ctrl_mem_typ : _GEN_31;
  assign alu_shamt = brjmp_offset[4:0];
  assign _T_335 = exe_alu_op1 + brjmp_offset;
  assign exe_adder_out = _T_335[31:0];
  assign _T_337 = exe_reg_ctrl_alu_fun == 4'h0;
  assign _T_338 = exe_reg_ctrl_alu_fun == 4'h1;
  assign _T_339 = exe_alu_op1 - brjmp_offset;
  assign _T_340 = $unsigned(_T_339);
  assign _T_341 = _T_340[31:0];
  assign _T_342 = exe_reg_ctrl_alu_fun == 4'h5;
  assign _T_343 = exe_alu_op1 & brjmp_offset;
  assign _T_344 = exe_reg_ctrl_alu_fun == 4'h6;
  assign _T_345 = exe_alu_op1 | brjmp_offset;
  assign _T_346 = exe_reg_ctrl_alu_fun == 4'h7;
  assign _T_347 = exe_alu_op1 ^ brjmp_offset;
  assign _T_348 = exe_reg_ctrl_alu_fun == 4'h8;
  assign _T_349 = $signed(exe_alu_op1);
  assign _T_350 = $signed(brjmp_offset);
  assign _T_351 = $signed(_T_349) < $signed(_T_350);
  assign _T_352 = exe_reg_ctrl_alu_fun == 4'h9;
  assign _T_353 = exe_alu_op1 < brjmp_offset;
  assign _T_354 = exe_reg_ctrl_alu_fun == 4'h2;
  assign _GEN_82 = {{31'd0}, exe_alu_op1};
  assign _T_355 = _GEN_82 << alu_shamt;
  assign _T_356 = _T_355[31:0];
  assign _T_357 = exe_reg_ctrl_alu_fun == 4'h4;
  assign _T_359 = $signed(_T_349) >>> alu_shamt;
  assign _T_360 = $unsigned(_T_359);
  assign _T_361 = exe_reg_ctrl_alu_fun == 4'h3;
  assign _T_362 = exe_alu_op1 >> alu_shamt;
  assign _T_363 = exe_reg_ctrl_alu_fun == 4'ha;
  assign _T_364 = exe_reg_ctrl_alu_fun == 4'hb;
  assign _T_365 = _T_364 ? brjmp_offset : exe_reg_inst;
  assign _T_366 = _T_363 ? exe_alu_op1 : _T_365;
  assign _T_367 = _T_361 ? _T_362 : _T_366;
  assign _T_368 = _T_357 ? _T_360 : _T_367;
  assign _T_369 = _T_354 ? _T_356 : _T_368;
  assign _T_370 = _T_352 ? {{31'd0}, _T_353} : _T_369;
  assign _T_371 = _T_348 ? {{31'd0}, _T_351} : _T_370;
  assign _T_372 = _T_346 ? _T_347 : _T_371;
  assign _T_373 = _T_344 ? _T_345 : _T_372;
  assign _T_374 = _T_342 ? _T_343 : _T_373;
  assign _T_375 = _T_338 ? _T_341 : _T_374;
  assign _T_376 = _T_337 ? exe_adder_out : _T_375;
  assign _T_377 = exe_reg_pc + brjmp_offset;
  assign _T_378 = _T_377[31:0];
  assign _T_380 = exe_reg_pc + 32'h4;
  assign exe_pc_plus4 = _T_380[31:0];
  assign _T_387 = exe_reg_ctrl_wb_sel == 2'h2;
  assign _T_388 = _T_387 ? exe_pc_plus4 : exe_alu_out;
  assign _GEN_49 = _T_163 ? exe_reg_pc : mem_reg_pc;
  assign _GEN_50 = _T_163 ? exe_reg_inst : mem_reg_inst;
  assign _GEN_51 = _T_163 ? _T_388 : mem_reg_alu_out;
  assign _GEN_52 = _T_163 ? exe_reg_wbaddr : mem_reg_wbaddr;
  assign _GEN_57 = _T_163 ? exe_reg_rs2_data : mem_reg_rs2_data;
  assign _GEN_58 = _T_163 ? exe_reg_ctrl_rf_wen : mem_reg_ctrl_rf_wen;
  assign _GEN_59 = _T_163 ? exe_reg_ctrl_mem_val : mem_reg_ctrl_mem_val;
  assign _GEN_60 = _T_163 ? exe_reg_ctrl_mem_fcn : mem_reg_ctrl_mem_fcn;
  assign _GEN_61 = _T_163 ? exe_reg_ctrl_mem_typ : mem_reg_ctrl_mem_typ;
  assign _GEN_62 = _T_163 ? exe_reg_ctrl_wb_sel : mem_reg_ctrl_wb_sel;
  assign _GEN_63 = _T_163 ? exe_reg_ctrl_csr_cmd : mem_reg_ctrl_csr_cmd;
  assign _GEN_64 = io_ctl_pipeline_kill ? 32'h4033 : _GEN_49;
  assign _GEN_65 = io_ctl_pipeline_kill ? 1'h0 : _GEN_58;
  assign _GEN_66 = io_ctl_pipeline_kill ? 1'h0 : _GEN_59;
  assign _GEN_67 = io_ctl_pipeline_kill ? 3'h0 : _GEN_63;
  assign _GEN_68 = io_ctl_pipeline_kill ? mem_reg_inst : _GEN_50;
  assign _GEN_69 = io_ctl_pipeline_kill ? mem_reg_alu_out : _GEN_51;
  assign _GEN_70 = io_ctl_pipeline_kill ? mem_reg_wbaddr : _GEN_52;
  assign _GEN_75 = io_ctl_pipeline_kill ? mem_reg_rs2_data : _GEN_57;
  assign _GEN_76 = io_ctl_pipeline_kill ? mem_reg_ctrl_mem_fcn : _GEN_60;
  assign _GEN_77 = io_ctl_pipeline_kill ? mem_reg_ctrl_mem_typ : _GEN_61;
  assign _GEN_78 = io_ctl_pipeline_kill ? mem_reg_ctrl_wb_sel : _GEN_62;
  assign _T_389 = mem_reg_inst[31:20];
  assign _T_394 = _T_163 & _T_161;
  assign _T_455 = mem_reg_ctrl_wb_sel == 2'h0;
  assign _T_456 = mem_reg_ctrl_wb_sel == 2'h2;
  assign _T_457 = mem_reg_ctrl_wb_sel == 2'h1;
  assign _T_458 = mem_reg_ctrl_wb_sel == 2'h3;
  assign _T_459 = _T_458 ? csr_io_rw_rdata : mem_reg_alu_out;
  assign _T_460 = _T_457 ? io_dmem_resp_bits_data : _T_459;
  assign _T_461 = _T_456 ? mem_reg_alu_out : _T_460;
  assign _T_462 = _T_455 ? mem_reg_alu_out : _T_461;
  assign _T_466 = io_ctl_mem_exception ? 1'h0 : mem_reg_ctrl_rf_wen;
  assign _GEN_79 = _T_163 ? mem_reg_wbaddr : wb_reg_wbaddr;
  assign _GEN_80 = _T_163 ? mem_wbdata : wb_reg_wbdata;
  assign _GEN_81 = _T_163 ? _T_466 : 1'h0;
  assign _T_468 = exe_alu_op1 == exe_reg_rs2_data;
  assign _T_470 = $signed(exe_reg_rs2_data);
  assign _T_471 = $signed(_T_349) < $signed(_T_470);
  assign _T_472 = exe_alu_op1 < exe_reg_rs2_data;
  assign _T_473 = csr_io_time;
  assign _T_482 = wb_reg_ctrl_rf_wen ? 8'h4d : 8'h20;
  assign _T_485 = mem_reg_ctrl_rf_wen ? 8'h5a : 8'h20;
  assign _T_489 = io_ctl_dec_stall ? 8'h53 : 8'h20;
  assign _T_490 = io_ctl_full_stall ? 8'h46 : _T_489;
  assign _T_498 = io_ctl_exe_pc_sel == 2'h3;
  assign _T_504 = _T_168 ? 8'h20 : 8'h3f;
  assign _T_505 = _T_498 ? 8'h45 : _T_504;
  assign _T_506 = _T_170 ? 8'h4a : _T_505;
  assign _T_507 = _T_169 ? 8'h42 : _T_506;
  assign _T_510 = csr_io_exception ? 8'h58 : 8'h20;
  assign _T_511 = io_ctl_pipeline_kill ? 32'h4033 : exe_reg_inst;
  assign _T_514 = reset == 1'h0;
  assign io_imem_req_bits_addr = if_reg_pc;
  assign io_dmem_req_valid = mem_reg_ctrl_mem_val;
  assign io_dmem_req_bits_addr = mem_reg_alu_out;
  assign io_dmem_req_bits_data = mem_reg_rs2_data;
  assign io_dmem_req_bits_fcn = mem_reg_ctrl_mem_fcn;
  assign io_dmem_req_bits_typ = mem_reg_ctrl_mem_typ;
  assign io_dat_dec_inst = dec_reg_inst;
  assign io_dat_exe_br_eq = _T_468;
  assign io_dat_exe_br_lt = _T_471;
  assign io_dat_exe_br_ltu = _T_472;
  assign io_dat_exe_br_type = exe_reg_ctrl_br_type;
  assign io_dat_mem_ctrl_dmem_val = mem_reg_ctrl_mem_val;
  assign io_dat_csr_eret = csr_io_eret;
  assign if_pc_next = _GEN_1;
  assign exe_brjmp_target = _T_378;
  assign exe_jump_reg_target = exe_adder_out;
  assign exception_target = csr_io_evec;
  assign regfile_io_rs1_addr = dec_rs1_addr;
  assign regfile_io_rs2_addr = dec_rs2_addr;
  assign regfile_io_waddr = wb_reg_wbaddr;
  assign regfile_io_wdata = wb_reg_wbdata;
  assign regfile_io_wen = wb_reg_ctrl_rf_wen;
  assign regfile_clock = clock;
  assign exe_alu_out = _T_376;
  assign mem_wbdata = _T_462;
  assign dec_op1_data = _T_277;
  assign dec_op2_data = _T_301;
  assign dec_rs2_data = _T_319;
  assign csr_io_rw_cmd = mem_reg_ctrl_csr_cmd;
  assign csr_io_rw_wdata = mem_reg_alu_out;
  assign csr_io_decode_csr = _T_389;
  assign csr_io_exception = io_ctl_mem_exception;
  assign csr_io_retire = _T_394;
  assign csr_io_pc = mem_reg_pc;
  assign csr_clock = clock;
  assign csr_reset = reset;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  if_reg_pc = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  dec_reg_inst = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  dec_reg_pc = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  exe_reg_inst = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  exe_reg_pc = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  exe_reg_wbaddr = _RAND_5[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  exe_alu_op1 = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  brjmp_offset = _RAND_7[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  exe_reg_rs2_data = _RAND_8[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  exe_reg_ctrl_br_type = _RAND_9[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  exe_reg_ctrl_alu_fun = _RAND_10[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  exe_reg_ctrl_wb_sel = _RAND_11[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  exe_reg_ctrl_rf_wen = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  exe_reg_ctrl_mem_val = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  exe_reg_ctrl_mem_fcn = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  exe_reg_ctrl_mem_typ = _RAND_15[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  exe_reg_ctrl_csr_cmd = _RAND_16[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{$random}};
  mem_reg_pc = _RAND_17[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{$random}};
  mem_reg_inst = _RAND_18[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{$random}};
  mem_reg_alu_out = _RAND_19[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{$random}};
  mem_reg_wbaddr = _RAND_20[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{$random}};
  mem_reg_rs2_data = _RAND_21[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{$random}};
  mem_reg_ctrl_rf_wen = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{$random}};
  mem_reg_ctrl_mem_val = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{$random}};
  mem_reg_ctrl_mem_fcn = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{$random}};
  mem_reg_ctrl_mem_typ = _RAND_25[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{$random}};
  mem_reg_ctrl_wb_sel = _RAND_26[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{$random}};
  mem_reg_ctrl_csr_cmd = _RAND_27[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{$random}};
  wb_reg_wbaddr = _RAND_28[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{$random}};
  wb_reg_wbdata = _RAND_29[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{$random}};
  wb_reg_ctrl_rf_wen = _RAND_30[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{$random}};
  _T_475 = _RAND_31[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{$random}};
  _T_477 = _RAND_32[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{$random}};
  _T_479 = _RAND_33[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      if_reg_pc <= 32'h00000000; // inject: START_ADDR=0
    end else begin
      if (_T_165) begin
        if_reg_pc <= if_pc_next;
      end
    end
    if (reset) begin
      dec_reg_inst <= 32'h4033;
    end else begin
      if (io_ctl_pipeline_kill) begin
        dec_reg_inst <= 32'h4033;
      end else begin
        if (_T_164) begin
          if (io_ctl_if_kill) begin
            dec_reg_inst <= 32'h4033;
          end else begin
            dec_reg_inst <= io_imem_resp_bits_data;
          end
        end
      end
    end
    if (reset) begin
      dec_reg_pc <= 32'h0;
    end else begin
      if (!(io_ctl_pipeline_kill)) begin
        if (_T_164) begin
          dec_reg_pc <= if_reg_pc;
        end
      end
    end
    if (reset) begin
      exe_reg_inst <= 32'h4033;
    end else begin
      if (_T_323) begin
        exe_reg_inst <= 32'h4033;
      end else begin
        if (_T_164) begin
          if (io_ctl_dec_kill) begin
            exe_reg_inst <= 32'h4033;
          end else begin
            exe_reg_inst <= dec_reg_inst;
          end
        end
      end
    end
    if (reset) begin
      exe_reg_pc <= 32'h0;
    end else begin
      if (!(_T_323)) begin
        if (_T_164) begin
          exe_reg_pc <= dec_reg_pc;
        end
      end
    end
    if (_T_323) begin
      exe_reg_wbaddr <= 5'h0;
    end else begin
      if (_T_164) begin
        if (io_ctl_dec_kill) begin
          exe_reg_wbaddr <= 5'h0;
        end else begin
          exe_reg_wbaddr <= dec_wbaddr;
        end
      end
    end
    if (!(_T_323)) begin
      if (_T_164) begin
        exe_alu_op1 <= dec_op1_data;
      end
    end
    if (!(_T_323)) begin
      if (_T_164) begin
        brjmp_offset <= dec_op2_data;
      end
    end
    if (!(_T_323)) begin
      if (_T_164) begin
        exe_reg_rs2_data <= dec_rs2_data;
      end
    end
    if (reset) begin
      exe_reg_ctrl_br_type <= 4'h0;
    end else begin
      if (_T_323) begin
        exe_reg_ctrl_br_type <= 4'h0;
      end else begin
        if (_T_164) begin
          if (io_ctl_dec_kill) begin
            exe_reg_ctrl_br_type <= 4'h0;
          end else begin
            exe_reg_ctrl_br_type <= io_ctl_br_type;
          end
        end
      end
    end
    if (!(_T_323)) begin
      if (_T_164) begin
        exe_reg_ctrl_alu_fun <= io_ctl_alu_fun;
      end
    end
    if (!(_T_323)) begin
      if (_T_164) begin
        exe_reg_ctrl_wb_sel <= io_ctl_wb_sel;
      end
    end
    if (reset) begin
      exe_reg_ctrl_rf_wen <= 1'h0;
    end else begin
      if (_T_323) begin
        exe_reg_ctrl_rf_wen <= 1'h0;
      end else begin
        if (_T_164) begin
          if (io_ctl_dec_kill) begin
            exe_reg_ctrl_rf_wen <= 1'h0;
          end else begin
            exe_reg_ctrl_rf_wen <= io_ctl_rf_wen;
          end
        end
      end
    end
    if (reset) begin
      exe_reg_ctrl_mem_val <= 1'h0;
    end else begin
      if (_T_323) begin
        exe_reg_ctrl_mem_val <= 1'h0;
      end else begin
        if (_T_164) begin
          if (io_ctl_dec_kill) begin
            exe_reg_ctrl_mem_val <= 1'h0;
          end else begin
            exe_reg_ctrl_mem_val <= io_ctl_mem_val;
          end
        end
      end
    end
    if (reset) begin
      exe_reg_ctrl_mem_fcn <= 1'h0;
    end else begin
      exe_reg_ctrl_mem_fcn <= _GEN_36[0];
    end
    if (reset) begin
      exe_reg_ctrl_mem_typ <= 3'h0;
    end else begin
      if (!(_T_323)) begin
        if (_T_164) begin
          if (!(io_ctl_dec_kill)) begin
            exe_reg_ctrl_mem_typ <= io_ctl_mem_typ;
          end
        end
      end
    end
    if (reset) begin
      exe_reg_ctrl_csr_cmd <= 3'h0;
    end else begin
      if (_T_323) begin
        exe_reg_ctrl_csr_cmd <= 3'h0;
      end else begin
        if (_T_164) begin
          if (io_ctl_dec_kill) begin
            exe_reg_ctrl_csr_cmd <= 3'h0;
          end else begin
            exe_reg_ctrl_csr_cmd <= io_ctl_csr_cmd;
          end
        end
      end
    end
    if (io_ctl_pipeline_kill) begin
      mem_reg_pc <= 32'h4033;
    end else begin
      if (_T_163) begin
        mem_reg_pc <= exe_reg_pc;
      end
    end
    if (!(io_ctl_pipeline_kill)) begin
      if (_T_163) begin
        mem_reg_inst <= exe_reg_inst;
      end
    end
    if (!(io_ctl_pipeline_kill)) begin
      if (_T_163) begin
        if (_T_387) begin
          mem_reg_alu_out <= exe_pc_plus4;
        end else begin
          mem_reg_alu_out <= exe_alu_out;
        end
      end
    end
    if (!(io_ctl_pipeline_kill)) begin
      if (_T_163) begin
        mem_reg_wbaddr <= exe_reg_wbaddr;
      end
    end
    if (!(io_ctl_pipeline_kill)) begin
      if (_T_163) begin
        mem_reg_rs2_data <= exe_reg_rs2_data;
      end
    end
    if (reset) begin
      mem_reg_ctrl_rf_wen <= 1'h0;
    end else begin
      if (io_ctl_pipeline_kill) begin
        mem_reg_ctrl_rf_wen <= 1'h0;
      end else begin
        if (_T_163) begin
          mem_reg_ctrl_rf_wen <= exe_reg_ctrl_rf_wen;
        end
      end
    end
    if (reset) begin
      mem_reg_ctrl_mem_val <= 1'h0;
    end else begin
      if (io_ctl_pipeline_kill) begin
        mem_reg_ctrl_mem_val <= 1'h0;
      end else begin
        if (_T_163) begin
          mem_reg_ctrl_mem_val <= exe_reg_ctrl_mem_val;
        end
      end
    end
    if (reset) begin
      mem_reg_ctrl_mem_fcn <= 1'h0;
    end else begin
      if (!(io_ctl_pipeline_kill)) begin
        if (_T_163) begin
          mem_reg_ctrl_mem_fcn <= exe_reg_ctrl_mem_fcn;
        end
      end
    end
    if (reset) begin
      mem_reg_ctrl_mem_typ <= 3'h0;
    end else begin
      if (!(io_ctl_pipeline_kill)) begin
        if (_T_163) begin
          mem_reg_ctrl_mem_typ <= exe_reg_ctrl_mem_typ;
        end
      end
    end
    if (!(io_ctl_pipeline_kill)) begin
      if (_T_163) begin
        mem_reg_ctrl_wb_sel <= exe_reg_ctrl_wb_sel;
      end
    end
    if (reset) begin
      mem_reg_ctrl_csr_cmd <= 3'h0;
    end else begin
      if (io_ctl_pipeline_kill) begin
        mem_reg_ctrl_csr_cmd <= 3'h0;
      end else begin
        if (_T_163) begin
          mem_reg_ctrl_csr_cmd <= exe_reg_ctrl_csr_cmd;
        end
      end
    end
    if (_T_163) begin
      wb_reg_wbaddr <= mem_reg_wbaddr;
    end
    if (_T_163) begin
      wb_reg_wbdata <= mem_wbdata;
    end
    if (reset) begin
      wb_reg_ctrl_rf_wen <= 1'h0;
    end else begin
      if (_T_163) begin
        if (io_ctl_mem_exception) begin
          wb_reg_ctrl_rf_wen <= 1'h0;
        end else begin
          wb_reg_ctrl_rf_wen <= mem_reg_ctrl_rf_wen;
        end
      end else begin
        wb_reg_ctrl_rf_wen <= 1'h0;
      end
    end
    _T_475 <= exe_reg_pc;
    _T_477 <= exe_reg_pc;
    _T_479 <= _T_477;
  end
  assign io_ctl_dec_stall = d_io_ctl_dec_stall;
  assign io_ctl_full_stall = d_io_ctl_full_stall;
  assign io_ctl_exe_pc_sel = d_io_ctl_exe_pc_sel;
  assign io_ctl_br_type = d_io_ctl_br_type;
  assign io_ctl_if_kill = d_io_ctl_if_kill;
  assign io_ctl_dec_kill = d_io_ctl_dec_kill;
  assign io_ctl_op1_sel = d_io_ctl_op1_sel;
  assign io_ctl_op2_sel = d_io_ctl_op2_sel;
  assign io_ctl_alu_fun = d_io_ctl_alu_fun;
  assign io_ctl_wb_sel = d_io_ctl_wb_sel;
  assign io_ctl_rf_wen = d_io_ctl_rf_wen;
  assign io_ctl_mem_val = d_io_ctl_mem_val;
  assign io_ctl_mem_fcn = d_io_ctl_mem_fcn;
  assign io_ctl_mem_typ = d_io_ctl_mem_typ;
  assign io_ctl_csr_cmd = d_io_ctl_csr_cmd;
  assign io_ctl_fencei = d_io_ctl_fencei;
  assign io_ctl_pipeline_kill = d_io_ctl_pipeline_kill;
  assign io_ctl_mem_exception = d_io_ctl_mem_exception;
  assign d_io_dat_dec_inst = io_dat_dec_inst;
  assign d_io_dat_exe_br_eq = io_dat_exe_br_eq;
  assign d_io_dat_exe_br_lt = io_dat_exe_br_lt;
  assign d_io_dat_exe_br_ltu = io_dat_exe_br_ltu;
  assign d_io_dat_exe_br_type = io_dat_exe_br_type;
  assign d_io_dat_mem_ctrl_dmem_val = io_dat_mem_ctrl_dmem_val;
  assign d_io_dat_csr_eret = io_dat_csr_eret;
  // end inject
  assign c_io_dmem_resp_valid = io_dmem_resp_valid;
  assign c_io_dat_dec_inst = d_io_dat_dec_inst;
  assign c_io_dat_exe_br_eq = d_io_dat_exe_br_eq;
  assign c_io_dat_exe_br_lt = d_io_dat_exe_br_lt;
  assign c_io_dat_exe_br_ltu = d_io_dat_exe_br_ltu;
  assign c_io_dat_exe_br_type = d_io_dat_exe_br_type;
  assign c_io_dat_mem_ctrl_dmem_val = d_io_dat_mem_ctrl_dmem_val;
  assign c_io_dat_csr_eret = d_io_dat_csr_eret;
  assign c_clock = clock;
  assign c_reset = reset;
  assign d_io_ctl_dec_stall = c_io_ctl_dec_stall;
  assign d_io_ctl_full_stall = c_io_ctl_full_stall;
  assign d_io_ctl_exe_pc_sel = c_io_ctl_exe_pc_sel;
  assign d_io_ctl_br_type = c_io_ctl_br_type;
  assign d_io_ctl_if_kill = c_io_ctl_if_kill;
  assign d_io_ctl_dec_kill = c_io_ctl_dec_kill;
  assign d_io_ctl_op1_sel = c_io_ctl_op1_sel;
  assign d_io_ctl_op2_sel = c_io_ctl_op2_sel;
  assign d_io_ctl_alu_fun = c_io_ctl_alu_fun;
  assign d_io_ctl_wb_sel = c_io_ctl_wb_sel;
  assign d_io_ctl_rf_wen = c_io_ctl_rf_wen;
  assign d_io_ctl_mem_val = c_io_ctl_mem_val;
  assign d_io_ctl_mem_fcn = c_io_ctl_mem_fcn;
  assign d_io_ctl_mem_typ = c_io_ctl_mem_typ;
  assign d_io_ctl_csr_cmd = c_io_ctl_csr_cmd;
  assign d_io_ctl_fencei = c_io_ctl_fencei;
  assign d_io_ctl_pipeline_kill = c_io_ctl_pipeline_kill;
  assign d_io_ctl_mem_exception = c_io_ctl_mem_exception;
endmodule
