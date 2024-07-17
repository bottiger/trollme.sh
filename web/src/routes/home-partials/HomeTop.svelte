<script lang="ts">
	import { CodeBlock } from '@skeletonlabs/skeleton';

    // Highlight JS
    import hljs from 'highlight.js/lib/core';
    import 'highlight.js/styles/github-dark.css';
    import { storeHighlightJs } from '@skeletonlabs/skeleton';
    import xml from 'highlight.js/lib/languages/xml'; // for HTML
    import css from 'highlight.js/lib/languages/css';
    import javascript from 'highlight.js/lib/languages/javascript';
    import typescript from 'highlight.js/lib/languages/typescript';
    import bash from 'highlight.js/lib/languages/bash';

    hljs.registerLanguage('xml', xml); // for HTML
    hljs.registerLanguage('css', css);
    hljs.registerLanguage('javascript', javascript);
    hljs.registerLanguage('typescript', typescript);
    hljs.registerLanguage('bash', bash);
    storeHighlightJs.set(hljs);

	// Data model for cards
	const cards = [
        { id: 1, header: 'It\'s mostly harmless', content: 'While it\'s never a good idea to execute code you found on the internet, we promiss that everything will be contained and easy to remove again.', footer: 'uninstall.sh', link: 'https://github.com/bottiger/trollme.sh/blob/main/shellscript/uninstall.sh', image: '/img/mostly_harmless.jpg' },
        { id: 2, header: 'It\'s escalating', content: 'It starts out slow with only a few rare anomalies. But over the course of a few days the anomalies will grow in scope and numbers', footer: 'troll.sh', link: 'https://github.com/bottiger/trollme.sh/blob/main/shellscript/troll.sh', image: '/img/progressive.jpeg' },
        { id: 3, header: 'You are accountable', content: 'You are strongly encouraged to submit your name at install-time. This will be visible to the victim when he/she finds the scripts. Pranks only becomes funnier when you know whos behind it, and if you are not willing to identify yourself you should probably not use this', footer: '', link: '', image: '/img/deep_mind.jpeg' }
    ];
</script>

<div class="container h-full mx-auto flex flex flex-col space-y-20 justify-center items-center">

	<div class="space-y-10 text-center flex flex-col items-center w-full">
        <div class="text-start w-full max-w-container">
            <div class="p-y-5">
		    <h1 class="h1 text-6xl"><span class="gradient-heading">TrollMe.sh:</span> <span class="gradient-heading-alt">Lighthearted mischief</span></h1>
		    <p class="subtext-custom">
                The command below will install a number of bash scripts on the computer which will execute at random and gradually become stranger and more visible.
                While it's always a bad idea to execute code directly from the internet you have my pinky-promiss that this is non-dangerous and easily removable again.     
            </p>
            </div>
            <div class="mt-4">
                <figure>
                    <section class="img-bg" />
                    <CodeBlock class="code-block" language="bash" code={`curl -s https://get.trollme.sh | sh -s -- "Your name"`} text="text-4xl"></CodeBlock>
                </figure>
            </div>
        </div>
		
	</div>

    <!--
	<div class="card-container">
		{#each cards as card}
			<div class="card card-hover bg-gradient-to-br variant-gradient-tertiary-secondary">
				<img src={card.image} alt="Placeholder Image">
				<header class="card-header h4">{card.header}</header>
				<section class="p-4">{card.content}</section>
				<footer class="card-footer">
					<hr class="opacity-50">
					<a href="{card.link}">{card.footer}</a>
				</footer>
			</div>
		{/each}
	</div>
    -->
</div>

<style lang="postcss">
        .subtext-custom {
            font-size: 1.25rem; /* Set a custom font size */
            font-weight: 500; /* Make the font weight slightly bolder */
            line-height: 1.6; /* Increase line height for readability */
            /*background: rgba(255, 255, 255, 0.8); /* Add a light background for contrast */
            /*padding: 10px; /* Add some padding for better spacing */
            border-radius: 5px; /* Optional: Add some border radius for a smoother look */
            color: #333; /* Ensure the text color is dark enough for contrast */
            margin-top: 10px; /* Adjust this value to get the desired spacing */
            margin-bottom: 20px; /* Add space below the subtext */
        }

	.gradient-heading {
		@apply bg-clip-text text-transparent box-decoration-clone;
		/* Direction */
		@apply bg-gradient-to-br;
		/* Color Stops */
		@apply from-primary-500 via-tertiary-500 to-secondary-500;
	}	

	.gradient-heading-alt {
		@apply bg-clip-text text-transparent box-decoration-clone;
		/* Direction */
		@apply bg-gradient-to-br;
		/* Color Stops */
		@apply from-indigo-500 via-purple-500 to-pink-500;
	}	

	.container {
		@apply w-full max-w-7xl mx-auto p-4 py-16 md:py-24;
	}

	figure {
		@apply flex relative flex-col;
	}

    .img-bg::before {
        content: '';
        @apply absolute z-[-1] rounded-full blur-[50px] transition-all;
        animation: pulse 5s cubic-bezier(0, 0, 0, 0.5) infinite, glow 5s linear infinite;
        width: 110%; /* Adjust this value as needed */
        height: 110%; /* Adjust this value as needed */
        top: -10%; /* Adjust this value as needed */
        left: -10%; /* Adjust this value as needed */
    }

	@keyframes glow {
		0% {
			@apply bg-primary-400/50;
		}
		33% {
			@apply bg-secondary-400/50;
		}
		66% {
			@apply bg-tertiary-400/50;
		}
		100% {
			@apply bg-primary-400/50;
		}
	}
	@keyframes pulse {
		50% {
			transform: scale(1.5);
		}
	}

	.code-block {
        @apply relative z-10; /* Ensure code block is above the img-bg */
    }



	.card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 25px;
            justify-content: center;
        }
        .card {
            /*background-color: white;
            color: black;
            border: 1px solid #ddd;*/
			color: wheat;
            border-radius: 8px;
            width: 400px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
			display: flex;
			flex-direction: column;
			justify-content: space-between;
        }
        .card img {
            width: 100%;
            height: 150px;
			object-fit: cover;
        }
        .card-header {
            padding: 12px;
			font-weight: bold;
		}
        
		.card-footer {
            padding: 12px;
		}

        .p-4 {
            padding: 12px;
			flex-grow: 1;
        }
</style>
