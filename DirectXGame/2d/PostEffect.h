#pragma once
#include "Sprite.h"
class PostEffect :
    public Sprite
{
private: // �G�C���A�X
    // Microsoft::WRL::���ȗ�
    template <class T> using ComPtr = Microsoft::WRL::ComPtr<T>;
public:
    /// <summary>
    /// �R���X�g���N�^
    /// </summary>
    PostEffect();

    /// <summary>
    /// ������
    /// </summary>
    void Initialize();

    /// <summary>
    /// �`��R�}���h�̔��s
    /// </summary>
    /// <param name="cmdList">�R�}���h���X�g</param>
    void Draw(ID3D12GraphicsCommandList* cmdList);

private:
    //�e�N�X�`������
    void CreateTexture(HRESULT &result);
    //SRV����
    void CreateSRV(HRESULT& result);
    //RTV�쐬
    void CreateRTV(HRESULT& result);
    //�[�x�o�b�t�@����
    void CreateDepthBuffer(HRESULT& result);
    //DSV�쐬
    void CreateDSV(HRESULT& result);

private:    //�����o�ϐ�
    //�e�N�X�`���o�b�t�@
    ComPtr<ID3D12Resource> texBuff;
    //SRV�p�f�X�N���v�^�q�[�v
    ComPtr<ID3D12DescriptorHeap> descHeapSRV;
    //�[�x�o�b�t�@
    ComPtr<ID3D12Resource> depthBuff;
    //RTV�p�f�X�N���v�^�q�[�v
    ComPtr<ID3D12DescriptorHeap> descHeapRTV;
    //DSV�p�f�X�N���v�^�q�[�v
    ComPtr<ID3D12DescriptorHeap> descHeapDSV;
};

