Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0758CEB64DB
	for <ath12k@archiver.kernel.org>; Thu, 15 Jun 2023 11:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FgXfrSoCO8Gtjap7VmpRajlm1YXuTwTG9r1gQajDJ9k=; b=a9HzUF7/a4xENz
	PZw6edU9AZZtH6XVuqb+HxTRTc9PDhWx176NxmVz+0PZjjIyYPD4CRXFZb7oa5VcIKBI04vtzvZTR
	CCRegesOq0Ia5O+L64zrWDjTk38hzMvB7jFhAo0EPMc+CRhYAPjvJfhuLiUV8JaSOPbgGSaIrDFio
	R9FA9M106YXk3aTQinh7ayiu/s8pJVBu/UyjuAySsehJhBtqMqfmWVDlA0hoFpcf0Hu1efymVrfBO
	nc31r/8EcF9dL3yuK/w3FXvz9tYhm6fmrlGCqe5/nMWpMRiXuRqXMYuNafewvv6MosnURMnmFjQzO
	SjIyHxscZSEAslqNUY0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9lW7-00EmS3-2C
	for ath12k@archiver.kernel.org;
	Thu, 15 Jun 2023 11:51:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9lW5-00EmRR-08
	for ath12k@lists.infradead.org;
	Thu, 15 Jun 2023 11:51:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3425A63AE6;
	Thu, 15 Jun 2023 11:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B263C433C8;
	Thu, 15 Jun 2023 11:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686829911;
	bh=gSsUQv6QcWREjEXlxHDwH17Cf4vOtWTj2MxWO/6SmwQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=tl7KXn3xsbb6LzemF/96AG3syv4nIR8y6armLhv/y+IKfLVBA3wn5qVlVd2OJYrw0
	 ahTVX8SWWPo440HQ2gFTSQQb0kehBX5oWkxN0+5BbtdvMJm5B+2UkCl2yXyDcGRoTH
	 NvrjgW2fyw5t+z93zMz1yfAPjSKRQjqdjlWviNisBxQEaaNa3sKv6xkY56k/UzLA93
	 dn3o+07BAvnZboks7HJctwF3mCjnxdNbURP2T+1aXSveVyVcMPpba1W7SbFO6U6/gH
	 8N37+crOjrXlytmtgPB9nR3v2XDnyheCgtuP22D8A6lQK5Mqbk+teWWUAeRMptBy+v
	 jMvH4tOLBVP+Q==
From: Kalle Valo <kvalo@kernel.org>
To: Aloka Dixit <quic_alokad@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Subject: Re: [PATCH v4 04/11] wifi: ath12k: propagate EHT capabilities to userspace
References: <20230602235820.23912-1-quic_alokad@quicinc.com>
	<20230602235820.23912-5-quic_alokad@quicinc.com>
Date: Thu, 15 Jun 2023 14:51:47 +0300
In-Reply-To: <20230602235820.23912-5-quic_alokad@quicinc.com> (Aloka Dixit's
	message of "Fri, 2 Jun 2023 16:58:13 -0700")
Message-ID: <87pm5xaqp8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_045153_142193_5F481331 
X-CRM114-Status: GOOD (  12.80  )
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

Aloka Dixit <quic_alokad@quicinc.com> writes:

> Propagate EHT capabilities to the userspace using a new member
> 'eht_cap' in structure ieee80211_sband_iftype_data.
>
> MCS-NSS capabilities are copied depending on the supported bandwidths
> for the given band.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
> Signed-off-by: Pradeep Kumar Chitrapu<quic_pradeepc@quicinc.com>

[...]

> +static void ath12k_mac_copy_eht_ppet_ru(u32 ppet, u8 ppe_thres[], int ru)
> +{
> +	int i;
> +	u32 val = 0;
> +	u8 ppet_size_ru = IEEE80211_EHT_PPE_THRES_INFO_PPET_SIZE * 2;
> +	u8 bit = IEEE80211_EHT_PPE_THRES_INFO_HEADER_SIZE;
> +
> +	u32p_replace_bits(&val, ppet >> (ru * ppet_size_ru),
> +			  GENMASK(ppet_size_ru - 1, 0));
> +
> +	val = ((val >> IEEE80211_EHT_PPE_THRES_INFO_PPET_SIZE) & GENMASK(2, 0)) |
> +	      ((val & GENMASK(2, 0)) << IEEE80211_EHT_PPE_THRES_INFO_PPET_SIZE);

This shifting of val looks weird. I didn't check the spec, what does it
do? Is there any cleaner way to do this? And should have a define for
GENMASK(2, 0)?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
