Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF90E732E6
	for <ath12k@archiver.kernel.org>; Thu, 28 Sep 2023 15:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lMSFfT6M8Bbh0QUuC6hh7QI7FVWpIkYBpeVP+OgCUJo=; b=0AP9zq5XHQ2AAO
	xNU9jrW7FYov8xiuDrx6AZULAkAoe6G3ml0hLSltwattDKkxPPr43mk7iRTrhvV5wImtmwReCwOR5
	Jo2tEpU+uRfdaCdb/ng3DRatDY1m5fqrgv0+R4khj6TjGw1u7lSEt6tmzrCNg8p8NrELkPp46jY09
	1c/W7di4SeO2Jh0RF95IMjPT5E/nD9Insc+6JHoYDuhM0ebgA2EvQTNYAtGyJQTWFPZQ4IiyY+ut1
	ld+Z86kYf1MG+v9hZAKBmlP/mgkmsJj/ooIvLVdrZr6b9wATGYpcxvfbN0znJf73FKZYYgvaZS/iR
	wQiTnsJDFdpkk+4n29sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlt0x-005Uwf-1B
	for ath12k@archiver.kernel.org;
	Thu, 28 Sep 2023 15:33:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlt0t-005Utl-2o
	for ath12k@lists.infradead.org;
	Thu, 28 Sep 2023 15:33:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 49DE6B81CE5;
	Thu, 28 Sep 2023 15:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2384C433C7;
	Thu, 28 Sep 2023 15:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695915193;
	bh=1LuJxiMXhASalrUfVnL7ck/q6s7MQDu+aMOcytyqgAo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=HVrYmn5uyV6eBfz6Gku2xahF9bWYa7EjgsVmgaJW8lNrR3Ufw5JmmKi1BVQDUfFKh
	 t24ukabQ9r4BQnaDwZfzy/x7UneGV4dqBtqsyhDYlZDX31SEI4dpvW+JeYLBB2FrIq
	 dVpFgXmq/NGQpXF1HhQKsw8IG1/K3EsqOYmgbHGcWe2yYxiTjpXfOeA14wzjkrDDEu
	 aejBzsLS5TVrRLfDmoppIjulT3QahFvfNDlvmntH51ZXTS3zxrjKxyLBc5qrFCe4E5
	 ApccGjDgsq0MuoOwKsFZ3ouuOwyyKCZXrPzmQK0UE6gT2wTg8VOYWGHNUrFwcMdHNc
	 rOfvoBcoW+ogg==
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/4] wifi: ath12k: add TAS capability for WCN7850
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230910082802.9198-2-quic_lingbok@quicinc.com>
References: <20230910082802.9198-2-quic_lingbok@quicinc.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <quic_jjohnson@quicinc.com>,
 <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169591519084.3096214.13489607891365501029.kvalo@kernel.org>
Date: Thu, 28 Sep 2023 15:33:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_083316_058431_AD30DA38 
X-CRM114-Status: UNSURE (   8.20  )
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

Lingbo Kong <quic_lingbok@quicinc.com> wrote:

> Currently, ath12k does not support Time-Average-SAR(TAS) for WCN7850. In
> order to enable Time-Average-SAR(TAS) for WCN7850, ath12k defines
> ath12k_get_acpi_all_data() function to get TAS configuration and SAR power
> table, then sets pdev_id, param_type_id, and finally sends the TAS
> configuration, SAR power table and WMI_PDEV_SET_BIOS_INTERFACE_CMDID
> command to firmware to implement TAS during the initialization phase.
> Besides, ath12k registers an ACPI event callback so that ACPI can notify
> ath12k to get the updated SAR power table and sends it to firmware when the
> device state is changed.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Fails to apply, please rebase.

error: patch failed: drivers/net/wireless/ath/ath12k/core.h:771
error: drivers/net/wireless/ath/ath12k/core.h: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath12k/hw.c:907
error: drivers/net/wireless/ath/ath12k/hw.c: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath12k/hw.h:186
error: drivers/net/wireless/ath/ath12k/hw.h: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath12k/wmi.h:4791
error: drivers/net/wireless/ath/ath12k/wmi.h: patch does not apply
stg import: Diff does not apply cleanly

4 patches set to Changes Requested.

13378463 [v4,1/4] wifi: ath12k: add TAS capability for WCN7850
13378462 [v4,2/4] wifi: ath12k: add BIOS SAR capability for WCN7850
13378465 [v4,3/4] wifi: ath12k: add adjust configuration of CCA threshold value for WCN7850
13378464 [v4,4/4] wifi: ath12k: add set band edge channel power for WCN7850

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230910082802.9198-2-quic_lingbok@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
