Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261D5606A888
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 06:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3W0gcvBT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BpxdOl0v;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dszaCtyd;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gs9Ol+95
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=; b=3W0gcvBTNgas68
	N2RxK3qVt+ZeHg6t6E/H7nuxMMpqiu221tYfh15qVXnqys/oBQOKMEhyDGzJYinEj+LXLtPMB2zsv
	qxX6pyvg68U15Jmz08M8F9fFPplJ9rHYbRvm7RK1V4mzeiNrWwy3txvDzIoTJZj80+Y8nyf7lzrSo
	XbTdUZ+3oqURIkb+FxK52TbIkJNq6hjow61XVXwm3b3fFtveuXb0DkkHhVGxWqLYSJDPEmG+v96fE
	IYQT3zYLdCuKWUurTmze04HZ2BNMMDziYbAwWAX74+0diWdKBeqvFAvsGQdPQLlihoxfjrYkpVcZl
	IIMPc3p9kes4XLfWAoFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ29-00000007sEi-3Tx9;
	Wed, 18 Nov 2026 06:20:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ28-00000007sCv-0lX6
	for ath12k@bombadil.infradead.org;
	Wed, 18 Nov 2026 06:20:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=; b=BpxdOl0voNtaNTaoOAkD4q89L/
	RWNYInz16u2Ns2rkGHWp/3epILBJ5zApIh1f3bDaRnpL3gYhiczGRJAxIaMjZ3LxIRS/dkEPrHwVC
	S0ysZlBHacd6xZxMD9QaggvsWwd9l9Fm9pC5gCiz3jVUfJbMmBJ6VDKiuvQENY1Y4zcz48HSZ0Ccf
	l/z/9sAgt4Oyi3jwP0zQFdJ6aa8WspZfYF4klke4Tp301vayU/4W8EfYAd11XgYydhnLpylElRXXw
	fidk4WCaeijIPqIHE965lGEnK9GNxUfJJFH4x6HcMC2YrPAO9H497OzkYyuq/K7u3JwtxDBgGcZ9G
	55c8cHPQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ1u-0000000Fgqg-1CFy
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 06:20:38 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VBPV472838
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=; b=dszaCtyds8GmMzRu
	NqD6eCTgNjKoLD0nH7upIT1h1ntWT6epLgYzGDty0aregqwoDkWmhB6/5MpuJ80w
	s+15kvbwQX8Y3Ue6DE0GQr4KgZSo1ItfsZUQrEnHP88PGqByHXjvyxn3lhJjKBhM
	5kqK460fUsQ9/ydIzndcUmWNLRgvOYHYfQGV+LfwBooW7q7TmLcrXtDMcunAwBBW
	TVje+G1iha8VjAN5jpc7qA51QPsLQq3GJ/Lo3rhIleNBWTRl/BlJmL84+jwY11Tq
	ZfSrzps7LX3mH6qsRfHiLwmJWZzqYKxlPEuh0o0gWys4DsPisHJ+/rJlzEqgWDUx
	TLo6FA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv89gm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:20:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso691506a12.1
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 22:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982823; x=1795587623; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=Gs9Ol+952yg/EGU4qODC5gI7U35bbZmylu9j1um1jP788jraucpJihjIhZWJXnnZ5F
         b9FS+iP7QwKRd2gZvTtMDG0x7VQBvYn47+4CYtGZfc57qdMestHiHctSKBl+uvRoQ49s
         zuCSBg1Nb2vChEcGV0DGereJDNLOLs+4c5XApxxCbzufWyFP2/EnmVg70Ehfv1HiEnEZ
         Q3EXo2fSd7BkOHzOrlIPwHzuWyjGVpR+3Ksw6YrKz75v1RmnLDqtMGUBlunlzrlwvzLN
         DzZp39NTnWYXbG1BdDmM2HThVmPM4Nr80p2XVWZMAN0ykHPHvCt714O3kglnxdGAjOtP
         mkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982823; x=1795587623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=le+TxiyW68lUkHPfD77p+yRQw/5QqyuL4/GScD2BYMiIbL+RhcX2Xh7Msm5g8yhQyf
         1MFffUFvBCiLnagPT2NAWmQEx+c47UyyykXeGEJE8L+iIIivvrb4smml0GW55KiMCNQr
         DJl6tbOnAfajMiXnc49bqyjeg8Aq7vB/dvy+rS3b0YlXG0/L4bm//mHJQdeMLb8KndXp
         oLzi3ruXXk/Qhe0uadMTlYs9CdozHyWHc5fljDBCJzpPT/+DhwxONhw0PwuXwf8VyQnj
         EXtC5bWpcENgyUB6IbyT8SO/yCWJGiRQHT5U4yn/ufwyks2jfuRSIHr6lj7KzfS2sMv3
         /NzA==
