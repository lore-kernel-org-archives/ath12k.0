Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89508C433FE
	for <ath12k@archiver.kernel.org>; Mon, 28 Nov 2022 14:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dvVEA4VW5DC5B0kXLGI0s+vWjSioK5RQ94KfahVxVmw=; b=JLHVjEdViNWIFc
	dsck3XK0fFDNhgzOprhLONueMM9dBuZs61hqyZlx4l9zPu6Qo1Qp5nO+TE24fTIl6Ctz3gtzW/0+a
	D1ThOAI8qL6Fn6Cshw2+H+bz7TfWUMzAmRUwXQgYMGIpyp1MNZsL+enZPD5iW8c7XPjJYru9nZyHW
	znwUgcBzlVtuWrumB8baOTFMuHWl9nM4msqqBX5szFMCndySx6NYHmuNXzo0156vHox+mtvabvUHS
	VmadZBrj69RJLUJbmAa20o8l0S7wVXKorR3l8VkVHpSKzZgFBiQDPye1OZA6L+LrPTL1PXr0J7mAq
	AJwk4lWRYeIgyMBoi+Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozfYW-002Mo8-0g
	for ath12k@archiver.kernel.org; Mon, 28 Nov 2022 14:56:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozfYT-002MnA-Rb
	for ath12k@lists.infradead.org; Mon, 28 Nov 2022 14:56:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 59332611F8
	for <ath12k@lists.infradead.org>; Mon, 28 Nov 2022 14:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31415C433C1;
	Mon, 28 Nov 2022 14:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669647380;
	bh=aat0ISTc8H75TcGqw7ZrDDhs3u11WJYKdL8R2eM6hvc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=SUhiHQvPemU/u1sPz11mDd+CDVOLH8UkBSK0YUmQsmjUiV/+zlJCwAqI32gDNONDI
	 GLHSr8htMhpDLxb/Aoxmewjl9bESRP/KC4/w4Ol1Am5TPZjXBMqn0IAJ9d2hajSnhO
	 I3fJFcabsmssTA+HTCBil2LUM2GznDyfx0uV3zjGKgNqYuhJh4sr49HEwP4Rv3fk7j
	 8iYO57gvfdh7wC0EwSYB43FossKG+evWHq3PwVSsErt7jAZ2cfG00MicIVJVHAjUYv
	 ZTWT/sNdhddIGoTWyuNXndRXfeyFbtAIvUUnv5Zuwh6QIuT7WWw/IFEcDdelA+RRW7
	 Zc0pTrMzNZhCw==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: Re: [PATCH v2 00/50] wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices
References: <20221116163902.24996-1-kvalo@kernel.org>
Date: Mon, 28 Nov 2022 16:56:16 +0200
In-Reply-To: <20221116163902.24996-1-kvalo@kernel.org> (Kalle Valo's message
	of "Wed, 16 Nov 2022 18:38:12 +0200")
Message-ID: <878rjv5drj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_065621_956938_8B39D6F4 
X-CRM114-Status: GOOD (  19.92  )
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

Kalle Valo <kvalo@kernel.org> writes:

> From: Kalle Valo <quic_kvalo@quicinc.com>
>
> ath12k is a new mac80211 driver for Qualcomm Wi-Fi 7 devices, first
> supporting QCN9274 and WCN7850 PCI devices.  QCN9274 supports both AP
> and station; WCN7850 supports only station mode. Monitor mode is not
> (yet) supported. Only PCI bus devices are supported.
>
> ath12k is forked from an earlier version of ath11k. It was simpler to
> have a "clean start" for the new generation and not try to share the
> code with ath11k. This makes maintenance easier and avoids major
> changes in ath11k, which would have significantly increased the risk
> of regressions in existing setups.
>
> ath12k uses le32 and cpu_to_le32() macros to handle endian
> conversions, instead of using the firmware byte swap feature utilized
> by ath11k. There is only one kernel module, named ath12k.ko.
>
> Currently ath12k only supports HE mode (IEEE 802.11ax) or older, but
> work is ongoing to add EHT mode (IEEE 802.11be) support.
>
> The size of the driver is ~41 kLOC and 45 files. To make the review
> easier, this initial version of ath12k does not support Device Tree,
> debugfs or any other extra features. Those will be added later, after
> ath12k is accepted to upstream.
>
> The driver is build tested by Intel's kernel test robot with both GCC
> and Clang. Sparse reports no warnings. The driver is mostly free of
> checkpatch warnings, albeit few of the warnings are omitted on
> purpose, list of them here:
>
> https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath12k/ath12k-check#L52
>
> The driver has had multiple authors who are listed in alphabetical
> order below.
>
> Co-developed-by: Balamurugan S <quic_bselvara@quicinc.com>
> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
> Co-developed-by: Balamurugan Selvarajan <quic_bselvara@quicinc.com>
> Signed-off-by: Balamurugan Selvarajan <quic_bselvara@quicinc.com>

I noticed that Balamurugan is twice here, fixed in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=master-pending&id=b644733d58cb65d2e319bad0e0f89a852021c5c2

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
