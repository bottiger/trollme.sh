<script lang="ts">
	const features = [
		{
			title: 'It\'s mostly harmless',
			body: 'While the intention of this is to cause mischief on the victims computer, everything it does is harmless',
			icon: 'fa-laptop-code'
		},
		{
			title: 'It\'s escalating',
			body: 'It starts out slow with only a few rare anomalies. But over the course of a few days the anomalies will grow in scope and numbers',
			icon: 'fa-universal-access'
		},
		{
			title: 'It\'s Removable',
			body: `It includes uninstall.sh which will completley remove everything from the computer again`,
			icon: 'fa-square-arrow-up-right'
		},
		{
			title: 'It\'s Pure bash',
			body: 'Everything is written in bash for broad compatibility and transparency',
			icon: 'fa-code'
		},
		{
			title: 'It\'s Open Source',
			body: `Projects like this only makes sense if you are able to review the code, which should be the bare minimum in your due diligence process. If you have the technical skills you are also encourages to help out by adding new scripts`,
			icon: 'fa-puzzle-piece'
		},
		{
			title: 'But! You are still accountable',
			body: 'You are strongly encouraged to submit your name at install-time. This will be visible to the victim when he/she finds the scripts. Pranks only becomes funnier when you know whos behind it, and if you are not willing to identify yourself you should probably not use this',
			icon: 'fa-icons'
		}
	];
</script>

<div class="space-y-4 md:space-y-10">
	<!-- Info -->
	<div class="space-y-4 text-center">
		<h1 class="h1">The script a nuttshell</h1>
	</div>
	<!-- Grid -->
	<div class="grid grid-cols-1 lg:grid-cols-3 gap-4">
		<!-- Loop -->
		{#each features as feature}
			<!-- Card -->
			<div class="card variant-glass p-4 shadow-lg md:p-10 space-y-4 text-center">
				<span class="btn-icon btn-icon-xl variant-soft-primary">
					<i class="fa-solid {feature.icon}"></i>
				</span>
				<h3 class="h3">{feature.title}</h3>
				<p>{@html feature.body}</p>
			</div>
		{/each}
	</div>
</div>