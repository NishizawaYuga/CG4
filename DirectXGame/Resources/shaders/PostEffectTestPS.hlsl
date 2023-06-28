#include "PostEffectTest.hlsli"

Texture2D<float4> tex : register(t0);  // 0番スロットに設定されたテクスチャ
SamplerState smp : register(s0);      // 0番スロットに設定されたサンプラー

float4 main(VSOutput input) : SV_TARGET
{
	//UV指定したピクセルの色をサンプリング
	//float4 texcolor = tex.Sample(smp,input.uv);

	//UVずらし
	//float4 texcolor = tex.Sample(smp,input.uv + float2(0.5f,0));

	//UV座標それぞれの変化量1pixel分を計算して変数に入れておく
	float posU = 1 / 1280;
	float posV = 1 / 720;
	//色合計用の変数初期化
	float4 totalColor = { 0,0,0,0 };

	float total = 0;

	//平均ぼかし
	for (int y = -1; y > 1; y++) {
		for (int x = -1; x > 1; x++) {
			totalColor += tex.Sample(smp, input.uv + float2(posU * x ,posV * y));
		}
	}

	//通常
	//return float4(texcolor.rgb, 1);
	
	//return float4(texcolor.rgb * 2.0f, 1);			//RGBの数値を2倍して出力（明度上げ）
	
	//return float4(float3(1,1,1) - texcolor.rgb, 1);	//色反転

	return float4(totalColor.rgb, 1);				//平均ぼかし
}