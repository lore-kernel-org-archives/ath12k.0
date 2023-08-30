Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5CEC83F15
	for <ath12k@archiver.kernel.org>; Wed, 30 Aug 2023 07:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YLMK0wqweQJ293ITS74x+KfWSyAWXdVls1EvLm3Evhw=; b=iHbsDiyWJR771f
	5WmCCOLVD7yzjfxsR2D+sDZ2y7zC6dZvMZya1ceEXy/hqUaHafmVOytVCzlYXWLOEuHTpN2kWLNLO
	Np6Ijg6QxJ0aFepfUav644dC0Q54UOklSU+4k5TTJa+q2DIqSfD2q5+kSUfNwW1dbIeIxe3CBR3N9
	lSQtuXsZDzckzjdMC60rPf4PuPei4slaoLFGaFiLMTNCuI1hqVZuoW6awKs3s9Ufarr9o2Dnh4nU8
	J9O3cvrGySQX8idqDXVi7TtOXgQbw6vomE8jHfZUlLMjzRp4nQGSSDffAh0MSbDwOsjPbS6pfWaE1
	ScRt/h5IwkNmQwN2Nf2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbFe1-00D09e-2u
	for ath12k@archiver.kernel.org;
	Wed, 30 Aug 2023 07:29:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbFdy-00D08z-1V;
	Wed, 30 Aug 2023 07:29:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E4C160EAA;
	Wed, 30 Aug 2023 07:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A78C433C7;
	Wed, 30 Aug 2023 07:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693380576;
	bh=ZeJ1BwB7KYij36PHxFK2U1Xz4mZAx/yEcPnFn0t3l/o=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=IP/Xf+Jti9LTA6m8LlnmX2OjaWLNUBdSXugPabPX7MFuLnR/Xeoex0fKZ6WHIUm0V
	 bHD6rS7V495MnUIn5lHmvHLvp/vDkzfn6ybJBp1eyzKXQQ4kCdKty8mh1l1eJ9zR/m
	 FY3CtOs8p8wlPNY5WRlq1DkwjkZBqV4F5muT8XB3YgQu4UdvmKIzz1E90B6rF/OsD2
	 71VbZEWIY1/UqCWjiVea+I+L2uMNKKFFWdpt99xtSJP/w9kY81NHpsbH7i5q/ip3qv
	 +EwHlHAyr7UvBBCb7EHxWLlDfsh1CN16kQhFAU2zEsTcCTqCmoqsr/Y1zFykkk9DH5
	 rurdfDXOKIlJg==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
    ath11k@lists.infradead.org
Subject: Re: [PATCH] wifi: ath11k: add chip id board name while searching
 board-2.bin for WCN6855
References: <20230830060226.18664-1-quic_wgong@quicinc.com>
Date: Wed, 30 Aug 2023 10:29:33 +0300
In-Reply-To: <20230830060226.18664-1-quic_wgong@quicinc.com> (Wen Gong's
	message of "Wed, 30 Aug 2023 02:02:26 -0400")
Message-ID: <87cyz5f0o2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_002938_567459_19A6542F 
X-CRM114-Status: UNSURE (   9.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Wen Gong <quic_wgong@quicinc.com> writes:

> Sometimes board-2.bin does not have the board data which matched the
> parameters such as bus type, vendor, device, subsystem-vendor,
> subsystem-device, qmi-chip-id and qmi-board-id, then wlan will load fail.
>
> Hence add another type which only matches the bus type and qmi-chip-id,
> then the ratio of missing board data reduced.
>
> Tested-on: WCN6855 hw2.0 PCI
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

Wrong list, adding also ath11k list.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
