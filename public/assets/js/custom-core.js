//active menu
let path = location.pathname.split("/");
let url = path[3] ? `${location.origin}/${path[1]}/${path[2]}/${path[3]}` : `${location.origin}/${path[1]}/${path[2]}`;

$("ul.menu-inner li a").each(function () {
  if ($(this).attr("href").indexOf(url) !== -1) {
    $(this).parent().addClass("active").parent().parent().addClass("active open");
  }
});

function displayDateTime() {
  const d = new Date();
  const options = { weekday: "long", year: "numeric", month: "long", day: "numeric", hour: "numeric", minute: "numeric", second: "numeric" };
  let date_string = d.toLocaleString("id-ID", options);
  date_string = date_string.replaceAll(".", ":");
  $(".date-time-display").html(date_string);

  setTimeout(() => {
    displayDateTime();
  }, 1000);
}

displayDateTime();

function dataTable(selector, endpoint, method = "POST", searching = true, ordering = true, lengthChange = true, colDefs = []) {
  $(selector).DataTable({
    processing: true,
    serverSide: true,
    searching: searching,
    ordering: ordering,
    lengthChange: lengthChange,
    bDestroy: true,
    language: {
      infoFiltered: "",
    },
    order: [],
    ajax: {
      url: baseUrl + endpoint,
      type: method,
    },
    columnDefs: colDefs,
  });
}

function dataTableData(selector, endpoint, method = "POST", data = {}, searching = true, ordering = true, lengthChange = true, colDefs = []) {
  $(selector).DataTable({
    processing: true,
    serverSide: true,
    searching: searching,
    ordering: ordering,
    lengthChange: lengthChange,
    bDestroy: true,
    language: {
      infoFiltered: "",
    },
    order: [],
    ajax: {
      url: baseUrl + endpoint,
      type: method,
      data: data,
    },
    columnDefs: colDefs,
  });
}

function reloadDataTable(selector = "#data-table") {
  $(selector).DataTable().ajax.reload(null, false);
}

function ajaxRequest(endpoint, data = {}, successCallback, errorCallback = function (err) {}, method = "POST") {
  $.ajax({
    url: baseUrl + endpoint,
    type: "POST",
    data: data,
    success: successCallback,
    errors: errorCallback,
  });
}

function sweetAlert2(title, text, icon = "success", timer = 3000) {
  Swal.fire({
    icon: icon,
    title: title,
    text: text,
    timer: timer,
    timerProgressBar: true,
    didOpen: () => {
      Swal.showLoading();
    },
  });
}

function swalDelete(data = {}, url, callback, type = "POST") {
  Swal.fire({
    title: "Are you sure?",
    text: "Your file will be permanently deleted!",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Yes, delete it!",
  }).then((result) => {
    if (result.isConfirmed) {
      $.ajax({
        type: type,
        url: url,
        data: data,
        success: function (data) {
          data = JSON.parse(data);
          if (data.error) {
            Swal.fire("Error!", data.error, "error");
          } else {
            Swal.fire("Deleted!", "Your file has been deleted.", "success");
            callback();
          }
          console.log(data, data.error);
        },
        error: function () {
          Swal.fire("Error!", "Error has been occured.", "error");
        },
      });
    }
  });
}
