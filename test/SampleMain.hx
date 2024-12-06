// This file is written entirely in the Haxe language
package ;

// import haxe.zip.Uncompress;
// import haxe.zip.Compress;

// import sample.Sample;
// import cpp.Reference;
// import cpp.Pointer;


class SampleMain {

    static function initialize() {
        var desc = DeviceDesc.make();

#if false

Slang::Result WindowedAppBase::initializeBase(
    const char* title,
    int width,
    int height,
    DeviceType deviceType)
{
    
    // Initialize the rendering layer.
#ifdef _DEBUG
    // Enable debug layer in debug config.
    gfxEnableDebugLayer();
#endif
    IDevice::Desc deviceDesc = {};
    deviceDesc.deviceType = deviceType;
    gfx::Result res = gfxCreateDevice(&deviceDesc, gDevice.writeRef());
    if (SLANG_FAILED(res))
        return res;

    ICommandQueue::Desc queueDesc = {};
    queueDesc.type = ICommandQueue::QueueType::Graphics;
    gQueue = gDevice->createCommandQueue(queueDesc);

    windowWidth = width;
    windowHeight = height;

    IFramebufferLayout::TargetLayout renderTargetLayout = {gfx::Format::R8G8B8A8_UNORM, 1};
    IFramebufferLayout::TargetLayout depthLayout = {gfx::Format::D32_FLOAT, 1};
    IFramebufferLayout::Desc framebufferLayoutDesc;
    framebufferLayoutDesc.renderTargetCount = 1;
    framebufferLayoutDesc.renderTargets = &renderTargetLayout;
    framebufferLayoutDesc.depthStencil = &depthLayout;
    SLANG_RETURN_ON_FAIL(
        gDevice->createFramebufferLayout(framebufferLayoutDesc, gFramebufferLayout.writeRef()));

    // Do not create swapchain and windows in test mode, because there won't be any display.
    if (!isTestMode())
    {
        // Create a window for our application to render into.
        //
        platform::WindowDesc windowDesc;
        windowDesc.title = title;
        windowDesc.width = width;
        windowDesc.height = height;
        windowDesc.style = platform::WindowStyle::Default;
        gWindow = platform::Application::createWindow(windowDesc);
        gWindow->events.mainLoop = [this]() { mainLoop(); };
        gWindow->events.sizeChanged = Slang::Action<>(this, &WindowedAppBase::windowSizeChanged);

        auto deviceInfo = gDevice->getDeviceInfo();
        Slang::StringBuilder titleSb;
        titleSb << title << " (" << deviceInfo.apiName << ": " << deviceInfo.adapterName << ")";
        gWindow->setText(titleSb.getBuffer());

        // Create swapchain and framebuffers.
        gfx::ISwapchain::Desc swapchainDesc = {};
        swapchainDesc.format = gfx::Format::R8G8B8A8_UNORM;
        swapchainDesc.width = width;
        swapchainDesc.height = height;
        swapchainDesc.imageCount = kSwapchainImageCount;
        swapchainDesc.queue = gQueue;
        gfx::WindowHandle windowHandle = gWindow->getNativeHandle().convert<gfx::WindowHandle>();
        gSwapchain = gDevice->createSwapchain(swapchainDesc, windowHandle);
        createSwapchainFramebuffers();
    }
    else
    {
        createOfflineFramebuffers();
    }

    for (uint32_t i = 0; i < kSwapchainImageCount; i++)
    {
        gfx::ITransientResourceHeap::Desc transientHeapDesc = {};
        transientHeapDesc.constantBufferSize = 4096 * 1024;
        auto transientHeap = gDevice->createTransientResourceHeap(transientHeapDesc);
        gTransientHeaps.add(transientHeap);
    }

    gfx::IRenderPassLayout::Desc renderPassDesc = {};
    renderPassDesc.framebufferLayout = gFramebufferLayout;
    renderPassDesc.renderTargetCount = 1;
    IRenderPassLayout::TargetAccessDesc renderTargetAccess = {};
    IRenderPassLayout::TargetAccessDesc depthStencilAccess = {};
    renderTargetAccess.loadOp = IRenderPassLayout::TargetLoadOp::Clear;
    renderTargetAccess.storeOp = IRenderPassLayout::TargetStoreOp::Store;
    renderTargetAccess.initialState = ResourceState::Undefined;
    renderTargetAccess.finalState = ResourceState::Present;
    depthStencilAccess.loadOp = IRenderPassLayout::TargetLoadOp::Clear;
    depthStencilAccess.storeOp = IRenderPassLayout::TargetStoreOp::Store;
    depthStencilAccess.initialState = ResourceState::DepthWrite;
    depthStencilAccess.finalState = ResourceState::DepthWrite;
    renderPassDesc.renderTargetAccess = &renderTargetAccess;
    renderPassDesc.depthStencilAccess = &depthStencilAccess;
    gRenderPass = gDevice->createRenderPassLayout(renderPassDesc);

    return SLANG_OK;
}


        Slang::Result initialize()
        {
            // Create a window for our application to render into.
            //
            initializeBase("hello-world", 1024, 768);
    
            // We will create objects needed to configur the "input assembler"
            // (IA) stage of the D3D pipeline.
            //
            // First, we create an input layout:
            //
            InputElementDesc inputElements[] = {
                {"POSITION", 0, Format::R32G32B32_FLOAT, offsetof(Vertex, position)},
                {"COLOR", 0, Format::R32G32B32_FLOAT, offsetof(Vertex, color)},
            };
            auto inputLayout = gDevice->createInputLayout(sizeof(Vertex), &inputElements[0], 2);
            if (!inputLayout)
                return SLANG_FAIL;
    
            // Next we allocate a vertex buffer for our pre-initialized
            // vertex data.
            //
            IBufferResource::Desc vertexBufferDesc;
            vertexBufferDesc.type = IResource::Type::Buffer;
            vertexBufferDesc.sizeInBytes = kVertexCount * sizeof(Vertex);
            vertexBufferDesc.defaultState = ResourceState::VertexBuffer;
            gVertexBuffer = gDevice->createBufferResource(vertexBufferDesc, &kVertexData[0]);
            if (!gVertexBuffer)
                return SLANG_FAIL;
    
            // Now we will use our `loadShaderProgram` function to load
            // the code from `shaders.slang` into the graphics API.
            //
            ComPtr<IShaderProgram> shaderProgram;
            SLANG_RETURN_ON_FAIL(loadShaderProgram(gDevice, shaderProgram.writeRef()));
    
            // Following the D3D12/Vulkan style of API, we need a pipeline state object
            // (PSO) to encapsulate the configuration of the overall graphics pipeline.
            //
            GraphicsPipelineStateDesc desc;
            desc.inputLayout = inputLayout;
            desc.program = shaderProgram;
            desc.framebufferLayout = gFramebufferLayout;
            auto pipelineState = gDevice->createGraphicsPipelineState(desc);
            if (!pipelineState)
                return SLANG_FAIL;
    
            gPipelineState = pipelineState;
    
            return SLANG_OK;
        }
#end    
    }
    static function main() {
        trace("Forcing bootstrap");

        // TApp app;

        // app.parseOption(argc, argv);
        // if (SLANG_FAILED(app.initialize()))
        // {
        //     return -1;
        // }
    
        // if (!app.isTestMode())
        // {
        //     platform::Application::run(app.getWindow());
        // }
        // else
        // {
        //     app.offlineRender();
        // }
    
        // app.finalize();

//         var p = Compress.run(haxe.io.Bytes.ofString("Hello World"), 1);
//         trace(Uncompress.run(p));
//         //trace('DLL Version ${sample.Native.Init.init()}');
// //        var x = new sample.Native.Sample();
//         //
//   //      sample.Sample.testStatic();

//         var xptr = Sample.construct();
//         var x = xptr;
// //        var x = xptr.get_ref();
//         trace('x is ${x}');
//         x.print();
//         var y = x.funci(20);
//         trace('y is ${y}');
//         var aptr = x.makeA();
//         var a = aptr;
//         trace('Class A value ${a.a}');
//         a.print();
//         trace('Enum value ${sample.SampleEnum.SE_0}');
//         trace('Enum value ${sample.SampleEnum.SE_1}');
//   //      var b = x.makeB();
    //    b.print();
        trace("Done Sample Main");
    }
    
}