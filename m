Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4D0CCA462
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 03:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBDv/dTqiVEnzWEKRasuco/mmrDrzRIuItpv/7sGIcU=; b=eW/9EAcBDrrRSJoNJs26eYq0Y+
	biC9lq/OVnD1QUtg3ZIuiS+mvW4W55DZpGkF6pS7iFQhEQ0Z+up8HMcirQLb1WKmWpiitNMwUuZfa
	nvoINT0s88UAkNRzrYMLKr5u7jgdTMSH1CdU98mKXBJ7HtmRWiS6PrZlSy8c3UhBhswluhy8BndN8
	oluXv0jj5DxBhLTiCQKMqqksujKZ2SR4/NK+SXBZ3Saplmpft1Xe7ddXRX0AkOA/b6bz2t99cAzQR
	w5WdGcOCdCaqiQcqcIcWiz06A4PYeXHliVn7kqWftExLe35j0LtIy3AYlHHPJAucfuPZr4+mcWmhV
	Ck86QeYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYWK-00000001pOb-0rCj;
	Fri, 16 Oct 2026 03:22:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYWH-00000001pMp-1DBk
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 03:22:10 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G1BwJ51890489
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PBDv/dTqiVEnzWEKRasuco/mmrDrzRIuItpv/7sGIcU=; b=nyS3D/YCe4ByCqib
	kM2nq7F6rC7b0fNdQ45GGjg4pKUiKGB0iYLad+1SXCE7fszRIu3MW1RyzGwg3P/p
	lCi9Z/+q41ayELgIFiwHqxnF7gRNDsTohW7h9XJinwsRhw/k2/UOOmYmTq0YsLh4
	u1k4I7Z59w6LGqYiWVCy6CIhcRgVgexCNzmswZEt10s9hy3Jq0pRWt14NSSjLyL9
	YoZ47KSvEdfOLph+/jI6anCviaIJQoEm7belqhnWs7iJlmnqrs0hbe6AayHRBvej
	VeJBjc+UA9HBWimDxmLIwNRVEr8i3EoGIZl2QFNv7ajJzFMgputj+yq/gsSAgeuM
	PNEAuw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba260bwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:08 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c3c370b17so7209418eec.0
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 20:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120928; x=1792725728; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PBDv/dTqiVEnzWEKRasuco/mmrDrzRIuItpv/7sGIcU=;
        b=Sds2K/dxvZnJ1nW7IG1hm5NsRYMJ40IZc2fsWcI6AHKCPpi5FJhtvBDts+G3w02Ys6
         ONDfT4UoxoYoQRftsuQSID5q4XcDLxFberbRMu3evKpCIAvWxSk6dPL+ZLaDa/huJ4mZ
         94ug3gG5iGnJpJf6RFxAiF1y5fLnUFgIgzeqlZHKTk2i4wphiRdeEXISMVK77ajj5WrS
         HXhIpE/BvjJArqH/WDhwRbwiabquuQp+mBnDuHd3tH/qdKAE+bNIIlllG+O5WLfJGpcW
         WJAweiiYkaPHjlfhOAA1P1M5T9Mr8hbz9UOwPYYBinRc2siGMapxnO47YA1XhJOQSWC9
         McDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120928; x=1792725728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBDv/dTqiVEnzWEKRasuco/mmrDrzRIuItpv/7sGIcU=;
        b=cR5R1K/Lbub9VwkJStiEWU8tLpTzU19bSwY2MfclH5qihFeUNCUAKjULkm+VqMGvSQ
         mrgWXI/xb51OShuajwvgAkWeGn/zg9YLibo+keYfnYk3YmFP3EqtakI9HpUc3kHcV0/b
         f4V8oD+pWmV/3VRhJPny8vAHBE2GmCRp+dT5SW5YgJ1+mJ9m5hsMyWFax8vUVoKi/y1O
         2YVPz4aaHEBOYRDxJJKoDE4r5resGON+dTUz1NZSLz/XpeBc1gXoNQ92Lvobx5qXJOyj
         EEEQEl8Y8zTRFH6N6uRUYnqAXY1wtJkgaA3UKh16UOmflenfHw6IW1WBCfCenTcymNja
         EOCw==
