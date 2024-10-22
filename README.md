# SVGF-HLSL-Implementation

This repo contains HLSL shaders for an implementation of Nvidia's [Spatiotemporal Variance-Guided Filtering](https://research.nvidia.com/publication/2017-07_spatiotemporal-variance-guided-filtering-real-time-reconstruction-path-traced) paper.

The implementation was developed by [Andrei Bazzaev](https://andreibazzaev.systeme.io/portfolio) and myself as part of our 3rd year university project - [On The Bubble](https://store.steampowered.com/app/2707350/On_the_Bubble/).
It is based on Nvidia's [Falcor SVGF](https://github.com/NVIDIAGameWorks/Falcor/tree/master/Source/RenderPasses/SVGFPass).

Explanation of shaders (in order of dispatches):
1. [Reproject](https://github.com/lumixem/SVGF-HLSL-Implementation/blob/main/Shaders/Reproject.hlsl) - Uses previous and current's frame data to lower amount of variance through temporal integration
2. [CalculateWeights](https://github.com/lumixem/SVGF-HLSL-Implementation/blob/main/Shaders/CalculateWeights.hlsl) - Calculates weights to estimate variance for pixels with limited history
3. [ATrous](https://github.com/lumixem/SVGF-HLSL-Implementation/blob/main/Shaders/ATrous.hlsl) - Filters and smooths noise based on the variance estimations
4. [Modulate](https://github.com/lumixem/SVGF-HLSL-Implementation/blob/main/Shaders/Modulate.hlsl) - Remodulates albedo and adds emission back in
