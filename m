Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FF2CA0FFE
	for <ath12k@archiver.kernel.org>; Thu, 28 Aug 2025 23:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vw3SJGDDg+2/BFpzGgCGfl4rFfyCl/pqzm6nt1fgYI0=; b=eUXXflKFUZ9XeKGNVcbYWXmyJ7
	6nnYM0/Ycqvw6GGyle2jRghBpryETLB+sDDv5Lbr3X8CWVITcEvLMKcswe0hnC7f8lPsKV5s1CEIw
	bfgW3n8WF3Ipsd2vF2xmsWpLSMuNPqvdLcGZGRfSj/j3D+qZXg51RGYsoxyPno15S7kRZ/4lLQkVA
	bREais9KyIgsAfrEEFEceTqiE1Ujcqvb0TTjhhBuDJH392tD53eBDFgfa5OgJ4kc4vZzdg27O6SS1
	xTHxEQdTMQsepqxEJcFyYQBdXg8PUYRFWcUtY2BApr7b/Ax6B3dpOnsSPdC+dY1UErJUUtAvEnPOV
	cQAbc6BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urlzP-00000003dL0-0Ld1;
	Thu, 28 Aug 2025 23:25:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgY7-00000002Ygb-00WL
	for ath12k@bombadil.infradead.org;
	Thu, 28 Aug 2025 17:36:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vw3SJGDDg+2/BFpzGgCGfl4rFfyCl/pqzm6nt1fgYI0=; b=NiA2KrJ4z4d0MuwjKi3oIEGTtr
	lqJhO9WHFX/cxgz3cj96UxbhN5E/jAM+u4vkpAvhso6bclz+6C0Rbs7wM3HRk5QFyueLVdJDMyVnk
	LhiCsfHOhTL8te9quMQNDPY/Je28nvNmYgb+l/V8o79qJWO4Rx6tE/4eXI1zCIQZAeqLvSTPNinuF
	jM3mui993Q3lEtBsTTWeFTvvD2Ct9Pzyntt8uOM0kC8zRTsod9pZ40BGffhB6BU/1FK5RYOpjUBt7
	2vz3Cn9IBCw+EGuvRgtR/dm7arKOZFphW95zkUA/DqazClBOoDUjqD5/aSTqiNXCf4ijkoXcncDDv
	Q/vz7+Wg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgY3-00000002pBp-3wmO
	for ath12k@lists.infradead.org;
	Thu, 28 Aug 2025 17:36:33 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S9UQMD005840;
	Thu, 28 Aug 2025 17:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vw3SJGDDg+2/BFpzGgCGfl4rFfyCl/pqzm6nt1fgYI0=; b=aPIlBVugAjLodp1Z
	hR+udmxzvtmLjk5BB650pVO/9S3OaTJl+HHxX8KqHpq01792nR55xZNrmFhx/Ed0
	HI/kxvIGxali461j8AbFR8verlfDPMAJb062vZiWx1oFH6bKj+RDD5CMam7MKy5/
	eE6Erlg/BAKg9efzE1btgSHnBpiBhvy4YA7eYLNN8PmojSmU+BrPJ5+R+N3Gwx19
	lHKHNplmlW5541g+vZ9BD44/72NtFiRLkOB7/l2EifYt8b/roac39LC7BhPa/5GC
	Yw5lMDw6+K4OuuL10sGkb7YGAsk3Gu957aVb+1FhZ+pAoEq1eAextU9sYIVvTwWD
	d1wacQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tbpgjvm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 17:36:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57SHaSvu009044
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 17:36:28 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 28 Aug 2025 10:36:27 -0700
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng 12/20] wifi: ath12k: Separate arch specific part of RX APIs
Date: Thu, 28 Aug 2025 23:05:45 +0530
Message-ID: <20250828173553.3341351-13-quic_rdeuri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828173553.3341351-1-quic_rdeuri@quicinc.com>
References: <20250828173553.3341351-1-quic_rdeuri@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Qzt2pZ2RNZ1A-FUOnf1-X1vNjESO3Uc3
X-Proofpoint-ORIG-GUID: Qzt2pZ2RNZ1A-FUOnf1-X1vNjESO3Uc3
X-Authority-Analysis: v=2.4 cv=G7gcE8k5 c=1 sm=1 tr=0 ts=68b0939e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=UhMrxNEtutGsJ7abFMIA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDE5OSBTYWx0ZWRfX/DPBlvpdPaWK
 J/dh22/t22tcw8GEewLXn1fIBfQ6hPANf5DGSRqfl+qTfdYuEaGVe4ouP/WCBV+LWgtB10fi8qD
 yQhMTiLGGy/rsJFWAZQXtMJvy0svmQLuDTRrZZbkL+9/TY5A/xKMOolMSN4wzFAOksLhfdqh13R
 n89NdXqkAJWISkUcs3tLHKQ7sF/GRV8pE1UWDiuG0GSne3W+qbrk2xucHKJ2MxntBg277a3rrq8
 BmJZeGNVsMImes//d56Q2Tg16KFXz49thcdifqJhFQnjXwhgJNCKPrhLm8UtfwSIUHNpNDnK5iB
 FeEiTps4XupxY3v0wSd/VK1kZJuM1FgP3CNP2lpCdzc5g0pZmmE5Iz+I918FYnbjAb/SV8pB26N
 Fxpb1ePL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508270199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_183632_296516_E94C486F 
