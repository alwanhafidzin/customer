<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>View Customer List</title>

    <link rel="stylesheet"
        	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script
        	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script
        	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />

        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>



    <style>
        a{
            color: white;
        }
        a:hover {
            color: white;
            text-decoration: none;
        }
    </style>

</head>
<body>

    <div class="container">

        <h1 class="p-3"> Customer List</h1>

          <button type="button" class="btn btn-primary">
                	<a href="/addCustomer">Add New Customer</a>
                </button>
          </br>

        <form:form>

            <table id="customerTable" class="table table-bordered">
               <thead>
            	<tr>
            		<th>Id</th>
            		<th>Nama</th>
            		<th>Alamat</th>
            		<th>Kota</th>
            		<th>Provinsi</th>
            		<th>Status</th>
            		<th>Tanggal Registrasi</th>
            		<th>Edit</th>
            		<th>Delete</th>
            	</tr>
            	</thead>

            	<tbody>
            	<c:forEach var="customer" items="${customerList}">
                    <tr>
                		<td>${customer.id}</td>
                		<td>${customer.nama}</td>
                		<td>${customer.alamat}</td>
                		<td>${customer.kota}</td>
                		<td>${customer.provinsi}</td>
                		<td>${customer.status == "NON_AKTIF" ? 'non-active' : 'active'}</td>
                		<td>${customer.tgl_registrasi}</td>
                		<td><button type="button" class="btn btn-success">
                		    <a href="/editCustomer/${customer.id}">Edit</a>
                		</button></td>
                		<td><button type="button" class="btn btn-danger">
                			<a href="/deleteCustomer/${customer.id}">Delete</a>
                		</button></td>
                	</tr>

            	</c:forEach>
            	</tbody>
            </table>

        </form:form>

    </div>

    <script th:inline="javascript">
                window.onload = function() {
                    let table = new DataTable('#customerTable', {
                        // options
                    });
                    var msg = "${message}";
                    console.log(msg);
                    if (msg == "Save Success") {
        				Command: toastr["success"]("Customer added successfully!!")
        			} else if (msg == "Delete Success") {
        				Command: toastr["success"]("Customer deleted successfully!!")
        			} else if (msg == "Delete Failure") {
        			    Command: toastr["error"]("Some error occurred, couldn't delete user")
        			} else if (msg == "Edit Success") {
        				Command: toastr["success"]("Customer updated successfully!!")
        			}

        			toastr.options = {
                          "closeButton": true,
                          "debug": false,
                          "newestOnTop": false,
                          "progressBar": true,
                          "positionClass": "toast-top-right",
                          "preventDuplicates": false,
                          "showDuration": "300",
                          "hideDuration": "1000",
                          "timeOut": "5000",
                          "extendedTimeOut": "1000",
                          "showEasing": "swing",
                          "hideEasing": "linear",
                          "showMethod": "fadeIn",
                          "hideMethod": "fadeOut"
                        }
        	    }
            </script>

</body>

</html>