X-Forwarded-Encrypted: i=1; AL+hErF3IMRdHf7CLSF2HrQW/+piE2WCRwByGEGpT6QPBKARMf2PwBHeCrzFZL2DtxvsJBYkgdjDmAQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z+sI4EJPssPanOciFVJfFC7enBUKdk7hY9EdaZxPAI3FU8To92i
	ZNELLySlqbeYr/DUKS/jIlcxGmR19QKb4pW4SY6vA8PxNQfA9LZSmYYntCok6J5/BD5osK9KW/w
	fe49J/EC9sOswFsBiHTHr1rwiJJD74PqVgcW89h5FdER73Bw6AJ31fz0FvZFLbc4f
X-Gm-Gg: AZFdTZck/QHXKJcVjpebkY3laX8N0TMa0+iQKNHVfwIGDR6qfMr4Qd4xrUSSCykIeYj
	AJx2z54PMMfhEQlldf3b9wxerx53uT5v+UpXGu2ehBzEe2Pd5hqADu7Svnl0ByqVu3dDGYvlU3b
	0TjTwldu6d5wlXyZjGukrCylTx3mMUMr6dOpdTVFmmyHaOFhlTHK1S65UTurp1fV9Nx9vZ0y1GH
	fU4pmxzCNviuo2IHmeoXjloJ6FFhTGhlb4vt1rP+v/SJ8gDplK1KVaEBiPc25nnNrRGM7mEoqOU
	cswCkyhlzJi9Qc27Q5Uie/UBeE61MYaGHYrzAAPNM2KqjjOdwIB0FmzgsgZy9T+ow7lp+Lll/8q
	+dB/jJEKw6qTRRI+37K/0CV0cyDZ45w7HdT1uv8x2ItnlJqChwbUL1pHPwMPA1nrcAhfiKSqq5e
	ojR6c5KyVQzOiyPSVz4gsXN2XCEYKvnROy6txpRIZTXPLXY+IsJZQMfCg42V+uiw7yFD4CzmjQf
	rY=
X-Received: by 2002:a17:90b:4acb:b0:3b0:9317:5842 with SMTP id 98e67ed59e1d1-3b3d07b08a8mr1866334a91.48.1794982823184;
        Tue, 17 Nov 2026 22:20:23 -0800 (PST)
X-Received: by 2002:a17:90b:4acb:b0:3b0:9317:5842 with SMTP id 98e67ed59e1d1-3b3d07b08a8mr1866309a91.48.1794982822752;
        Tue, 17 Nov 2026 22:20:22 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:20:22 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:17 +0530
Subject: [PATCH ath-next v2 14/15] wifi: ath12k: add and hook Wi-Fi 8
 mac80211 ops skeleton for QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-14-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: OFIywGzMIIrbuUk8rXV-mH0tXLjqMa51
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd43a8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qlncVs5R31ZIVvcfge8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXwdED/dpl2Pvl
 ssXLa0AtnSzsJD/rjiNwsXMHPSKApkTn+UCC7WRDwR4JHlTJOtXjs8qqKzXclT9uwSryvTxWGdo
 4x0k76+wGFWuZV2Dlv1G4eOj0kQSWGbTVs9jluW45E302OAB9VXma26XHr2Vx/M4D623diQYZ5F
 KCcjTiBJigPOVcG0X3zsRZOrXPWKamjf/dZnZFb332M7tSoaM4/HHJweyaz1bxqKfkbyjxyunOP
 USieiivOaZ+Jn++fM11lNyWGlaYX/y3yVThe+wmPlXQw+tki233KK+AoFN0shyumdYp7zt1C8Fk
 zJLaztzD7W9pGjsOVNgEXsAO4S90KxrF2jEzcdcy+dDC+kmGPd8usSRR43UIPklIfWFj8P7Fq7g
 9LKUD9t+9GPtBCCuu/5YhziRMtVIg3gRVOYWx2EpF66R/24eX0no/F4Wq+32mMZ5VvdsrmywF4d
 klDYxW+u15sgS1lq1QA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX6tM4U8pyhG7M
 f3z+t20253L7ruZ5MpsRaDIVbCqWEJBsirHWHhoq6/fo0269/5ua0fnYB7yq+AwYd/iHBqaNzuh
 DZOMjgoOd95wWb1aVJvXM86ZBowCD2o=
X-Proofpoint-GUID: OFIywGzMIIrbuUk8rXV-mH0tXLjqMa51
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_062027_090120_22D46D98 
X-CRM114-Status: GOOD (  13.88  )
X-Spam-Score: -0.9 (/)
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

Implement an ieee80211_ops skeleton for QCN9575.

Add ath12k_ops_wifi8 in wifi8/hw.c as a dedicated Wi-Fi 8 ieee80211_ops
table. Introduce a stub Wi-Fi 8 TX callback (ath12k_wifi8_mac_op_tx) and
reuse existing common ath12k_mac_op_* callbacks for all remaining mac80211
operations. Hook ath12k_ops_wifi8 in ath12k_wifi8_hw_init() so Wi-Fi 8
devices use the dedicated ops instance. The stub TX callback is a
placeholder; a follow-up patch implements the QCN9575-specific TX path.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/hw.c | 70 ++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 92c897de16f4..30188f4fae02 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -10,8 +10,11 @@
 #include "../core.h"
 #include "../ce.h"
 #include "../debug.h"
