#include "PostEffectTest.hlsli"

Texture2D<float4> tex0 : register(t0);  // 0番スロットに設定されたテクスチャ
Texture2D<float4> tex1 : register(t1);	// 1番スロットに設定されたテクスチャ
SamplerState smp : register(s0);      // 0番スロットに設定されたサンプラー

float4 main(VSOutput input) : SV_TARGET
{
	//マルチテクスチャ
	float4 colortex0 = tex0.Sample(smp,input.uv);
	float4 colortex1 = tex1.Sample(smp, input.uv);

	float4 color = colortex0;
	if (fmod(input.uv.y, 0.1f) < 0.05f) {
		color = colortex1;
	}

	//UV指定したピクセルの色をサンプリング
	//float4 texcolor = tex.Sample(smp,input.uv);

	//UVずらし
	//float4 texcolor = tex.Sample(smp,input.uv + float2(0.5f,0));

	//UV座標それぞれの変化量1pixel分を計算して変数に入れておく
	//float posU = 1.0f / 1280.0f;
	//float posV = 1.0f / 720.0f;
	//色合計用の変数初期化
	//float4 texColor = { 0,0,0,0 };

	//float total = 0.0f;
	//const float roopNum = 5.0f;

	//平均ぼかし
	/*for (float y = -roopNum; y < roopNum; y += 1.0f) {
		for (float x = -roopNum; x < roopNum; x += 1.0f) {
			texColor += tex.Sample(smp, input.uv + float2(posU * x, posV * y));
			total += 1.0f;
		}
	}*/

	//通常
	//return float4(texcolor.rgb, 1);

	//return float4(texcolor.rgb * 2.0f, 1);			//RGBの数値を2倍して出力（明度上げ）

	//return float4(float3(1,1,1) - texcolor.rgb, 1);	//色反転

	//return float4(texColor.rgb / total , 1);				//平均ぼかし

	return float4(color.rgb, 1);	//マルチテクスチャ
}