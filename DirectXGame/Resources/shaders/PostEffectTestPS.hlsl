#include "PostEffectTest.hlsli"

Texture2D<float4> tex : register(t0);  // 0�ԃX���b�g�ɐݒ肳�ꂽ�e�N�X�`��
SamplerState smp : register(s0);      // 0�ԃX���b�g�ɐݒ肳�ꂽ�T���v���[

float4 main(VSOutput input) : SV_TARGET
{
	//UV�w�肵���s�N�Z���̐F���T���v�����O
	//float4 texcolor = tex.Sample(smp,input.uv);
	
	//UV���炵
	float4 texcolor = tex.Sample(smp,input.uv + float2(0.5f,0));

	//�ʏ�
	return float4(texcolor.rgb, 1);
	//return float4(texcolor.rgb * 2.0f, 1);			//RGB�̐��l��2�{���ďo�́i���x�グ�j
	
	//return float4(float3(1,1,1) - texcolor.rgb, 1);	//�F���]
}