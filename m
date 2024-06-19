Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6320BC27C53
	for <ath12k@archiver.kernel.org>; Wed, 19 Jun 2024 14:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaPtoeivJYEcxVUXZNvfncCVS/kiz7eUeMYTUvV4Ewc=; b=y0J3aBMn/2X0NdXc5liFxLGdTa
	EduhQdPga4JFSgJqRI5N0/aNH4gk/xpu35hrTluP/IqlJX4LI46+eXLJVsko6iRbHhYT1UQ94a1QC
	/FAh0uy79Cb5NIiZoRQkx/94ng1AOjn976yYDk+vh1/DtilKHsRLGeUeYhFIWuko648ZAGMFow7wB
	CnCuGTZwna1RbmmEocFiFFcwmQnp6R4eaLtY2I0/JXYH+wSmOedsD2G4Z+ivbldmpsddVFehYNCnx
	sdsZCKwA8Ge5O/dmCXQXW+9IfOZLVrC05xvXX+DpM1IID0PTAptWErnjhjRmenHLRERksDJdNH/xG
	ecsca72A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJw4E-00000001Sps-3lfr
	for ath12k@archiver.kernel.org;
	Wed, 19 Jun 2024 14:13:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJw4C-00000001SpP-3HJO
	for ath12k@lists.infradead.org;
	Wed, 19 Jun 2024 14:13:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 15A1D61E36;
	Wed, 19 Jun 2024 14:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2CC0C2BBFC;
	Wed, 19 Jun 2024 14:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718806419;
	bh=NQyi1a2zLyx4i/sgAfmUTZEz1dspq8q7MpovmmxN66M=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=B+gLRYl8ZJZ2aLi4eh15lkgPXO/eAVl15Kl784HvlZeUSQQFHdpE61FSIkxoyHeT0
	 CZ5M7MdScSvjMqCY0v9ySCGTgzek3PrqXHl+sMtic/5K/I+XP/bn4QbQUm26tFq5o9
	 vTR225nUv9b8WKMTmHglvSf8urgd6BdiKpMb8HDf0ntGzblVgqJLWZTo694hAlU/j1
	 FQ6DktoF2auStxW1UT+Q2MMZKl+u12vaWsJf3rskQIE7BCOjyq6hQr/1ToYqN7JkdN
	 F17KgMqHRi6ZN2aD2p6wWUxKmOZlirfKpmc805qCF+T43OHLuWOnSL8g0I1jfXHvlK
	 c2CglD1w8Elug==
From: Kalle Valo <kvalo@kernel.org>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org,  Lingbo
 Kong <quic_lingbok@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: Fix pdev id sent to firmware for single
 phy devices
References: <20240611043342.2672998-1-quic_rgnanase@quicinc.com>
Date: Wed, 19 Jun 2024 17:13:36 +0300
In-Reply-To: <20240611043342.2672998-1-quic_rgnanase@quicinc.com> (Ramya
	Gnanasekar's message of "Tue, 11 Jun 2024 10:03:42 +0530")
Message-ID: <878qz1kokv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_071340_964334_4514EA9F 
X-CRM114-Status: UNSURE (   9.94  )
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

Ramya Gnanasekar <quic_rgnanase@quicinc.com> writes:

> From: Lingbo Kong <quic_lingbok@quicinc.com>
>
> Pdev id from mac phy capabilities will be sent as a part of
> HTT/WMI command to firmware. This causes issue with single pdev
> devices where firmware does not respond to the WMI/HTT request
> sent from host.

But WCN7850 already works so I'm not really understanding the bug
description. Can you elaborate, please?

> @@ -81,5 +81,8 @@ int ath12k_mac_rfkill_config(struct ath12k *ar);
>  int ath12k_mac_wait_tx_complete(struct ath12k *ar);
>  void ath12k_mac_handle_beacon(struct ath12k *ar, struct sk_buff *skb);
>  void ath12k_mac_handle_beacon_miss(struct ath12k *ar, u32 vdev_id);
> +u8 ath12k_mac_get_target_pdev_id(struct ath12k *ar);
> +u8 ath12k_mac_get_target_pdev_id_from_vif(struct ath12k_vif *arvif);
> +struct ath12k_vif *ath12k_mac_get_vif_up(struct ath12k *ar);

AFAICS ath12k_mac_get_target_pdev_id_from_vif() and
ath12k_mac_get_vif_up() can be static, no need to add them to mac.h.

So we are left with ath12k_mac_get_target_pdev_id() but I don't see it
called anywhere. Isn't that dead code we are adding?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

