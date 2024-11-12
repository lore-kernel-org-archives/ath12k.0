Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F27D32D84
	for <ath12k@archiver.kernel.org>; Tue, 12 Nov 2024 10:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dsg3F7lAKgErzC7rkraaVS7Mj7ehm8V/giimuWRYHg=; b=p/RX9Nld0e4kDpfSUZz5pWjv5m
	DfZMjqVeV+NHV5D+fDQ0Wqy/Ys2ekOXZUcS+jXwp1r0pzt3MuzCEJiSLdhDsiOrS9CMYUuhg4sShw
	1tloLCxXaeJAQxdVRTnJixektRsdWwVWHQ9O4pJ9Q9D50hLBlKL9ix8coWuGkoHTy7KhXzRxOGcak
	eY1ei0IJ08jIMcmCGP7cznsc/hVZfIRmEjVFclErf9nfNFM2pMqnASgT5j5jJXQdPdRU11WYv82RK
	CTa0HqZiKcbFhFyZ6RxRqHt21gzEGOnv3MFxJqaNCPOHPqh0SP6VMcyBDZUa7N1nqSRY0MhCXq16b
	mXR4WE3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAo4F-00000003206-2BSz
	for ath12k@archiver.kernel.org;
	Tue, 12 Nov 2024 10:24:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnsv-00000002zQb-2O6j
	for ath12k@lists.infradead.org;
	Tue, 12 Nov 2024 10:12:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F33E0A418AD;
	Tue, 12 Nov 2024 10:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C4BC4CED4;
	Tue, 12 Nov 2024 10:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731406352;
	bh=Fd1Ey/xvSs8MLl8eDHlLf2EcdKORJxcgeuDQKWpdshs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KLyO475+MkOHS+QlXJIWcWJpS4vYGlVV8YgR7JhXtnDzGDVBpfNj/irerqLU9RCEz
	 AvJBvQNOBhwotDtAgqCURQaEL14o9Q6aFAOzO8ss+u8Lf7n4UFjnyAXaWy3noCp+HV
	 +nQ7piFPsmtzCwAOSP5EqmOwCmqgwSAipfo3StVUYfzvcrNMRHF/v1ffPPmB5nUrsv
	 oxvpt8rDWFHTxEXz/dfJCQ6GGvr5mrLNEXW9Ia5HBWFuZCKxKUO9B91Dew4sVwWRcU
	 XNaAyw49DXhnkUtskuZ3jaakFlK+ZBLmE5TNc4jGrNYh5vMqdYSp8xeV2xyFYeYCYe
	 a5EvT/KUQzlzQ==
From: Kalle Valo <kvalo@kernel.org>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  Sidhanta Sahu <quic_sidhanta@quicinc.com>
Subject: Re: [PATCH v2] wifi: ath12k: Support MBSSID Control Frame Stats
References: <20241105052854.2118987-1-quic_rdevanat@quicinc.com>
Date: Tue, 12 Nov 2024 12:12:29 +0200
In-Reply-To: <20241105052854.2118987-1-quic_rdevanat@quicinc.com> (Roopni
	Devanathan's message of "Tue, 5 Nov 2024 10:58:54 +0530")
Message-ID: <87jzd8wyk2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_021233_712836_45331804 
X-CRM114-Status: UNSURE (   7.98  )
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

Roopni Devanathan <quic_rdevanat@quicinc.com> writes:

> From: Sidhanta Sahu <quic_sidhanta@quicinc.com>
>
> Add support to request MBSSID control frame stats from firmware
> through HTT stats type 54. These stats give information such as
> basic trigger, BSR trigger, multi-user RTS and uplink MUMIMO
> trigger within and across various BSS.
>
> Note: WCN7850 firmware version -
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4 does not
> support HTT stats type 54.
>
> Sample output:
> -------------
> echo 54 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_MBSSID_CTRL_FRAME_STATS_TLV:
> mac_id = 0
> basic_trigger_across_bss = 0
> basic_trigger_within_bss = 0
> bsr_trigger_across_bss = 0
> bsr_trigger_within_bss = 0
> mu_rts_across_bss = 0
> mu_rts_within_bss = 0
> ul_mumimo_trigger_across_bss = 0
> ul_mumimo_trigger_within_bss = 0
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Sidhanta Sahu <quic_sidhanta@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

