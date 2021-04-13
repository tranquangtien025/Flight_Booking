<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>AirLines | Home</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <jsp:include page="../include/css-page.jsp" />
        <jsp:include page="../include/js-page.jsp"/>

        <script src="<c:url value="/resources/js/jquery-1.7.1.min.js"/>"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#departure1Box').on('change', function () {
                    var departure = $(this).val();
                    $.ajax({
                        type: 'GET',
                        url: '${pageContext.request.contextPath}/manager/loadDestination/' + departure,
                        success: function (result) {
                            var list = JSON.parse(result);
                            var s = '';
                            for (var i = 0; i < list.length; i++) {
                                s += '<option value="' + list[i] + '">' + list[i] + '</option>';
                            }
                            $('#destination1Box').html(s);
                        }
                    });
                });
            });
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#departure2Box').on('change', function () {
                    var departure = $(this).val();
                    $.ajax({
                        type: 'GET',
                        url: '${pageContext.request.contextPath}/manager/loadDestination/' + departure,
                        success: function (result) {
                            var list = JSON.parse(result);
                            var s = '';
                            for (var i = 0; i < list.length; i++) {
                                s += '<option value="' + list[i] + '">' + list[i] + '</option>';
                            }
                            $('#destination2Box').html(s);
                        }
                    });
                });
            });
        </script>
        
        <script type="text/javascript">
            function validation() {
                var bookingNumber = $('#bookingNumber').val();
                var email = $('#email').val();
                var error = 0;

                if (bookingNumber === "") {
                    document.getElementById("bookingNumberError").innerHTML = "This field is required";
                    error += 1;
                } else if (bookingNumber.length > 13) {
                    document.getElementById("bookingNumberError").innerHTML = "Booking number must be less than or equals to 13 characters";
                    error += 1;
                } else {
                    document.getElementById("bookingNumberError").innerHTML = "";
                }
                for (var i = 0; i < bookingNumber.length; i++) {
                    if (!bookingNumber[i].match(/[0-9]/)) {
                        document.getElementById("bookingNumberError").innerHTML = "Booking number must be used digit only";
                    }
                }

                if (email === "") {
                    document.getElementById("emailError").innerHTML = "This field is required";
                    error += 1;
                } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                    document.getElementById("emailError").innerHTML = "Input email invalid";
                    error += 1;
                } else {
                    document.getElementById("emailError").innerHTML = "";
                }
                
                if (error === 0) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
    </head>
    <body id="page1">
        <div class="main">
            <!--header -->
            <header>
                <jsp:include page="../include/header-top.jsp"/>
                <nav>
                    <ul id="menu">
                        <li id="menu_active"><a href="home.html"><span><span>Home</span></span></a></li>         -->
                        <li><a href="services.html"><span><span>Services</span></span></a></li>
                        <li><a href="promotions.html"><span><span>Promotions</span></span></a></li>
                        <li class="end"><a href="contacts.html"><span><span>Contacts</span></span></a></li>
                    </ul>
                </nav>
            </header>
            <!-- / header -->
            <!--content -->
            <section id="content">
                <div class="for_banners">
                    <article class="col1" style="width: 339px">
                        <div class="tabs">
                            <ul class="nav">
                                <li class="selected"><a href="#RoundTrip">Round Trip</a></li>
                                <li class="end"><a href="#OneWay">One Way</a></li>
                                <li class="end"><a href="#CheckBooking">Check Booking</a></li>
                            </ul>
                            <div class="content">
                                <div class="tab-content" id="RoundTrip">
                                    <form id="form_1" action="#" method="post">
                                        <div>
                                            <div class="row" style="padding-top: 30px"> <span class="left">From</span>
                                                <span class="left" style="padding-left: 0">
                                                    <select id="departure1Box" name="departure" class="input">
                                                        <c:forEach var="airport" items="${airports}">
                                                            <option value="${airport.name}">${airport.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </span>
                                            </div>
                                            <div class="row"> <span class="left">To</span>
                                                <span class="left" style="padding-left: 0">
                                                    <select id="destination1Box" name="destination" class="input">
                                                        <option value="Ho Chi Minh (SGN), Vietnam">Ho Chi Minh (SGN), Vietnam</option>
                                                        <c:forEach var="airport" items="${airports}">
                                                            <option value="${airport.name}">${airport.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </span>
                                            </div>
                                            <div class="wrapper">
                                                <div class="col1">
                                                    <div class="row"> <span class="left">Departure</span>
                                                        <span class="left" style="padding-left: 0">
                                                            <input type="date" class="input1" value="03.05.2011"  onblur="if (this.value == '')
                                                                        this.value = '03.05.2011'" onFocus="if (this.value == '03.05.2011')
                                                                                    this.value = ''" style="margin-bottom: 5px">
                                                        </span>
                                                    </div>
                                                    <div class="row"> <span class="left">Return</span>
                                                        <span class="left" style="padding-left: 0">
                                                            <input type="date" class="input1" value="03.05.2011"  onblur="if (this.value == '')
                                                                        this.value = '03.05.2011'" onFocus="if (this.value == '03.05.2011')
                                                                                    this.value = ''" style="margin-bottom: 5px">
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row"> <span class="left">Adult</span>
                                                <input type="number" class="input2" value="1"  onblur="if (this.value == '')
                                                            this.value = '2'" onFocus="if (this.value == '1')
                                                                        this.value = ''" style="margin-bottom: 5px">
                                            </div>
                                            <div class="row"> <span class="left">Children</span>
                                                <input type="number" class="input2" value="0"  onblur="if (this.value == '')
                                                            this.value = '0'" onFocus="if (this.value == '0')
                                                                        this.value = ''" style="margin-bottom: 5px">
                                                <span class="pad_left1">(0-11 years)</span> 
                                            </div>
                                            <div class="row"> <span class="left">Infant</span>
                                                <input type="number" class="input2" value="0"  onblur="if (this.value == '')
                                                            this.value = '0'" onFocus="if (this.value == '0')
                                                                        this.value = ''" style="margin-bottom: 5px">
                                                <span class="pad_left1">(0-2 years)</span> 
                                            </div>
                                            <div class="wrapper"> <span class="right relative"><a href="#" class="button1"><strong>Search</strong></a></span></div>
                                        </div>
                                    </form>
                                </div>

                                <div class="tab-content" id="OneWay">
                                    <form id="form_1" action="#" method="post">
                                        <div>
                                            <div class="row" style="padding-top: 30px"> <span class="left">From</span>
                                                <span class="left" style="padding-left: 0">
                                                    <select id="departure2Box" name="" class="input">
                                                        <c:forEach var="airport" items="${airports}">
                                                            <option value="${airport.name}">${airport.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </span>
                                            </div>
                                            <div class="row"> <span class="left">To</span>
                                                <span class="left" style="padding-left: 0">
                                                    <select id="destination2Box" name="" class="input">
                                                        <option value="Ho Chi Minh (SGN), Vietnam">Ho Chi Minh (SGN), Vietnam</option>
                                                        <c:forEach var="airport" items="${airports}">
                                                            <option value="${airport.name}">${airport.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </span>
                                            </div>
                                            <div class="wrapper">
                                                <div class="col1">
                                                    <div class="row"> <span class="left">Departure</span>
                                                        <span class="left" style="padding-left: 0">
                                                            <input type="date" class="input1" value="03.05.2011"  onblur="if (this.value == '')
                                                                        this.value = '03.05.2011'" onFocus="if (this.value == '03.05.2011')
                                                                                    this.value = ''" style="margin-bottom: 5px">
                                                        </span>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="row"> <span class="left">Adult</span>
                                                <input type="text" class="input2" value="2"  onblur="if (this.value == '')
                                                            this.value = '2'" onFocus="if (this.value == '2')
                                                                        this.value = ''" style="margin-bottom: 5px">
                                            </div>
                                            <div class="row"> <span class="left">Children</span>
                                                <input type="text" class="input2" value="0"  onblur="if (this.value == '')
                                                            this.value = '0'" onFocus="if (this.value == '0')
                                                                        this.value = ''" style="margin-bottom: 5px">
                                                <span class="pad_left1">(0-11 years)</span> 
                                            </div>
                                            <div class="row"> <span class="left">Infant</span>
                                                <input type="text" class="input2" value="0"  onblur="if (this.value == '')
                                                            this.value = '0'" onFocus="if (this.value == '0')
                                                                        this.value = ''" style="margin-bottom: 5px">
                                                <span class="pad_left1">(0-2 years)</span> 
                                            </div>
                                            <div class="wrapper" style="padding-top: 30px"> <span class="right relative"><a href="#" class="button1"><strong>Search</strong></a></span></div>
                                        </div>
                                    </form>
                                </div>
                                
                                <div class="tab-content" id="CheckBooking">
                                    <form id="form_1" action="#" method="post">
                                        <div>
                                            <div class="row" style="padding-top: 30px"> 
                                                <p style="padding: 0 20px 0 31px">Input your booking number:</p>   
                                                <div style="padding: 10px 20px 0 31px">
                                                    <input id="bookingNumber" type="text" class="input" name="bookingNumber" placeholder="Ex: 12345"/>
                                                </div>
                                                <div style="padding: 10px 20px 0 31px">
                                                    <br>
                                                    <p style="color: red" id="bookingNumberError"></p>
                                                </div>
                                            </div>
                                            <div class="row"> 
                                                <p style="padding: 0 20px 0 31px">Input your email:</p>   
                                                <div style="padding: 10px 20px 0 31px">
                                                    <input id="email" type="text" class="input" name="bookingNumber" placeholder="Ex: yourname@gmail.com"/>
                                                </div>
                                                <div style="padding: 10px 20px 0 31px">
                                                    <br>
                                                    <p style="color: red" id="emailError"></p>
                                                </div>
                                            </div>  
                                            <div onclick="return validation();" class="wrapper" style="padding-top: 30px"> <span class="right relative"><a href="#" class="button1"><strong>Search</strong></a></span></div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </article>
                    <div id="slider"> <img src="<c:url value="/resources/images/banner1.jpg"/>" alt=""> <img src="images/banner2.jpg" alt=""> <img src="<c:url value="/resources/images/banner3.jpg"/>" alt=""> </div>
                </div>
                <div class="wrapper pad1">
                    <article class="col1">
                        <div class="box1">
                            <h2 class="top">Offers of the Week from UK</h2>
                            <div class="pad"> <strong>From Birmingham</strong><br>
                                <ul class="pad_bot1 list1">
                                    <li> <span class="right color1">from GBP 143.-</span> <a href="<c:url value="/resources/book2.html"/>">Zurich</a> </li>
                                </ul>
                                <strong>From London City</strong><br>
                                <ul class="pad_bot1 list1">
                                    <li> <span class="right color1">from GBP 176.-</span> <a href="<c:url value="/resources/book2.html"/>">Basel</a> </li>
                                    <li> <span class="right color1">from GBP 109.-</span> <a href="<c:url value="/resources/book2.html"/>">Geneva</a> </li>
                                </ul>
                                <strong>From London Heathrow</strong><br>
                                <ul class="pad_bot2 list1">
                                    <li> <span class="right color1">from GBP 100.-</span> <a href="<c:url value="/resources/book2.html"/>">Geneva</a> </li>
                                    <li> <span class="right color1">from GBP 112.-</span> <a href="<c:url value="/resources/book2.html"/>">Zurich</a> </li>
                                    <li> <span class="right color1">from GBP 88.-</span> <a href="<c:url value="/resources/book2.html"/>">Basel</a> </li>
                                </ul>
                            </div>
                            <h2>From Ireland To Switzerland</h2>
                            <div class="pad"> <strong>From Dublin</strong><br>
                                <ul class="pad_bot2 list1">
                                    <li class="pad_bot1"> <span class="right color1">from EUR 122.-</span> <a href="<c:url value="/resources/book2.html"/>">Zurich</a> </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                    <article class="col2" style="padding-left: 120px">
                        <h3>About Our Airlines<span>Template created by TemplateMonster.com team</span></h3>
                        <div class="wrapper">
                            <article class="cols">
                                <figure><img src="<c:url value="/resources/images/page1_img1.jpg"/>" alt="" class="pad_bot2"></figure>
                                <p class="pad_bot1"><strong>Airlines is one of free website templates created by TemplateMonster.com team.</strong></p>
                                <p>This website template is optimized for 1024X768 screen resolution. It is also XHTML &amp; CSS valid. This website template has several pages: <a href="index.html">About</a>, <a href="offers.html">Offers</a>, <a href="book.html">Book</a>, <a href="services.html">Services</a>, <a href="safety.html">Safety</a>, <a href="contacts.html">Contacts</a>.</p>
                            </article>
                            <article class="cols pad_left1">
                                <figure><img src="<c:url value="/resources/images/page1_img2.jpg"/>" alt="" class="pad_bot2"></figure>
                                <p class="pad_bot1"><strong>This Airlines Template goes with two packages.</strong></p>
                                <p>With PSD source files and without them. PSD source files are available for free for the registered members of Templates.com. The basic package (without PSD source files) is available for anyone without registration).</p>
                            </article>
                        </div>
                        <a href="#" class="button1"><strong>Read More</strong></a> </article>
                </div>
            </section>
            <!--content end-->
            <!--footer -->
            <jsp:include page="../include/footer.jsp"/>
            <!--footer end-->
        </div>
        <script type="text/javascript">Cufon.now();</script>
        <script type="text/javascript">
            $(document).ready(function () {
                tabs.init();
            });
            jQuery(document).ready(function ($) {
                $('#form_1, #form_2, #form_3').jqTransform({
                    imgPath: 'jqtransformplugin/img/'
                });
            });
            $(window).load(function () {
                $('#slider').nivoSlider({
                    effect: 'fade', //Specify sets like: 'fold,fade,sliceDown, sliceDownLeft, sliceUp, sliceUpLeft, sliceUpDown, sliceUpDownLeft' 
                    slices: 15,
                    animSpeed: 500,
                    pauseTime: 6000,
                    startSlide: 0, //Set starting Slide (0 index)
                    directionNav: false, //Next & Prev
                    directionNavHide: false, //Only show on hover
                    controlNav: false, //1,2,3...
                    controlNavThumbs: false, //Use thumbnails for Control Nav
                    controlNavThumbsFromRel: false, //Use image rel for thumbs
                    controlNavThumbsSearch: '.jpg', //Replace this with...
                    controlNavThumbsReplace: '_thumb.jpg', //...this in thumb Image src
                    keyboardNav: true, //Use left & right arrows
                    pauseOnHover: true, //Stop animation while hovering
                    manualAdvance: false, //Force manual transitions
                    captionOpacity: 1, //Universal caption opacity
                    beforeChange: function () {},
                    afterChange: function () {},
                    slideshowEnd: function () {} //Triggers after all slides have been shown
                });
            });
        </script>
    </body>
</html>