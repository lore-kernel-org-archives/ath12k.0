Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2549CE77173
	for <ath12k@archiver.kernel.org>; Fri,  6 Dec 2024 15:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++p0HGQ0NpnZgMDAX6spAWHGfQxHIWJ6CAw/t5ljOEY=; b=SHoxcIGjTUPUIX9Fze9NRlag70
	zpbIR/K6nw1wNFVhE+IzUJckULsJ13nLtMFzFvHhqvO1bSbSSuWjE0jzfALtlN9KvllRychzNGK+9
	XQ4rHyANzM/jc7YiqZHH4z17r5c2cZ6zEtNJA+uqyJsz1znNjq36Z7eoV5hBM9I5pVtub/X96i3X2
	k3+QU4MfVTO9nZRYNyGE4AbOKShTdVIVVAzLaDoAzKPwP8VfgNI4H5KPPBnnWzKVI2+vDZtQQk4Q3
	PCEYd2EzkZ9aIcCBJBKUOGOV2MH9lrlKPPVH094dcus9ZkJpduTTfSF5dEWYEvQFKgHYIpCyGgnm8
	eMzpvvPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaT2-000000021Bd-3pYi
	for ath12k@archiver.kernel.org;
	Fri, 06 Dec 2024 15:42:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaSz-000000021AL-3GNB
	for ath12k@lists.infradead.org;
	Fri, 06 Dec 2024 15:42:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 092EA5C615E
	for <ath12k@lists.infradead.org>; Fri,  6 Dec 2024 15:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64632C4CED1;
	Fri,  6 Dec 2024 15:42:04 +0000 (UTC)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20241204163216.433795-1-kvalo@kernel.org>
References: <20241204163216.433795-1-kvalo@kernel.org>
Subject: Re: [PATCH 0/7] wifi: ath12k: MLO support part 6
Message-Id: <173349972434.1649864.17683658768076689357.b4-ty@oss.qualcomm.com>
Date: Fri, 06 Dec 2024 07:42:04 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_074205_860919_8536CC6C 
X-CRM114-Status: UNSURE (   4.70  )
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


On Wed, 04 Dec 2024 18:32:09 +0200, Kalle Valo wrote:
> In this patchset there's refactoring to support hardware grouping, meaning
> multiple hardware devices can be registered to mac80211 as a single device.
> 
> Please review.
> 
> Aditya Kumar Singh (1):
>   wifi: ath12k: rename mlo_capable_flags to single_chip_mlo_supp
> 
> [...]

Applied, thanks!

[1/7] wifi: ath12k: move ATH12K_FLAG_REGISTERED handling to ath12k_mac_register()
      commit: a5686ae820fa7ab03226a3b0ff529720b7bac599
[2/7] wifi: ath12k: rename mlo_capable_flags to single_chip_mlo_supp
      commit: 46d16f7e1d1413ad7ff99c1334d8874623717745
[3/7] wifi: ath12k: introduce device group abstraction
      commit: 6f245ea0ec6c29b90c8fa4fdf6e178c646125d7e
[4/7] wifi: ath12k: refactor core start based on hardware group
      commit: ee146e11b4d9183e01d8b7e4963941730ed4af6d
[5/7] wifi: ath12k: move struct ath12k_hw from per device to group
      commit: a343d97f27f514015e6d5e789672cf4ab4111720
[6/7] wifi: ath12k: send QMI host capability after device group is ready
      commit: d302ac65ac938516487f57ae20f11e9cf6327606
[7/7] wifi: ath12k: introduce mlo_capable flag for device group
      commit: da8656797ae10b524a7a0c3d5eeb6237fa3ddd70

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


