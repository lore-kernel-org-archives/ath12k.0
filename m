Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A04C61D97
	for <ath12k@archiver.kernel.org>; Wed, 22 Nov 2023 18:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFxH0Kh6HcYg4c/iBeopSCBHW0FkgxyBYb7jvcXJefI=; b=fGgY67tLQplDy6
	NtwHJFexUQYLSPmoCL0XFeImZAH1K3Zq+VwvhlFYKD3cIKPNoFhqL/UGkJnCGrbKMnpL4jUC71uRU
	ZWBLF6N+HwK0msRMFNVSLk6sWHUdHCcIws7EUNhdrmwZTFtkjJFBtHJJv+zyZctrEWil9UzI35KCX
	YotRBYEI6hWvDbrvln8d5qN9dAo7YKUL7T/7ulFmBfkDctvP59WnjCwk+OJ2lqAdkmlFPi+E6BrBH
	WR2D48vjnzs4jy508EfcSSjOBiD3ZS8q2VsxULMsuVstdO26ZoOLSRL3ZJr22S1l7n/VN3mp1J3fK
	AC4pGZbk/03maxY0c1+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ruo-002otB-21
	for ath12k@archiver.kernel.org;
	Wed, 22 Nov 2023 18:25:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rul-002osA-1O;
	Wed, 22 Nov 2023 18:25:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E427861EAC;
	Wed, 22 Nov 2023 18:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EFDC433C7;
	Wed, 22 Nov 2023 18:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700677530;
	bh=H92zqDBjuciQLmNG2J9FvGopKpP6F0Nuszp0E+9FHPU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Kh2zKVD/cDLyT0ybZywCRR22UaWGUHUvRaP8CQESw5naXMWn1slrkx/OLlCehvqx6
	 GIjLemepdfkA3vt72g7w8kElOiyL+on6K/zbWMoXWiTvlsWFv7c37CQftKp9xRF32T
	 l2nxFY7wPz95xjypX9wExma/dPj4fN80ahgIFellj1ay0XShQWZGQ/uLl83igZzCwZ
	 q0h2TkLk6bqnPcC1wgOC90bW1c6+VbK+Rt2hWXN9uK55gqcNJZwyoamoJLgOgLkTQ4
	 ZnFT8NQ1ZSzmdf+RxGRC4cD0r2v01MINPdE9nScVXzlkJavPzVmllxpvqmJwF02brG
	 e7PCurzbuacaA==
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] wifi: ath11k: Remove obsolete struct
 wmi_peer_flags_map *peer_flags
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231106-ath-peer-flags-v1-1-781e83b7e8e8@quicinc.com>
References: <20231106-ath-peer-flags-v1-1-781e83b7e8e8@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <ath12k@lists.infradead.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170067752747.158537.2182756707529538748.kvalo@kernel.org>
Date: Wed, 22 Nov 2023 18:25:29 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_102531_517193_51E6E1E1 
X-CRM114-Status: UNSURE (   5.56  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Currently both struct ath11k_pdev_wmi and struct ath11k_wmi_base
> define:
>         const struct wmi_peer_flags_map *peer_flags;
> 
> But that member is not used, and in fact, struct wmi_peer_flags_map
> is not defined within ath11k; these are obsolete remnants inherited
> from ath10k. So remove them.
> 
> Compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

4 patches applied to ath-next branch of ath.git, thanks.

53bcb41d9eda wifi: ath11k: Remove obsolete struct wmi_peer_flags_map *peer_flags
69bc79faa616 wifi: ath12k: Remove obsolete struct wmi_peer_flags_map *peer_flags
7d4a70201204 wifi: ath11k: Consolidate WMI peer flags
51516d9842a3 wifi: ath12k: Consolidate WMI peer flags

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231106-ath-peer-flags-v1-1-781e83b7e8e8@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
