<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="css/index.css" rel="stylesheet" type="text/css" />
    </head>
        <script>
        function deleteroomtype(rid) {
                var result = confirm("Do you want to delete this roomtype?");
                if (result) {
                    window.location.href = 'delete?rid=' + rid;
                }
            }
    </script>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-5">
                <a class="navbar-brand" href="index.jsp">Khách Sạn SUN&SEA Cửa Lò | 128 Nguyễn Sư Hồi | 0936640999</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.jsp">Trang chủ</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Hệ Thống Phòng</a></li>
                        <li class="nav-item"><a class="nav-link" href="search.jsp">Tìm Kiếm</a></li>
                        <li class="nav-item">
                            <c:if test="${sessionScope.account.isAdmin == true}">
                                <a class="nav-link" href="listallcustomer" class="btn btn-light" >Tất cả khách</a>
                            </c:if>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7"><img class="img-fluid rounded mb-4 mb-lg-0" src="https://upload.wikimedia.org/wikipedia/commons/6/61/Cualovedem.jpg" alt="..."  /></div>
                <div class="col-lg-5">
                    <h1 class="font-weight-light">Về Thị Xã Cửa Lò</h1>
                    <p>Cửa Lò được Tổ chức Du lịch thế giới đánh giá là một trong những bãi tắm lý tưởng nhất Việt Nam:Với chiều dài trên 10 km, được bao bọc bởi hai con sông ở hai đầu, độ dốc thoải đều, nước biển trong xanh, sóng vừa phải, độ mặn thích hợp là những đặc điểm mà không phải bãi tắm nào cũng có……</p>
                    <a class="btn btn-primary" href="https://cualo.vn/gioi-thieu-ve-cua-lo/">Tới bài viết.</a>
                </div>
            </div>
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body"><p style="font-size: 35px; color:  #330066 !important">Hệ Thống Phòng Nghỉ</p></div>
            </div>
            <div class="card bg-secondary my-5 py-4 text-center">
                <div class="card-body"><p style="color: black; font-size: 20px !important">Check in from 5.00 to 9.00: 50% room's price<br/>
                        Check in from 9.00 to 14.00: 30% room's price 
                    </p>
                    <p style="color: black; font-size: 20px !important"> Check out from 12.00 to 15.00: Extra 30% room'price <br/>
                        Check out from 15.00 to 18.00: Extra 50% room'price<br/>
                        Check out after 18.00: Extra 100% room's price<br/>
                    </p></div>
            </div>
            <div class="row gx-4 gx-lg-5">
                <c:forEach items="${requestScope.roomtypes}" var="rot">
                    <div class="col-md-4 mb-5">
                        <div class="card h-100">
                            <div class="card-body">
                                <h2 class="card-title">${rot.rtype}</h2>
                                <p class="card-text">${rot.description}</p>
                            </div>
                            <div class="card-footer"><a class="btn btn-primary btn-sm" href="detail?rid=${rot.rid}">More Info</a>
                                <c:if test="${sessionScope.account.isAdmin == true}">
                                    <a class="btn btn-primary btn-sm" href="update?rid=${rot.rid}">Update</a>
                                    <a class="btn btn-primary btn-sm" href="#" onclick="deleteroomtype(${rot.rid})">Delete</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${sessionScope.account.isAdmin == true}">
                    <div class="col-md-4 mb-5">
                        <div class="card h-100">
                            <div class="card-body">
                                <h2 class="card-title">Room Type</h2>
                                <p class="card-text">DESCRIPTION</p>
                            </div>
                            <div class="card-footer"><a class="btn btn-primary btn-sm" href="insert">Insert Room type</a></div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
        <footer class="py-5 bg-dark">
            <div class="container px-4 px-lg-5"><p class="m-0 text-center text-white">&copy; SUN&SEA Hotel</p>
                <p class="m-0 text-center text-white">128 Nguyễn Sư Hồi | 0936640999</p>
            </div>
        </footer>
    </body>
</html>
