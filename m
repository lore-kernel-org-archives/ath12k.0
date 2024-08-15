Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DF3C3DA7F
	for <ath12k@archiver.kernel.org>; Thu, 15 Aug 2024 16:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9HMM6WT2cxM1K+jYLhmEO80ZABPF7vY8UeUME54BfHc=; b=ekUPLyKpsmR7LY4q7so3XqbAec
	r/8vKCNROjyUKPWn/ZIFzjeogCj87V8aRMmx6qRhprqi+DG3UpIhxqAoS25OPS5Hc9a6Vxsi2MzVO
	TGhYRLnOD70Br1LFroNsHg+4nuEgGgZvx+DzaLz73xerG+AuJDmELb7aUrgW3wW5j/id1/BVOAi6q
	eEi0bQViUDDQtkPK2avg+L0mgVGc9VnsA2L9JpVBwB6bjApkAwyF7HZ++Ud2HNuJe/PCercJFFjJ2
	UTvv+zZbsYYid0bKCYLAYD0IDU3gpTD+Ebgjwd29hoZOuJuBkVDA8olhe8H1/IUFPoqEI+ostJtut
	cV/gCawg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seczR-0000000ASpl-45Do
	for ath12k@archiver.kernel.org;
	Thu, 15 Aug 2024 16:06:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seczL-0000000ASp6-2FQh
	for ath12k@lists.infradead.org;
	Thu, 15 Aug 2024 16:06:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C4C0ECE1A2E;
	Thu, 15 Aug 2024 16:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2376C32786;
	Thu, 15 Aug 2024 16:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723737968;
	bh=jRBX+LCD/1Z7RY8F7WSgOgemqIoD+qNV4OeL1tIzsts=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=q3IdeY/8Dp1KKuf3UWNn4sUqJK+gCtXFJ/DdvYJklGIb0dANyNOxORbAB+j52shKq
	 zic127i5YnPaRDJJtYKMOUtQGr6Ora1mYUgvnIvgJxM3zXOY20gh6j1AhXiITNPHA/
	 CPnkDHvlw8PxoZicPNm6hXge3JoEqBg3wRsE3ZvGx6Mn4WAtpk8fpJ/anQ5YBrgVR2
	 QOaMxotHmyNMos7/65RQMwz84xcqgFSa2CS0WOCsTgwikuHZsYcBThOEJWqX7VaRqE
	 y729khX32OSMSocsF4irqh8epgmPH07s1LGfUFLlVzP1mf7yK7XQQOs6nMZIUbGQip
	 7qMTefhxeGYVA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] wifi: ath12k: fix the stack frame size warning in
 ath12k_mac_op_hw_scan
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240809015841.2671448-1-quic_miaoqing@quicinc.com>
References: <20240809015841.2671448-1-quic_miaoqing@quicinc.com>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, Miaoqing Pan <quic_miaoqing@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172373796602.1088510.1385102629331505053.kvalo@kernel.org>
Date: Thu, 15 Aug 2024 16:06:07 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_090611_765362_1C6B8B9A 
X-CRM114-Status: UNSURE (   5.16  )
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

Miaoqing Pan <quic_miaoqing@quicinc.com> wrote:

> Fix the following W=1 kernel build warning:
> 
> drivers/net/wireless/ath/ath12k/mac.c: In function ‘ath12k_mac_op_hw_scan’:
> drivers/net/wireless/ath/ath12k/mac.c:3806:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

6274df2530e3 wifi: ath12k: fix the stack frame size warning in ath12k_mac_op_hw_scan

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240809015841.2671448-1-quic_miaoqing@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


