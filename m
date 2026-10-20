Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699F9606A31C
	for <ath12k@archiver.kernel.org>; Tue, 20 Oct 2026 21:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LqYl7xNT;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=j4cJPCA9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JnNQriX6Bbstn8TepnqDJgRRLBsCHc7/Dcoc4OhbyCI=; b=LqYl7xNTZEp/PxT1rc+kR9Zv/Q
	zTg2l7xRypg5JkpKdUVxxHdjIlF7yCZbmWU02JMSMCaknQ1HD5KmDE14ybP41/7dRqztz38/bEfpK
	S5PP+bbFbKtiKkrlhfeR70p7F2rZKmrcdCIMvICLt8ZV3Vl2ZwXVoU2q8KeUdRb+sPVnBwIRtcryb
	Zeb82BTIywiVsqJJwT719/hvHn8w7j4ahES/TyiiPRcCCRNm1ylrZUY1DtSeGlOTpKaxWVftPhvjX
	59g+dVj75DRy7rAMJ9sqxtidi0Yil+TmSnohYYW7A/7P4tTJJ3QHR8+C0uj/Ji+uFTQ1sGM6dldpZ
	JVak05GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJHUS-0000000AgDV-0jf5;
	Tue, 20 Oct 2026 21:35:24 +0000
Received: from mail-24418.protonmail.ch ([109.224.244.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJHUP-0000000AgCv-2vVC
	for ath12k@lists.infradead.org;
	Tue, 20 Oct 2026 21:35:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792532116; x=1792791316;
	bh=JnNQriX6Bbstn8TepnqDJgRRLBsCHc7/Dcoc4OhbyCI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=j4cJPCA9d2Q0bYz+NFNw/w3qEevfZtiXBUd2zYrgh3LGSW/OkGlUG7ig/y4pMrPwm
	 BR6aSw8c+ukHeczXLJXgN0BEpoJ16vGOJWKj8WFpKOTvJQwMZe6pk3YTFXr3eCOuvR
	 2wojWD/YFOldiUZIS9CP+aNVco+oIsmKCAdodnGpmpyiENg4fPWYaOuJ494miBAjSC
	 kFJUMkqE8cgSRezyWm4YIzzLxN81qNSoff6wtms95HA30v8tgraFYl+fzjCztJv6FV
	 TTcgU8BevMfZI+r+Kr5xm/lP+fffwOl9acjiginj7tvtCWwnebD9AXAh3e7jh0/xOS
	 PRXDfLy3U2eDA==
Date: Tue, 20 Oct 2026 21:35:09 +0000
To: Jeff Johnson <jjohnson@kernel.org>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath12k: don't count a vdev restart as a started vdev
Message-ID: <20261020213505.31624-1-birk.skyum@pm.me>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: 0691d706ead9bfd175647fe90f64433c99c5156e
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_143521_898278_246621FC 
X-CRM114-Status: UNSURE (   8.54  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k_mac_vdev_start_restart() increments ar->num_started_vdevs for a
restart as well as for a start. A restart is not paired with a stop, so
each one leaves the count one too high until the driver is restarted.
ath12k_mac_update_vif_chan() restarts every vdev that is up when its
channel context changes, for example when the AP changes the bandwidth
of the link.

Since commit 18ae7d0cdd76 ("wifi: ath12k: Avoid CPU busy-wait by
handling VDEV_STAT and BCN_STAT"), ath12k_wmi_fw_stats_process()
completes a WMI_REQUEST_VDEV_STAT request only after as many vdev stats
events as there are started vdevs. With the count too high that never
happens, so from then on every station statistics request waits the
full 3 seconds in ath12k_mac_get_fw_stats(), with the wiphy lock held,
and logs "time out while waiting for fw stats done".

On a Lenovo Yoga Slim 7x connected to an MLO AP, the timeouts start a
few seconds after the AP narrows its 5 GHz link from 160 to 80 MHz and
repeat every 3 seconds until the driver is reloaded. While they last,
channel switches take minutes to complete, transmits fail in bursts and
group rekeys end in a deauthentication.

Count only vdev starts, as ath11k does.

With this change the Yoga went through the AP's next switch of that
link, from channel 128 to channel 36 at 80 MHz, without a single
timeout, and the switch completed in under two seconds.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SIL=
ICONZ_UPSTREAM-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Birk Skyum <birk.skyum@pm.me>
---
 drivers/net/wireless/ath/ath12k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/a=
th/ath12k/mac.c
index 01f8c65..1b46723 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11472,7 +11472,8 @@ ath12k_mac_vdev_start_restart(struct ath12k_link_vi=
f *arvif,
 =09=09=09=09=09=09   &arvif->reg_tpc_info);
 =09}
=20
-=09ar->num_started_vdevs++;
+=09if (!restart)
+=09=09ar->num_started_vdevs++;
 =09ath12k_dbg(ab, ATH12K_DBG_MAC,  "vdev %pM started, vdev_id %d\n",
 =09=09   ahvif->vif->addr, arvif->vdev_id);
=20
base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
--=20
2.53.0



