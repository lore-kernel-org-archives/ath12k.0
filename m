Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F289E77184
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 13:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7L72duLo3LIz7FcB0v2uuJf3UHsbnJJQr/Ni+oEXS0E=; b=PHAGFnphU/eIjTE6ofGlt882ne
	Z9Ufkkso7/rmekxD2i/yvudTswHBghRIz/hzYtu1IPXnfEzZCVafpzK9zlMJ4QasmxDQUQk2g5HAE
	09UB2JBG/tIWuTxkocoTqlZKz09+Fn6VUhKhT/B6z6qtPp3Gt0t1wAJWXoSJ4joIbdY9sd4KPyPAW
	3YeUkVzj2dDdHJr1LWaVZNliPiOsgn10cwm0beNCKxxR8UUO28pydHLwXlqXaLKMlhmA+chWVon4/
	0gQ5BpYVMV1eDatnZDdjhPK6ehZGblVArl25UvoQu5TmIJWFoUpOAXgBxwVg7yP0MkiTs5B27YeCV
	9PKDdF3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGaQ-00000001wYS-3VJr
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 13:29:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGaO-00000001wXS-285n
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 13:29:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E53925C3A60;
	Thu, 19 Dec 2024 13:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD4EC4CECE;
	Thu, 19 Dec 2024 13:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734614943;
	bh=A1LYNU+bTOwVQx1HXIzE9f7TQzF01a4QaqmVeeoBuRs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=vI+BcTFcOWA0TixP6swapoBS5v4jRbxVhVJVwBQFS9QCY+olRREkxdpLAA905ZbSy
	 yTnOXU+Z1ZNzcWF63Tyc9K107MtisqnU7jBuPoLF4td4pJE892UTYrHab08YZotfBh
	 82KxxcAjJ28moEuVPhe9yJhM75lUjM58T0SAckzRzJIz1LD/70rwNGC5RqY8mZJuYb
	 HUHO2kLXx2pk5xxjtvzxFZEpsA77AcDgmMAxMkhR5+J0etbsp0hwDR2RspfXZ/lRm8
	 ETZdhxB1zzdVuL1b3dIahXi2o2nisuuS+mUsUr/OXOv9MhmWPq3RVS+L7FqXS+ooWR
	 7tM9xwbWMAFwA==
From: Kalle Valo <kvalo@kernel.org>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,  <linux-wireless@vger.kernel.org>,
  <ath12k@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] wifi: ath12k: handle radar detection with MLO
References: <20241218-ath12k_mlo_dfs-v1-0-058e783bcfc7@quicinc.com>
	<20241218-ath12k_mlo_dfs-v1-3-058e783bcfc7@quicinc.com>
Date: Thu, 19 Dec 2024 15:29:00 +0200
In-Reply-To: <20241218-ath12k_mlo_dfs-v1-3-058e783bcfc7@quicinc.com> (Aditya
	Kumar Singh's message of "Wed, 18 Dec 2024 09:11:34 +0530")
Message-ID: <875xnfhkdf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_052904_592985_50BC735B 
X-CRM114-Status: UNSURE (   8.49  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> writes:

> ieee80211_radar_detected() expects the driver to pass a channel context
> configuration during MLO. This is used to identify exactly which link
> detected the radar.
>
> Add support to pass this to mac80211. Since the link arvif is not known in
> the WMI event, introduce a helper iterator API,
> ath12k_mac_get_any_chanctx_conf_iter(), to get the channel context
> configuration.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

