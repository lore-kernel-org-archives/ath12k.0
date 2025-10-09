Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C73CCD183
	for <ath12k@archiver.kernel.org>; Thu,  9 Oct 2025 21:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQyEmfeBw0vC/RSfBZBXIMhXrAf5wyYL8BHTwLNqMYE=; b=Yr2r1MK41FBDLIph8vnu2p+qZu
	orZP79OUQFJu7zDrzeySjnYYKGqTSE3LkguOQY4DZQl1AsPlzU++a/aiSCZb+0DR2jzPlUF/r2QrU
	4SnIotmuW1OdyWcfouVoRFAiht/unFDszaU8CWFHpPgE3GnRwdPmWVqJTeZQ+rFXBojeJD4O7Yge7
	C4st9gs/yqwTRkvmaFSPvV7kaL67BViGJnPkL75mc3Q72UakIWdfkTRrps4+1yIHq4A8hlXQ6Q9Hu
	NWy09b9rHjCyo13Qi10NQWw/p1B/D0w4uivrfJ/pV7uDQu1DjyAlgJAv90NokiuW7MoUy4ovlo5Pm
	BI2gIl5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6y0g-000000078PO-23Gz;
	Thu, 09 Oct 2025 21:17:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6y0e-000000078OF-2S06
	for ath12k@lists.infradead.org;
	Thu, 09 Oct 2025 21:17:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599Ecfn0012274;
	Thu, 9 Oct 2025 21:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQyEmfeBw0vC/RSfBZBXIMhXrAf5wyYL8BHTwLNqMYE=; b=pIl0SrnSD5N5XGne
	U1NAdF3HTx4TWzCKQRCGxVbnu+jxo7UPqNi0Ex3nz3UbFVcXIBk03NDNFtofHrrV
	wLh/PAPjMZCh4XfGFquRkaw/064iGoMO9w30MhQpPiuk4iuNT45qNxrFvGCuhN89
	se70Y7F//kywo7Yvh27Nb3OdHCsPSdZdlNoXr9z3O3tgnfh/o0O5Sa9+FFGnxmlv
	DzW9BdwD0uy0uML6Omr9UDgJqsgiJ5nuMjd4c9UdCA/CeTP+MqkbW99rlO5N2sOt
	JZDm79LKFsE4qJoUKTKporje9ptmoZfWu8RbjUUiYvnuwvCqF7sCaLug3e+goRMe
	ywB8Tg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kmapy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 21:17:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 599LHA6x028815
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Oct 2025 21:17:10 GMT
Received: from ath12k-linux2.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 9 Oct 2025 14:17:10 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Subject: [ath-next V17 2/2] wifi: ath12k: fix TX and RX MCS rate configurations in HE mode
Date: Thu, 9 Oct 2025 14:16:56 -0700
Message-ID: <20251009211656.2386085-3-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009211656.2386085-1-quic_pradeepc@quicinc.com>
References: <20251009211656.2386085-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=dojWylg4 c=1 sm=1 tr=0 ts=68e82657 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=-WEFs_rbKGq8kVQlx6kA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: EogD7f8ZgkD-YiRX5tN1-bZFAmd7BBDt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXxfBVTj35FRVl
 /R7Lbg1WDk2NOu0jLnswWzPULW1gY/WdNh/9LwZjS4maQOG17PmD3dmvaQ8Lm7FXwFBgsX2h+Mb
 XuncMlJtU6/pHulU9Vx5B7zKT68wf0Gx4YgCZSg25+UUY7cArGTSK4JrbxRYEMOHucaAUleWdLn
 DJVXp+ipSUzT+DinNYVnDxXTv88IXudbNEkZZQ9za+OxSt0x5t3lBrYb7YUJ0OTm1RTbbrIM6nn
 6VtwBWNQzBYv8YSv08x+aYyxeynsSYzRUZMwbh9q9VF8eYKMsUD6i9TsVFxTWJBRxlZibPWH3Y/
 8UfyU+JoSy6yUaT6lReaYuA50ffi4kIEDF3cCUiKzdNfBy1TSdGBgoPTDc7XoGRAAl5iyxN9sEz
 5Ql1AV0krOog/5JVRZgtIHs1wtZxBA==
X-Proofpoint-ORIG-GUID: EogD7f8ZgkD-YiRX5tN1-bZFAmd7BBDt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_141712_636896_9E831BDF 
X-CRM114-Status: GOOD (  12.30  )
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

Currently, the TX and RX MCS rate configurations per peer are
reversed when sent to the firmware. As a result, RX MCS rates
are configured for TX, and vice versa. This commit rectifies
the configuration to match what the firmware expects.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 0d425a1bc0ab..e0a685a968bd 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2624,9 +2624,10 @@ static void ath12k_peer_assoc_h_he(struct ath12k *ar,
 	switch (link_sta->bandwidth) {
 	case IEEE80211_STA_RX_BW_160:
 		v = le16_to_cpu(he_cap->he_mcs_nss_supp.rx_mcs_160);
+		v = ath12k_peer_assoc_h_he_limit(v, he_mcs_mask);
 		arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] = v;
 
-		v = ath12k_peer_assoc_h_he_limit(v, he_mcs_mask);
+		v = le16_to_cpu(he_cap->he_mcs_nss_supp.tx_mcs_160);
 		arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] = v;
 
 		arg->peer_he_mcs_count++;
@@ -2636,10 +2637,10 @@ static void ath12k_peer_assoc_h_he(struct ath12k *ar,
 
 	default:
 		v = le16_to_cpu(he_cap->he_mcs_nss_supp.rx_mcs_80);
+		v = ath12k_peer_assoc_h_he_limit(v, he_mcs_mask);
 		arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] = v;
 
 		v = le16_to_cpu(he_cap->he_mcs_nss_supp.tx_mcs_80);
-		v = ath12k_peer_assoc_h_he_limit(v, he_mcs_mask);
 		arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] = v;
 
 		arg->peer_he_mcs_count++;
-- 
2.43.0


