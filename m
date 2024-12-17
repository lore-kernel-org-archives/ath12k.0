Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0862E7717F
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 19:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaoKH3j6l3iqNbEl04V8vx3MaQhTRiAneia29VWIIho=; b=Pka4ju8ETWVhboOMwXReNDJh+x
	GsqiXBIy+s7ZcMH4d0Qqv82pvAgr6i3MwlakG7IxS6+0WMMUtqd6R5YPQwSG1HmR3In3mzrIljE3n
	U6OhuC3YDvIhjyzEE1QuTxfkZqfDMM7eVUfV1w7N2VPQv1gJgK6Whz0BK25NLUTOwjO76Ls7d00J0
	q9xjxGo982k2P3U8V+t9NO8fCwGYL/X2hS8OCsEOWDZNSJQqmw8qDmoyrPOR7ou5HL1L49Dyv65qm
	hJ1G5zSLul9XK223F3Tu3iC4o9Z+2b8r9FeIT/U2ddasJwBVmjQBKvwVwXFuXOUpxfGCHIcOy9Ok2
	dLYbGikg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdeq-0000000EgvL-343I
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 19:55:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNden-0000000Egub-2lha
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 19:55:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0AA365C5ACF;
	Tue, 17 Dec 2024 19:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBBE0C4CED3;
	Tue, 17 Dec 2024 19:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734465300;
	bh=P4Wh7WDxvuaJPE+NzdLH/LTdc0U/KBQgaAVuya/DXBs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=lFe5kZa2KED4DCcGIYJPdNTGa3JlG7adtZ5YtHxg8b8Qq0Or/u0IxjcWiiRhNvocl
	 5C2VcFS+wft6+M8Xq5czNZT4X8jn47rhRXNlJvaBdvopOfWd5BokL6msYTEfRwI3ao
	 uMDw+LsqaFbOIHK6CoVulgVnMzV9FKP7yDVKfot7cMHWT7NDJ34sE0i13Pz3hzzPNw
	 kKQMH1l81Bms+80dKaZJ2WWnsak3Ozk7dpWYwyw3fcFOidIUGIe9xxUOb1q+0iGc4b
	 6uZnEW8lqyJanP0ax2k4Y7+6cSxnuw3P1Yn6Bur/Jyx9+t64wa3Xa7W5HBiIi4lV0g
	 uqd7zD6CbittQ==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Jeff
 Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v3 7/8] wifi: ath12k: Change the Tx monitor SRNG ring ID
References: <20241217084511.2981515-1-quic_periyasa@quicinc.com>
	<20241217084511.2981515-8-quic_periyasa@quicinc.com>
Date: Tue, 17 Dec 2024 21:54:58 +0200
In-Reply-To: <20241217084511.2981515-8-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Tue, 17 Dec 2024 14:15:10 +0530")
Message-ID: <87ikrijd9p.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_115501_745096_20180A9B 
X-CRM114-Status: UNSURE (   7.71  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> The Tx monitor SRNG ring ID does not align with the ath12k 802.11be
> hardware architecture. Currently, there is no issue since the Tx monitor
> is not enabled. However, in the future, the Tx monitor will be enabled.
> Therefore, change the HAL_SRNG_RING_ID_WMAC1_SW2TXMON_BUF0 SRNG ID and
> assign the correct start ring ID for the ring type HAL_TX_MONITOR_BUF.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

