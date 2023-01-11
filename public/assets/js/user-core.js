if ($("#dashboard-section").get(0)) {
  ajaxRequest("/user/ajax/get-summary", {}, function (data) {
    data = JSON.parse(data);

    setTimeout(() => {
      $(".total-file").html(data.file.total_file);
      $(".total-download").html(data.download.total_download);
    }, 1e2);
  });
}

if ($("#upload-file-section").get(0)) {
  dataTable("#data-table", "/user/ajax/dt-load-file");

  $("#file_input").fileinput({ maxFileCount: 5, showUpload: false, browseOnZoneClick: true });

  $.ajax({
    type: "POST",
    url: baseUrl + "/user/ajax/get-folders",
    success: function (data) {
      data = JSON.parse(data);
      data.forEach((d) => {
        $("#folder_id").append(
          $("<option>", {
            value: d.folder_id,
            text: d.folder_name,
          })
        );
      });
    },
    error: function (e) {
      console.log(e);
    },
  });

  let upload_form = $("#form-upload-file");

  upload_form.off("submit").on("submit", function (e) {
    e.preventDefault();
    let submitBtn = $(this).children().children().children('button[type="submit"]');
    let url = upload_form.attr("action");

    submitBtn.prop("disabled", true);
    submitBtn.html("Uploading...");

    $.ajax({
      type: upload_form.attr("method"),
      url: url,
      data: new FormData(this),
      processData: false,
      contentType: false,
      success: function (data) {
        data = JSON.parse(data);

        console.log(data);

        submitBtn.prop("disabled", false);
        submitBtn.html("Upload File");

        $("#file_input").fileinput("clear");
        $("#form-upload-file").trigger("reset");

        if (data.length == 0) {
          reloadDataTable();
          setTimeout(function () {
            sweetAlert2("Sukses!", "Data berhasil disimpan!", "success");
          }, 100);
        } else {
          sweetAlert2("Error!", data.file_inputer, "error");
        }
      },
      error: function (data) {
        alert("An error occurred: " + data.responseJSON.message);
      },
    });
  });

  $("body").on("click", ".btn-delete-myfile", function () {
    let data = {
      uuid: $(this).data("uuid"),
    };

    swalDelete(data, $(this).data("url"), () => {
      $("#data-table").DataTable().ajax.reload(null, false);
    });
  });

  $("body").on("click", ".btn-change-access", function () {
    $.ajax({
      type: "POST",
      url: baseUrl + "/user/ajax/get-file",
      data: {
        uuid: $(this).data("uuid"),
      },
      success: function (data) {
        data = JSON.parse(data);
        $("#uuid").val(data.uuid);
        $("#file_name").html(data.file_name);
        $(`.form-check input[value='${data.access_modifier}']`).prop("checked", true);

        $("#modal-change-access").modal("show");
      },
    });
  });

  let change_access_form = $("#form-change-access");

  change_access_form.off("submit").on("submit", function (e) {
    e.preventDefault();
    let submitBtn = $(this).children('button[type="submit"]');
    let url = change_access_form.attr("action");

    submitBtn.prop("disabled", true);
    submitBtn.html("Process...");

    $.ajax({
      type: change_access_form.attr("method"),
      url: url,
      data: new FormData(this),
      processData: false,
      contentType: false,
      success: function (data) {
        data = JSON.parse(data);

        $(".invalid-feedback, .custom-errors").remove();
        submitBtn.prop("disabled", false);
        submitBtn.html("Save");

        if (data.length == 0) {
          $("#modal-change-access").modal("hide");
          reloadDataTable();
          setTimeout(function () {
            sweetAlert2("Sukses!", "Data berhasil disimpan!", "success");
          }, 100);
        } else {
          Object.keys(data).forEach((prop) => {
            let elem = "#err_" + prop;
            $(elem).addClass("is-invalid");
            $(elem).after(`<small class="invalid-feedback">${data[prop]}</small>`);
          });
        }
      },
      error: function (data) {
        alert("An error occurred: " + data.responseJSON.message);
      },
    });
  });
}

if ($("#download-history-section").get(0)) {
  dataTable("#data-table", "/user/ajax/dt-load-download-history");
}

if ($("#browse-file-by-folder-section").get(0)) {
  function displayFolder(display = "folder", data_search = {}) {
    ajaxRequest("/user/ajax/get-folders", data_search, function (data) {
      $(".loading").remove(); //remove loading

      let folder_container = $("#folder-container");
      folder_container.empty(); //remove child nodes

      data = JSON.parse(data);
      let folder = `<div class="d-flex flex-wrap mt-3">`;
      let list = `<ul class="list-group">`;
      data.forEach((d) => {
        folder += `<a class="card icon-card cursor-pointer text-center mb-4 mx-2" href="by-folder/${d.folder_slug}">
                          <div class="card-body">
                              <i class="bx ${d.folder_icon} mb-2"></i>
                              <p class="icon-name text-capitalize text-truncate mb-0">${d.folder_name}</p>
                              <span class="position-absolute top-0 translate-middle badge rounded-pill bg-primary">
                                ${d.file_count} file
                                <span class="visually-hidden">files</span>
                              </span>
                          </div>
                      </a>`;

        list += `<a class="cursor-pointer" href="by-folder/${d.folder_slug}">
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    <div class="icon-list"><i class="bx ${d.folder_icon} me-2"></i><span class="list-text">${d.folder_name}</span></div>
                    <span class="badge bg-primary">${d.file_count} file</span>
                  </li>
                </a>`;
      });
      folder += `</div>`;
      list += `</ul>`;

      display = display === "folder" ? folder : list;

      folder_container.append(display);
    });
  }

  displayFolder();

  $("body").on("click", ".btn-folder-display", function () {
    $(".btn-folder-display").removeClass("active");
    $(this).addClass("active");

    displayFolder($(this).data("display"));
  });

  $("body").on("keyup", ".folder-search-input", function () {
    let display = $(".btn-folder-display.active").data("display");
    let data_search = {
      browse_by: display,
      argument: $(this).val(),
    };

    displayFolder(display, data_search);
  });
}

if ($("#browse-file-by-user-section").get(0)) {
  dataTable("#data-table", "/user/ajax/dt-load-browse-file-by-user");
}

if ($("#browse-by-folder-list-section").get(0)) {
  $("body").on("click", ".btn-download", function () {
    $(this).trigger("click");
    $(this).prop("disabled", true);
  });

  dataTableData("#data-table", "/user/ajax/dt-load-browse-file-by", "POST", { browse_by: "by-folder", argument: path[4] });
  $(".slug").html("FOLDER: " + path[4].toUpperCase());
}

if ($("#browse-by-user-list-section").get(0)) {
  dataTableData("#data-table", "/user/ajax/dt-load-browse-file-by", "POST", { browse_by: "by-user", argument: path[4] });
  $(".username").html("USERNAME: " + path[4].toUpperCase());
}
