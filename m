Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17790C5AD49
	for <ath12k@archiver.kernel.org>; Fri,  6 Jun 2025 11:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y/rzm51Zkr3jP4eeeMK/FxNqdtEdmgE6zUnfJ4N1dz4=; b=WkpsphL5rMgyZ/1rBOc/18kJI0
	Wfmq+7uSV2FUGn2tu7FlTkwF5u9PqWt2sXlrmjTyOkFT4dYX/KuB7w/NQEXfpWfHWzrQSqKfqRnK6
	2RTqacnZSQqrYfYZvRLZTf/NfiYU5ebSk/hHOGzJ3rJ24kxIcqqY+PTEZZROPFbgGC13F1h5Wp/7a
	5ga0+2noe9675USltrlo70SjUzcx+6exbu1E7uclUGe9CUbf//S1slBq5z8Pv1IalmrykqwGBY0Ns
	SeuYmu06AgllDwuODJuFNZiZtf2NaJmpAzrVrp4kgZU+TPyz/UMhQXLALoJkFGqtZbZttpr47jPx7
	a3oR0G4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNVAr-000000008I6-1mkQ;
	Fri, 06 Jun 2025 11:23:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNVAo-000000008Hj-2aDC
	for ath12k@lists.infradead.org;
	Fri, 06 Jun 2025 11:23:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5568wkia014417;
	Fri, 6 Jun 2025 11:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y/rzm51Zkr3jP4eeeMK/Fx
	NqdtEdmgE6zUnfJ4N1dz4=; b=T7FpNq8smkvyPVHsBXslWTADaBLNcKnVzG0Sjz
	TycdtfXKXs3IHPeLzMr0mCwVlp4CUDj7VEHFFhUmXhU4ImXqTcTmIeCKn0m8cbJX
	o5Tx8k5Ns6Kht5wZI97akyGTs9pfJzYwvMAUKOHYawiWqKJFwAtL35yDNun6qeCP
	yWINb+SxWplWwEZREUJ3nLyIQB7RfgIU5tyo5N5HfPj3ExNEyhbcAiuAyYIzt6Ye
	xZS+BBc7b40PB4tW6IroIvA0fZhaoFHyXOkmA979IqdX3Oycl+7vpgRSQmYwEx78
	Nj1moboZ3ZYC1Hlt+fPs53dId9Pk+xXQARE6Ho1rCLje2DCw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8tce4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 11:23:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 556BNYOZ026136
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 11:23:34 GMT
Received: from hu-hbasuthk-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Jun 2025 04:23:32 -0700
From: Hariharan Basuthkar <quic_hbasuthk@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Hariharan Basuthkar
	<quic_hbasuthk@quicinc.com>
Subject: [PATCH ath-next] wifi: ath12k: Send WMI_VDEV_SET_TPC_POWER_CMD for AP vdev
Date: Fri, 6 Jun 2025 16:53:16 +0530
Message-ID: <20250606112316.39316-1-quic_hbasuthk@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=6842cfc1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=XoFb-Slw00YomcIzJzcA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: PG_bXvTnvXpPiRlSVa68fJZr6r7Y0j1o
X-Proofpoint-GUID: PG_bXvTnvXpPiRlSVa68fJZr6r7Y0j1o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEwMyBTYWx0ZWRfX2nDl1DGAWG6P
 5xuntv15pfR6XIq9QA6ZK68cmcAa0GHyW9QPppRh2/CoCQ0J7Qm7p8Mdmcc+vTF9NzlKzNYUR1Y
 6ApRSlCzlj/Ju/fPegEfKakIfLpRmHS6qOpGBxJHoHWZnbJCp+uN5za2c3QkK4gRRCXrl/l7tPV
 UsiXr3vE0rSQqGKk79p/3/71pAZixL+YEsBpEmN59V/Pquq4F61zPcWRhlTndtnXjiXlJHzW7so
 irLvtJC4xCT0yhi1dUqUlrL/a81QoGTmLF9Fc8iC3kXw2xOHyXPB7d65/wkASTBoC4IKMlVu4CK
 jGFm7DArE/c56G6UAso7Zi1r4nBtP0aKGoWINoDkxRWG/LHt3+KeBry9zAc9EcVjtstgIv1rBn/
 VJ1bVTQuBUNbI+c7eske/5LNPPgXnp96/Mxemqqr8WpNG4Xy/bow0AxOoYBMBCkeJ+FxORCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_042346_665152_2B4EBC47 
X-CRM114-Status: GOOD (  15.25  )
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