X-Forwarded-Encrypted: i=1; AKwUvBz7jb0bU89lz8SE6hTCaCpn+JHwzAJOFbuuKJj0CGeSh3/fjoI3S1UMOSzF/r4y3fixnmeqjPc=@lists.infradead.org
X-Gm-Message-State: AFq9FYKFuIoQ+m/iwkuuvGiTP3NCUOWcfIEKOfIZhY87566QQM+pdp45
	ARurRdmjdYQL0FpGU/wV70vc/GErgqA1v/iui5XjLEec/kbGrnpVwUSvjVKgWpDSOv+e6GCYbPq
	1h0Bz+4lHL8Ef4FuhuPNpHTEc8SZ0mTlhimTmPGp6T3SQcjfWEUnwwrBmVCUsSm1b
X-Gm-Gg: AYBFou3gNRbr6MC8v+6wiz0vfNqKaIwW4HvoD/15eqroL6sHnk+GommlTH3LubRHHQD
	RTuPuBKdZscGmvQ5jlr+8kTCb3fFV15JbMQKjvyaQXYItDdU3QGMLqREWO/mkLCw47+zR11r8Bm
	V3Red9bPk4mgq+iRhSekbjuq/LgerfQz21/qMq8jFkYDJtIRN3RhjWcp8U6ZDquvPef71ckbNpL
	b7vB3DexNDvePbTJBIFCykmMDZ0oA2KBHougRG0mGvrFJG4+5jQ76xJ6rYbDPwTj9R64+y2tsZx
	WBVDfa0rGB0FadItwjRv4eMxLvrBRcch4H7fS5Dk7oAO3d1NdzWenwBsUBEDpDkhas0Z/Ug1eLY
	H7ZKRMfJrMzNvwj0j5q4/uVEK9j2kCE1IYDbO3ouRQKiU6e7djDw8muu4wjC9uxUxGL0AA0SNbR
	zmnTeNXAatwwT52PayuAlD1w==
X-Received: by 2002:a05:7300:e9d6:10b0:354:1db3:674e with SMTP id 5a478bee46e88-3541db367f0mr30095090eec.6.1792120928012;
        Thu, 15 Oct 2026 20:22:08 -0700 (PDT)
X-Received: by 2002:a05:7300:e9d6:10b0:354:1db3:674e with SMTP id 5a478bee46e88-3541db367f0mr30095052eec.6.1792120927321;
        Thu, 15 Oct 2026 20:22:07 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:06 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:41 +0530
Subject: [PATCH ath-next v2 04/17] wifi: ath12k: Add hardware ring mask for
 QCN6432
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-4-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad19860 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qBdOBzyLVJzNEwNtDhoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX+qOX5EkPNXoa
 lnnpGTtCBbtBoRBQikS5ZDrTemCS22HCw4jtZf45D1cxQ8SY84xUWH9MIEE1dVA0LNkA5qDf4eI
 Zvq/8UGnhakDY4meLv7shbGEYkQNjiL89Y//iGLSsGjwkFI0NgJPLpl+I2JyrV0s6FfWhUv9nUC
 pxEbu4+acPW6PbyxxY/lreONc7lPxZ/2awQlbIgfBLF+Mgrbx4rBgWaTAhE+y3kMz7x5OwgO+hs
 uNHXu2weny6Cn0G9mXC0KDPgf41p4xftu54AftkH/iI8G5CpM+W569rfsJOVOenYIHa2LUpLKrk
 952Pd+Mssd/nMVWNWbbdq1OLLX5TXdEVIgrz60ZdX1JEDV7aClmkYJaraRq/vvBppDXhe6+90Tr
 NGb591LW8lJCdjR+Tllwk3sSFi2rfeWi2Ar7IBpuk4CNjh/dcIH460QgmLBQdiWMXIO2576EeS+
 Sdf+0qGJhVwgGNazskA==
