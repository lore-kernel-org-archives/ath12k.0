Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CFBCA600B
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 10:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wa7DmZ6ssigABhc5h5OgPyDj2/OGW3Y/6mK5cRprqeQ=; b=eGs9dxVT8GUBxAzGp3oKaOsrc5
	VAtEPYIWF8ClySjukI0U1lHEFH2WI7DZIejiRJAa0McBJ+lO1g8i9uhDX+uH+Y/VJ3s5m4n0fmup6
	mCh2ne1K+2ZyAzkucEa1W6SU4cOD0dm0/78W9QE32dii92hQKJIbg3oOzqKbH2hm/BC9uxaWtqRGR
	wW+1q/BRrbZ0vr3p5uDca1sla2rUKH6/U4XHvhd9VzNwG18BR4GIavFsapuPM1XE1dD6qQwB3BVVq
	PswY9uluSlrhTIiX0RnM/LOSL9zA74PC5xdcx7RWge2RKv9lI2wNliEPSg9fH088auYW9XsW2qo3P
	SVCjg46w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElIf-000000046EA-2H2f;
	Thu, 08 Oct 2026 10:24:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElIY-0000000469p-1rNV
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 10:24:32 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KZLJ1170059
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 10:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wa7DmZ6ssigABhc5h5OgPyDj2/OGW3Y/6mK5cRprqeQ=; b=GJNU2cHVGO3OPef+
	Ku0yIzdByH/lPiwxowruCtBLrFkptUk03FtqS8eLLlIfWz4Gjeyzk4dYOx5jFCbm
	aXn1C2zieZtBAm3/wz177j2IqzQuLiNEciojVWp7rK5LukyUJ8dzrqB1kgo7vGy6
	fkyd5Y0uubcsAhN8hujibSwSD+H8FEeGfr1emSLWPADQFWOLjp2R/uwz/UEVE6UX
	4AO31WJX+WuJAi5cWQKcJdv6uU394tTiNs96NZyZXstKHj3axEGWv+iVM3tScdm7
	LpXjjfMxLIfz1yr0eLHbXldkyWU5X59X0UbmaqT8d4vk2vpkMmpCOzwHXgyXs7I8
	m4FXhA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3adjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 10:24:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e6188d1e51so16231485ad.0
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 03:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455064; x=1792059864; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wa7DmZ6ssigABhc5h5OgPyDj2/OGW3Y/6mK5cRprqeQ=;
        b=AL3J0jjYw1Zrryuf+Gtq96nh+iLGtQm/9QUveM1/b7vyJnKVHr2ud0rMykOHLnzAcP
         14pep2RDjQSLSEtgf7m+NFjugM0EeLn9Ha37leJ3C0P6tsnIArACci/8BZvDcPF+jWlf
         WfbrU74vGwxE0yUAuGgW5eINKVTlm6kp2eSSMSIbCAZXo2oAjAdwFAlY0xR68ucPBMcw
         k422+St8bjAXFB4FxtvqbMD8pR5iKCZ0O/VlnYYBpR8OlZ6pvRHuPOTnn81oyjCnG/ex
         FrJL0NbHDYzQ8r+y2M84dO8D6DBhfLTLk186ggnGPu2gRuxnm04bjxaVhwuRfZm2Gtfm
         sXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455064; x=1792059864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wa7DmZ6ssigABhc5h5OgPyDj2/OGW3Y/6mK5cRprqeQ=;
        b=SMc/rt++5R8nDkV2/U1h0xDoe17Tsf17cRwU2r9CTY1uSGJWAYE6vdatx53hqFFNSY
         vyX3EwApVnh+X23CsnDnvKelSny9Hd9HLwXxbsFzwrcEKcRafl1O/JEv/xoNBo96WEy9
         UtIZNAJUDBPteGcCtBcl91iiSAyExqTF67kEpYkbHSFRd5M+nYexdjTR31WPOpc6lGdn
         qst4OrHlbZiOKQdBj5On6UgZjwEF4HZzSDmOuvckcEUhheSwbLtXGLz3o0Z2L4TM6aIH
         itwNyt597EPt3+NeDAO0y/Lr0yBjsV2UNpF9s6giz6CiyJvc5aepO44+7WClWKW5DCow
         cGOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOO8qvE1O1Jvbo6S2jSNAlAHQK+NLwjpMF45A+gzxlBKd2lUAz20P7grqN+Rge/M4OGYGEDB0=@lists.infradead.org
