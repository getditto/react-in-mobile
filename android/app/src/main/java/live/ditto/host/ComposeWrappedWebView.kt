package live.ditto.host

// The built in Android WebView
import android.webkit.WebResourceRequest
import android.webkit.WebResourceResponse
import android.webkit.WebView
import android.webkit.WebViewClient

// Import the WebViewAssetLoader
// This is part of the AndroidX Webkit library
// The gradle dependency is `androidx.webkit:webkit:1.9.0`
// See the gradle file for more details
import androidx.webkit.WebViewAssetLoader
import androidx.webkit.WebViewAssetLoader.AssetsPathHandler

import android.view.ViewGroup
import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.viewinterop.AndroidView
import live.ditto.host.ui.theme.HostTheme

@Composable
fun ComposeWrappedWebView() {
    AndroidView(
        factory = { context ->

            val assetLoader = WebViewAssetLoader.Builder()
                .addPathHandler("/assets/", AssetsPathHandler(context))
                .build()

            WebView(context).apply {
                layoutParams = ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT
                )

                /**
                 * Enable JavaScript in the WebView. This is required to load JS in the WebView.
                 * The compiler will warn you that this can cause XSS security issues but since we
                 * are loading our own assets, this is not a concern hence the
                 * `@Suppress("SetJavaScriptEnabled")` annotation.
                 *
                 * See https://developer.android.com/reference/android/webkit/WebSettings#setJavaScriptEnabled(boolean)
                 */
                @Suppress("SetJavaScriptEnabled")
                settings.javaScriptEnabled = false

                webViewClient =  object : WebViewClient() {
                    override fun shouldInterceptRequest(
                        view: WebView,
                        request: WebResourceRequest
                    ): WebResourceResponse? {
                        return assetLoader.shouldInterceptRequest(request.url)
                    }
                }
                /**
                 * This is the URL that will be loaded when the WebView is first
                 * The assets directory is served by a domain `https://assets.androidplatform.net`
                 * Learn more about the WebViewAssetLoader here:
                 * https://developer.android.com/reference/androidx/webkit/WebViewAssetLoader
                 */
                /**
                 * This is the URL that will be loaded when the WebView is first
                 * The assets directory is served by a domain `https://assets.androidplatform.net`
                 * Learn more about the WebViewAssetLoader here:
                 * https://developer.android.com/reference/androidx/webkit/WebViewAssetLoader
                 */
                loadUrl("https://appassets.androidplatform.net/assets/dist/index.html")
            }
        },
        update = {}
    )
}

@Preview(showBackground = true)
@Composable
fun ComposeWrappedWebViewPreview() {
    HostTheme {
        ComposeWrappedWebView()
    }
}
