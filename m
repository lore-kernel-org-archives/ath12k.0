Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D1AC83026
	for <ath12k@archiver.kernel.org>; Mon, 30 Jun 2025 06:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wSuD+H1Tbpx0DjzHpljEMona78eEmzW/sxLoGQ+9hRk=; b=tSNliuTDZJ+hUbhn9TqKCgoIqO
	xnsZm39RrkhhvtxHOe6cMi2SZrjIONASkC3g4V+5ZQQvO2StiAWUYFKMwRDyhWfk719uUvaUS1n5e
	di5omYh9e/CQMA56EwPa8aeSP2sJUR/GcJgU5BMwA7Yk2pCSWmLAzat8XJNdJdXSuxmQvLyqvy6pH
	Xr0h+OVPYP78voK5OAp4aPaWhCh3HbajlxwU9yWPEMk8pWHRYOveuxC5UlXG9tHVJE2B0AOjngTVr
	N9a8L7qdxTA+bdDGeEUISrPj6zjAUD4KhBSBO+2nqeoPLebuolaUhwmpTmFBvyeDg6IIDABRnIu18
	5iu9ElMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8Ge-00000001MzG-1R7h;
	Mon, 30 Jun 2025 06:45:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8Gb-00000001MyR-3Pya
	for ath12k@lists.infradead.org;
	Mon, 30 Jun 2025 06:45:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TLeodw007424;
	Mon, 30 Jun 2025 06:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wSuD+H1Tbpx0DjzHpljEMo
	na78eEmzW/sxLoGQ+9hRk=; b=H8mNcbN2mLaxAmbP4ZYjnxJMsSJ0aHl5vjPVlX
	XeVb0831oH7HHnUbCT2/xWnzbrNh5iTmhLddeXk6i9beTFVxM17JnKwfd8X2ZXDL
	+yfaM3clxIRfAXBsOZXlTYJGQyED+cwxhqbMBj4dqM77oO7kOfAomaFc6KINXUzt
	Dn9WgM/dmPRVovy7XYXyR+dIzWFjA4k3ZiszS37MlEpxkqd3g0stmETs5mMLW0RO
	nIh8hIweFFMjYqNzvbUsWEX1u2tJ1BOP40xt9aBO6TqOzdNPuZOKh8l2vZbngkLn
	d+VfUMYSYpNLLImUx4O8tvi9OVccXTOTV6vfX2tUzcWWq7BA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801umn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 06:45:23 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55U6j3Is016286
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 06:45:03 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 29 Jun 2025 23:45:02 -0700
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sarika Sharma
	<quic_sarishar@quicinc.com>
Subject: [PATCH ath-next] wifi: ath12k: properly set bit for pdev mask for firmware PPDU_STATS request
Date: Mon, 30 Jun 2025 12:14:31 +0530
Message-ID: <20250630064431.3446333-1-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Hjpw_8FoCR8tJcGIkR5SxUuFKjunYO09
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68623283 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=cZj-qgbuDKRneyf3sl4A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Hjpw_8FoCR8tJcGIkR5SxUuFKjunYO09
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA1NSBTYWx0ZWRfX94Arb9DQhYre
 D11wC8uQNrrblUMF/ZkB1d/pKkF71SQbkiHMfyXaiJuJ0IZc/axAty80yCEZSpwzuMNMPm1bKQY
 Kt78hCB+1c1LOwMorCwOn1MOl/XU1DMGTZyurjai3SdJ6Kl53oIwJ4YUVDPdy6It9/OK46gMY1v
 Ast/+3YbOHdSaKaPjWoqldViXkKuPw4N1gH7TazsLOBxuUfZCmNKJxxXff41rhq4jJJhd/g2/7u
 Or+MEI+DnI38GBJ+46DkWQIG/qetAPqo3pteM9FqawqkKLlVtc2sGmeuWByH5oZ8DlhzwLpf2D/
 5TyGWH4UKHtAxYtHXSVOP6ADTA6zyiwZacz7gmQItNRALZzWqtNr2rb4JbIvooGbYtJ9AcUVsn5
 6TwQW+LUlIj6pMPE0VzUtwF2P77/jbZ8pWcO/AZ2cbPM5b5/UyORJNF2OBPM0lVntxieL1f+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_234525_971313_3241C3FF 
X-CRM114-Status: GOOD (  14.81  )
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

Currently, the HTT_H2T_MSG_TYPE_PPDU_STATS_CFG request uses bits
8 to 15 as the bitmask for HTT_PPDU_STATS_CFG_PDEV_ID for firmware
PPDU_STATS. However, bit 8 is reserved for SOC stats, and the actual
PDEV ID should be encoded using bits 9 to 15. This leads to incorrect
PDEV ID encoding in the request, causing it to either ignore the
request or apply it to the wrong PDEV.

Additionally, pdev_mask calculation is done as
pdev_mask = 1 << (i + 1); (i.e. i= num_rxmda_per_pdev)
but this is not valid for multiple pdevs(multi-MAC configurations)
with 1 rxdma per pdev, as this will mask the same value for all pdevs.
To correctly identify each and exact MAC in multi-MAC configurations,
the calculation should include ar->pdev_idx:
pdev_mask = 1 << i + ar->pdev_idx;

Due to these issues, the firmware does not send PPDU_STATS for the
intended PDEV, leading to inaccurate and incomplete statistics on the
host. This might trigger certain WARN_ON() conditions in host that
rely on these statistics.

Hence, change the bitmask for HTT_PPDU_STATS_CFG_PDEV_ID as bit 9
to 15 to properly fill the pdev id in request message and change
the pdev_mask calculation to consider ar->pdev_idx to mask pdev
correctly.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.h    | 3 ++-
 drivers/net/wireless/ath/ath12k/dp_tx.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index a353333f83b6..a537c3420f91 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -703,7 +703,8 @@ struct htt_ppdu_stats_cfg_cmd {
 } __packed;
 
 #define HTT_PPDU_STATS_CFG_MSG_TYPE		GENMASK(7, 0)
-#define HTT_PPDU_STATS_CFG_PDEV_ID		GENMASK(15, 8)
+#define HTT_PPDU_STATS_CFG_SOC_STATS		BIT(8)
+#define HTT_PPDU_STATS_CFG_PDEV_ID		GENMASK(15, 9)
 #define HTT_PPDU_STATS_CFG_TLV_TYPE_BITMASK	GENMASK(31, 16)
 
 enum htt_ppdu_stats_tag_type {
diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index ca3d97043da0..1fa37cda1046 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -1257,7 +1257,7 @@ int ath12k_dp_tx_htt_h2t_ppdu_stats_req(struct ath12k *ar, u32 mask)
 		cmd->msg = le32_encode_bits(HTT_H2T_MSG_TYPE_PPDU_STATS_CFG,
 					    HTT_PPDU_STATS_CFG_MSG_TYPE);
 
-		pdev_mask = 1 << (i + 1);
+		pdev_mask = 1 << (i + ar->pdev_idx);
 		cmd->msg |= le32_encode_bits(pdev_mask, HTT_PPDU_STATS_CFG_PDEV_ID);
 		cmd->msg |= le32_encode_bits(mask, HTT_PPDU_STATS_CFG_TLV_TYPE_BITMASK);
 

base-commit: 391a83d0c8ebb1e476cba73bf4c010af73993111
-- 
2.34.1


