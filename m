Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B904C27C65
	for <ath12k@archiver.kernel.org>; Tue, 11 Jun 2024 18:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoLlotROdfdlIZaVb2fp3dw31KVhEvswyUKy1Lc2fYo=; b=DJQHJQ4xJvLcklh6MufG/7tb3x
	hQW1s2eUTzS73t85LN7SfE6gnzKVTES63pFdSwTnhr7vq45JPQ1OUhBL9+6j5jl6jvHbisvUtuiNc
	c/nHcu4dHqFOis5U9y+dins9R1w8xtB7/m1V8y+TM2+7gSkDIVOOtHh//C6Py1b4PjjSphiJC3yIV
	n5A2EvsIBPgm8v13PCaZjEbuibZ4XMznSLAdQtwFEFGJ8vO2nxYVXjGujKx50VphJxV+iM5iZ0dj0
	k+7XTURS7tVsHGAquUaq1qtCJJVPkMHgFbByRgspU0ImFLZXssys6p1gSHZTiBrr8yYPzqy9W0bCF
	s1Vhshzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH6L2-00000009rt1-3UZO
	for ath12k@archiver.kernel.org;
	Tue, 11 Jun 2024 18:35:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH6Kz-00000009rsf-3hHn
	for ath12k@lists.infradead.org;
	Tue, 11 Jun 2024 18:35:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 63A3C6113A;
	Tue, 11 Jun 2024 18:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A802C2BD10;
	Tue, 11 Jun 2024 18:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718130916;
	bh=Zpmd3ygmkPqb6iypRmQIwESFV41GHfX32oSI6YK1PGw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=NMN71+0ep7LW/AWi35zkUMmFEEzx7c23IIfKvJfUa1Qwb20YBPuc/VDIRIZX68JQ5
	 AOcbUppH/HPvsSxrMBrViks4wOy00n4QgU1TmvSfz+iCCzbyhLi7Ca+CsLdbmHN8Fo
	 6K+vq+hVpz6wVyiisiv9Tl5fN0Aep5WrIjI/xPpu5DuYbckPAfjlfLviaxD1f5f2Ur
	 PF2NB/8WjQgBRvoIjX8L35hpGQNEuqT/GCnLdi2pLJwA/6LDwv6kaenxDAkJnnDann
	 2cJQMWmMro9fUXDkg8PnHoBn+1wa6+ZRBGILejJPyXQObbWc+3xudsIKg+9OcVqY0c
	 XnKKOlfhqrNOg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: modify remain on channel for single wiphy
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240528082739.1226758-1-quic_ramess@quicinc.com>
References: <20240528082739.1226758-1-quic_ramess@quicinc.com>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171813091314.3564613.4590047167429779934.kvalo@kernel.org>
Date: Tue, 11 Jun 2024 18:35:14 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_113518_025403_E4FF75B2 
X-CRM114-Status: GOOD (  11.33  )
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

> When multiple radios are advertised as a single wiphy which supports various
> bands, vdev creation for the vif is deferred until channel is assigned to it.
> If a remain on channel (RoC) request is received from mac80211, select the
> corresponding radio (ar) based on channel and create a vdev on that radio to
> initiate an RoC scan.
> 
> Note that on RoC completion this vdev is not deleted. If a new RoC/hw scan
> request is seen on that same vif for a different band the vdev will be deleted
> and created on the new radio supporting the request.
> 
> Also if the RoC scan is requested when the vdev is in started state, no
> switching to new radio is allowed and RoC request can be accepted only on
> channels within same radio.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

4938ba733ee2 wifi: ath12k: modify remain on channel for single wiphy

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240528082739.1226758-1-quic_ramess@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


