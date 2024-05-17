Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F667C25B79
	for <ath12k@archiver.kernel.org>; Fri, 17 May 2024 06:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5vraI/wJe/M9PMp/iXSwY70gFGzbtWCZo7KHleB8Kw=; b=N2u3El09CMT7p6YnuqbJh4lfaS
	LOhcvIv0rA6rP4v+XAY2CVayeU7nWyh9AoBBQSWA+9LO3YkDig5U2B4rm6nQIt8expudRnFFdABxR
	dpoefEhp/utvXQYGIVuV2Nxu/g9Kg+H95VDHMbzfDzuQqhhDcd8G1VJFCyzwe0RJ937g+fQxEEL/H
	yPGuDdn0DoVquVDVgmfip2s8+FDnfTCOWcJxAAALc6JeeTWZAy+RdswiKaJHJnK1MY/PaMOtnMR4x
	j5GhQQ+H/eWFMybUoljLdh8KY7kXG7qtdpDCXudU8r+tSDzy676kRY6bn6Kr94NGQlyYf8lFxN+RC
	cV4nXwPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7rX3-00000006zzJ-4Bkn
	for ath12k@archiver.kernel.org;
	Fri, 17 May 2024 06:57:34 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7rWz-00000006zyV-3yH8
	for ath12k@lists.infradead.org;
	Fri, 17 May 2024 06:57:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D56BCCE19B9;
	Fri, 17 May 2024 06:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA7FEC2BD10;
	Fri, 17 May 2024 06:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715929041;
	bh=WDA8FD2lgGijxh27XqYTzwf8c0PDnanf6CKK2mQJuds=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=dsPen7AfMkuRv7H/6osZ+V1ItRq1GHa0yMGAualYKjEV6K+1hXkUTDQa3pqN7vZUE
	 lARigiQ232AoFUiJpvNrNeD+RGOFvdXRGDRkS4iSyfYLbX6ZzAPuzOGBDQV0P1lAuZ
	 xowQCuPw/AktFkJks/B9s83XcWVuaKde/XaXrmp5KxgvAFVqIqqBY6ny8Reg5Rmn+u
	 MmrTTnGVwbCkDKUvp6XWMamTeiwM7y9R3pEe8DHAKi2B/JZ2AbEjB/2UVckBs6v06b
	 F5+M9kWfUaAeOFwEZEYMKdBR7Hji9kJxfhTEPmsrrMyi3mlEYP1B0WDaaTsRRYpE1c
	 3HSbWG/umt32w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: fix the issue that calculation of ack
 signal
 strength
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240511030917.65811-1-quic_lingbok@quicinc.com>
References: <20240511030917.65811-1-quic_lingbok@quicinc.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_lingbok@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171592903908.3197586.10319031507353572437.kvalo@kernel.org>
Date: Fri, 17 May 2024 06:57:20 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_235730_215395_3E5E541E 
X-CRM114-Status: UNSURE (   8.92  )
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

Lingbo Kong <quic_lingbok@quicinc.com> wrote:

> Currently, the calculation of ack signal strength is incorrect.
> 
> This is because before calculating the ack signal strength, ath12k need
> to determine whether the hardware and firmware support db2dbm. If the
> hardware and firmware support db2dbm, do not need to add noise floor,
> otherwise, need to add noise floor.
> 
> Besides, the value of ack_rssi passed by firmware to ath12k should be a
> signed number, so change its type to s8.
> 
> This patch affects QCN9274 and WCN7850 because they have the same issue.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

ed61863debb2 wifi: ath12k: fix ack signal strength calculation

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240511030917.65811-1-quic_lingbok@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