X-Gm-Message-State: AFq9FYLdQdIvk3fBYcbmadaq+BxRIB9c62/zw7BWZD4kyXkdaLhpOJ3K
	YyGDvH0/wt0KJdCFiQayHZAlYSRePjLySt/L4C/vylBFoYKro3xkF3cL8gDaR2VVEgW7lLvjnjV
	A7JqvvaAPbI0LbxvE9Cyl0UcUxcXFUNSekB8opnLT14k96GTSrvj28fo6Xt6vaXXZ
X-Gm-Gg: AYBFou1WXYMSr3z0qMmbocH5GNVi6vPTGJGv36b2K/nSPS6H/1WCdlEhlqCJYCBwF2k
	fRdrVKoOmtjcacvWj6yhr9ZZDiFJhsohwXzZSw+rYkJ/cMiGqj98OStcAMOqJtntsYvGlZcL481
	GBM5O2LidzFXt4mVaMJ4hi3/bP2V0pJnJrrjR2BKRb3VyBxreaEWT/tO6KjYOkgeFUUnI0wJUtR
	2UID1x/EexDTM3ir+vlOOIc3QK8zio8iNQfzO2cjsJ/I7lRgA/Ta6zpCueJIPRGcF0S8evKwFr3
	dvKx7FwKRYVJX/DTQ5zSx5RfenxeHZUFpVrF5g5Mi64xIh9tEppX/UshZgeMfGNpXsJZ1+/5+jC
	JIF+TjweUqQidf0zPNdwIKHsRGKgcOtNEb0Bwt7jRgUC4Z1fIvBsGv0NxI9NPwym0n7Fa7JKmWh
	TUm3YMkHUSSuq05lzVovQiCQ==
X-Received: by 2002:a17:903:1a6f:b0:2df:8382:918b with SMTP id d9443c01a7336-2e5ff84c27bmr43533015ad.0.1791455064332;
        Thu, 08 Oct 2026 03:24:24 -0700 (PDT)
X-Received: by 2002:a17:903:1a6f:b0:2df:8382:918b with SMTP id d9443c01a7336-2e5ff84c27bmr43532825ad.0.1791455063855;
        Thu, 08 Oct 2026 03:24:23 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:24:23 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:00 +0530
Subject: [PATCH ath-next 04/17] wifi: ath12k: Add hardware ring mask for
 QCN6432
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-4-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: qOm1evOdF6AdWCtizuSra044Uy4ZYRGw
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac76f59 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qBdOBzyLVJzNEwNtDhoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX+9VSh3Ctmr9U
 3d5GlunmQqoD8eEfgA409NimnE0NzT0+rTSDRhJ56dygxDqKikwOvvdygu/u875X8yOnOQ4+Iqu
 xFARlLoVMF3AHcOnfcGUt2exXqiZHrc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfXz8YOW5PQKc6C
 nArmkjmxrAFUkkvxNlu9Y/Du1UdCKGrzkAJ//tJG8qimeiQpMrFOiHCltQh6CGXlA/T28pr1NwI
 RoKkS1SE8Gh5inpfvGdtFDvjES9QFcOXxNHQ98/z6kWzeVUsMbAUEvnsrGb8a1Z8WjsixT/juhk
 ELFZQUVgnUuXOvsSiCMCz0+RN400mHMTJwV0IQ9ARxINf7lADcVIWX1FDkm00zEm30/hGiDx5HI
 8+XC+3H/debOYSZ628Cvqd1imqFv3652FQZ6QsO3pcuRsD88swcl4TmSWKaGm/ZrE1xypbEe0Ug
 LDp+LkFb7jvbTB3aDUujNeVmdgW7TumaCYUt4Qz002F3udnXv4bSDQVpiKwT2GKvqSk3y0sxA+M
 h8jaDnSXSEpCfwd7r5XmTckmCAKpUZmmgtPKjJOpV79FBGkrDQpifnG/czmAdT0FkXmTSw6JvNb
 T8h/Te051ZRcm3XykUg==
X-Proofpoint-ORIG-GUID: qOm1evOdF6AdWCtizuSra044Uy4ZYRGw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_032426_619969_D68419FF 
X-CRM114-Status: GOOD (  14.11  )
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
index 1e652dc0d247..2e585a42dd9b 100644
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
index f57adb2107df..408844024dd6 100644
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
@@ -919,7 +969,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.internal_sleep_clock = false,
 
 		.hw_ops = &qcn9274_ops,
-		.ring_mask = &ath12k_wifi7_hw_ring_mask_ipq5332,
+		.ring_mask = &ath12k_wifi7_hw_ring_mask_qcn6432,
 
 		.host_ce_config = ath12k_wifi7_host_ce_config_ipq5332,
 		.ce_count = 12,

-- 
2.34.1


