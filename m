Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701E7C00528
	for <ath12k@archiver.kernel.org>; Tue,  1 Aug 2023 13:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+xoRAU5Yb2LuD5ZeMN6jeW1LIJwtG7wvxQJNQ85CJak=; b=4/tRQLYJ6PuRxn
	StgHKsA0A4/twTtfUhPwSnOZOJIBoy7Lr8qwutEoU9q4CMHk3ptZKo1Qjvs9uBtLj03i3fQQ5jLJo
	G7xYcqZmCwEvxmEn3orQ/OBwCsMQKCnKwwvVTJy42vs4SIlZkwG1mu9bf8aGaAtnYsKYqCokQrwEP
	kIPhnwiuFA6ixXzi+2Dnt9GmDAmwmk6CJZ7r2NhYzBm9EoEoWc3jWvsAqV9wgzYrvN8BZVdcGiT0/
	IQTJVQOGwQrWuMclZ7hTtL+jY3+jwewROmP4fJ7WJ89lwhNL6kAM2JnMkJvq5VHQbOAeK3zBDXhM1
	8jyw8vj5vY+nlTrPsCIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQpnn-002Uuw-2S
	for ath12k@archiver.kernel.org;
	Tue, 01 Aug 2023 13:52:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQpnl-002UuH-0f
	for ath12k@lists.infradead.org;
	Tue, 01 Aug 2023 13:52:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B182B615AC;
	Tue,  1 Aug 2023 13:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1F6C433C7;
	Tue,  1 Aug 2023 13:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690897960;
	bh=GtyRiFHthsDjtKkiPp/i8BU3l3WVaTFcYHgdGtnnWJg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=BElcm7HGDPmhq3g+fa/Lz8p4qtc1eSd18g7VJJZB+v0Swv83UFY1O3wLsD/wXY9E/
	 kAgk/cL0xT+eSswB7xru01PwcXBYb0Uk7TWd92B8PFgxTxS8IPWv+2U5tVtLCwUwlI
	 pif0jnoSIJSnan49WSToXy7REI7ueF8bpRE9O2CiioLzLFEJYPBz8e0CiLrhZxfSOm
	 7jDI5oMzqZlUt514Qi4g5LxzSOsyLulApU4Vhd1NNolyUbd1HbetkWjcMDUd9ukJVS
	 8M1yPcagu+ZDhSTT+05XPBVPMTERHwGP7vcg3mAWJUinvIalX0vo2TZwWVOajfWvfv
	 loNNLtfl53eGg==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] ath12k: Fix a NULL pointer dereference in
 ath12k_mac_op_hw_scan()
References: <20230726092625.3350-1-quic_wgong@quicinc.com>
Date: Tue, 01 Aug 2023 16:52:37 +0300
In-Reply-To: <20230726092625.3350-1-quic_wgong@quicinc.com> (Wen Gong's
	message of "Wed, 26 Jul 2023 05:26:25 -0400")
Message-ID: <87fs52yimy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_065241_314128_C476DFF5 
X-CRM114-Status: GOOD (  10.65  )
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

> In ath12k_mac_op_hw_scan(), the return value of kzalloc() is directly
> used in memcpy(), which may lead to a NULL pointer dereference on
> failure of kzalloc().
>
> Fix this bug by adding a check of arg.extraie.ptr.

"wifi:" missing from subject.

> Tested-on: WCN7850 hw2.0 PCI
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

This on one line.

I can fix both of these in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
