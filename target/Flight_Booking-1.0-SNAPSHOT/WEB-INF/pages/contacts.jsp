<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>AirLines | Contacts</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <jsp:include page="include/css-page.jsp" />
        <jsp:include page="include/js-page.jsp"/>
    </head>
    <body id="page6">
        <div class="main">
            <!--header -->
            <header>
                <jsp:include page="include/header-top.jsp"/>
                <nav>
                    <ul id="menu">
                        <li><a href="home.html"><span><span>Home</span></span></a></li>
                        <li><a href="services.html"><span><span>Services</span></span></a></li>
                        <li><a href="promotions.html"><span><span>Promotions</span></span></a></li>
                        <li id="menu_active" class="end"><a href="contacts.html"><span><span>Contacts</span></span></a></li>
                    </ul>
                </nav>
            </header>
            <!-- / header -->
            <!--content -->
            <section id="content">
                <div class="wrapper pad1">
                    <article class="col1">
                        <div class="box1">
                            <h2 class="top">Contact Us</h2>
                            <div class="pad">
                                <div class="wrapper pad_bot1">
                                    <p class="cols pad_bot2"><strong>Country:<br>
                                            City:<br>
                                            Address:<br>
                                            Email:</strong></p>
                                    <p class="color1 pad_bot2">USA<br>
                                        San Diego<br>
                                        Beach st. 54<br>
                                        <a href="#">airlines@mail.com</a></p>
                                </div>
                            </div>
                            <h2>Miscellaneous Info</h2>
                            <div class="pad pad_bot1">
                                <p class="pad_bot2">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inven- tore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolore ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat volup- tatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.</p>
                            </div>
                        </div>
                    </article>
                    <article class="col2">
                        <h3 class="pad_top1">Contact Form</h3>
                        <form id="ContactForm" action="#">
                            <div>
                                <div  class="wrapper"> <span>Name:</span>
                                    <input type="text" class="input" >
                                </div>
                                <div  class="wrapper"> <span>Email:</span>
                                    <input type="text" class="input" >
                                </div>
                                <div  class="textarea_box"> <span>Message:</span>
                                    <textarea name="textarea" cols="1" rows="1"></textarea>
                                </div>
                                <a href="#" class="button1"><strong>Send</strong></a> <a href="#" class="button1"><strong>Clear</strong></a> </div>
                        </form>
                    </article>
                </div>
            </section>
            <!--content end-->
            <!--footer -->
            <jsp:include page="include/footer.jsp"/>
            <!--footer end-->
        </div>
        <script type="text/javascript">Cufon.now();</script>
    </body>
</html>