X-Proofpoint-ORIG-GUID: DXO9OGuYYze4jAvDL8KNuwxc_illj8AJ
X-Proofpoint-GUID: DXO9OGuYYze4jAvDL8KNuwxc_illj8AJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX/gyWK0VRwD4K
 aA2YG5NzCeR2TWvr4tjchylZt3kHmuYOQX/0nH5NSA9mcFUYrXmyt9z3JxgwBtRikllQVP2vR7Z
 BPBEnzmcwXfiJchU6e+xrMQHMp6ZAnY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_202209_348508_2D8A210D 
X-CRM114-Status: GOOD (  13.87  )
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

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Add hardware ring mask configuration for QCN6432 to support interrupt group
mappings for various hardware rings.

The QCN6432 requires a different ring mask configuration compared to
IPQ5332 and QCN9274, with support for up to 12 external IRQ groups
instead of the previous maximum of 11. Hence add a dedicated ring mask
structure that defines the interrupt group assignments for TX rings,
RX rings, RX monitor destination, RX error handling, RX WBM release,
REO status, Host2RXDMA communication, and TX monitor destination.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h       |  2 +-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 52 +++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 52558dd126a0..833aa6d43ce4 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -127,7 +127,7 @@ enum ath12k_bus {
 	ATH12K_BUS_AHB,
 };
 
-#define ATH12K_EXT_IRQ_GRP_NUM_MAX 11
+#define ATH12K_EXT_IRQ_GRP_NUM_MAX 12
 
 struct hal_rx_desc;
 struct hal_tcl_data_cmd;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 494c7b3ae1ac..616ff695763c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -332,6 +332,56 @@ static const struct ath12k_hw_ring_mask ath12k_wifi7_hw_ring_mask_wcn7850 = {
 	},
 };
 
+static const struct ath12k_hw_ring_mask ath12k_wifi7_hw_ring_mask_qcn6432 = {
+	.tx  = {
+		ATH12K_TX_RING_MASK_0,
+		ATH12K_TX_RING_MASK_1,
+		ATH12K_TX_RING_MASK_2,
+		0, 0, 0, 0, 0, 0, 0, 0,
+		ATH12K_TX_RING_MASK_3
+	},
+	.rx_mon_dest = {
+		0, 0, 0, 0, 0, 0, 0, 0,
+		ATH12K_RX_MON_RING_MASK_0,
+		ATH12K_RX_MON_RING_MASK_1,
+		ATH12K_RX_MON_RING_MASK_2,
+		0
+	},
+	.rx = {
+		0, 0, 0, 0,
+		ATH12K_RX_RING_MASK_0,
+		ATH12K_RX_RING_MASK_1,
+		ATH12K_RX_RING_MASK_2,
+		ATH12K_RX_RING_MASK_3,
+		0, 0, 0, 0
+	},
+	.rx_err = {
+		0, 0, 0,
+		ATH12K_RX_ERR_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0
+	},
+	.rx_wbm_rel = {
+		0, 0, 0,
+		ATH12K_RX_WBM_REL_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0
+	},
+	.reo_status = {
+		0, 0, 0,
+		ATH12K_REO_STATUS_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0
+	},
+	.host2rxdma = {
+		0, 0,
+		ATH12K_HOST2RXDMA_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0, 0
+	},
+	.tx_mon_dest = {
+		ATH12K_TX_MON_RING_MASK_0,
+		0, 0, 0, 0, 0, 0, 0, 0, 0,
+		0, 0
+	},
+};
+
 static const struct ce_ie_addr ath12k_wifi7_ce_ie_addr_ipq5332 = {
 	.ie1_reg_addr = CE_HOST_IPQ5332_IE_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
 	.ie2_reg_addr = CE_HOST_IPQ5332_IE_2_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
@@ -925,7 +975,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.internal_sleep_clock = false,
 
 		.hw_ops = &qcn9274_ops,
-		.ring_mask = &ath12k_wifi7_hw_ring_mask_ipq5332,
+		.ring_mask = &ath12k_wifi7_hw_ring_mask_qcn6432,
 
 		.host_ce_config = ath12k_wifi7_host_ce_config_ipq5332,
 		.ce_count = 12,

-- 
2.34.1


