Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4688DCF9C69
	for <ath12k@archiver.kernel.org>; Sat, 21 Sep 2024 14:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ze5CkP7MQHmwCuO1XBfTk19h4/iqKy8mgsPeFXpqRQg=; b=0x+heUQmpi7OmQuG6QLX+9ZVzI
	9aWvfL9t1L14jPGHOqqhDLk7HCB9qZdfFbNREzBi2P2MD7UfR3dRCgk81TAfD/t4bkWT8v9bA3ZUk
	8irGFjbuPHUCj34cZGAxpt0fOa4O7E61dJuvyjQMVLJLdlR61V3pbL6S9y0gjwi1WZBDNVY3i0EZZ
	yRzJVOnbyeefYnc1B7W0vuOZXOArxZa+zoApfP624zzl9DAcUnjMwnNlq0+5a+ZeOTEi8M6vELvTA
	zn2hDV91hZVEX+oVlPaPGFQ/DqHH4CjsxqeGbRFfRQVIj7OzHbV6rHLl+mQ7uc3W1ieWdWA3UUSK7
	iai3bwhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ss1Kc-0000000Dnlz-3pwY
	for ath12k@archiver.kernel.org;
	Sat, 21 Sep 2024 14:43:30 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ss1KZ-0000000Dnky-3SHo;
	Sat, 21 Sep 2024 14:43:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1726929801; x=1727534601; i=markus.elfring@web.de;
	bh=Ze5CkP7MQHmwCuO1XBfTk19h4/iqKy8mgsPeFXpqRQg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=G5drAkqfR3T4Lzq/W+k4zvI48iRxKH9NhGenbapWZpTC+mRt3vs9RdVJcssk9Vk2
	 u2kS4OSLTf8WNfhBPqoGf4VWPd3OWMXh34CrdaRs8TqyT37myKPPj2OM4OGgKPONM
	 2+mjN73NJobh2mubr4SIZcvwj/9KK9PDDCTs9Kjk7ytbg4TbXGEuHGPvmHq5gp1lh
	 8RxqzGLgSf2cKLnnXtzEhn/iI7AYjS05ub2B4wlpxj53vUsalO7Hy3VO4aID24YQC
	 TgvLoaGMclKcymfy1SJHW+zPZHMgtJcLpy3arOot/FSx9J57l8voTfSjuv7A/kHd8
	 4/NcLCjPtpgX6tGbMg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MtPre-1rxA3C3fcE-014EHH; Sat, 21
 Sep 2024 16:43:20 +0200
Message-ID: <6658a046-9d4e-4f18-8405-f5dadcf410ee@web.de>
Date: Sat, 21 Sep 2024 16:43:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>,
 Kalle Valo <kvalo@kernel.org>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@inria.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] wifi: ath: Use dev_kfree_skb_any(skb) call only once in three
 functions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:y0mbzl/D0kDzSIz9D2uwsK9cknnXkWfSJZHPGL5XJMRJJAIdscy
 +8DFodCZeGr6Wqe7bh7idUQQpYUkJhOR2atAs/O0QSaeUF8eg87hnkzt945WatRXdo1lzFW
 hxGVI0XOwZnVnSWOl8Piok6njIJVA/QPmn5ZOL70Dxzw1D2Js+hET8+H5Ll1DCV8ojMUQje
 hiC/6o05XlXklUeT5k14g==
