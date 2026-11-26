Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFBE60A2608
	for <ath12k@archiver.kernel.org>; Thu, 26 Nov 2026 09:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3x6w5FzF;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DpieXgtt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CCa85BMN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eJnnvQ5aLDsD97522fKzkf8jFAq8ARUXVpXmP0iy07A=; b=3x6w5FzFUmdlqF
	8uoMx2tcZfVcB0Bc1Y+hAMETrPkS8jGiNokW3dNtrnnGhcJPFN31F1G+wyirmzoaAiZZEnQyl0tAL
	LyjZggWVGUkRBMLz6+NSr6FLhCY6TXLozuyKTzvtOKe5+MSdSlPP11rdmEdWVQ799wHm80nhwf8fu
	4NywBb5nbTvgWVaEGW/jMlmDqs3t69q0Gj9S1BSfkHiSU7K3DlLRFxGHF7enMOHCj0Ig6yrERSdAC
	NFsdtPXIy4jUBdhjop6Oy7fj29C/5uj4nonQSB8VoPFwirO1jEblfuatkk9zmgTjht+M4eZkZFMpp
	ticrLHtKbrINNEtznAig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVf9-0000000CX3R-0fsZ;
	Thu, 26 Nov 2026 09:21:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVf4-0000000CWzx-1bY0
	for ath12k@lists.infradead.org;
	Thu, 26 Nov 2026 09:21:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8NYpj2860076
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 09:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eJnnvQ5aLDs
	D97522fKzkf8jFAq8ARUXVpXmP0iy07A=; b=DpieXgttU48CowZjrVSLWlpN5ig
	61tA8QpPZbpJ1HxPr+GfOuAXVdQ6SMlWoDkAa+qvxe22P0fAdz0QxNjZDuwMkKjA
	KzIkt4OeokSaCTv7TEzbkxnsV3rJy6l//ZNIgH7AU+mqTgy2o3i1AYGjjzbcUxek
	DB3hmw1vdHzHo+RlEsPHX90/i8HotWxDH4TqxwkxA3aHrcvFDyjUSz4swk1+b6SE
	+mjnNWa8nKQTNk6NDeoRYU9TRN+BKYcL+6sqiqKwsNtsB1hTmNhjSwtYoFAbcDZt
	g4daWwYR+Poi7WPCnNkIuiqCDMxY4It5ZXFeihds2O8XDDn7m9CV84VnXxA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g87ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 09:21:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a065d0e9deso5800439b3a.0
        for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 01:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795684860; x=1796289660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eJnnvQ5aLDsD97522fKzkf8jFAq8ARUXVpXmP0iy07A=;
        b=CCa85BMN19y8OZCUYSfiqyhKtxMw5du4f1ODGwzU30yyI5eFOFYmacHADeEGXveb4b
         yAhwL1vtAI9t+P01VH7ZhtBZxUuy+8d2XxznvDxGGVgcNqzJWoksN1u5gA9W03+FnkNf
         1ccg0F+0nrZQL/e/UFmNW6iAblkVc0pO1OSUXdgJmxHu5klueyCkJS6GCXPQ5CXa5cZC
         y0Tg+GvkLBNPIHGskSUaEepeaMhNMZz30IXtcUzlx8VhHdPNoa5QNbSFl3CodqNXyhti
         9Cs+hNeG9m+3AJW1KhAmdYaWcAVxsTkGfhulxfh7FSk1EERfjdZ6jV0VdKB2O+xIikgs
         wlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684860; x=1796289660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eJnnvQ5aLDsD97522fKzkf8jFAq8ARUXVpXmP0iy07A=;
        b=Ku3JxZ0fz1JBV9oyYboath/wEvsmI4k6Fl+dSGnuyT2VF5JFrQ/6hD2Y8D4E4K1ETX
         0AqLtbaFWOzlMsayLpbk74ZDBKt7u7Jm9f+XYBi0ewKXYsoBAuSlfx9bllLkdrW8ap7q
         6LJ8q+74pyUFVqII9o+Zd+YH38evKSls41/CWHuNA0ug7UcQFCyoKxuu23aRl67+IuAh
         4Uk0u+AfEkxPmS0TAR7GCCp5KDGQJHXrDzX5mjsBwfKQTjy0CNhRVZP6H04/ttF77s25
         6lyTgxfyw2j1v25yfhxlaEGMPQTYVKXQvK6sJs9hM//WntAz36Pa692rumlxnubYL2RB
         hBrQ==
X-Gm-Message-State: APuU4Z/7L47+c3MuoJmjKcumPoQUFlW+6bn30wC9PrKVCyxCWLYdPFf7
	kINkIhCbY+KgLcwANGmXBO2ooUl0VCTr1YmYUTPOfg61IBVJ+sW4p61/m58ExwjW8UzS06Y/5KF
	8Wwyb+Uo+sv38MBEu0XFbi+VC0vmWlkkihClVintDQK6D01tJWIiXdOA5EeENqPLN
