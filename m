Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4DCC54F2E
	for <ath12k@archiver.kernel.org>; Wed, 21 May 2025 22:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igBIHxXxEIGErFGPWQKC8rBeF0DUPvb+tsDy6dmbEUQ=; b=sHDLyS4jmgYJLZYLhjuLqV0T5k
	awWeyj//bsVojtiQwPDXTYLg7yBfAsaW8YB82lOph6s2m+K0XNOarjzuUpZQpAT9xDu/wvnJk5o3c
	NUdKb8TWm8065JbloHbAGcem/dikEsjqWawc0fHCY7SVI+hia/7RxK5HhZmD4SwntVf2Ki8vZWNXW
	zTZvFy7j0JH6VbXSRKZEAwMj9C7ZdaKjawOvHf8ffdVO0TZEQgMQzvIbRdJ61utGY0L3JSBCY1kam
	ZYTkxZA2Wa+bkvPI3+cFMSGtCA9rBNRFnisaEgzDGXlNKn4dXBys8bldgZIVsR1APnWbhWRsfHcbG
	LZ8T7ytA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHsCE-0000000GxnP-0etR;
	Wed, 21 May 2025 22:45:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHsCB-0000000GxkW-2RSK
	for ath12k@lists.infradead.org;
	Wed, 21 May 2025 22:45:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIhKMc027654;
	Wed, 21 May 2025 22:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	igBIHxXxEIGErFGPWQKC8rBeF0DUPvb+tsDy6dmbEUQ=; b=n5c8p9dBo/+917ae
	iUuuRoUPhgwmxRjEorR4N5thttRSLen0XwHulOSFzfVHZvX/ZX7Xb8qa67RpJUAw
	jx3TGu38TFybZ9zCbXxa3PoR7FqIyl7TyaU+RpGmjLnDTRjq5ODiDDkcGM8aLJ6C
	pgH1JDyjAtZODpP3W+kKpoMlU/N8QCB8wVOob4E3+nH0XDeYWh0cSY4dAnFcFYsC
	dgkUoVt65T3wJptGX80bBT1muPG/3O+IiWrYoP6NVayscmgOnCqKVpuSjYrEn/02
	HlxMp7yg/I4LhlQquL2SfmAXdKThQLrOF/XiFsCW2VZETvSbXsLI0NXYRbRFUxC4
	e9SLmw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9cars-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 22:45:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LMjrc1023294
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 22:45:53 GMT
Received: from ath12k-linux2.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 21 May 2025 15:45:53 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH ath-next V14 5/9] wifi: ath12k: fix TX and RX MCS rate configurations in HE mode
Date: Wed, 21 May 2025 15:45:35 -0700
Message-ID: <20250521224539.355985-6-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521224539.355985-1-quic_pradeepc@quicinc.com>
References: <20250521224539.355985-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lrtwH7rWiPRFD03fbbD0IavLBLpNgTW-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDIyNSBTYWx0ZWRfX0HS2wunF/V5Q
 jQqxwakF2Imrc/4a4WgPSFOFxUyO27D7Yw6gnIBRodgtwOFgflHDfeJMrELW79jrSDvXvRC0nnc
 lTonRisd7/CZWExy3sM2diYhHrZ5YT1dPhFtq33ItpY8BaOhwiLxc3wn0tlWRX8B/cd+xyEHTZY
 A4nCDSw77SEdaZfmqAB81LMzQWIuTucnxkms4pM1CIIYZrgAPcBk4XN8tWVQ6JQKCpMpelTF6Hj
 /XLCY2ByRqjtwd/zSjtcCfLOyKdT+uQtAJU1XZvedwqQW5MFk2GeD7O72PfhAP1V0YcbHdiTxde
 roRpAlQg48k0Ug5EMIUPb9TYEP15vwtPDTw03C3u7eOhs6znDqvMYNAtXwbxfGeHRwjsbMgpWLG
 +weN3zziLWlwb66N0xo5nfdJRHrOVDNcSx8/Z/xvCmHBTuVr44Q7It0iW+CGbHNqXrg4h4CH
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682e57a2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=mu3tZSmwaZwQUXtd2tAA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: lrtwH7rWiPRFD03fbbD0IavLBLpNgTW-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210225
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_154555_754656_78AA1D58 
X-CRM114-Status: GOOD (  13.02  )
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
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 4 ++--
 drivers/net/wireless/ath/ath12k/wmi.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 72e7730c7694..efdccc4c2b47 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2328,8 +2328,8 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 		he_mcs->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_HE_RATE_SET,
 							    sizeof(*he_mcs));
 
-		he_mcs->rx_mcs_set = cpu_to_le32(arg->peer_he_rx_mcs_set[i]);
-		he_mcs->tx_mcs_set = cpu_to_le32(arg->peer_he_tx_mcs_set[i]);
+		he_mcs->rx_mcs_set = cpu_to_le32(arg->peer_he_tx_mcs_set[i]);
+		he_mcs->tx_mcs_set = cpu_to_le32(arg->peer_he_rx_mcs_set[i]);
 		ptr += sizeof(*he_mcs);
 	}
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 6ce467e63385..a9c68c5d0542 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -4141,7 +4141,9 @@ struct ath12k_wmi_vht_rate_set_params {
 
 struct ath12k_wmi_he_rate_set_params {
 	__le32 tlv_header;
+	/* MCS at which the peer can receive */
 	__le32 rx_mcs_set;
+	/* MCS at which the peer can transmit */
 	__le32 tx_mcs_set;
 } __packed;
 
-- 
2.43.0


