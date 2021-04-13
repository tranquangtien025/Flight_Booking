<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>AirLines | Promotions</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <jsp:include page="include/css-page.jsp" />
        <jsp:include page="include/js-page.jsp"/>
    </head>
    <body id="page5">
        <div class="main">
            <!--header -->
            <header>
                <jsp:include page="include/header-top.jsp"/>
                <nav>
                    <ul id="menu">
                        <li><a href="home.html"><span><span>Home</span></span></a></li>
                        <li><a href="services.html"><span><span>Services</span></span></a></li>
                        <li id="menu_active"><a href="promotions.html"><span><span>Promotions</span></span></a></li>
                        <li class="end"><a href="contacts.html"><span><span>Contacts</span></span></a></li>
                    </ul>
                </nav>
            </header>
            <!-- / header -->
            <!--content -->
            <section id="content">
                <div class="wrapper pad1">
                    <article class="col1">
                        <div class="box1">
                            <h2 class="top">Hot Offers of the Week</h2>
                            <div class="pad"> <strong>Birmingham</strong><br>
                                <ul class="pad_bot1 list1">
                                    <li> <span class="right color1">from GBP 143.-</span> <a href="<c:url value="/resources/book2.html"/>">Zurich</a> </li>
                                </ul>
                                <strong>London (LCY)</strong><br>
                                <ul class="pad_bot1 list1">
                                    <li> <span class="right color1">from GBP 176.-</span> <a href="<c:url value="/resources/book2.html"/>">Geneva</a> </li>
                                    <li> <span class="right color1">from GBP 109.-</span> <a href="<c:url value="/resources/book2.html"/>">Zurich</a> </li>
                                </ul>
                                <strong>London (LHR)</strong><br>
                                <ul class="pad_bot2 list1">
                                    <li> <span class="right color1">from GBP 100.-</span> <a href="<c:url value="/resources/book2.html"/>">Geneva</a> </li>
                                    <li> <span class="right color1">from GBP 112.-</span> <a href="<c:url value="/resources/book2.html"/>">Zurich</a> </li>
                                    <li> <span class="right color1">from GBP 88.-</span> <a href="<c:url value="/resources/book2.html"/>">Basel</a> </li>
                                </ul>
                                <strong>Manchester</strong><br>
                                <ul class="pad_bot2 list1">
                                    <li> <span class="right color1">from GBP 97.-</span> <a href="<c:url value="/resources/book2.html"/>">Basel</a> </li>
                                    <li> <span class="right color1">from GBP 103.-</span> <a href="<c:url value="/resources/book2.html"/>">Zurich</a> </li>
                                </ul>
                                <strong>Edinburgh</strong><br>
                                <ul class="pad_bot2 list1">
                                    <li> <span class="right color1">from GBP 165.-</span> <a href="<c:url value="/resources/book2.html"/>">Zurich</a> </li>
                                </ul>
                                <strong>Birmingham</strong><br>
                                <ul class="pad_bot1 list1">
                                    <li> <span class="right color1">from GBP 143.-</span> <a href="<c:url value="/resources/book2.html"/>">Zurich</a> </li>
                                </ul>
                                <strong>London (LCY)</strong><br>
                                <ul class="pad_bot1 list1">
                                    <li> <span class="right color1">from GBP 176.-</span> <a href="<c:url value="/resources/book2.html"/>">Geneva</a> </li>
                                    <li> <span class="right color1">from GBP 109.-</span> <a href="<c:url value="/resources/book2.html"/>">Zurich</a> </li>
                                </ul>
                                <strong>London (LHR)</strong><br>
                                <ul class="pad_bot2 list1">
                                    <li> <span class="right color1">from GBP 100.-</span> <a href="<c:url value="/resources/book2.html"/>">Geneva</a> </li>
                                    <li> <span class="right color1">from GBP 112.-</span> <a href="<c:url value="/resources/book2.html"/>">Zurich</a> </li>
                                    <li> <span class="right color1">from GBP 88.-</span> <a href="<c:url value="/resources/book2.html"/>">Basel</a> </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                    <article class="col2">
                        <h3 class="pad_top1">About Promotions</h3>
                        <div class="wrapper pad_bot2">
                            <figure class="left marg_right1"><img src="<c:url value="/resources-management/img/holiday.jpg"/>" alt="" width="170px" height="120px"></figure>
                            <p><strong>At vero eos et accusamus et iusto</strong> odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis estet.</p>
                        </div>
                        <div class="wrapper pad_bot2">
                            <figure class="left marg_right1"><img src="<c:url value="/resources-management/img/children_holidays.jpg"/>" alt="" width="170px" height="120px"></figure>
                            <p><strong>Nam libero tempore, cum soluta nobis</strong> est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae.</p>
                        </div>
                            <div class="wrapper pad_bot2">
                            <figure class="left marg_right1"><img src="<c:url value="/resources-management/img/domestic.gif"/>" alt="" width="170px" height="120px"></figure>
                            <p><strong>At vero eos et accusamus et iusto</strong> odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis estet.</p>
                        </div>
                        <div class="wrapper pad_bot2">
                            <figure class="left marg_right1"><img src="<c:url value="/resources-management/img/trial.jpg"/>" alt="" width="170px" height="120px"></figure>
                            <p><strong>Nam libero tempore, cum soluta nobis</strong> est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae.</p>
                        </div>
                        <div class="wrapper"> <a href="#" class="button1 right"><strong>Read More</strong></a> </div>
                        
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