Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5D1C4345F
	for <ath12k@archiver.kernel.org>; Thu,  2 May 2024 10:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SkXpY4A0t0K/IdmfsoA3rc3ydfEz4HjqgcCMAHrsi7Y=; b=el6iS+jfdgilKughfzYgFyNhVn
	iV+ED/vLvCUV8SSpwcYTXMohpCSRAzmhV7mnF63NIYrVE5nJZgDPOrbeTeNtiUtyrCU+D/BVQPzg6
	hDPcwCD8Meg8teWabaCVZ2z8CuvNRmgiBxgCuDjfRncHGqvJa8XqmaQopxav6E4GvOxB4uRr86uoj
	+FgN54F4yP6q98sHFQiM90vmuDhsZjYSAn2iMbypxe8nWx8TW71Ju0FKHyHBg29uwssjWboxKWmsQ
	Tt5M8LHz0vL2Vw+x6lkDgtjUODLZBHbuy1ZBXMCJjDsSy+iSrePn9hhhnep9BfkHMVEkaX0rmluDC
	DDP5e4Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2TUk-0000000CIkA-26WI
	for ath12k@archiver.kernel.org;
	Thu, 02 May 2024 10:16:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2TUh-0000000CIjk-06TY
	for ath12k@lists.infradead.org;
	Thu, 02 May 2024 10:16:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0C771CE12F2;
	Thu,  2 May 2024 10:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165C7C113CC;
	Thu,  2 May 2024 10:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714645007;
	bh=RC+YsNvF5u9BaYOcoKiAusrWX9nqtl9ZOmyWCsuEoj4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=kHR5z81P7ZS/PzfaXM6qZwUMqD7IbD6nBK7h8WN2EHZTglsXeyG/wEo7Q+22V/Lxz
	 bMs68s3kDk/jNVWWVZ7GQOYRTInuKIxSx+AY/qfvparJls4FTZho4I+u80V0ipOWG3
	 xj5nT7nwwUDKCibQos9NXyM+OZRU/GYQusQMEeb6Zws0a+0d5EUqqamwllgD6MJN9O
	 jukiIl7hTKgQJnlFDs8tgCy3fEXgZCF60IfKJvdAC4SYcvn0BaLX0092FO1rE+FCAT
	 7pqhPGRT9fc9POf6FTneRO3BqgE49OEXcYcJG+tBXLmpDNdBw2CTMfX1QF8eJHyu3w
	 y/voEH4VqyJHQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] wifi: ath12k: fix the problem that down grade phy mode
 operation
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240425083837.5340-1-quic_lingbok@quicinc.com>
References: <20240425083837.5340-1-quic_lingbok@quicinc.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_lingbok@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171464500387.548512.12268613053950785024.kvalo@kernel.org>
Date: Thu,  2 May 2024 10:16:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_031651_449755_F8E28E22 
X-CRM114-Status: GOOD (  14.00  )
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

Lingbo Kong <quic_lingbok@quicinc.com> wrote:

> Currently, when using WCN7850 or QCN9274 as AP, ath12k always performs down
> grade phy mode operation regardless of whether the firmware supports EHT
> capability or not and then vdev will start in HE mode. When stations that
> support EHT capability try to connect to the AP, the AP will set phy mode
> to EHT after receiving the association request packet, and then send
> WMI_PEER_ASSOC_CMDID command to firmware, AP’s firmware will crash.
> 
> This is because when the ath12k_mac_copy_sband_iftype_data() function
> handles EHT capability, it does not copy the EHT capability into the
> iftype[band][type] array according to the interface type. So, interface
> type should not be used as an index to get eht_cap in
> ath12k_mac_check_down_grade_phy_mode() function.
> 
> To address this issue, use types_mask to select the eht_cap in
> ath12k_mac_check_down_grade_phy_mode() function.
> 
> This patch affects QCN9274 and WCN7850 because they have the same issue.
> 
> Hostapd log:
> wlo1: STA 02:03:7f:37:12:34 IEEE 802.11: Could not set STA to kernel driver
> 
> Kernel log:
> [270894.816076] ath12k_pci 0000:03:00.0: failed to send WMI_PEER_SET_PARAM cmd
> [270894.816111] ath12k_pci 0000:03:00.0: failed to setup peer SMPS for vdev 0: -108
> [270894.816122] ath12k_pci 0000:03:00.0: Failed to associate station: 02:03:7f:37:12:34
> [270894.843389] ieee80211 phy5: Hardware restart was requested
> [270894.843517] ath12k_pci 0000:03:00.0: failed to lookup peer 02:03:7f:37:12:34 on vdev 0
> [270894.843616] ath12k_pci 0000:03:00.0: failed to send WMI_PEER_DELETE cmd
> [270894.843650] ath12k_pci 0000:03:00.0: failed to delete peer vdev_id 0 addr 02:03:7f:37:12:34 ret -108
> [270894.843663] ath12k_pci 0000:03:00.0: Failed to delete peer: 02:03:7f:37:12:34 for VDEV: 0
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

bf76b144fe53 wifi: ath12k: fix the problem that down grade phy mode operation

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240425083837.5340-1-quic_lingbok@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