X-CRM114-Status: GOOD (  12.22  )
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

From: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>

Below API have architecture specific HAL macros.
  ath12k_dp_rx_peer_pn_replay_config

Separate architecture specific parts from these APIs to
later move them to wifi7 directory.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>
Signed-off-by: Ripan Deuri <quic_rdeuri@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 56 ++++++++++++++-----------
 1 file changed, 32 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 8832ba5f5cdb..dd771063f591 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -958,6 +958,36 @@ int ath12k_dp_rx_ampdu_stop(struct ath12k *ar,
 	return ret;
 }
 
+static void ath12k_dp_setup_pn_check_reo_cmd(struct ath12k_hal_reo_cmd *cmd,
+					     struct ath12k_dp_rx_tid *rx_tid,
+					     u32 cipher, enum set_key_cmd key_cmd)
+{
+	cmd->flag = HAL_REO_CMD_FLG_NEED_STATUS;
+	cmd->upd0 = HAL_REO_CMD_UPD0_PN |
+			HAL_REO_CMD_UPD0_PN_SIZE |
+			HAL_REO_CMD_UPD0_PN_VALID |
+			HAL_REO_CMD_UPD0_PN_CHECK |
+			HAL_REO_CMD_UPD0_SVLD;
+
+	switch (cipher) {
+	case WLAN_CIPHER_SUITE_TKIP:
+	case WLAN_CIPHER_SUITE_CCMP:
+	case WLAN_CIPHER_SUITE_CCMP_256:
+	case WLAN_CIPHER_SUITE_GCMP:
+	case WLAN_CIPHER_SUITE_GCMP_256:
+		if (key_cmd == SET_KEY) {
+			cmd->upd1 |= HAL_REO_CMD_UPD1_PN_CHECK;
+			cmd->pn_size = 48;
+		}
+		break;
+	default:
+		break;
+	}
+
+	cmd->addr_lo = lower_32_bits(rx_tid->qbuf.paddr_aligned);
+	cmd->addr_hi = upper_32_bits(rx_tid->qbuf.paddr_aligned);
+}
+
 int ath12k_dp_rx_peer_pn_replay_config(struct ath12k_link_vif *arvif,
 				       const u8 *peer_addr,
 				       enum set_key_cmd key_cmd,
@@ -978,28 +1008,6 @@ int ath12k_dp_rx_peer_pn_replay_config(struct ath12k_link_vif *arvif,
 	if (!(key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
 		return 0;
 
-	cmd.flag = HAL_REO_CMD_FLG_NEED_STATUS;
-	cmd.upd0 = HAL_REO_CMD_UPD0_PN |
-		    HAL_REO_CMD_UPD0_PN_SIZE |
-		    HAL_REO_CMD_UPD0_PN_VALID |
-		    HAL_REO_CMD_UPD0_PN_CHECK |
-		    HAL_REO_CMD_UPD0_SVLD;
-
-	switch (key->cipher) {
-	case WLAN_CIPHER_SUITE_TKIP:
-	case WLAN_CIPHER_SUITE_CCMP:
-	case WLAN_CIPHER_SUITE_CCMP_256:
-	case WLAN_CIPHER_SUITE_GCMP:
-	case WLAN_CIPHER_SUITE_GCMP_256:
-		if (key_cmd == SET_KEY) {
-			cmd.upd1 |= HAL_REO_CMD_UPD1_PN_CHECK;
-			cmd.pn_size = 48;
-		}
-		break;
-	default:
-		break;
-	}
-
 	spin_lock_bh(&ab->base_lock);
 
 	peer = ath12k_peer_find(ab, arvif->vdev_id, peer_addr);
@@ -1014,8 +1022,8 @@ int ath12k_dp_rx_peer_pn_replay_config(struct ath12k_link_vif *arvif,
 		rx_tid = &peer->rx_tid[tid];
 		if (!rx_tid->active)
 			continue;
-		cmd.addr_lo = lower_32_bits(rx_tid->qbuf.paddr_aligned);
-		cmd.addr_hi = upper_32_bits(rx_tid->qbuf.paddr_aligned);
+
+		ath12k_dp_setup_pn_check_reo_cmd(&cmd, rx_tid, key->cipher, key_cmd);
 		ret = ath12k_dp_reo_cmd_send(ab, rx_tid,
 					     HAL_REO_CMD_UPDATE_RX_QUEUE,
 					     &cmd, NULL);
-- 
2.34.1


