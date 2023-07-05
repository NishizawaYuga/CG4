#include "PostEffectTest.hlsli"

Texture2D<float4> tex0 : register(t0);  // 0�ԃX���b�g�ɐݒ肳�ꂽ�e�N�X�`��
Texture2D<float4> tex1 : register(t1);	// 1�ԃX���b�g�ɐݒ肳�ꂽ�e�N�X�`��
SamplerState smp : register(s0);      // 0�ԃX���b�g�ɐݒ肳�ꂽ�T���v���[

float4 main(VSOutput input) : SV_TARGET
{
	//�}���`�e�N�X�`��
	float4 colortex0 = tex0.Sample(smp,input.uv);
	float4 colortex1 = tex1.Sample(smp, input.uv);

	float4 color = colortex0;
	if (fmod(input.uv.y, 0.1f) < 0.05f) {
		color = colortex1;
	}

	//UV�w�肵���s�N�Z���̐F���T���v�����O
	//float4 texcolor = tex.Sample(smp,input.uv);

	//UV���炵
	//float4 texcolor = tex.Sample(smp,input.uv + float2(0.5f,0));

	//UV���W���ꂼ��̕ω���1pixel�����v�Z���ĕϐ��ɓ���Ă���
	//float posU = 1.0f / 1280.0f;
	//float posV = 1.0f / 720.0f;
	//�F���v�p�̕ϐ�������
	//float4 texColor = { 0,0,0,0 };

	//float total = 0.0f;
	//const float roopNum = 5.0f;

	//���ςڂ���
	/*for (float y = -roopNum; y < roopNum; y += 1.0f) {
		for (float x = -roopNum; x < roopNum; x += 1.0f) {
			texColor += tex.Sample(smp, input.uv + float2(posU * x, posV * y));
			total += 1.0f;
		}
	}*/

	//�ʏ�
	//return float4(texcolor.rgb, 1);

	//return float4(texcolor.rgb * 2.0f, 1);			//RGB�̐��l��2�{���ďo�́i���x�グ�j

	//return float4(float3(1,1,1) - texcolor.rgb, 1);	//�F���]

	//return float4(texColor.rgb / total , 1);				//���ςڂ���

	return float4(color.rgb, 1);	//�}���`�e�N�X�`��
}