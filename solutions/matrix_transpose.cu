#include<cuda_runtime.h>
// #include<cstdio>

__global__ void transpose_naive(float* out, const float* in, int width, int height){
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (x < width && y < height) {
        out[x * height + y] = in[y * width + x]; // in[x, y] -> out[y, x]
    }
}

__global__ void transpose_coalesced_write(float* out, const float* in, int width, int height){
    int y = blockIdx.x * blockDim.x + threadIdx.x;
    int x = blockIdx.y * blockDim.y + threadIdx.y;

    if (x< height && y < width) {
        out[y * height + x] = in[x * width + y];
    }
}

int main() {
}