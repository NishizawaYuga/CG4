#pragma once
#include "Sprite.h"
class PostEffect :
    public Sprite
{
private: // エイリアス
    // Microsoft::WRL::を省略
    template <class T> using ComPtr = Microsoft::WRL::ComPtr<T>;
public:
    /// <summary>
    /// コンストラクタ
    /// </summary>
    PostEffect();

    /// <summary>
    /// 初期化
    /// </summary>
    void Initialize();

    /// <summary>
    /// 描画コマンドの発行
    /// </summary>
    /// <param name="cmdList">コマンドリスト</param>
    void Draw(ID3D12GraphicsCommandList* cmdList);

private:
    //テクスチャ生成
    void CreateTexture(HRESULT &result);
    //SRV生成
    void CreateSRV(HRESULT& result);
    //RTV作成
    void CreateRTV(HRESULT& result);
    //深度バッファ生成
    void CreateDepthBuffer(HRESULT& result);
    //DSV作成
    void CreateDSV(HRESULT& result);

private:    //メンバ変数
    //テクスチャバッファ
    ComPtr<ID3D12Resource> texBuff;
    //SRV用デスクリプタヒープ
    ComPtr<ID3D12DescriptorHeap> descHeapSRV;
    //深度バッファ
    ComPtr<ID3D12Resource> depthBuff;
    //RTV用デスクリプタヒープ
    ComPtr<ID3D12DescriptorHeap> descHeapRTV;
    //DSV用デスクリプタヒープ
    ComPtr<ID3D12DescriptorHeap> descHeapDSV;
};

