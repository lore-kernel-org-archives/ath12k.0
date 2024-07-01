Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E118C2BD09
	for <ath12k@archiver.kernel.org>; Mon,  1 Jul 2024 18:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ehLNtmdeKFcS2ZqxWZOrd4AIWS0COQjIbt0BB8ovgs=; b=Vzk6vlUuAansrguwQY+zFdtOJr
	cIG0f0kitqDug/zpsld3lLV0GgIw1VZthwWrftH1NKGxf3Edd9jITrBeKnJ0QWKT0GR3kfNI7Knbm
	0E0SM2NBCNzQOASfdy/7MnRo5Uw9A9I7FZ7PcVep5W+R63z0560UDeBwC8IBklEAp+5aztfnWy8A9
	isbXomk86vpc9LAUdB70D22a63SvsIedakJsVL0eaSJs6e2IHA1T0GTqWzy/7GSZmLRdryApzKJct
	B+weDN2ya05DoWcvOyGMBfSvtVMxokWWwDIwtE9Vkk49OWK1rpQkRxQJqw5a9VlhpzdDrlVqIRSML
	rhLddRJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOME1-00000004Xuc-0Aeo
	for ath12k@archiver.kernel.org;
	Mon, 01 Jul 2024 18:58:05 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOMDy-00000004Xts-08Sx
	for ath12k@lists.infradead.org;
	Mon, 01 Jul 2024 18:58:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5E5BCCE1712;
	Mon,  1 Jul 2024 18:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88312C116B1;
	Mon,  1 Jul 2024 18:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719860279;
	bh=a2zWdi8FyBy3/Glv695kZ8tMOoCrLOOvh2aga+UWQS4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=IsXECD1/PMtH6/6yl+fAdoamM7GAgkd0uEgYOk2EJhp5IQbbo0LuYfEmrYJjil5Xk
	 FMrC0zTtl8xDmvtKpZCUN3vi5u1C1NckpGB8W5QdnEk4Rx1UXw9Gviw1ZDbbWyjDRH
	 x4KfScOf2Ow5CyM7pfPB2vcHyRcfPTWB0XUKrwSnRr+9WFMPJm7ovH9RW605imFCkS
	 Q73oZPX3JUPB+pnACW0XlwRu+3T/PKS5RSrUQsvsvEYozJUt7pj2bK36G9O7lOQt88
	 GQv/k/rqBdTiAWnd8vY66rUsn8c2O7GMN2NINCgjYM7kGlXizS9rHBc/HmNPjkAlfP
	 LZrM8citm3jqA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/3] wifi: ath12k: Support Transmit Scheduler stats
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240625042217.1303332-2-quic_rdevanat@quicinc.com>
References: <20240625042217.1303332-2-quic_rdevanat@quicinc.com>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Dinesh Karthikeyan
	<quic_dinek@quicinc.com>, Roopni Devanathan <quic_rdevanat@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171986027651.2958036.684437537530478512.kvalo@kernel.org>
Date: Mon,  1 Jul 2024 18:57:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_115802_450140_22460408 
X-CRM114-Status: UNSURE (   6.39  )
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

Roopni Devanathan <quic_rdevanat@quicinc.com> wrote:

> Add support to request transmission scheduler stats from firmware through
> HTT stats type 4. This stat gives information such as pdev stats
> scheduled per transmission queue, transmission queue command posted and
> reaped, scheduler order, scheduler ineligibility and supercycle triggers.
> 
> Sample output:
> -------------
> echo 4 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_STATS_TX_SCHED_CMN_TLV:
> mac_id = 0
> current_timestamp = 952546828
> 
> HTT_TX_PDEV_STATS_SCHED_PER_TXQ_TLV:
> mac_id = 0
> txq_id = 14
> sched_policy = 2
> .....
> 
> HTT_SCHED_TXQ_CMD_POSTED_TLV:
> sched_cmd_posted =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> 10:0, 11:0, 12:0
> 
> HTT_SCHED_TXQ_CMD_REAPED_TLV:
> sched_cmd_reaped =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> 10:0, 11:0, 12:0
> 
> HTT_SCHED_TXQ_SCHED_ORDER_SU_TLV:
> sched_order_su =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0,
> 11:0, 12:0, 13:0, 14:0, 15:0, 16:0, 17:0, 18:0, 19:0
> 
> HTT_SCHED_TXQ_SCHED_INELIGIBILITY:
> sched_ineligibility =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> 10:0, 11:0, 12:0, 13:0, 14:0, 15:0, 16:0, 17:0, 18:0, 19:0, 20:0, 21:0,
> 22:0, 23:0, 24:0, 25:0, 26:0, 27:0, 28:0, 29:0, 30:0, 31:0, 32:0, 33:0,
> 34:0, 35:0
> 
> HTT_SCHED_TXQ_SUPERCYCLE_TRIGGER:
> supercycle_triggers =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

4b6dfc758c2f wifi: ath12k: Support Transmit Scheduler stats
cf1187b3a683 wifi: ath12k: Support pdev error stats
5344fc76f894 wifi: ath12k: Support TQM stats

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240625042217.1303332-2-quic_rdevanat@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


