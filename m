Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2CCEB3637
	for <ath12k@archiver.kernel.org>; Mon,  2 Mar 2026 21:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EekSGy/JPL3wGnaM2v/rWl0wKxVmIaBoQvyBvSln5rs=; b=C8KQim8TdqXH4LpYBWTXGxwgN/
	eyTgSiu3e/GgAnwPmGmB6W5nQJ1Jl2VXt0HworFlTYTEgVTEfiyJujiTYvUawMZfnZuIDOweuaKHt
	/AXk0dbvlwqs4kkxeIUiFWvGKhdpuaufkh9Zdvr4F/SolOtmGWt8jMGUgbdR1CELY7pS3Ie23dOXt
	y4/A0KaPgG/UUBFHB6wwguj97/GX+ImpfaN9AOjBkVcvnh2VkiAFs5Em2c+PPASjipxp3yujxyFac
	7vNihZ9I67JO76ah4Zdhsh5F64tJkQfB5E1Sl4HfgdCpGS8i3CO2uJdQKUNSkIgnOYfrv1t0+7MuF
	BwNH0GRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxAUI-0000000Dzrx-0Iuf;
	Mon, 02 Mar 2026 21:07:34 +0000
Received: from mail-106105.protonmail.ch ([79.135.106.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxAUE-0000000Dzr8-2NOB
	for ath12k@lists.infradead.org;
	Mon, 02 Mar 2026 21:07:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=clowdydev.com;
	s=protonmail; t=1772485644; x=1772744844;
	bh=EekSGy/JPL3wGnaM2v/rWl0wKxVmIaBoQvyBvSln5rs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ic0IBacua3HUtsppQPm5NtjFbxXQ4onifXOZrIvyLzxu2dOGAyqwbQtmWmm0O+J1w
	 g9ph10vF0yqu7GRF/NhbZdskkorEj2QlkwyMTZtBhcLDtvg7K06oAQWCgCt7WrX8Je
	 pRMxan/Lhw1XubxH3Z+UWO4y//US/SGq+/2UyFr89M1aKnO6tEo8mEWrMMbRtTkn/l
	 UW12b9zY70D0tV/3/jGtmRZica5+7O12bD7pIuKggEr8g6tdNBSw4Hj8bzjDl3J+PT
	 rLh0nfKvnNeTezairksN78+T+7yXtHzwFjdtX2GQo2rYLRGClW9e5PByvwWPM5hcOP
	 EAAzNZDWnJ/lA==
Date: Mon, 02 Mar 2026 21:07:19 +0000
To: jjohnson@kernel.org
From: Alex <alex@clowdydev.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, clowdyffs <alex@clowdydev.com>
Subject: [PATCH] wifi: ath12k: fix tx_status memory leak on allocation failure
Message-ID: <20260302210703.1789448-1-alex@clowdydev.com>
Feedback-ID: 184521167:user:proton
X-Pm-Message-ID: 76f5c4564ce8dac150bb81aa24e45ab4cf6a573b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_130731_727973_9987756B 
X-CRM114-Status: UNSURE (   7.49  )
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

From: clowdyffs <alex@clowdydev.com>

When kmalloc() for tx_status fails partway through the TX ring
allocation loop in ath12k_dp_setup(), the previously allocated
tx_status buffers from earlier iterations are not freed on the
error path.

Add a cleanup loop to the existing failure path that frees all
allocated tx_status buffers. The cleanup loop mirrors the existing
pattern in ath12k_dp_device_deinit() (the normal teardown path)
rather than extracting a shared helper, to avoid adding call
overhead to the common deinit path. Happy to refactor into a helper
if preferred.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")

Signed-off-by: clowdyffs <alex@clowdydev.com>
---
 drivers/net/wireless/ath/ath12k/dp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/at=
h/ath12k/dp.c
index 1c82d927d27b..8ea0d41f9829 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1548,9 +1548,6 @@ static int ath12k_dp_setup(struct ath12k_base *ab)
 =09=09dp->tx_ring[i].tx_status =3D kmalloc(size, GFP_KERNEL);
 =09=09if (!dp->tx_ring[i].tx_status) {
 =09=09=09ret =3D -ENOMEM;
-=09=09=09/* FIXME: The allocated tx status is not freed
-=09=09=09 * properly here
-=09=09=09 */
 =09=09=09goto fail_cmn_reoq_cleanup;
 =09=09}
 =09}
@@ -1570,6 +1567,10 @@ static int ath12k_dp_setup(struct ath12k_base *ab)
 =09ath12k_dp_rx_free(ab);
=20
 fail_cmn_reoq_cleanup:
+=09for (i =3D 0; i < ab->hw_params->max_tx_ring; i++) {
+=09=09kfree(dp->tx_ring[i].tx_status);
+=09=09dp->tx_ring[i].tx_status =3D NULL;
+=09}
 =09ath12k_dp_reoq_lut_cleanup(ab);
=20
 fail_cmn_srng_cleanup:
--=20
2.53.0



