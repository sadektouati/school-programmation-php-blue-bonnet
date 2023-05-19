<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blue bonnet</title>
    <style>
        article{
            display: flex;
            flex-direction:column;
            gap: 2rem;
            margin: auto;
            width: min(100%, 50em);
        }
        img, h2{
            display:block;
            width:100%;
        }
        img, pre{
            margin-top: 1rem;
        }
        pre{
            font-size:1rem;
        }
    </style>
</head>
<body>
    <h1>Blue bonnet</h1>

    <article>

        <div>
            <h2>SQL</h2>
            <pre>
                <?php include('script.sql'); ?>
            </pre>
        </div>

        <div>
            <h2>MPD</h2>
            <img src="mpd.png">
        </div>
        
        <div>
            <h2>MCD</h2>
            <img src="mcd.png">
        </div>

    </article>

</body>
</html>