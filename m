Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D47E77184
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 11:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jc0jMd2NGM/o0BZ2WYWiNPMafAcyqH57L8QlBeOZSyo=; b=tXt7o0JMt9v8bquyYDiQJafCLY
	IpECfzFDIQLinqdB5hzKWqJ8LX4QgAJY/XfQcvm4XASm9bN2rwqs3uf+x7wIPi6EP+CSJWDDZv8s0
	88eLlp+5eii7H/7qBBx0FDH/uwouAydliBuvoNMno42Js6jPIRV+y5w0StmnLpDOS3rjhwWjAgUBP
	6zKnBgEkdPV2m5d+MetHFnDZtcEZbmANky0LAQCHFkDDHipozDIO6zD7Cul3+fNgt97e/nSnMjwxg
	yatuMbZsTXRWFFqwb9ncaH1IOAh0Wez92fhy1EsO3v8lwUbpMiFRbNbpR2R5/wvBxgkobUaMtSZQ4
	bYLQAVew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOExu-00000001hIi-01Kv
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 11:45:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOExr-00000001hIA-1ZCw
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 11:45:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0D667A420B7;
	Thu, 19 Dec 2024 11:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49EBEC4CECE;
	Thu, 19 Dec 2024 11:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734608710;
	bh=Fj25Garq+lXEMR3l0Ql+GQfTpwLe9QLa8x2yqoDpZQI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=DYjIJdQiO5reW5RZtQrLS3aWOyHWeNaq/KBIc/xWixszYIFp79yeX5KnAJ5V97Rwu
	 /k0cmHLXIt+T9NSwF3BjP2jqgclTYmK2bvE8A3z0tr2vhFZobIa9LUS1tnx3FpEsRY
	 WY/pQI4atGA4cGFUdk/S1w5uVDzNRn+Qhgera3Zt+CnV5xZjHEiLKyPpR9ImetvcVU
	 HdaupOlzms7u387e4ro5RBDAE4XVHO+FNIswk0lzi4a7fXyrI35bobkQ1mlV+lyoN1
	 6CEy/TfMX5yDVnCBZUO3donrYEQIjg9+UL7DwQJzj02GH0Es/MUaTnGvcvl0MWtFuM
	 +tmq367LOE6uA==
From: Kalle Valo <kvalo@kernel.org>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Dinesh
 Karthikeyan <quic_dinek@quicinc.com>
Subject: Re: [PATCH 2/6] wifi: ath12k: Support Latency Stats
References: <20241217095216.1543923-1-quic_rdevanat@quicinc.com>
	<20241217095216.1543923-3-quic_rdevanat@quicinc.com>
Date: Thu, 19 Dec 2024 13:45:07 +0200
In-Reply-To: <20241217095216.1543923-3-quic_rdevanat@quicinc.com> (Roopni
	Devanathan's message of "Tue, 17 Dec 2024 15:22:12 +0530")
Message-ID: <878qsbj3r0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_034511_483015_B69B496A 
X-CRM114-Status: UNSURE (   8.43  )
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
> Add support to request latency stats from firmware through HTT stats
> type 25. These stats give information about count of transmitted and
> received MAC Protocol Data Units(PDU) and Service Data Units(SDU)

I don't if this is a cultural difference (like adding two spaces after a
dot) but I'm used to having a space before open parenthesis.

> and other latency stats.
>
> Sample output:
> -------------
> echo 25 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_STATS_LATENCY_CTX_TLV:
> duration = 0
> tx_msdu_cnt = 0
> tx_mpdu_cnt = 0
> rx_msdu_cnt = 0
> rx_mpdu_cnt = 0
>
> HTT_STATS_LATENCY_PROF_TLV:
> Latency name = PROF_SCH_ENQ_TQM_CMDS
> count = 0
> minimum = 4294967295
> maximum = 0
> .....
>
> HTT_STATS_LATENCY_CNT_TLV:
> prof_enable_cnt = 39
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

