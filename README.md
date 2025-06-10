# ChatComponentAPI

A cross-version ChatComponent API for Bukkit/Spigot servers that provides seamless compatibility across multiple Minecraft versions.

**This is a fork of the original ChatComponentAPI project.**

- **Original Repository**: [bitbucket.org/BillyGalbreath/chatcomponentapi](https://bitbucket.org/BillyGalbreath/chatcomponentapi/src/master/)
- **Original Author**: BillyGalbreath

## 📋 Overview

ChatComponentAPI is a library that allows Bukkit/Spigot plugin developers to send chat components (JSON-formatted messages) to players with consistent behavior across different Minecraft server versions. It provides a unified interface for sending messages to different chat positions (chat, action bar, etc.) without worrying about version-specific implementation details.

## ✨ Features

- **Cross-version compatibility** - Supports Minecraft versions 1.8.x through 1.12.x
- **Multiple chat positions** - Send messages to chat, action bar, and other positions
- **Simple API** - Clean interface using Spigot's BaseComponent system
- **No dependencies** - Works with vanilla Spigot/Bukkit installations

## 🏗️ Supported Versions

- **1.8.x** (R1, R2, R3)
- **1.9.x** (R1, R2)
- **1.10.x** (R1)
- **1.11.x** (R1)
- **1.12.x** (R1)

## 📦 Maven

### Using JitPack (Recommended)

Add the JitPack repository to your `pom.xml`:

```xml
<repositories>
    <repository>
        <id>jitpack.io</id>
        <url>https://jitpack.io</url>
    </repository>
</repositories>
```

Then add the dependency:

```xml
<dependency>
    <groupId>com.github.OstlerDev</groupId>
    <artifactId>ChatComponentAPI</artifactId>
    <version>1.12.0</version>
</dependency>
```

> **Note**: Latest releases are available at [GitHub Releases](https://github.com/OstlerDev/ChatComponentAPI/releases)

## 🔧 Usage

The API provides a simple way to send chat components with rich formatting, hover events, and click events:

```java
import net.md_5.bungee.api.chat.BaseComponent;
import net.md_5.bungee.api.chat.HoverEvent;
import net.md_5.bungee.api.chat.TextComponent;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.player.PlayerJoinEvent;

import net.pl3x.bukkit.chatapi.ComponentSender;

public class PlayerListener implements Listener {
    @EventHandler
    public void onPlayerJoin(PlayerJoinEvent event) {
        TextComponent text = new TextComponent("Welcome to the server!");
        TextComponent hoverText = new TextComponent("Click me for more info :)");
        HoverEvent hoverEvent = new HoverEvent(HoverEvent.Action.SHOW_TEXT, new BaseComponent[]{hoverText});
        text.setHoverEvent(hoverEvent);

        ComponentSender.sendMessage(event.getPlayer(), text);
    }
}
```

### Basic Usage

```java
// Simple text message
ComponentSender.sendMessage(player, new TextComponent("Hello World!"));

// Message with hover text
TextComponent message = new TextComponent("Hover over me!");
message.setHoverEvent(new HoverEvent(HoverEvent.Action.SHOW_TEXT, 
    new BaseComponent[]{new TextComponent("Secret message!")}));
ComponentSender.sendMessage(player, message);
```

## 🏗️ Building

This project uses Maven for dependency management and building:

```bash
mvn clean install
```

## 📜 License

This project maintains the same license as the original repository.

## 🙏 Attribution

**This is a fork of the original ChatComponentAPI project.**

- **Original Repository**: [bitbucket.org/BillyGalbreath/chatcomponentapi](https://bitbucket.org/BillyGalbreath/chatcomponentapi/src/master/)
- **Original Author**: BillyGalbreath

This fork was created to preserve and maintain this valuable library for the Bukkit/Spigot community. All original commits, authors, and git history have been preserved. Special thanks to BillyGalbreath for creating and maintaining this excellent cross-version compatibility library.

## 🤝 Contributing

If you'd like to contribute improvements or bug fixes, please feel free to submit pull requests. Since this is a community maintenance fork, contributions are welcome to keep this library up to date with newer Minecraft versions or to fix any issues.

## ⚠️ Note

This repository was forked from the original Bitbucket repository to ensure its preservation and continued availability for the Minecraft plugin development community. The original repository may still be maintained at the Bitbucket location linked above. 
