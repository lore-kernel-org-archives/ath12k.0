Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DF8C27C43
	for <ath12k@archiver.kernel.org>; Thu, 30 May 2024 15:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DotFDQJII63j/t0pQuZL/g0ddw3jSvtU5hZEgf/theU=; b=3LzfTE16kHNUqlJg7OJPASY/Je
	N0NHKmVcqfCzWtDHXgmuaOw5XGv5FFRUZ8xKtFsU3P7XVW8xRoWucR/2cFnmtunnzp4ciRIxuXVFI
	JDsDxiigwxF4ye3bpvh6831ZPm+9cKyvUKMCTllDll7eFEvxEdtbIe8tYyu3PKhArDOWp6LcHdtdW
	EBFZ6F+xIUgIiwJ5P8pXAJexe4KFSTa7OEAqy5BmQNzDPKjZUYweYKlyk5VUObXlRiqJfzXg6L7VU
	c0N9nNHfGjrBZ8ZpiWZXDLuulT4uW9B1wmxhBvOU48l5nJErlYpo9yt0vL6CPnw99+KxVwTsOlSZ2
	U8Z1mHUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCi24-00000007liS-30aU
	for ath12k@archiver.kernel.org;
	Thu, 30 May 2024 15:49:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCi21-00000007lgA-3BfJ
	for ath12k@lists.infradead.org;
	Thu, 30 May 2024 15:49:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D9C4ACE1AC2;
	Thu, 30 May 2024 15:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE0BC2BBFC;
	Thu, 30 May 2024 15:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717084170;
	bh=0mrtFxmnKphhdbbAOAMZrrK6ThPiZ89bJ1wLJ4t9xeo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=W76rWAWoP3T8RGwrFN/CxV0OdpVHAqWicn7MredWG0uzT6yQpW7Yja1EnaHXfSJWU
	 7ydZFyB2pKrbuFjMPMwAfZG+6OUA2qkwdllIvCCI436XIHFhekbWO89oQhX7wk67KB
	 F0uEgeeCiMdYm949G62X9iOH2IZ9MtT7MVudtHvCm6cCqj+/hmwyC+mS9/4lw7WCHv
	 wUPhYIwaoC0KAEyk+7Y3jMwvy1qiy7vgSnzyjT1x24oDfCDNdCn+Rk5fjfqHOOi74N
	 i5hztsvCq6pb0X5L33ynTbQmDZoQy9vboF5jviz3cxoqRObZJ2QlatGIxuYy+Kcznh
	 QfU5IzLQac5Zw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: fix memory leak in
 ath12k_dp_rx_peer_frag_setup()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240526124226.24661-1-quic_bqiang@quicinc.com>
References: <20240526124226.24661-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171708416720.182911.5669999040960213709.kvalo@kernel.org>
Date: Thu, 30 May 2024 15:49:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_084934_045440_310B8CC7 
X-CRM114-Status: UNSURE (   6.50  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> Currently the resource allocated by crypto_alloc_shash() is not
> freed in case ath12k_peer_find() fails, resulting in memory leak.
> 
> Add crypto_free_shash() to fix it.
> 
> This is found during code review, compile tested only.
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3d6004154318 wifi: ath12k: fix memory leak in ath12k_dp_rx_peer_frag_setup()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240526124226.24661-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


