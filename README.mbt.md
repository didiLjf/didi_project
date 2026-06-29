# Orbit (MoonBit 异步 Actor 并发框架)

## 简介
Orbit 是一个专为 MoonBit 设计的轻量级、高性能 Actor 模型并发框架。它基于 `moonbitlang/async` 构建，旨在简化 MoonBit 中的并发编程，提供高容错、易扩展的状态管理和消息传递机制。

## 目标与方向
- **方向**: 系统能力与运行时框架 (System capabilities and runtime framework)。
- 本项目不仅满足 MoonBit 2026 开源大赛的基本要求，还致力于成为 MoonBit 生态中不可或缺的并发基石，为构建高吞吐量、低延迟的服务器和并发系统提供原生支持。

## 核心特性
- **Actor 核心抽象**: 使用函数式编程模式定义的行为 (Behavior)，支持强类型的状态和消息流转。
- **Mailbox**: 为每个 Actor 分配独立的消息队列。
- **ActorSystem**: 提供轻量级的执行环境和系统级别的 Actor 注册与生命周期管理。
- **Supervision**: 提供核心的监管树策略 (`OneForOne`, `OneForAll`) 实现高容错能力。
- **调度机制**: 将 Actor 执行流与 MoonBit 底层异步事件循环深度结合。

## 开发进度
目前处于大赛 Phase 1 阶段，完成了项目的核心概念验证和底层抽象建立。

## 许可证
Apache-2.0