UI-OutboundReport: notjunk:1;M01:P0:2UyM1PGgl5E=;0iXHIZBz4wWxEax5Cnp5LoA5N3L
 ig9vOrQ27CnYRQczpkylS0WkR9ZigT+00f2fqrRj3Igps62vsdCdEvJ8fFYOBMSXuVAbYnb1O
 ZbphnlosBXm3ZENoWjHQe/Q1B698OHtFjQ43OZJ7X5kEWJUGt0C5xA8pD2UHjyAFxpHc5LD+7
 y5lYpprn72gOJAuURoMFo9p9XByK/2YGDPs8HL9rBtZ9vR1gbwCNpMqVDtPV6WVHQee1suBBG
 DVWjKmTEeU3pz28r6ZsYOk8UAxw9n8uoD171QPtgvGv5K03Rmo5IqkQ2klJvQm2x3w24ad/hF
 bBKaxp2HJW5jn1gClzdI1xnAlcfNKWVqrJZnPMkHqG+/vZvIyvGCmJNjHmJmMvoIAAuLet6vR
 CHGuFM69WsvUGaC5iIK2PCMVIQe29R83TFr0F80QnbzXtJ0lE/5mAD9Ii4wYkjAt109/+MPa0
 gYCCgSf4evynNpmrIswOSZb1izL8MGrGjxd79BZyQS5W1zso+nmOqAxTUYMg+DUri58vPOxch
 YFo69Fe76byWPGJPklWs1hz2Q5Xx4YWeYU75f+jMIv2FrQqI2W3pPIElpwApW/fYh855c9lhe
 hFXwtaDRzpOhdwE7Ukguq60UGeaIF9PQnU+ZRf0SiwIKxli2Vttj5JuvEWAYdHKExwGMNQ5ad
 J3xOJkTsOrzhQQ4nTje15miz+mSMG6OVNfMNMgndEJ2tjbvJ/hxkxD9NoQkeS8Bo3skbwyqSm
 elIvE5mxY2amLC20Sj6vpLL8SamElNcYSd9RJ31JhjTReDkvVnOW+2RUbxFL0xN8WnAKiBxZe
 XF3/1GseKFM4oIS6S/WQdwjw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240921_074328_256551_F323F851 
X-CRM114-Status: UNSURE (   8.70  )
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Sep 2024 16:32:09 +0200

A dev_kfree_skb_any(skb) call was immediately used after a return code
check in three function implementations.
Thus use such a function call only once instead directly before the checks=
.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/net/wireless/ath/ath11k/dp_rx.c  | 6 ++----
 drivers/net/wireless/ath/ath12k/dp_mon.c | 4 +---
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 6 ++----
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireles=
s/ath/ath11k/dp_rx.c
index c087d8a0f5b2..eb8e5fbdd77a 100644
=2D-- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1808,11 +1808,9 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k=
 *ar,
 		/* Free up all buffers of the MSDU */
 		while ((skb =3D __skb_dequeue(msdu_list)) !=3D NULL) {
 			rxcb =3D ATH11K_SKB_RXCB(skb);
-			if (!rxcb->is_continuation) {
-				dev_kfree_skb_any(skb);
-				break;
-			}
 			dev_kfree_skb_any(skb);
+			if (!rxcb->is_continuation)
+				break;
 		}
 		return -ENOMEM;
 	}
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wirele=
ss/ath/ath12k/dp_mon.c
index 5c6749bc4039..21780f06b4ae 100644
=2D-- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -2102,16 +2102,14 @@ int ath12k_dp_mon_srng_process(struct ath12k *ar, =
int mac_id, int *budget,
 								  skb, napi, ppdu_id);

 			peer =3D ath12k_peer_find_by_id(ab, ppdu_info->peer_id);
-
+			dev_kfree_skb_any(skb);
 			if (!peer || !peer->sta) {
 				ath12k_dbg(ab, ATH12K_DBG_DATA,
 					   "failed to find the peer with peer_id %d\n",
 					   ppdu_info->peer_id);
-				dev_kfree_skb_any(skb);
 				continue;
 			}

-			dev_kfree_skb_any(skb);
 			pmon->dest_skb_q[i] =3D NULL;
 		}

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireles=
s/ath/ath12k/dp_rx.c
index 91e3393f7b5f..c0b59ac247bf 100644
=2D-- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1804,11 +1804,9 @@ static int ath12k_dp_rx_msdu_coalesce(struct ath12k=
 *ar,
 		/* Free up all buffers of the MSDU */
 		while ((skb =3D __skb_dequeue(msdu_list)) !=3D NULL) {
 			rxcb =3D ATH12K_SKB_RXCB(skb);
-			if (!rxcb->is_continuation) {
-				dev_kfree_skb_any(skb);
-				break;
-			}
 			dev_kfree_skb_any(skb);
+			if (!rxcb->is_continuation)
+				break;
 		}
 		return -ENOMEM;
 	}
=2D-
2.46.0


