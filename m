Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E3FE732E0
	for <ath12k@archiver.kernel.org>; Thu, 28 Sep 2023 15:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pcHMSMXOs1ijflQUApPVOWAMFY0NJZXB/WhrIWYD9Cc=; b=2FMgEusz+3AhW6
	gnwDl2hhY9A3cQXcSrRm+eE3wl9GtpZl3ic62ts0Zz4TzqEcQr+hl9YL4e4sydrmqWAAu94+ZSH3a
	LwiIBEVHTHXlUX+kLMqHknWFaHTbfDqzmVJzwFQPkXEFUhHOEh1+T6bV0jaHJfZwK/9COlfAsx7I2
	7N05l6NReoS7OmZm5aILgkJutNvLUHqm98wIfzIWt/SYCAFLcttoohTTFDotMbHqXMmwAUp0p4c4E
	9vk7ar5RsFc+Q4wN67eIIUn6kyQqkNaGhmzVuEFLnasLA+BcawaTdBTJyUrWcqQFM7i0klCcQ+nPl
	Q2BMpWgbAoy/ENdHbjbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsXV-005Bcp-2t
	for ath12k@archiver.kernel.org;
	Thu, 28 Sep 2023 15:02:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsXS-005BZw-1N
	for ath12k@lists.infradead.org;
	Thu, 28 Sep 2023 15:02:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A2BC1B81CC1;
	Thu, 28 Sep 2023 15:02:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16123C433C7;
	Thu, 28 Sep 2023 15:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695913368;
	bh=tsaHVP2mx7ljQj4gqbh8HSWkgBxSGcfcQehBDZTlBcY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=LykRHUy0u0cVgoS6993uSGpPsRukfCzMfffkSXgrHN1fnV57PE3PwypUy4B60tL7Q
	 KxLCUTNbO8ugzwI42HBXiJI8tDYrCZKYeWxTWNfzK6v6bKRWtKt5cHhjYgU26hd/Dn
	 1xzYEGN7+MpNYZJkw11fbg2DFMwQbKnU5oQF7EfIpT79OtnAavaJI5+VqPHz1/YuwS
	 +cQF50UrENEgAFang6JAqgiHsufWmUI0dJy5xMvHq10orEBApUcuskJeUDbgn5CScS
	 UixESlDAxNx75cj7VwIpLPyWOzDj0Y+kShJUD4cAl6yaMN+a4uzzw5bbB2GOoOB7MD
	 kOEdzn92TOB9Q==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: indicate to mac80211 scan complete with
 aborted
 flag for ATH12K_SCAN_STARTING state
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230905105947.10369-1-quic_wgong@quicinc.com>
References: <20230905105947.10369-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169591336483.3019228.4801533515401885948.kvalo@kernel.org>
Date: Thu, 28 Sep 2023 15:02:46 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_080250_635188_6F7AFAA1 
X-CRM114-Status: GOOD (  11.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Wen Gong <quic_wgong@quicinc.com> wrote:

> Scan failure can not be recovered from when running a loop of the
> following steps:
> 1. run scan: "iw wlan scan".
> 2. run command: echo assert > /sys/kernel/debug/ath12k/wcn7850\ hw2.0/simulate_fw_crash
>    immediately after step 1.
> 
> result:
> scan failed and can not recover even when wlan recovery succeeds:
> command failed: Device or resource busy (-16)
> 
> reason:
> When scan arrives, WMI_START_SCAN_CMDID is sent to the firmware and
> function ath12k_mac_op_hw_scan() returns, then simulate_fw_crash arrives
> and the scan started event does not arrive, and then it starts to do
> recovery of wlan. __ath12k_mac_scan_finish() which is called from
> ath12k_core_halt() is one step of recovery, it will not call
> ieee80211_scan_completed() by logic currently because the scan state is
> ATH12K_SCAN_STARTING. Thus it leads the scan not being completed in
> mac80211, and leads all consecutive scans failing with -EBUSY in
> nl80211_trigger_scan even after wlan recovery success.
> 
> Indicate scan complete with aborted flag to mac80211 for
> ATH12K_SCAN_STARTING to allow recovery from scan failed with "Device or
> resource busy (-16)" after wlan recovery.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

c2ebb1d11ab9 wifi: ath12k: indicate to mac80211 scan complete with aborted flag for ATH12K_SCAN_STARTING state

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230905105947.10369-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
