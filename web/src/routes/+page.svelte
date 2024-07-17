<script lang="ts">
	import '../app.postcss';
	import { AppShell, AppBar } from '@skeletonlabs/skeleton';

	// HTTP response data provided by +page.ts
	import type { PageData } from './$types';
	export let data: PageData;
	$: ({ contributors } = data);

	import HomeTop from './home-partials/HomeTop.svelte';
	import HomeFeatures from './home-partials/HomeFeatures.svelte';
	import HomeContributors from './home-partials/HomeContributors.svelte';
</script>

<div class="container h-full mx-auto flex flex flex-col space-y-20 justify-center items-center pb-20">

<!-- top -->
<section id="top">
	<div class="section-container"><HomeTop /></div>
</section>

<!-- features -->
<section id="features" class="features-gradient">
	<div class="section-container"><HomeFeatures /></div>
</section>

<!-- contributors -->
<section id="contributors">
	<div class="section-container"><HomeContributors {contributors} /></div>
</section>

</div>

<style lang="postcss">
</style>
