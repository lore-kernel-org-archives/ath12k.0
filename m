Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B39C3DA7F
	for <ath12k@archiver.kernel.org>; Mon,  5 Aug 2024 09:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwXxVZTm7IvlOs4Z62LXYolep1QJ5soDQ3V5c1clVAU=; b=1E1sC3Qidlam8TO41fiCeKWRGD
	E+tLdKRjwy02Km+f4uuQonVME3JxTwPgU67NY4iPwlb9iOJhZF17RKh1mEhM9lLZNuakiuj6+/m6+
	mbGPEw1PjVCZ5Q/rrAo7Qr0PrZnLdLq9ueYLUCG/qk4RyRtIJ6XATNacr+b0Y7NMpmqvf9jrUu+1b
	ydSNwA8YWAcZgWzxni/72HwOG8tOEi6OjGueDP9A34bDfte4EXCHD4CzPSlZrJx1+U5xWGeYD5xwC
	n9TiaXssLkvA1wM5WEMVCU329eypeVBWpvjIcXxCqmVgX8HGlDofxXGIAJ6nv39aCZeevQmH5Vq3c
	/SvM6XMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sau1P-0000000FHr8-2WcL
	for ath12k@archiver.kernel.org;
	Mon, 05 Aug 2024 09:28:55 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sau1M-0000000FHqR-2ViX
	for ath12k@lists.infradead.org;
	Mon, 05 Aug 2024 09:28:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3C191CE0A56;
	Mon,  5 Aug 2024 09:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C6DC32782;
	Mon,  5 Aug 2024 09:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722850129;
	bh=y26axP4JKUvXZJXcke8RVR5AeL04n4oU22P76jsEH/w=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=pXmul6It5kL8o+0ij0aLAoA50BEeIAfv2IJSmR9kC1wDElFsbNRNAprpDH//wKe9I
	 DB+x5TclGFUlFthV44GaLM4TWMaReJ922k2s08LETPRpsbCQPHyaD7fy9SH+wO4+f4
	 wVxhNkzUytoW2zANCbHr/X/pIfSMEDAPtzZsNg2WwXhAU/lZ4aA91VhO09oZTmzokZ
	 iTtfgnIg5zhuuT4aVC1HwHq6xS7JgPwEni+C9ca57S5y3fyhFRtBxvdJHvw7vMERNb
	 uQtwUHOK04hJ9hHISrQKPwrnfDUsIdc5i+HRpi+2ETfEbgxJpfNokArVWZhfirXyic
	 HcpceUo9zcGXg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: use 128 bytes aligned iova in transmit path
 for
 WCN7850
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240715023814.20242-1-quic_bqiang@quicinc.com>
References: <20240715023814.20242-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>, <kernel@quicinc.com>, <netdev@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172285012623.3144432.10455609105773618485.kvalo@kernel.org>
Date: Mon,  5 Aug 2024 09:28:48 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_022852_850295_1004A784 
X-CRM114-Status: GOOD (  15.14  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> In transmit path, it is likely that the iova is not aligned to PCIe TLP
> max payload size, which is 128 for WCN7850. Normally in such cases hardware
> is expected to split the packet into several parts in a manner such that
> they, other than the first one, have aligned iova. However due to hardware
> limitations, WCN7850 does not behave like that properly with some specific
> unaligned iova in transmit path. This easily results in target hang in a
> KPI transmit test: packet send/receive failure, WMI command send timeout
> etc. Also fatal error seen in PCIe level:
> 
>         ...
>         Capabilities: ...
>                 ...
>                 DevSta: ... FatalErr+ ...
>                 ...
>         ...
> 
> Work around this by manually moving/reallocating payload buffer such that
> we can map it to a 128 bytes aligned iova. The moving requires sufficient
> head room or tail room in skb: for the former we can do ourselves a favor
> by asking some extra bytes when registering with mac80211, while for the
> latter we can do nothing.
> 
> Moving/reallocating buffer consumes additional CPU cycles, but the good news
> is that an aligned iova increases PCIe efficiency. In my tests on some X86
> platforms the KPI results are almost consistent.
> 
> Since this is seen only with WCN7850, add a new hardware parameter to
> differentiate from others.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Cc: <stable@vger.kernel.org>
> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-current branch of ath.git, thanks.

38055789d151 wifi: ath12k: use 128 bytes aligned iova in transmit path for WCN7850

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240715023814.20242-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


