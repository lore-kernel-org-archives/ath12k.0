Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44224CD128A
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 14:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIYPcSgtUQ6QliWWHXaKBCBiIor0pBV4N/9HnyJsdrE=; b=O1M+GQbNNCLXjGQBakxcSplEEk
	EPc2MWKIN5+YJ5JFi6EuJWs27zwciAUnnlqDN130BbPTAlyG84RJtSWAPevOA3T6HKvAnOti0UdlE
	f3ctvmRn4i+M4AlVw2q97oGYT/O06zXD/PTVMvo01J++2NyjNB6yuzMvIHf9mQt2AB+PgztT89TC3
	v06bG+ptdllxpEuf6bFhaIRLRBAFt0LZCp2Q5bYOlpgSnQLnWVxeYJnMDETwt4LFtwtMJ9cGsKl8Y
	A+Oj3uI8kfvawOroAm+v7dGlZdvOqP/STgcN2k5leqXsKWUtiLoiNvKI/JBM3Ey/4H4o3VlNMR5VH
	OVYsA8zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYgy-00000007PNv-45V8
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 14:12:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYgv-00000007PMt-3TUc
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 14:12:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B27CC61B20;
	Wed, 10 Apr 2024 14:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BD7C433F1;
	Wed, 10 Apr 2024 14:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712758364;
	bh=BXGtyS18Uukci2HwGWwcuVTHGU7yyftxekIlybw6Ye4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=VmFto3zeOwuxZuydrRcp2fu8oQE+TptliJRsvi5nvtmbUhfLMakxSXSvBVUOoZVy1
	 P8w4VSwJ573NYEcxtC6T4Jt0wjAJuW+B7l2CmxXSvJD7C1iHCMvInUH09RMCkCZADv
	 u05yWuTo/dy+R3CvLbTK2/vvq7L44gSOJHNbX0xOlraR/2ZPiVGncM0mTvrHJC9ieu
	 7syxEK48KnmDRMlPAWTK+feYH5CX/hqYXYpodnUJWDaiBg29fA3InyLmVbTaVF0cOi
	 HQu2x313+PWhSH/UqdUX8olhO865GEL7GnK51hy6jwukUPCCAmJS18tQbddGzDxOqW
	 eeGbnyRIOUyCA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 01/12] wifi: ath12k: add multiple radio support in a
 single
 MAC HW un/register
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240405194519.1337906-2-quic_ramess@quicinc.com>
References: <20240405194519.1337906-2-quic_ramess@quicinc.com>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>, Sriram R <quic_srirrama@quicinc.com>,
 Rameshkumar Sundaram <quic_ramess@quicinc.com>, Jeff Johnson
	<quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171275836091.3687247.13367447879167874394.kvalo@kernel.org>
Date: Wed, 10 Apr 2024 14:12:42 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_071245_991139_C831FD6C 
X-CRM114-Status: UNSURE (   7.22  )
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

Rameshkumar Sundaram <quic_ramess@quicinc.com> wrote:

> Currently MAC HW un/register helper function support the single radio.
> To enable single/multi link operation in the future, the following helper
> functions need to be refactored to accommodate multiple radios under a
> single MAC HW un/register:
> 
>         * ath12k_ah_to_ar()
>         * ath12k_mac_hw_allocate()
>         * ath12k_mac_hw_register()
>         * ath12k_mac_hw_unregister()
> 
> This refactoring will make it easier to scale these functionalities and
> support Multi link operation.
> 
>                          Current Multi wiphy Model
> 
>  +---------------+          +---------------+            +---------------+
>  |  Mac80211 hw  |          | Mac80211 hw   |            | Mac80211 hw   |
>  |  private data |          | private data  |            | private data  |
>  |               |          |               |            |               |
>  |ath12k_hw (ah) |          |ath12k_hw (ah) |            |ath12k_hw (ah) |
>  |               |          |               |            |               |
>  | +-----------+ |          | +-----------+ |            | +-----------+ |
>  | | ar (2GHz) | |          | | ar (5GHz) | |            | | ar (6GHz) | |
>  | +-----------+ |          | +-----------+ |            | +-----------+ |
>  |               |          |               |            |               |
>  +---------------+          +---------------+            +---------------+
> 
>                            Single wiphy Model
> 
>                             +--------------+
>                             | Mac80211 hw  |
>                             | private data |
>                             |              |
>                             |ath12k hw (ah)|
>                             | +----------+ |
>                             | |ar (2GHz) | |
>                             | +----------+ |
>                             | |ar (5GHz) | |
>                             | +----------+ |
>                             | |ar (6GHz) | |
>                             | +----------+ |
>                             +--------------+
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

12 patches applied to ath-next branch of ath.git, thanks.

ba12f08f3167 wifi: ath12k: add multiple radio support in a single MAC HW un/register
d01c08ed6fdb wifi: ath12k: Modify add and remove chanctx ops for single wiphy support
b8ce837ea264 wifi: ath12k: modify ath12k mac start/stop ops for single wiphy
314876885bdc wifi: ath12k: vdev statemachine changes for single wiphy
0d6e6736ed9f wifi: ath12k: scan statemachine changes for single wiphy
0148e40c9f0a wifi: ath12k: fetch correct radio based on vdev status
b5068bc9180d wifi: ath12k: Cache vdev configs before vdev create
cec77a252407 wifi: ath12k: Add additional checks for vif and sta iterators
0da00e45ee9a wifi: ath12k: modify regulatory support for single wiphy architecture
5a6af83c397d wifi: ath12k: Modify set and get antenna mac ops for single wiphy
d258f16ba10f wifi: ath12k: Modify rts threshold mac op for single wiphy
4f242b1d6996 wifi: ath12k: support get_survey mac op for single wiphy

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240405194519.1337906-2-quic_ramess@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


