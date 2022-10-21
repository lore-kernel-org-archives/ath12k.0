Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F5AC4332F
	for <ath12k@archiver.kernel.org>; Fri, 21 Oct 2022 10:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7LHwN0qev42CS42Qqgbjai5xOAa9JvsroiWTyAr8y/M=; b=XKTosQjHvKg3RR
	NZssquiZXVL1oHjmXAlcJbptReouB1SR38radY3UTzcPOrFjsU49aU0IPO8PTMRMBVC9B6eeJelNg
	QwXd3PgcaONn2sALatnilyqcJeCUYZwf8TqOUHNf/tT6AXcpJnPhzMXcsB6ibTNEzl45Oxsw05bdq
	fX6na3qjeHjLLKbPzBl+CHcPY7WL4vOKgtAqVvMJKMIXnCQObtqMSu8KsmPCmfJOW1zbBtA5HwH9f
	prz87q1y+D3Nt0/K9/0GjP/FBptTB958FwdIZ/KLqwsqUgImz8+qi13CaGcVDXgXlt4Fx3Svl/L7n
	KAfG/rGpELtpFsNGYqeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpjm-007FXL-UC
	for ath12k@archiver.kernel.org; Fri, 21 Oct 2022 10:58:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpjj-007FWB-Ur
	for ath12k@lists.infradead.org; Fri, 21 Oct 2022 10:58:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9DF9BB829D9;
	Fri, 21 Oct 2022 10:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DBDCC433C1;
	Fri, 21 Oct 2022 10:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666349925;
	bh=70Ces4Q+pevX+GMvRqDBvO9S7E+kRyMBl08I5+iVKcg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OEG5U28Ao+OVH2adFKQt/1SfbDYWWAde72NaUijlNBj9aaM5F8LBErpesKdQtwz1F
	 1AQ/XHTmsyz8jJjjxgKDfT7nSS3sETMz47RkUwy342LAbdsJno2o14EGpvuXj4JV6e
	 6ru6QwYSsUIDjGOlSN/08Bv9UOTkSZh+UP8orB6EYxu2Pc0bFSg5jyCS5CTgTm/AUP
	 CGiuCO8YVvtAZgXWdSlfjs62+E+T+/M/B+KAM73HTY5YkQAwcMYUYfG9IvejI2Nkwh
	 RcTwgLmnKWxSZCJipQZwdlUs7rev3LrcHvdVap5L8ca2j2zqLwnD1K0OdkCBHN5N3X
	 Nnu0Q0RMr5+Eg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>,  <ath12k@lists.infradead.org>
Subject: Re: [PATCH 06/50] wifi: ath12k: add core.h
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-7-kvalo@kernel.org>
	<f0c1dad2-cb69-cc7e-5cc8-892b4a3fa9d9@quicinc.com>
Date: Fri, 21 Oct 2022 13:58:38 +0300
In-Reply-To: <f0c1dad2-cb69-cc7e-5cc8-892b4a3fa9d9@quicinc.com> (Jeff
	Johnson's message of "Fri, 12 Aug 2022 17:16:10 -0700")
Message-ID: <871qr1l9y9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_035848_145512_D5E6337D 
X-CRM114-Status: GOOD (  10.36  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

>> +struct ath12k_skb_cb {
>> +	dma_addr_t paddr;
>> +	u8 flags;
>> +	u32 cipher;
>> +	struct ath12k *ar;
>> +	struct ieee80211_vif *vif;
>> +	dma_addr_t paddr_ext_desc;
>> +} __packed;
>
> Usage of __packed seems incorrect since this is not an ABI buffer, and
> packing will potentially result in some members being unaligned
> (ath11k has struct ath11k_skb_cb packed as well).
>
> Suggest removing __packed and using pahole to find the ideal layout
> since the only concern is that this does not exceed
> IEEE80211_TX_INFO_DRIVER_DATA_SIZE

Praneesh fixed this in ath12k-bringup:

1a458fd07d47 ath12k: remove __packed from the ath12k_skb_cb struct

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
