<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript"
            src="http://localhost:7000/jasperserver-pro/client/visualize.js?_opt=false&logLevel=debug"></script>
    <script type="text/javascript">

        var report;

        function loadReportWithButtons(path) {
            visualize({
                auth: {
                    name: "",
                    password: "",
                    organization: ""
                }
            }, function (v) {
                report = v.report({
                    resource: path,
                    container: "#container"
                });

            }, function (err) {
                alert("Auth error Server said" + err.message)
            }, showButtons);

        }

        function loadReport(path) {
            visualize({
                auth: {
                    name: "",
                    password: "",
                    organization: ""
                }

            }, function (v) {
                report = v.report({
                    resource: path,
                    container: "#container"
                });

            }, function (err) {
                alert("Auth error Server said" + err.message)
            }, hideButtons);

        }

        function hideButtons() {
            var e = document.getElementById('buttonContainer');
            e.style.display = 'none';
        }

        function showButtons() {
            var e = document.getElementById('buttonContainer');
            e.style.display = 'block';
        }

        function nextPage() {
            var currentPage = report.pages() || 1;

            report.pages(++currentPage).run().fail(function (err) {
                alert(err);
            });
        }

        function prevPage() {
            var currentPage = report.pages() || 1;

            report.pages(--currentPage).run().fail(function (err) {
                alert(err);
            });
        }

    </script>
</head>
<body>
<h1 align="center">Virtuoso Reporting Framework</h1>
<div align="center">
    <button onclick='loadReportWithButtons("/public/Test_Report1")'>Student Marks</button>
    <button onclick='loadReport("/public/Test_Report2")'>School Marks</button>
    <button onclick='loadReport("/public/Test_Report3")'>School Marks Graph</button>
    <button onclick='loadReport("/public/Test_Report4")'>Travel Impact</button>
</div>
<div id="message"></div>
<div id="container" align="center"></div>
<div id="buttonContainer" align="center" style="display:none;">
    <button id="previousPage" onclick='prevPage()'>Previous Page</button>
    <button id="nextPage" onclick='nextPage()'>Next Page</button>
</div>
</body>
</html>