X-Gm-Gg: AZFdTZe9XbD/loi81NSSl51DUBVzL+kGufM4JeO1qZ+LorgkoCIr09kyhHJS0qEK0ID
	ztDcRe05PT4dCbhu69BC/bSh6GI/5yIhi0WZz3cNDq0fB+dQEqs4PEGBh5lH0Mh1LuWiSVPxwqk
	fbwVqSGn4XAUEsBcK0FgoECMnMW3C/iY714UVnu5P9vMpDUdpgAfokU+tbe5ic+kqDPCIazCa2i
	yNXVVG191Y8YkzMR4YP2Vix9J9BCbSSRb2H8jyE4TRMVigQOj1mKa15LVQ1lCZIEdqh6q5p8bug
	f0H5R4EyCcCLxhcCgUh6cUGveKLUyl2sy9qVuWteGePjFs3DOa5znPG0Pu/xjrTeRz5PquywU9T
	djTvjAzJ6I3auFBIOY90uSS49URlFsFd95sHlh0pAEZOneGxwQRp4K4GJ98S9hiWw/POkykRiuo
	TDt+C5gpym8icFh+wSEeKRkqXVB4t9PCg=
X-Received: by 2002:a05:6a00:1492:b0:8a0:5f42:a482 with SMTP id d2e1a72fcca58-8c7de587185mr14794953b3a.43.1795684860360;
        Thu, 26 Nov 2026 01:21:00 -0800 (PST)
X-Received: by 2002:a05:6a00:1492:b0:8a0:5f42:a482 with SMTP id d2e1a72fcca58-8c7de587185mr14794930b3a.43.1795684859810;
        Thu, 26 Nov 2026 01:20:59 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm10752089b3a.7.2026.11.26.01.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:20:59 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 4/7] wifi: ath12k: skip links without channel context in ath12k_mac_get_vif_up()
Date: Thu, 26 Nov 2026 17:20:34 +0800
Message-Id: <20261126092037.462830-5-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
References: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: EpSRYsy6uDcgugAybkI__1ryDOCSbjJy
X-Proofpoint-GUID: EpSRYsy6uDcgugAybkI__1ryDOCSbjJy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX6ocfplX5u84D
 Troyn6mOZIznOE/NyTrDHiZONqCkoemlvOl5RQ5OYSvyShhnXe45E28PqfBGZLCFp0kAbc3nMdt
 GJ8pfTdxFiFyc8Qd+OP9/OrrDMIDS2EOyaqE5DxMNEkrkrOuYmw2hWdjIwlAHWD82bNA7NMBCmr
 WRRXslZ+bmojf3Y4gT37ImSSvRzoiZcOaNmhJt3ulxsDiw06SNP+XDEnyIZebZl3yqZu90EqejY
 Y7x2yl9OzTIJgjNF0/mBDpT9CqBSzp1cuBPD5Hv6BjC5W6KT5fC5mR2n1ry9iAkzMlrBTbnQzol
 9ytDP7An4Qxo5h5sQiseI/zc/HjSzLSd/9KQP2ZVJM83yC0l1gciNTxLaUEj8ws+OKLtgsB0sII
 lRTpmcibARp8RRtry0fhPh5QbDhbhbL2Gh6/jfsExkju4gSx3c0ljsMfRxae/uMe/cGSQPgcEC+
 27Rco5HYnMll6Riff2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX+5QKjDgXFbux
 Ou0op7VAeN1fXouwJPAnYRnN9S85fpNP20KKNTzVE7MdiDAT2tk7pBlEdrVlbFUXwOHnyWmP7jT
 f4abKyYARWL8SZLmsKeszjy0K7GbzBw=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b07f9fd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=gfZQdUK8Rj-w2-3WJ4IA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_012104_447223_81F7D282 
X-CRM114-Status: GOOD (  14.79  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Active-link deactivation releases the channel context of a link while its
vdev stays up in firmware. ath12k_mac_get_vif_up() returns the first vdev
that is up, and that vdev is used to derive the target pdev. It could pick
such a deactivated link, and ath12k_mac_get_target_pdev_id_from_vif() would
then find no channel for it.

Skip links without a channel context in ath12k_mac_get_vif_up(). The
WARN_ON() in ath12k_mac_get_target_pdev_id_from_vif() is kept, since
callers reaching it are expected to have a channel context.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d7234ef9c025..2b4dfef3efb7 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -953,12 +953,23 @@ void ath12k_mac_get_any_chanctx_conf_iter(struct ieee80211_hw *hw,
 static struct ath12k_link_vif *ath12k_mac_get_vif_up(struct ath12k *ar)
 {
 	struct ath12k_link_vif *arvif;
+	struct cfg80211_chan_def def;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
 	list_for_each_entry(arvif, &ar->arvifs, list) {
-		if (arvif->is_up)
-			return arvif;
+		if (!arvif->is_up)
+			continue;
+
+		/*
+		 * A deactivated MLO link keeps its vdev up in firmware but has
+		 * released its channel context, so it cannot be used to pick
+		 * the target pdev.
+		 */
+		if (ath12k_mac_vif_link_chan(arvif->ahvif->vif, arvif->link_id, &def))
+			continue;
+
+		return arvif;
 	}
 
 	return NULL;
-- 
2.34.1