The power value is 6 dBm on an AP operating on the 6 GHz channel.
This is a very low value.

On 6 GHz, the target computes the EIRP based on the power values sent
in the WMI_VDEV_SET_TPC_POWER_CMD. Currently, this is being sent only
for station interfaces and not for AP interfaces.

Therefore, add AP vdev to the condition in
ath12k_mac_station_supports_tpc() and rename
ath12k_mac_station_supports_tpc() to ath12k_mac_supports_tpc().

For a AP vdev, hardcode ap_power_type as IEEE80211_REG_LPI_AP, which is
filled in the WMI_VDEV_SET_TPC_POWER_CMDID sent to the target.
Currently, LPI is the only supported AP power mode. Since there is
no method currently to set the AP power mode from user-space, the
power mode is hard-coded to LPI.

Retain the existing logic for populating the power mode for a station
vdev.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Hariharan Basuthkar <quic_hbasuthk@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 727015995cfe..df2c93ac12cc 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3744,13 +3744,13 @@ static void ath12k_mac_vif_setup_ps(struct ath12k_link_vif *arvif)
 			    psmode, arvif->vdev_id, ret);
 }
 
-static bool ath12k_mac_supports_station_tpc(struct ath12k *ar,
-					    struct ath12k_vif *ahvif,
-					    const struct cfg80211_chan_def *chandef)
+static bool ath12k_mac_supports_tpc(struct ath12k *ar, struct ath12k_vif *ahvif,
+				    const struct cfg80211_chan_def *chandef)
 {
 	return ath12k_wmi_supports_6ghz_cc_ext(ar) &&
 		test_bit(WMI_TLV_SERVICE_EXT_TPC_REG_SUPPORT, ar->ab->wmi_ab.svc_map) &&
-		ahvif->vdev_type == WMI_VDEV_TYPE_STA &&
+		(ahvif->vdev_type == WMI_VDEV_TYPE_STA  ||
+		 ahvif->vdev_type == WMI_VDEV_TYPE_AP) &&
 		ahvif->vdev_subtype == WMI_VDEV_SUBTYPE_NONE &&
 		chandef->chan &&
 		chandef->chan->band == NL80211_BAND_6GHZ;
@@ -9324,7 +9324,7 @@ ath12k_mac_vdev_start_restart(struct ath12k_link_vif *arvif,
 	/* TODO: For now we only set TPC power here. However when
 	 * channel changes, say CSA, it should be updated again.
 	 */
-	if (ath12k_mac_supports_station_tpc(ar, ahvif, chandef)) {
+	if (ath12k_mac_supports_tpc(ar, ahvif, chandef)) {
 		ath12k_mac_fill_reg_tpc_info(ar, arvif, ctx);
 		ath12k_wmi_send_vdev_set_tpc_power(ar, arvif->vdev_id,
 						   &arvif->reg_tpc_info);
@@ -9881,7 +9881,9 @@ void ath12k_mac_fill_reg_tpc_info(struct ath12k *ar,
 	bool is_psd_power = false, is_tpe_present = false;
 	s8 max_tx_power[ATH12K_NUM_PWR_LEVELS],
 		psd_power, tx_power, eirp_power;
+	struct ath12k_vif *ahvif = arvif->ahvif;
 	u16 start_freq, center_freq;
+	u8 reg_6ghz_power_mode;
 
 	chan = ctx->def.chan;
 	start_freq = ath12k_mac_get_6ghz_start_frequency(&ctx->def);
@@ -10037,8 +10039,14 @@ void ath12k_mac_fill_reg_tpc_info(struct ath12k *ar,
 	reg_tpc_info->num_pwr_levels = num_pwr_levels;
 	reg_tpc_info->is_psd_power = is_psd_power;
 	reg_tpc_info->eirp_power = eirp_power;
+	if (ahvif->vdev_type == WMI_VDEV_TYPE_STA)
+		reg_6ghz_power_mode = bss_conf->power_type;
+	else
+		/* For now, LPI is the only supported AP power mode */
+		reg_6ghz_power_mode = IEEE80211_REG_LPI_AP;
+
 	reg_tpc_info->ap_power_type =
-		ath12k_reg_ap_pwr_convert(bss_conf->power_type);
+		ath12k_reg_ap_pwr_convert(reg_6ghz_power_mode);
 }
 
 static void ath12k_mac_parse_tx_pwr_env(struct ath12k *ar,

base-commit: 172e1570e1d31260f11f43e828d98aff020726a8
-- 
2.34.1


