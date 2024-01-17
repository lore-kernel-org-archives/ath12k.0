Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3698C47422
	for <ath12k@archiver.kernel.org>; Wed, 17 Jan 2024 06:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QJxBJ2V0sHfs5z0Xv80yrz91TbPdoZ2W+luMW+akxHE=; b=LZAqgDlYHhKQOcTpfMl14N9nST
	qobsE799hLnQgYivehNsrcziOO48txJEZNSOY8Bmy1OIO2zN4bTMVhXJb186trrxub5oqitAfIA8S
	ECcpINBXdie5YRGV8Sp08FVA1PG0lSryVAHfAum5WYKD5a8ivSQM5vU33GNYV0L0O7iGWf15VLtb7
	wpyY+wP1WcMhCi+TPG6iRjwkAFUt9yG+vsRD6Zo/DHao+jX62OXkMWBMFqodSL9Zfkkd0obVD5+e+
	nF/cyVCsrtL0k3y6p75OwfIo2xSC9oYe5YkawzHfdd80eN4EJm48TsTOZZZ4J01wkuxOE8TME+NWI
	3NaFbgCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPzO7-00EZwM-0X
	for ath12k@archiver.kernel.org;
	Wed, 17 Jan 2024 06:26:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPzO2-00EZvK-37
	for ath12k@lists.infradead.org;
	Wed, 17 Jan 2024 06:26:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40H6DCdU029350;
	Wed, 17 Jan 2024 06:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=QJxBJ2V0sHfs5z0Xv80yrz91TbPdoZ2W+luMW+akxHE=; b=lT
	nZ0g1EqnjWTiHkSVSVs+tVAnfYKL60w6U4HeZePQbe7Gs1X7fitNMuCugYsTyiCk
	YpsZpgjrZg/yToJ2yQ63QDKbBqbCvo/0NcxT55QhdapCiMPXvHkmDDCq60hdeVRo
	sdTpmGhnzC9ZRsTbwUvYXPvrOaeCB/MClXRXJ2GVgb4LFmQ0xfbC+7vh1uf+8Acp
	KhWIIJO6rYs0rZOrq9zRvWL81UWKQy2hwgiFZ0EdMZFqiM8cwQHP6zTEf8Z+xeAc
	m4r3hfid3slxQT4yZEPQHkDgRZ0ew30lnCI6tkxP/bn2YYr/Fa2BxownqcCWMq6R
	7KXtK29PCdkz0bnRCF6Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vnmq0jy36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 06:26:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40H6Qpbr001450
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 06:26:51 GMT
Received: from srirrama-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 22:26:49 -0800
From: Sriram R <quic_srirrama@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
Subject: [PATCH] wifi: ath12k: Fix issues in channel list update
Date: Wed, 17 Jan 2024 11:56:28 +0530
Message-ID: <20240117062628.8260-1-quic_srirrama@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BJ71lD-O0RdSrxFguicQL4SbyveRGJME
X-Proofpoint-ORIG-GUID: BJ71lD-O0RdSrxFguicQL4SbyveRGJME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_02,2024-01-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=859 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401170043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_222655_221376_03ED396C 
X-CRM114-Status: GOOD (  20.03  )
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

Currently, the logic used to select the 6 GHz band is incorrect,
which may cause 6 GHz supported channels to not be updated properly.
This is because the 6 GHz Max frequency supported by the driver is
being compared to the Max frequency supported on the board. If in
some cases, the 6 GHz Max frequency supported on the board is less
than the defined 6 GHz Max frequency, all 6 GHz channels are disabled.
To address this, compare the max frequency supported by the board to
the defined 6 GHz Minimum frequency by the driver.

Similarly, when a dual mac card supports both 6 GHz and 5 GHz radios,
if the 5 GHz radio gets enumerated first before 6 GHz, the checks in
ath12k_mac_setup_channels_rates() can cause the 5 GHz channels which
were enabled earlier to get disabled when the 6 GHz channel list is
updated. This is because the Min 6 GHz frequency defined in the driver
is 5945 MHz, which should be 5925 MHz since channel 2 is not considered
currently, but the firmware can pass 5925 MHz as the minimum.
Hence, update the Min frequency supported by the driver to 5925 MHz.

In addition, ensure that the channel list update to firmware updates
only the channels that the current radio (ar) supports rather than
considering the wiphy support. This would be required when multiple pdevs
are supported in a wiphy and they support different ranges of frequencies
or bands as in single wiphy support.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h | 2 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 2 +-
 drivers/net/wireless/ath/ath12k/reg.c  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index ba0a30f1ea29..41e8bf1af169 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -425,7 +425,7 @@ struct ath12k_sta {
 };
 
 #define ATH12K_MIN_5G_FREQ 4150
-#define ATH12K_MIN_6G_FREQ 5945
+#define ATH12K_MIN_6G_FREQ 5925
 #define ATH12K_MAX_6G_FREQ 7115
 #define ATH12K_NUM_CHANS 100
 #define ATH12K_MAX_5G_CHAN 173
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 88cec54c6c2e..f4e5dc363472 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7198,7 +7198,7 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 	}
 
 	if (supported_bands & WMI_HOST_WLAN_5G_CAP) {
-		if (reg_cap->high_5ghz_chan >= ATH12K_MAX_6G_FREQ) {
+		if (reg_cap->high_5ghz_chan >= ATH12K_MIN_6G_FREQ) {
 			channels = kmemdup(ath12k_6ghz_channels,
 					   sizeof(ath12k_6ghz_channels), GFP_KERNEL);
 			if (!channels) {
diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index f924bc13ccff..29542c46b094 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -103,7 +103,7 @@ int ath12k_reg_update_chan_list(struct ath12k *ar)
 
 	bands = hw->wiphy->bands;
 	for (band = 0; band < NUM_NL80211_BANDS; band++) {
-		if (!bands[band])
+		if (!(ar->mac.sbands[band].channels && bands[band]))
 			continue;
 
 		for (i = 0; i < bands[band]->n_channels; i++) {
@@ -129,7 +129,7 @@ int ath12k_reg_update_chan_list(struct ath12k *ar)
 	ch = arg->channel;
 
 	for (band = 0; band < NUM_NL80211_BANDS; band++) {
-		if (!bands[band])
+		if (!(ar->mac.sbands[band].channels && bands[band]))
 			continue;
 
 		for (i = 0; i < bands[band]->n_channels; i++) {
-- 
2.17.1


