//--------------------------------------------------------------------------------------
struct VSInput
{
    float4 position : POSITION;
    float2 tex : TEXCOORD0;
};


struct PSInput
{
    float4 position : SV_POSITION;
    float2 tex : TEXCOORD0;
    //float4 color : COLOR;
};


Texture2D screen_texture : register( t0 );
SamplerState samLinear : register( s0 );

PSInput VS(VSInput input)
{
    PSInput result;

    result.position = input.position;
    result.tex = input.tex;

    return result;
}

float4 PS(PSInput input) : SV_TARGET
{
    return screen_texture.Sample( samLinear, input.tex );
    //return input.position;
}