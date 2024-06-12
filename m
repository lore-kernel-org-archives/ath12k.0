Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7D3C27C53
	for <ath12k@archiver.kernel.org>; Wed, 12 Jun 2024 15:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4ZRYpyRksJXAC7eqQUrubX0WAADsS963fxbHZmjvRY=; b=F1TStvCh1pK00rhnp3oxT3RFNn
	WBe6gaXHsE5287H9A/EA6DCXaSiZiIQsmEjw1HvuIhGhk5PCczZns8ORoUzJaQLQ2tvW32H/YfCst
	3bJSJqoktXNu6B4kkKrzO9zKWBgIr2bVS+jzazzhask+ZdVQLuqy4vixtYN3lvyW0CcJVeBj9zykj
	Q5j7M2JrP2zMtnEZxQUsTg8I/11Uj562nRgDQ5DHj7fPr2ADCYqeZPsjy6vErsMHIROcfPMyB7DiV
	bStZwwqLJbQh1TOpK10kpQ0aGX7TscLSxqFDZeAbq/8qw6dK4cfHJrNkHTFobYh9uAAjxzSjI1ykM
	5riWPruQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHQKT-0000000DG5o-0NGA
	for ath12k@archiver.kernel.org;
	Wed, 12 Jun 2024 15:56:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHQKO-0000000DG3L-1X3O;
	Wed, 12 Jun 2024 15:56:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ADF7F614E9;
	Wed, 12 Jun 2024 15:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AEC7C4DDE4;
	Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718207757;
	bh=OGohKvk0MjWf9+Q8+mvrBX+1BAlKKRyUXLbfH75xyb4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kYWVzenO6v46dav7m+6VeeBQvWtkfZ2ijSROLzZNF2xhVox8NT4g6D7nEQ7Yr1CvD
	 QbMqbzoNwKvtHxN4oOUSJGsdzFSOiqxLCA02gKqMCQ7TCsZzzusBONx5M/RWdCVpV3
	 EiLccKqgRHfAnZUsG10WiKCsIr5ffuOoIqg1qhcsU6IhDG8FGsX5pkowWNVMy10FlC
	 cn2EJB/8N7UtSBq02dCqRuSQs3PZ1MDiLAg7XtxdpzyjShLg11I47hWenlonizyvmL
	 MeVPPNyid+I2VhiIZBpPj5WbK56sRWz78MH6UY8PKtaaCMSFrdgOOixPo+5vEX+bSG
	 8/iqEXeUVgsUQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 61107C43618;
	Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171820775738.32393.13116890369510221266.git-patchwork-notify@kernel.org>
Date: Wed, 12 Jun 2024 15:55:57 +0000
References: <20240516133454.681ba6a0@rorschach.local.home>
In-Reply-To: <20240516133454.681ba6a0@rorschach.local.home>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ath10k@lists.infradead.org,
 Julia.Lawall@inria.fr, linux-s390@vger.kernel.org, dev@openvswitch.org,
 linux-cifs@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 io-uring@vger.kernel.org, torvalds@linux-foundation.org,
 iommu@lists.linux.dev, ath11k@lists.infradead.org,
 linux-media@vger.kernel.org, linux-wpan@vger.kernel.org,
 linux-pm@vger.kernel.org, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-erofs@lists.ozlabs.org, virtualization@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-block@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, mathieu.desnoyers@efficios.com,
 linux-cxl@vger.kernel.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, linux-edac@vger.kernel.org,
 linux-hwmon@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ath12k@lists.infradead.org, tipc-discussion@lists.sourceforge.net,
 mhiramat@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-nfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_085600_484220_5A6FC0DF 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Steven Rostedt (Google) <rostedt@goodmis.org>:

On Thu, 16 May 2024 13:34:54 -0400 you wrote:
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> [
>    This is a treewide change. I will likely re-create this patch again in
>    the second week of the merge window of v6.10 and submit it then. Hoping
>    to keep the conflicts that it will cause to a minimum.
> ]
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] tracing/treewide: Remove second parameter of __assign_str()
    https://git.kernel.org/jaegeuk/f2fs/c/2c92ca849fcc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



