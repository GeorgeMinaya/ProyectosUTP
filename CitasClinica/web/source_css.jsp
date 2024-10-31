<!-- BootStrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!-- Iconos -->
<link href="https://cdn.jsdelivr.net/npm/@mdi/font@7.4.47/css/materialdesignicons.min.css" rel="stylesheet">
<!-- Controles de Material Desing 3 -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
<script type="importmap">
    {
        "imports": {
            "@material/web/": "https://esm.run/@material/web/"
        }
    }
</script>
<script type="module">
    import '@material/web/all.js';
    import {styles as typescaleStyles} from '@material/web/typography/md-typescale-styles.js';

    document.adoptedStyleSheets.push(typescaleStyles.styleSheet);
</script>
<style>
    body {
        background-color: #66c8db
    }

    .shadow-blue {
        border-radius: 14px;
        background: #fdfbfb;
        box-shadow: 35px 35px 70px #4f9aa9,
            -35px -35px 70px #7df6ff;
    }
    .wh-login {
        width: 400px;
        height: 600px;
    }

    .fecha-oculta {
        opacity: 0;
        height: 0px;
        pointer-events: none;
    }

    :root {
        --md-outlined-text-field-focus-outline-color: #4f9aa9;
        --md-sys-color-primary: #418999r;
        --md-sys-color-on-surface-variant: #418999;
        --md-sys-color-on-surface: #418999;
    }
</style>
