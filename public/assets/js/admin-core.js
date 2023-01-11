if ($("#menu-section").get(0)) {
  dataTable("#data-table", "/admin/ajax/dt-load-menu");
}

if ($("#sub-menu-section").get(0)) {
  dataTable("#data-table", "/admin/ajax/dt-load-sub-menu");
}
