Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF7ACD1284
	for <ath12k@archiver.kernel.org>; Thu,  4 Apr 2024 10:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tOmAuklxfOyv/MNQtZXy51azx92G8hgWiLrSV16q6I=; b=0O6NC0ME3AkTLFoOHo8Rh5b3d6
	VXhzd3tExLQiWfKaeBoEOnlChvul2jkLvaTPcaCK7yL0i9O5YXA3nV9qKIDiIbTaFss8f5koQuUfh
	eMesMpssLTUsa5moJCPOntFD8I5UjAv59CM8rTV+9FVpXkgOh0CcpM5LBg01owatyBmR+K/A7bi0y
	BsToteXY3Uw0MCH6JRWXIVdpHVUNXN9o9yTiQtqUqfGg1KcfBwwA79Wsj1/Bmz/cVTlqP6nG5WWZj
	YEeIT3IQQSij9h7epvDtRVodygNb3LWL5UtpRi5CT3SqNmffmqHrY66kqm3UnSEWrPde+DIQhRhGh
	UrVLhkNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsK0O-000000027pM-1b0k
	for ath12k@archiver.kernel.org;
	Thu, 04 Apr 2024 10:07:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsK0K-000000027on-3xfV
	for ath12k@lists.infradead.org;
	Thu, 04 Apr 2024 10:07:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0E648CE307D;
	Thu,  4 Apr 2024 10:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FF2C433C7;
	Thu,  4 Apr 2024 10:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712225250;
	bh=XEgOJFtAd5hyX1dGEovuhPvmsdKiprDvZmqlS9wDNQI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=c9u4v2oKow1m8FOfV3+vm3m7neKDXSA93hj7pjGlY9T+UdS86Z4SH/OKmaN+1hHx8
	 rBF3gLqFhx4bshxkzVlJqAnpabSIhWogMGI90Idv1X3CZ+FeHko2531gK/YArNXhoJ
	 RQr6Y4CcmkHR0nyj7XS9trmAFyg3lFwb+fW7AGZu8BvwFAwJlgqoe3G78lmu601eVk
	 YYJtTA2xG24N2rHtQPQ+QjdgjlckenswgCHshFSSwZoiEoOtzUGQYldZ55WwW/kMXV
	 SCi09j0deiZkFaOpaIwbsu+q/nPeA3M49rQIsOpaT5mehZcK+Km2eE685Y5zvIvShm
	 3Q/xS0+N5ZaZw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] wifi: ath12k: Add initial debugfs support in ath12k
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240320171305.655288-2-quic_rgnanase@quicinc.com>
References: <20240320171305.655288-2-quic_rgnanase@quicinc.com>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>,
 Ramya Gnanasekar <quic_rgnanase@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171222524717.1806092.5883238198294792890.kvalo@kernel.org>
Date: Thu,  4 Apr 2024 10:07:29 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_030733_258214_9C710F20 
X-CRM114-Status: UNSURE (   6.78  )
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

Ramya Gnanasekar <quic_rgnanase@quicinc.com> wrote:

> The initial debugfs infra bringup in ath12k driver and create the ath12k debugfs
> and soc-specific directories in /sys/kernel/debug/
> 
> For each ath12k device, directory will be created in <bus>-<devname>
> schema under ath12k root directory.
> 
> Example with one ath12k device:
> /sys/kernel/debug/ath12k/pci-0000:06:00.0
> 
> ath12k
> `-- pci-0000:06:00.0
>     |-- mac0
> 
> To enable ath12k debugfs support (CONFIG_ATH12K_DEBUGFS=y)
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

f8bde02a26b9 wifi: ath12k: initial debugfs support
f51d917b7330 wifi: ath12k: debugfs: radar simulation support

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240320171305.655288-2-quic_rgnanase@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