+#include "../debugfs.h"
+#include "../debugfs_sta.h"
 #include "../hw.h"
 #include "../mhi.h"
+#include "../testmode.h"
 #include "ce.h"
 #include "hal.h"
 #include "hw.h"
@@ -152,6 +155,72 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	},
 };
 
+static void ath12k_wifi8_mac_op_tx(struct ieee80211_hw *hw,
+				   struct ieee80211_tx_control *control,
+				   struct sk_buff *skb)
+{
+	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+
+	__ath12k_warn(ah->dev, "wifi8: tx stub is a placeholder, dropping frame\n");
+	ieee80211_free_txskb(hw, skb);
+}
+
+static const struct ieee80211_ops ath12k_ops_wifi8 = {
+	.tx				= ath12k_wifi8_mac_op_tx,
+	.wake_tx_queue			= ieee80211_handle_wake_tx_queue,
+	.start				= ath12k_mac_op_start,
+	.stop				= ath12k_mac_op_stop,
+	.reconfig_complete		= ath12k_mac_op_reconfig_complete,
+	.add_interface			= ath12k_mac_op_add_interface,
+	.remove_interface		= ath12k_mac_op_remove_interface,
+	.update_vif_offload		= ath12k_mac_op_update_vif_offload,
+	.link_info_changed		= ath12k_mac_op_link_info_changed,
+	.vif_cfg_changed		= ath12k_mac_op_vif_cfg_changed,
+	.change_vif_links		= ath12k_mac_op_change_vif_links,
+	.configure_filter		= ath12k_mac_op_configure_filter,
+	.hw_scan			= ath12k_mac_op_hw_scan,
+	.cancel_hw_scan			= ath12k_mac_op_cancel_hw_scan,
+	.set_key			= ath12k_mac_op_set_key,
+	.set_rekey_data			= ath12k_mac_op_set_rekey_data,
+	.sta_state			= ath12k_mac_op_sta_state,
+	.sta_set_txpwr			= ath12k_mac_op_sta_set_txpwr,
+	.link_sta_rc_update		= ath12k_mac_op_link_sta_rc_update,
+	.conf_tx			= ath12k_mac_op_conf_tx,
+	.set_antenna			= ath12k_mac_op_set_antenna,
+	.get_antenna			= ath12k_mac_op_get_antenna,
+	.ampdu_action			= ath12k_mac_op_ampdu_action,
+	.add_chanctx			= ath12k_mac_op_add_chanctx,
+	.remove_chanctx			= ath12k_mac_op_remove_chanctx,
+	.change_chanctx			= ath12k_mac_op_change_chanctx,
+	.assign_vif_chanctx		= ath12k_mac_op_assign_vif_chanctx,
+	.unassign_vif_chanctx		= ath12k_mac_op_unassign_vif_chanctx,
+	.switch_vif_chanctx		= ath12k_mac_op_switch_vif_chanctx,
+	.get_txpower			= ath12k_mac_op_get_txpower,
+	.set_rts_threshold		= ath12k_mac_op_set_rts_threshold,
+	.set_frag_threshold		= ath12k_mac_op_set_frag_threshold,
+	.set_bitrate_mask		= ath12k_mac_op_set_bitrate_mask,
+	.get_survey			= ath12k_mac_op_get_survey,
+	.flush				= ath12k_mac_op_flush,
+	.sta_statistics			= ath12k_mac_op_sta_statistics,
+	.link_sta_statistics		= ath12k_mac_op_link_sta_statistics,
+	.remain_on_channel		= ath12k_mac_op_remain_on_channel,
+	.cancel_remain_on_channel	= ath12k_mac_op_cancel_remain_on_channel,
+	.change_sta_links		= ath12k_mac_op_change_sta_links,
+	.can_activate_links		= ath12k_mac_op_can_activate_links,
+#ifdef CONFIG_PM
+	.suspend			= ath12k_wow_op_suspend,
+	.resume				= ath12k_wow_op_resume,
+	.set_wakeup			= ath12k_wow_op_set_wakeup,
+#endif
+#ifdef CONFIG_ATH12K_DEBUGFS
+	.vif_add_debugfs		= ath12k_debugfs_op_vif_add,
+#endif
+	CFG80211_TESTMODE_CMD(ath12k_tm_cmd)
+#ifdef CONFIG_ATH12K_DEBUGFS
+	.link_sta_add_debugfs		= ath12k_debugfs_link_sta_op_add,
+#endif
+};
+
 int ath12k_wifi8_hw_init(struct ath12k_base *ab)
 {
 	const struct ath12k_hw_params *hw_params = NULL;
@@ -171,6 +240,7 @@ int ath12k_wifi8_hw_init(struct ath12k_base *ab)
 	}
 
 	ab->hw_params = hw_params;
+	ab->ath12k_ops = &ath12k_ops_wifi8;
 
 	ath12k_wifi8_hal_init(ab);
 

-- 
2.34.1


