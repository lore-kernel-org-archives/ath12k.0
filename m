Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F0DC3064D
	for <ath12k@archiver.kernel.org>; Wed, 26 Jun 2024 15:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnZZ1eCaFanrhr5o5zH4hm19n1B2qRvBWQet7s+5CHM=; b=zHcid4izRM+MhsCia5Y1S+XZ9N
	pxjLX0IHX87Chlmw38df/kbvinKP3BB/3vlxaKN+ZvcGB0EmMb0Ml5nneCVPcHEq0fG9YE6r6/3gG
	gYFrY0wXN2pCiViCCh9DmmYqcqENTPjLgrE72O/6Q+pQNCxtxTEjcuBBbqBVYbM06KjuDkv3EpVU2
	C5lDycCfWtNUuGshrjWdgHDTqiF6qsDJZfn1Z9iV1mbQBA/aiGKS48ijmJR/YWhGjCXwhOdKJ5HfB
	OS3iRKUuP4dcQQBmypjSPwS06UkcL7/XInYp/F5JaAXpvrp4svdttRr4O36XnsU6uc50jQ6VnezKa
	kH3iPcBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUmY-00000007RS1-2UAs
	for ath12k@archiver.kernel.org;
	Wed, 26 Jun 2024 15:42:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUmW-00000007RRc-24a5
	for ath12k@lists.infradead.org;
	Wed, 26 Jun 2024 15:42:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C60406198E;
	Wed, 26 Jun 2024 15:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A79FC116B1;
	Wed, 26 Jun 2024 15:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719416518;
	bh=U3zPUmPwStP/4jvwruoRXcg0ehbADGhwirCpV0MeysM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=U5p64JE5pAQZYEaQyXYA8BUGWQu3rg+BzYaMOAjQ0EbZRNBOdblQ0gqBHPOX+uN8A
	 7tBJWdNL9Q8Ll/CUpopchwbmyQXKpOb+BoE6cCwjEVdnyNwwSgwfRnyryrj9QLHlq3
	 SenAnMAGd8wxEQYPufNQJzs97l+/DaX+ZuZsVWmrTryxXIu5VP2n1hH2XADg5sxKyj
	 E/ZQRW1ya8MhoaH1Xd88Wkz/Xm514g0Q7aRmPk6UjfxSquLZoqSKoSY9Oyvk8uFmda
	 KBEC0tKoEUjLQFNyMCMYpxRJCIBxQqAICAhAFblJh4iFxfLLliXlPCk1Q/3ae7bli+
	 EEm/ouDdVec+A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath12k: Fix pdev id sent to firmware for single
 phy
 devices
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240621102809.3984004-1-quic_rgnanase@quicinc.com>
References: <20240621102809.3984004-1-quic_rgnanase@quicinc.com>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Lingbo Kong <quic_lingbok@quicinc.com>,
 Ramya Gnanasekar <quic_rgnanase@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171941651550.1568703.13692158978977489041.kvalo@kernel.org>
Date: Wed, 26 Jun 2024 15:41:57 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_084200_827774_03BE0375 
X-CRM114-Status: UNSURE (   7.62  )
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

Ramya Gnanasekar <quic_rgnanase@quicinc.com> wrote:

> Pdev id from mac phy capabilities will be sent as a part of
> HTT/WMI command to firmware. This causes issue with single pdev
> devices where firmware does not respond to the WMI/HTT request
> sent from host.
> 
> For single pdev devices firmware expects pdev id as 1 for 5 GHz/6 GHz
> phy and 2 for 2 GHz band. Add wrapper ath12k_mac_get_target_pdev_id()
> to help fetch right pdev for single pdev devices.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

2c7857677d69 wifi: ath12k: Fix pdev id sent to firmware for single phy devices

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240621102809.3984004-1-quic_rgnanase@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


