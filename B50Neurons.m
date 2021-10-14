function [Y,Xf,Af] = B50Neurons(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 13-Oct-2021 10:07:40.
%
% [Y] = myNeuralNetworkFunction(X,~,~) takes these arguments:
%
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = Qx24 matrix, input #1 at timestep ts.
%
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = Qx3 matrix, output #1 at timestep ts.
%
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [2.68524673386582;2.99314871776712;2.88021282102574;2.79588112427484;2.8060730339926;3.02668430577179;3.26800948558642;2.74914254946245;2.69445254160432;2.99347749507623;2.88119916078485;2.79620966219352;2.80607315529021;3.0266843060025;3.26998217447009;2.75133130469005;2.6816301669079;2.99314871567896;2.88103476690423;2.79609800320815;2.80607316798478;3.0289857694349;3.26850265648006;2.75116691520627];
x1_step1.gain = [4.91762367688358;5.53510098847241;5.13739698110513;4.58325968387612;3.91572950029497;4.16791200433099;5.15611889488224;4.13912274603117;4.83169072646509;5.65663128860184;5.26506004685958;4.75613023615933;4.00071531096501;4.24492717324758;5.31270763688594;4.11369551925013;4.27098957700928;4.97796570982053;4.69554843668877;4.09128687220232;3.50610054229561;3.74657864442045;4.54977320355665;3.54807300765043];
x1_step1.ymin = -1;

% Layer 1
b1 = [-10.649489237816906595;-3.0224515882416582713;-0.43619229038892215478;25.083071488817701322;-0.45634484345281728368;-39.700515248477010743;-7.305164482915993851;-5.663955138907719622;0.96816370247080008049;26.84107783103489453;193.69629641884040439;2.1751087181143167193;-42.259910194183056831;4.8535773716230918851;2.8824862469881007421;17.802522565586986758;-15.701407678604901719;3.9096679496015402933;-5.9828062324377606629;-7.5721877024075627816;-8.4726964847062848918;-7.3762162064523630889;-8.5176524003722455802;5.6501656092235510442;-2.0758666401332637186;5.4643933665108415099;5.8047938844241899758;-1.171280312113759825;-1.27986866976328173;-19.774584437659051162;-34.829602961286269647;0.9433688418789361041;2.6887826886161683149;3.2708799837943369759;-6.2815132025523867654;-0.42621296600586622283;9.9985349461269645843;82.668963324022143979;7.3804779363983419316;3.2630790432225893483;9.4767769369519001543;9.6536036965504834484;-2.9674420923164968045;-2.9782703255961751054;122.71665502488755806;17.206480469786004761;8.4165939826540601132;8.8306527233759553042;5.0379076552768857766;-7.0393491272424899563];
IW1_1 = [19.382415188163605535 -10.281553134028074581 -12.990371828940196153 59.25075763384649008 -27.964584665466510671 11.435961423787773583 -2.5880752850482870997 -89.442122548154017636 -29.374051694611559071 14.60664415972446406 23.036332802316270119 -84.400319583071762963 48.483599317809456863 -41.57925511088740933 0.54794483223173862108 198.45881683056063594 8.8800323718118665539 -3.5408403335202933704 -12.451654054612591338 31.300743788897548825 -25.660157521223556643 34.128990460190451017 2.1366545378433956515 -124.3394365160160504;-18.685347106959611096 -0.96841097937579867505 5.1255216082285608437 2.7634887811854400574 34.571412430594527621 4.4968722525510766985 -0.96409075699136514981 1.332856265440254262 13.49464386674424432 1.2585570635906855319 -4.3656916462206920571 -3.1270325088992114715 43.245011042196779272 -12.762774973801194633 -3.77885488373279399 -5.6055377857609247627 8.1036385340254764031 0.21175778842748901876 -0.98784507246938479952 1.8747379720547376891 -89.449049112909861492 10.052186575134488322 6.9981009320125737716 5.0251390268341165068;24.502440090750333468 -16.905339824314438602 4.9201698463571235109 -5.1488158123647975728 -2.1230434820277093166 -23.124213952453828824 12.565110952230458707 -23.610654852782616331 -21.114148139457309838 8.4113677114545275515 -8.1926480752432340182 -12.774006629822439507 -2.745697321085181386 14.572907682132775875 -20.864894492806357107 37.963501093220479277 -8.9480030456771597613 12.872536242154753339 13.480689270969934412 21.956150460548141012 12.084507984021190197 16.571040318158580362 7.8870810974910350311 -19.390899129453270433;0.55595571494558537751 -1.7840413574753175574 -16.418215321575441834 359.08457123823546908 -2.1909842952281555206 -2.5331313605003651368 -0.14101356266727441136 -1.1588506210248785688 -2.3649990588328471119 0.25755466401185633796 2.6368207675581434302 -404.13235989608244836 -0.39222101115236318591 2.4380861451782029903 -0.36544913786294636049 0.77283442334934671081 1.9094737500590088786 2.2096311201039045002 16.263028500396622178 66.619854140603436576 2.4268512215376327745 -0.49096385492218785895 0.59916446578780957477 0.41142787388978246943;19.00804984301897349 -7.2529079542226231325 -2.2404533395385555217 -4.1024187095877380216 19.331561937178317834 4.138374632007898235 -16.382719551662450641 3.9505069215792758541 -9.7673448597576211228 10.866013822339281703 2.8990823202707312056 26.541900401230652307 -41.017734891119573604 -17.531160599841317804 16.503467006102322756 -15.203566387488663736 -9.1934658868912144669 -4.8882868196088624657 -1.5683921263994597961 -27.718190706623847319 25.631137830295923408 14.439991375863408862 -0.34150153442868191878 14.387892550123558166;-77.612949195525956725 142.13219094413975085 -36.824463317345475843 -46.559856555791718336 -70.680115872719213144 61.466999090738859479 1.1707210354629156157 60.917470497027927934 88.362221760884722244 -172.31196691239105689 70.379073378110504677 -11.618656391019801077 199.57959795975475004 -48.691962576219090408 63.854060589192549457 105.93783519339423549 26.034617049728712601 51.159546096097457735 -53.801069361189050255 61.484258163415837828 -145.22526064416879876 -88.48888984538881175 -90.949859905218687572 -193.41647714521499779;-0.29629782637920620836 -0.1953740867639093548 -1.402732927874177582 0.72915253678861058351 -66.489215063501035274 -0.53042527560896601813 2.1648788619748509099 0.21976263921601732476 -3.0154419194515260649 0.11023481147417699133 1.2663516402020684737 -1.5894118128747016794 110.96665722196951265 -1.9666047456857052023 -2.300907693890986927 -0.19266212966771553705 3.608324284457981701 0.15391128755107694182 0.30819924453692904009 1.0205872157675899281 -52.794533739612418799 2.7825180486021414694 0.41984016385302791452 0.030125762435992860244;4.5818103871390452042 -4.0542549430038850033 -2.5167959949286009547 15.152941385457483037 11.386252330040152358 5.1808495843590511853 7.2446963571866671572 -11.570917073025485777 5.6152344827761995205 -0.87782567113646903234 15.819071324061290795 -22.425377589298165049 -22.491218267453234603 6.6659907253582622033 6.8742580363717991077 17.471802358408115907 13.62590147082059211 0.97250147196418856854 -3.281094544355278142 -2.5461434353997116631 0.64511178748955000373 -2.9180630935584894736 -1.9528628330175024086 -21.082560788781641747;1.5495378455712871535 -19.793562652085629594 -17.101558117044259433 2.1896477842808095282 4.2603287109380296727 -9.4735202913840943495 -18.677948790042613325 4.6401097440761169821 -2.6256923037522073017 26.472877733500254749 22.942353985281947359 15.957004804727459302 -11.995775790547741124 13.364474487756183407 30.252489981994813206 -36.991584529705832551 -0.28996146504082437323 -1.6853817873929757276 -3.6183993103871734398 -11.493324174766440748 9.1774832670808930146 -7.6006145009462358075 -13.375406485121954958 30.748281075093760961;-129.02955285547304243 165.27983816452592691 -168.73829008004921093 106.82786001230331863 -53.98307940872732047 -114.69392503806531636 -223.76166041770702009 32.610976678064986345 -32.254270707152400632 -169.38530293189052145 133.5345648307733768 -152.48590585116230045 45.810513181769053404 185.09508291916588973 283.9388051650277589 31.576524908148332571 184.93247233045755706 28.637784894942594605 25.705172224927057556 67.771234957687894962 -13.64902346251976617 -94.15942761420761542 -70.26460012736237104 -5.5197436593714979125;495.55186354697855222 351.66392328238094933 -1089.8928375076759494 675.72701724661965272 1321.1389048057617401 -41.81252095888446263 582.87737005596898143 -163.66765098667488587 -125.42288633314659307 -145.15625385370597655 871.5853122298181006 -1056.8659773088454585 -2675.3641039620169977 -481.1226498858090963 -308.25962297180075211 479.64636296036621843 -236.87438683467655665 32.09525987992189755 12.10484220138980227 -329.41047241099880694 1523.8804998389332468 910.81349421421191437 -188.59466414275505031 -15.066325636947246025;68.420351482204836202 -4.7354189701730335926 61.132601903512423291 72.726303033776900975 -34.353301146718735026 -0.67718445689155992717 41.390260168031296928 -4.4349710235621619958 -73.314389882697469147 19.362061472700794695 -79.548693565005848427 -55.131772704901322868 21.024841536894872007 -33.437434174851951241 -54.166736566652701867 46.902171658887418459 2.5504924962861297288 -8.3306070620708752017 20.448337966358316464 -1.2704309818753178885 5.0050017651374130168 37.971347795811873027 22.992986985403589983 -44.447383536349413191;-357.03426320015910278 11.604288365154001639 -88.030182262811806027 -308.4856702879757222 -1622.1341542145466974 -347.7955081953588774 251.36544921941774078 329.69207624853493144 566.83658122337033092 224.41770902391019149 326.94703740488432686 454.28902192756470413 2299.0553398322331304 572.21243650161943606 -435.11996113469427883 -933.2257076453645368 -278.10592548748957142 -211.23187169107282557 -149.15837002866223315 -83.535545380343194211 -813.21672816020100072 -253.96677062331036723 88.401105058567594597 779.30269937294042393;-25.43427551224303329 3.4303059227111458718 -9.0312202828039893632 -16.255546232574765497 7.3253464052493164615 1.1144323885146993902 -10.774649765959452452 2.1569487599927659183 18.956770321792980383 2.0959530383515998508 -2.3923473342743006853 13.044398834646552032 -15.593160725135367883 -3.9261843771089566246 16.716573847749700121 28.581745867540792716 4.1945509425757112609 0.98678914540439954806 1.7822304071660755032 8.8934843202127122908 13.501268928399221991 1.0769826085314806452 -8.2503655705948180099 -19.680868833533970985;-0.96970318316734405162 6.028668653484972495 16.666075822452210531 -8.2895110255374948593 14.697475832133012119 21.365418965011354402 -3.816787771111205263 -11.044066461736942841 -7.3504605717644952989 -7.2693459778595990173 -15.212439117350713857 6.5939381514844432886 -19.754325107017418617 -34.906216088866301561 8.6027685028541700518 7.2652626844527183891 6.1951959843608612744 3.642821166132092614 -2.3402749686954873454 2.1496753781009534379 7.2077336492211347974 15.042276285464264873 -4.8257655703661592739 5.5012007782568455028;-1.5458846022359500338 -10.07454661318416278 288.18825159635127875 4.2699980844930012225 -5.5181180248247621023 1.2532593443679955758 -2.2218950676938300504 -1.3282673821739845454 0.93564219975828977205 3.2625581219011929868 -384.16607468809991133 14.632162127764276605 8.6436269373965615159 -4.6654241225465700182 -0.8968349334675991269 -2.500016773652746771 0.9872215665714800803 8.8030508949628067938 115.70811900669998806 -22.487589010702258463 -4.1747084280672748235 3.0706606088158814316 3.5921242322292559201 4.3605751509024601731;-33.989503535814399982 -0.27404557683156144376 0.92064919580136161947 -0.6303251330159943544 -140.03225758471009499 -2.9406617651743380826 -1.0202883910306914661 0.78919413959950512893 34.918236889628403219 0.22396430760844165953 -0.49267894811818513379 -0.80549491420991270463 213.7439263093848183 12.848072766795635147 5.8332669232230820455 1.6287147881647030534 0.12584699927831577426 -0.10775226103079371676 -0.43702505110203426764 1.8943535007823368854 -88.344306326814518115 -10.518502625612264012 -6.8702234236655934652 -2.8934685614645601071;-48.142498796857744026 -0.78240651254418835947 -0.51600424501715602688 0.15523064285571469556 -4.9047779673537057477 -2.4146717643369823847 0.80958946046154700582 -2.30946391852209576 35.533764714990219602 2.2229825815894268537 4.5121358927600789812 0.036527564134264167706 4.7198939390895002788 1.8720223233282502484 -1.3528297950778220837 3.8744124489404452305 15.15559960769233605 -1.6504836902305608515 -4.4014697038782912841 -0.25792015243917226774 0.31889637693630856763 0.35526119892677687773 0.23434722532093058001 -1.2623433873970233421;-0.36718972262946364404 -0.08678665020716949674 -1.2441872541616092462 0.54102402354301193377 -54.272161759690220606 -0.55945876786806747472 1.5099473545573705024 0.22432801488149006763 -2.3009092234316099734 0.11691715413035586035 1.151738520033453117 -1.1525223222205853713 91.149705896563901319 -0.61884826050903218864 -1.2256429192745437184 -0.17921168096412926074 2.9010864113166281442 0.019198693387742497146 0.24845734839264066451 0.76794499640775903959 -43.766668352296932198 1.3180217818464365909 -0.13865966034893084657 0.038155036171206857532;0.30859264628486465787 0.83345372049309729423 0.45253086550043442049 -0.80432274961691829773 -0.71111507247981686763 -0.51625373782477312901 0.90730710077161080829 -72.245873406614691703 -0.16695717625519973515 -1.0755921740662865993 -0.41491094273403911208 0.81325700249105059569 1.6788622223086795415 1.0605402126347809322 -0.80078364511810429249 123.24372288071833736 -0.10129645270642897992 0.14830541738151156728 0.025971843765355950157 0.038048838196256797028 -1.1993922678131483384 -0.42343965668812277858 -0.16434953112320122015 -59.059280360961530221;44.278500080343164313 17.843128804868371162 0.93347607594616521798 -4.7598864043902224807 18.154809371945198393 -22.251133274756263347 -19.227929793062127573 -42.04100570680621729 -57.504466434304930544 -22.159160127531656315 5.9976817798236066182 -0.39843681819936094257 -40.578783268049932076 38.164277071539693509 30.344812801564092553 75.016845744052872647 6.8007922553338131522 6.378060726222582133 -2.304470628772102625 8.129603960764114845 14.334856739610884802 -13.569108334361155599 -11.275024771048531846 -37.908369343061210088;0.37020173089113916909 0.82426903146078212004 0.51015665571322166283 -0.80005806887280317419 -0.72360763312719300622 -0.60155962569435916798 0.71297111988992090126 -70.172903643959202213 -0.22256162807305279738 -1.0512561735205045998 -0.4393452589236863659 0.80375864148247910812 1.7607943569968891318 1.1843432824553921101 -0.40552428208805457732 119.92208756076507825 -0.1057237883326809097 0.13569259175383832638 -0.012425209498555146378 0.03243932458249455808 -1.2723428901043174477 -0.47806711115535116541 -0.4199028736382310889 -57.614165538630430774;-11.379431326231292942 -2.5962766050031600429 17.05469436451519627 13.19604024636850248 -16.011928219256379435 -13.649450958710072968 -7.7315290590056484632 -1.7514465626392672348 -2.5715451677888836457 0.44493644249236674604 -15.717468882838369737 -18.925706144561818434 -8.4360186016989686664 3.0545764995437894029 3.9340785998619267616 35.785581325613165404 9.978519982853057968 -3.0525266255777565583 -9.108545766545278255 3.8437323728789798416 13.353213779266962291 0.068906944557188584688 -8.5153241680871367691 -30.987938118221663331;23.2582868780640446 5.8293150553841082129 -1.7690986147679963469 13.806733708410277472 0.41200576906064112492 -7.37573084586591321 -3.5730660591807152926 9.4262802432953538556 -22.203869125661409356 -2.1634542778867897894 -5.5206222163368643407 -14.654112235290432054 -7.3121275204699900385 -12.764926260166962635 4.7186691909642988207 -11.320203925566939773 2.8938523497068655566 -8.3415822502426557605 -0.23663426030578221804 6.7664984448158129737 3.960120544467212067 12.925488917868229066 -5.019391230587967101 7.8272757821084368857;8.5976928586590233294 1.0370070689523762653 3.4141384046395057972 2.1666362425388387969 -0.13700262515235045457 0.94315240580187875707 -3.3249535512879302424 -6.4295032107150253964 -7.5946730283742791556 -0.028620861410077497178 -1.2319472094654255745 -1.0768580193994128358 6.2126159291385310013 -1.1221265269868112568 8.168453863127430381 14.693378866721698017 -0.93532877031667793766 -0.93234984612517646241 -2.2989241222746321647 -1.1386532553401562673 -7.7287806407155130728 0.48208269769065070776 -5.5409125039548996483 -9.5948754632030954781;2.4734250399904111895 -2.3858800529926007528 3.0314960842029363697 -11.755409945236475977 -1.8875732205416908549 8.8584532587001785231 -1.1333895889547969116 3.038329608097039447 7.7807729375201839517 6.9495921070968389444 -15.365839040723866304 8.0147583993920203937 -9.1474292011422893012 -8.7558663235341764874 -1.997297039511187311 -12.631412599848472311 -7.9362249180948154503 -0.69323412245552007427 9.7800797651274482547 5.7932042742505736044 9.6862814408124240373 0.14937713658725521038 3.6315255255968574843 17.291848059360358292;-15.430605654129671223 33.594341490164296715 -20.135329675295874807 17.148446477919524256 7.7018604347982480007 14.552406913440291802 12.498429443911804881 -1.1657801741057034484 -6.3110809610458797891 -25.428297714863788315 26.132845299053087729 13.005988625376453172 -25.062563089889390966 -24.264661606296318297 -12.520349231315268668 -39.907337212172315333 7.6449236136071352377 -10.549846611841561028 0.45120016220498265769 -13.726537093120684929 11.642773449172253208 9.7778724597592407974 -0.27687773545080529569 26.235746358107778775;-10.965467973362143184 -16.134180374426641436 -22.009233388979122736 21.930536983460783063 -15.405242685357977805 10.892471679209466018 -5.6306061045860644754 -17.147632337240022338 38.191683135653498482 25.146000246928597477 23.370200114045246664 -14.094187681561713532 22.908392340756059014 -26.260207686834945662 7.3946560756520325342 24.915846415376744716 -25.780054853606333864 -10.326882188972030363 -6.3261974493517172391 -0.095265160107848190219 -10.731785152604471634 26.738483069993396413 -0.89654392105388025502 -9.5953609926719405365;-4.6436499506416462069 6.9851071160236566371 -2.2704957060313524231 -6.6206413220757251992 -6.4312150089584099177 -1.0589298124347983343 -1.9479668876171940539 -1.64240302982591313 5.5025571628856146944 -8.0248912636578495494 4.9715022197037983531 4.6879429408525057354 5.5413106242073935093 1.297742933486321526 0.20358442829814080155 6.4900866034327640008 -0.63306109440972280211 0.11669469964566552 -2.6277989163370025771 0.085922873247411379882 1.5265050903672323646 2.0223113918250539278 2.4165199023163905778 -6.6326661495046943529;237.71227164908711416 27.002390909459265345 -19.666027727960745608 -4.5883642332903047389 -22.26947647151133225 -187.91520454034946397 -25.581595513100438666 350.45369792377130125 -100.90783887870273361 -15.717841952195801269 -6.9360749265183940793 27.178129166909222647 89.47265339972435072 205.73288341994975781 -12.651056004207790195 -424.50457690123954535 -127.72569451613462377 12.760348196023713285 23.552796056459989416 4.1206586940530884888 -72.949000017387689354 -39.678884121394382589 56.448904953772647275 105.62824044081925479;76.231386409206805865 54.135286599934765661 -10.593674474814225306 10.655542601352504306 85.890933176600412935 -31.055261544389431094 7.043706346772390603 -8.0983204357158591336 -66.119278445903958641 -85.165459001211488044 -5.767884415580451396 2.9231351818537003595 -50.754627739503781925 96.99992428184194182 5.0086325134569280593 70.383094482411365789 -19.681442159470801556 20.93757863285627252 4.0495271046612142385 -19.610010047084543316 -40.251814766909348009 -57.619778821966882276 -6.2620120000017225337 -79.733965997235529244;-12.610669832321347528 2.0237406589195279238 -3.6738615463258401661 7.4119819961650614815 7.1211724126289137615 -21.745869991555931477 16.308970415995904801 2.9679721642179708319 9.4495837612470925393 -6.4278497030427041992 -0.45748517842642905107 -4.3267984954891209881 -15.083292313642733262 30.863462513854798885 -23.591968172244662583 -1.4839761565719182812 5.9644858131205635843 1.3960601486373573898 3.4703526413760199532 -4.313228719396184907 7.9140225965087083182 -6.8161467220725757699 8.8685884950581339581 -4.062124567622864113;-52.560076801148291281 0.11427768802282955996 -22.839710937903483057 -1.3066378619203704581 -6.8628615975860967069 -2.5922977897142627235 1.3362532564171354377 -0.27068280918763321097 37.554396650431705496 0.31394190287814360829 30.555553844700117594 -0.095521802937003852385 9.1908225737263595789 2.2245243231894598068 -2.4694413851735013132 1.2707250508007119638 17.965002715870490135 -0.49041371025645968951 -8.97670634548103763 1.5306318373265599408 -2.7743010006600958839 0.15439125232775222085 0.88659352887697717716 -0.70528061057084179275;-4.625304328772359419 -1.8886531118286578046 -34.359305022752522518 2.6465581254695993429 -10.990896912134958896 -2.3449237435266758744 0.2225117087463499288 5.7063538555140960185 4.7437181983699820975 -1.0185054018227630568 10.103767086173451872 -5.6176215156404563089 10.491868290219478865 4.0416260438610338568 -0.1346211468146950585 -8.4097110208722103408 -0.21545788996011738803 3.6431346568274594055 27.128699350532844647 2.6919305067638954476 0.50836867995858803226 -1.5343665445787153523 -0.014996208475747951905 3.6281220783642251781;-2.5492646603220814328 -4.8258051432411779302 -19.925004794174970613 -82.578151858576177347 -8.8046927867423523395 -2.7042466735195160865 2.0699099377494580843 -0.49426371256961965095 -1.9885970613733245926 2.6291041345405852248 43.644863029622278816 97.772759550138289342 4.2835595077956689636 2.9676449179271333634 -2.8339768363687776187 1.3738432159103757257 4.6101788629477811199 2.5740024502220943958 -28.109920836465491334 -19.448495781229208745 5.6625069820439044577 -0.38748916416881057367 1.1369275032196477504 -1.4795620451770723491;-0.86916459647034693958 -6.7216203802898499831 -3.4601996883417660555 -0.79736142825452593907 -5.9338327898238114599 -2.7466020905450303502 11.245304766291141618 -258.28067586755975071 0.46793678667553495476 8.0951178584461285226 3.0513868536541171039 -0.70727013870702348797 11.727083584587926879 7.9873363286282508255 -5.5316032046156946578 266.71674821882072592 0.51309934489107233979 -1.5104583774406350472 0.57778594230094193485 1.7258227512540833537 -6.7977816977464398107 -6.9235487276699805292 -6.8324358824917315047 -6.3449605952291694422;38.550272987838745564 -77.977014274201110311 63.878385561605639964 42.199539285807368572 46.048363680707055323 7.3123871811493863504 19.098946358139684776 232.87155597779704408 -21.900248713463415839 92.906666828413662529 -4.8639223617061624338 -33.287540829523827313 -66.031080821793636915 -14.398310221119082541 -24.753375690218302196 -368.08954658525073 -15.075621939423824003 -11.913498966811328472 -58.496285924091289132 -12.645680776250229016 24.527455450128066161 2.1924536259781719494 3.4329518806877437065 147.84688900796970756;55.206218281630079048 8.419002572298181164 -12.145238958815008701 138.11005412492684741 15.16798052641465766 -5.677996678094892502 11.22517540060204766 153.31535820877854803 -140.80288774869106305 -12.648062322271606206 -3.239776798366155397 -173.59786057681580473 -48.160682467480427249 -91.51987710188525682 -59.600730417554743212 -465.77602352014508824 83.265160206866724479 -1.2551713788532421479 -10.00564312150690327 41.651965014907240459 35.022217298181573142 67.741734234555792682 59.533743289810082899 365.81440912429513901;11.110091254087645751 -7.6745464110726064888 6.240485942420048282 -1.5198873244411008621 8.543655834162747098 -13.510474649396361002 -1.2031803802526375158 2.8353496377215252622 0.99173231216789636822 20.35813903998255725 -0.05031389829346788467 4.2322859300949149386 -29.508202275011470306 3.3778150806591278332 2.3821557468356227005 -13.467084452555868168 0.20484100412350758624 -8.5842364329334479578 -2.0016164850424407184 -2.7410581631642383371 19.948256025429230931 12.29608341550459194 3.9310649320002291063 15.1340176002586837;7.9625846287648593957 4.0500948867505961459 -58.178511549079132692 31.349893105571990048 6.6071501654824054128 0.45879421066473691226 -2.0132517827387190756 1.0493207931410364342 -0.44733530917240377223 -0.33366551888572848483 30.680198258137917122 -25.710006964984724931 -12.319553499542324815 -0.21836361611057658605 3.5314297252119550841 -2.3794859618832959747 -9.0651360274346934887 -4.917947516299189914 30.62057038016104471 -5.5593600829194791402 7.3678987532231703383 -0.094298394319018291609 -0.75353638114396903624 1.0978831041721868189;105.02131116079003448 -87.724356617616265908 -4.1782229265777077742 16.700213689192590749 280.16549274511220347 -159.47405280989769949 76.656895767586107127 12.237272537610243361 -93.602375606109077921 98.966758343615666149 -23.378583613509967165 25.122056202944559544 -464.70882049688282223 152.98744414048678664 -69.843007319632306462 -106.80458227127185467 -43.708133378490813925 -52.366080284001242262 29.265010678818125456 -19.785977539685671189 228.32822460036132384 -61.449592126733648456 26.825956829573474494 98.162041361697262687;-16.066364759846756272 1.9552958923283429993 -26.304579771189757764 -5.6720708708301375012 8.1012166341613092158 12.712672861718827377 -19.813679748070143205 7.8401746585218639041 3.2638256768206130864 -6.4789122371788083754 15.257164395517568423 -4.0193979507576420573 -27.306892753755168002 -33.33731164151141968 13.882466859721043662 26.339085175175810605 9.2162522923212986115 0.27005465324025018647 18.355028850794731454 4.8611148593914554894 17.058542066446857888 23.038825150789843832 7.7049291489453199944 -28.86889817729276686;30.339138392142249501 4.1778456279334896806 -3.6765065251646968925 -0.45697546374057262941 5.9637398052512731184 14.830603639256979775 5.5499486649849538722 14.433551293961503603 -25.485060820542937421 5.9452728037545163886 -16.651745775689231976 10.222688524577716151 -6.8730570330641729271 1.8544018635093721947 -1.6534910644776876776 -9.1821470478588569364 12.904847704838639189 1.8027636006407248281 19.634256035657458028 -6.4425336324027391299 1.8480806054607281652 -10.011965820751209222 -5.5795939436116608334 -5.6880539257109736795;21.089612713868550742 -38.255263853706544808 6.7391305066521143274 -32.563613657003841695 17.644729567860885311 9.6258007999702890345 -5.639808828526747142 -14.349807867333741029 -23.710968191362969293 12.252341467244804107 -13.501941638838641069 27.414219250149891138 -29.796106397480325967 -30.883115157397721617 10.642852804248594367 29.925484749143105745 2.3818788475133643168 23.223047460754468574 2.1875079905329606333 3.2107214915207924477 29.604512353238987998 18.182662108606791662 -15.557470784398265806 -17.423722104040940906;272.54076890816617151 -48.841853117764237879 44.263243857466896714 87.419120060085887758 120.48471235712528937 445.98734779219705615 9.1498921473654402092 35.771909169745669033 -210.51808498657931068 88.908371028252673796 -111.98544873761827034 -9.0310080157945158419 -231.57662588582587659 -798.75371436748469023 -85.265814584163578616 -195.93829911681285694 -19.052556099380176136 105.60214088613021488 6.5704988300521875999 -37.768755749243950959 216.55237906205570653 468.7828445930335306 69.836830710608637673 212.57578391771917836;-130.34040715697366863 -26.023813808729467922 95.636594217633629 67.525870104530213212 -12.81785325584184676 -60.970631598050651689 56.016651008348276264 51.574807450280154342 159.32646090828419005 28.036116776000046258 -91.737637062943719002 -26.648519428112045659 -79.636789963764584854 113.15697102432027066 -75.405035154672717113 -3.3340913218593972722 -36.543373116980539805 7.0045495128117121197 -6.0671963441851142207 -47.548946604824124051 73.856776792523476161 -52.392059010842132238 18.970742020969851183 -11.185030033229438118;-0.44961579946015572951 3.2577177753169008767 -0.15363245154023685846 67.60949648653574684 -2.3635103641739401148 0.58355570989692584494 -0.11240920001352071311 -0.51455547369146925618 0.7552829061275135869 -2.8793825437916762411 -7.6922796950721670228 -103.89674802865948777 3.0999003599849261903 -0.73826075329546747561 0.58712445023499759689 -0.09172841792663137539 -0.73888864663625208884 -0.78623923895440261944 9.0121023920433920296 45.497971159423457266 -0.70442274350136080407 0.57054628307950494559 -0.64419641881928135785 0.59874048272173940877;-66.268677714665045642 -7.8013305931026826201 21.590179250981574199 -12.629411238447035615 12.524507309601762728 -9.0986580874532982932 -14.843649731516538992 24.934260588122054259 48.598608395593373643 19.122468031123755594 -25.738863894347851158 19.796105267663609339 -24.959874499082555843 2.2589412857670501111 12.529138445810497515 -56.963505357835188647 13.221023975891309732 -8.4214460030376496746 7.7874957860816795829 -10.012529361056063948 5.6992647338065101081 -9.6310529557186868033 -1.042475297156467251 36.141237410035230937;3.6289833561937245854 -0.83277382393576870889 -0.71097165538236628546 -17.477178433145272862 -19.213772283046377964 -5.5111471145458015286 6.1228103647598457471 0.13109286249613610886 -1.1503007999270056239 -8.4658879659370942505 4.239721406204294496 -2.0950705581220407936 10.651553685162788554 4.2723868069456987229 -18.177817650797539528 -0.192319645416053564 -4.8309830170502223723 10.189675451558930064 -4.1299909021298075729 17.942068897498312907 -1.2970169900038139854 2.3411726338329845731 10.133030323235596271 10.203807085244651631;31.185103156144698744 -6.3949747364925055848 -10.692228038198834383 -6.1073060325722554609 -3.9217188042180701757 -2.9076804401693072677 -1.500443167688585655 -4.2032160741670283599 18.642600925188059335 4.3843556212030598829 22.428173987395723543 3.1794175972044405043 7.7472964750175385973 5.3036219563085511552 -0.28562333832731606753 10.180657488312645498 -57.543797152750315149 3.4559950472755107675 -14.724381877402084484 4.6103602169729640536 -4.4637056658720615232 -3.0264222188188139029 1.182943529407493255 -7.4051698502095169019];

% Layer 2
b2 = [-0.43624843462914580927;0.010129147754415902816;1.0374970954566775649];
LW2_1 = [0.062646078335059460218 0.057063137547879352884 -0.016474703054079629927 0.37064800860148605643 -0.10862648473886654665 -0.024504923375954751341 -0.26952309197165680299 -0.011881904850639338905 0.052136028472828534197 0.028877431879092078926 0.01043978914574351935 0.037018723251305021837 0.010771229105271116697 -0.0073985752447721410407 0.087630936253499616684 0.25028158058031957367 0.019546139929805281948 -0.32047951504864274908 0.22112104080118755167 -0.14843264673088746308 -0.025692171677377188821 0.13150269151586352345 0.039952047162734233288 0.012195708602642772039 0.010078159599766321405 0.045154225029577881034 -0.025059702905467256401 -0.044069479434218745972 0.10723226891935144778 -0.0044673475375246619185 -0.03659792697938536038 0.065936167445166102286 0.30127012303648931235 -0.13578363284993125171 0.25640575166371415428 0.0090585364490349054578 0.02340629498021491034 -0.037872211695447771662 0.014547415870193373261 0.13029333575895415964 0.031901354682534632801 -0.026799835367869478953 -0.024492794268670858154 0.046089242491267709556 -0.01213216344710885998 -0.043414143112386054113 -0.26948989057152183957 -0.01843142282749885702 0.055784047134410735813 -0.15045059123787771216;0.016464433269102053681 -0.19449038914599622863 -0.045047890581941231469 0.0062739478785085109336 0.005818234491133761517 0.0072938726902982394321 1.4153651941835065919 0.031835875001791982819 -0.029625775699561623933 -0.026278470139216306839 -0.012951177954202346826 -0.025487960398006322821 -0.0027028859061308330505 0.054491005127312530654 0.025365007561668949376 0.021181200701466774278 0.17869064060716116638 -0.013689484564177203246 -1.574188034727532326 -7.5409865200196621871 0.028767383520680818443 7.6162468351801129174 0.0026515658114409038776 -0.041214150892650396052 -0.19482907961064360736 -0.031413900435796074384 0.053893971887373270935 0.044539567289630051239 -0.079043299520688017901 -0.027275411179836200892 0.0014678907213589911102 -0.037551073992450202665 -0.0070979207531200010084 -0.0042278864348230700554 -0.0077178758140730822912 -0.13591580139276715489 -0.012382216609567248816 0.0095409431098005502425 0.039484073381414734605 0.029721282509678759176 -0.013127655081381330721 0.047525765640144157498 0.034169663089440444059 -0.01241873492307126077 -0.014026071659776057771 0.026123721556207537414 -0.00027982319205162005729 -0.03317993407315966703 -0.024347622023728671126 0.018030055525140809003;0.038265849560892434278 0.034834646959049905823 0.089539259800140630352 -0.057161035137784026172 0.11007566993348877338 -0.074563688570357028462 0.97193594801409932682 0.021122175595261583059 0.040237344036826792892 0.028998626493718093755 -0.011718260463453783471 0.02403829228424684411 -0.014684172606412393067 -0.014461181947824671215 0.13758721513777380507 0.023511242904961465044 0.13835231458118554815 -0.376726193191908032 -0.99560488788242418323 1.8540798400035958249 0.019024671889880231945 -1.8565227381199334022 0.0015945604175014024481 -0.018660448533301000201 -0.17420909116726793209 0.032073650453465614441 -0.012899042900131529529 0.0094570479352460781741 0.083267715670578362763 0.038673193324095786472 -0.015555520690287542168 0.075540098349407711065 0.4418824034545638102 0.12355002839443629536 -0.079433426569553558516 0.052405066155125266947 -0.014400425855539324832 -0.0016387233770377891435 0.014428882120092729677 -0.12778451857043865436 0.043015916874313268881 -0.048833239525289416638 -0.019297140166396480748 0.033578516854879628117 0.029368320732529640954 -0.012682129545966973339 -0.0756089204313097063 0.00035352813072053387855 0.037020411668755283385 -0.042427828153636132358];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [0.0579764877829954;0.0579996479572353;2];
y1_step1.xoffset = [0.000124857619797858;0.0149896864439588;0.5];

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
    X = {X};
end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
    Q = size(X{1},1); % samples/series
else
    Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS
    
    % Input 1
    X{1,ts} = X{1,ts}';
    Xp1 = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1);
    Y{1,ts} = Y{1,ts}';
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX
    Y = cell2mat(Y);
end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
x = bsxfun(@minus,y,settings.ymin);
x = bsxfun(@rdivide,x,settings.gain);
x = bsxfun(@plus,x,settings.xoffset);
end
