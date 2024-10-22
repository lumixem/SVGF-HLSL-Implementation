#define SHADER_STRUCT 1

#include "ShaderHeaders/CameraGPU.h"
#include "ShaderHeaders/GpuModelStruct.h"

float4 Demodulate(float4 sampl, float4 albedo)
{
	float epsilon = 0.001f;
	float4 illumination = sampl / max(float4(epsilon, epsilon, epsilon, epsilon), albedo);
	return illumination;
}

// Calculate Luminance
// https://stackoverflow.com/questions/596216/formula-to-determine-perceived-brightness-of-rgb-color
float Luminance(float3 color)
{
	return dot(color, float3(0.299, 0.587, 0.114));
}

float CalculateWeight(float depthCenter, float depthP, float phiD, float3 normalCenter, float3 normalP, float phiN,
					  float luminanceCenter, float luminanceP, float phiL)
{
	float epsilon = 0.0000001;

	// Depth weight
	float difference = abs(depthCenter - depthP);
	float weightDepth = (phiD == 0) ? 0.f : difference / max(phiD, epsilon);

	// Normal weight
	float weightNormal = pow(max(0.f, dot(normalCenter, normalP)), phiN);

	// Luminance weight
	float weightLuminance = abs(luminanceCenter - luminanceP) / phiL;

	float weight = exp(-weightDepth - weightLuminance) * weightNormal;
	return weight;
}

