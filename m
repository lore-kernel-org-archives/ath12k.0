Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4515C10F1A
	for <ath12k@archiver.kernel.org>; Tue,  7 May 2024 10:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+/lzQ5xjbrY+Qct6kpVDubYK4qp4fCp9brJcTp0q13k=; b=PwBJFxcVzoQmTX6EfHdPfq/WG4
	yGK/RhOj5WFcp5lvz6qOXvp3CSKnldNI28JDWtmKCcvBfnCyDDjzxu0TtkayUDIyI+D1av+zavKgJ
	oW6hWjDDgXFOVtveFd44CtLYolpwLWmTn2AaxVhs9szD++B/1DYqNms/0OQEu27WHuMokDewwfpL0
	w4qifsv9uEiyeFPOdLJhqwi5Hlro6P8RFOkYq/3pgnW1NRDPtBdBLQ469eNZsmREobLEqBJPfA4RE
	oNgUXSfh1UJU3yVHKEMdSzjRAMaPJPnhwhpfsngJu0pOmciwiG98SvCvt5Go+l3R6jlSRkFLN7sJJ
	lj8qwTOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Hl3-0000000ATiF-1sp4
	for ath12k@archiver.kernel.org;
	Tue, 07 May 2024 10:09:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Hl1-0000000AThi-1V6t
	for ath12k@lists.infradead.org;
	Tue, 07 May 2024 10:09:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 47B9D615FC;
	Tue,  7 May 2024 10:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04EEAC2BBFC;
	Tue,  7 May 2024 10:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715076550;
	bh=aC/zygQxaj+/h1z25yU/geEqMlaXbhAYUmrWO2nrIiA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=nbHWZ9cm9+ihq0txoM6ak5wOQexjTxsNnyZ44SRH7cWB3IOyADyVaFEWydXIF8ID4
	 EPt1IOZY4EIoMWuzGn9WI9nocLKbHsS48OZMG8LIfi4YuZnifAFzsTSW0uVddxiy5E
	 viMneV3yaZ2RKmpFcwo4kQp0Cqc2vBHB8cId9ip2ruPBCbtfRod7J4Ayxp8YH06b7O
	 uqID0x52ryBRMEicbLCARLUBS5j7LOWckVRSn+XqBNMFzmp4HrHBofeWgDodcVFasL
	 KOm1XYaiE93ujPoNcFbmD8mvER0sEVoN2PPKdHzPsAVRIev0PT+XcDh4CBXe6/ybJR
	 nKqr7FUwOmccQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCHv4 1/3] wifi: ath12k: fix calling correct function for rx
 monitor mode
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240430091414.2486196-2-quic_tamizhr@quicinc.com>
References: <20240430091414.2486196-2-quic_tamizhr@quicinc.com>
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Tamizh Chelvam Raja
	<quic_tamizhr@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171507654698.3827098.4687810601192996986.kvalo@kernel.org>
Date: Tue,  7 May 2024 10:09:08 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_030911_483600_AD47BFC8 
X-CRM114-Status: UNSURE (   5.31  )
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

Tamizh Chelvam Raja <quic_tamizhr@quicinc.com> wrote:

> Currently in ath12k_dp_tx_htt_monitor_mode_ring_config()
> ath12k_dp_tx_htt_tx_monitor_mode_ring_config() function wrongly called twice.
> Fix that by calling ath12k_dp_tx_htt_rx_monitor_mode_ring_config().
> 
> Currently monitor mode is disabled in driver so the change is compile
> tested and boot sequence verified.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

9f74e7b306dc wifi: ath12k: fix calling correct function for rx monitor mode
ed07ff674509 wifi: ath12k: Remove unsupported tx monitor handling
582e94ebe230 wifi: ath12k: Remove unused tcl_*_ring configuration

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240430091414.2486196-2-quic_tamizhr@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


