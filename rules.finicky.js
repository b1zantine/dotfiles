module.exports = {
    defaultBrowser: "Firefox",
    rewrite: [
        {
            // Redirect all urls to use https
            match: ({ url }) => url.protocol === "http",
            url: { protocol: "https" }
        }
    ],
    handlers: [
        {
            // Open any url that includes the string "workplace" in Firefox
            match: [
                "*.zoom.us/j/*"
                // finicky.matchDomains(/.*\.zoom.us/),
                // /zoom.us\/j\//,
            ],
            browser: "us.zoom.xos"
        },
        {
            // Open Spotify links in Spotify app
            match: "open.spotify.com/*",
            browser: "Spotify"
        },
        {
            match: finicky.matchHostnames(['teams.microsoft.com']),
            browser: 'com.microsoft.teams',
            url: ({ url }) =>
                ({ ...url, protocol: 'msteams' }),
        },
        {
            match: finicky.matchHostnames(['www.notion.so', 'notion.so']),
            browser: 'notion',
            url: ({ url }) => ({ ...url, protocol: 'notion' })
        }
    ]
};
