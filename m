Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DC1E77184
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 13:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yc4wRCYGPBPe/CiP/mUIwELCAKQzPAGl7VGDSgrKdJI=; b=3z43s8srX5OiQcj3d+Mq8niFrM
	K6hKGnofNieYuj37Kf5W/zWCoa23FcTqopw7bQoxiDUDVP3adrA8ClsW3zLOZntu/7dyGwXMBfx3k
	Bt51pjQUVuGv1k+I67bckazkvoVnJni0Ys7L/oAiRVJzkc7dNeq4k0fJZ/ZGnZPuftgXw9uaPZJ7U
	Z3rzAK3EArGLzwn4Ut3yWYkzWwXtqqunrs1W+IUvPNGYlf1+Mv4OUxWc7iSWD7kZAR3CGwqehc0Ko
	o5Uf9kY+XsIvEslD5ZXXklxRFG5UGFuxmprq8JsL2BYPyYWL8VTDkNc1Sp1+a4QD2mX6t9lbUUuzx
	5n+DgYsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGQc-00000001vFX-3FEI
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 13:18:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGQa-00000001vFA-1DrX
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 13:18:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9EB09A4254A;
	Thu, 19 Dec 2024 13:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD335C4CECE;
	Thu, 19 Dec 2024 13:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734614334;
	bh=9mvFxMcblzSvuF/BKCnA6aW0HtVE9ED6kWiGTSkVmEo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Ur8tGVKWsYsew9PyGu54EwdkgiKZR9b8rOcwVwlf9mDZKoF+mmFypwO9t5M8BN9pa
	 rEzr9QkHV/7dy0Skf17jfxWLaWsJUk7PdZJeZZ4ydlWpLh7apgYyiQLjh3H8D9r94o
	 uyqXpOZ4kTroGDdME3zJOLREwqaEzFbbYuIh5Swr5U19/DMCrlQ3P/dOUr5jPWdNnx
	 7kUeielzwxYm6JrytejDG06I3Cmqp8MWNasAuGa+8ZNjQsJRROc90M/AXghLBBgg3R
	 R52n16ka0m+F9pCrAzHgDg/71alrwDWRQ6zZGZklBsYhS8NIzVgc+NU7HHEiLcKVzO
	 svqol3rYifIzQ==
From: Kalle Valo <kvalo@kernel.org>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Dinesh
 Karthikeyan <quic_dinek@quicinc.com>
Subject: Re: [PATCH 5/6] wifi: ath12k: Support Uplink MUMIMO Trigger Stats
References: <20241217095216.1543923-1-quic_rdevanat@quicinc.com>
	<20241217095216.1543923-6-quic_rdevanat@quicinc.com>
Date: Thu, 19 Dec 2024 15:18:51 +0200
In-Reply-To: <20241217095216.1543923-6-quic_rdevanat@quicinc.com> (Roopni
	Devanathan's message of "Tue, 17 Dec 2024 15:22:15 +0530")
Message-ID: <87v7vfhkuc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_051856_401236_3DAF1810 
X-CRM114-Status: UNSURE (   7.82  )
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

> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
>
> Add support to request uplink MUMIMO trigger stats from firmware
> through HTT stats type 27. These stats give information about
> bandwidth, RSSI of signal received, dB mean of pilots received,
> etc., of all users.
>
> Note: MCC firmware version WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> does not support tags HTT_STATS_RX_PDEV_UL_TRIG_STATS_TAG(94) and
> HTT_STATS_RX_PDEV_UL_OFDMA_USER_STATS_TAG(95), currently.
>
> Sample output:
> -------------
> echo 27 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_RX_PDEV_UL_MUMIMO_TRIG_STATS_TLV:
> mac_id = 0
> rx_11ax_ul_mumimo = 0
> ul_mumimo_rx_mcs =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> ul_mumimo_rx_gi_0 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> ul_mumimo_rx_gi_1 =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> .....
> ul_mumimo_rx_nss =  1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0
> ul_mumimo_rx_bw =  0:0, 1:0, 2:0, 3:0
> half_ul_mumimo_rx_bw =  0:0, 1:0, 2:0, 3:0
> quarter_ul_mumimo_rx_bw =  0:0, 1:0, 2:0, 3:0
> ul_mumimo_rx_stbc = 0
> ul_mumimo_rx_ldpc = 0
> rx_ul_mumimo_rssi_in_dbm: chain0  =  0:6, 1:0, 2:0, 3:0
> rx_ul_mumimo_rssi_in_dbm: chain1  =  0:0, 1:0, 2:0, 3:0
> .....
> rx_ul_mumimo_target_rssi: user_0  =  0:-128, 1:-128, 2:-128, 3:-128
> rx_ul_mumimo_target_rssi: user_1  =  0:-128, 1:-128, 2:-128, 3:-128
> .....
> rx_ul_mumimo_fd_rssi: user_0  =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rx_ul_mumimo_fd_rssi: user_1  =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> .....
> rx_ulmumimo_pilot_evm_db_mean: user_0  =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> rx_ulmumimo_pilot_evm_db_mean: user_1  =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> .....
> ul_mumimo_basic_trigger_rx_qos_null_only = 0
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

