Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED0FC47077
	for <ath12k@archiver.kernel.org>; Mon,  8 Jan 2024 08:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BykGcKuhPw0Ir+mBvwpjHkE4b2hEMULJ5sUj5w3otCQ=; b=H8z6OixEZ1tJp0PV8diD3P5mOq
	IbUIic0j9WfYBw5+bBu/cXiNIo45YJmPiGGbeCqvikihW3wcr9oQCCa9FMPs6YTD74Oc6z8Xaz4le
	9S3lqCruFuFGbWw7lKaFC0i8C0jD//0h1Ivz8YVD+zF0Hb1QCgp4Lfrsvay4FhScIRyEwg4yPNJqK
	rM9sY2h/95l2OZS3sTNYdMqyi4XcjKOUmRXiSYN8oxrgZXC7HVwerOOg99nhxWXnmF50gO/hVvK4J
	OOsaW2zh9MYE5GRJUIdobZ2S6jw1rWtZgr12FWobDcS6Fq8f2npIuSorBBnZkXz7VB0preFTg/bNR
	KfevjqVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMkxx-004IUc-1J
	for ath12k@archiver.kernel.org;
	Mon, 08 Jan 2024 08:26:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMkxu-004ISW-2x
	for ath12k@lists.infradead.org;
	Mon, 08 Jan 2024 08:26:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40860V3N015597;
	Mon, 8 Jan 2024 08:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=BykGcKuhPw0Ir+mBvwpjHkE4b2hEMULJ5sUj5w3otCQ=; b=T2
	HUMnn14/R+eZQ9Ysrs5FXpl2+xIto80VwN6zDiBKPFGfLFG7ZaWXIKgVEvT7s+JC
	SRFu71ONxAY0QlCCUTnNxFpr/mWDj57LZyinBJHGBwkTlqtn97JELQRkPiKYMCy6
	z1x8OYegwxUHkzLf4pCtCsQyrEmFF0qNq3a3olZECKZClIO+53WJN0c8Kmn7ykWq
	huB5l6T2JoVQTWZ0LKlOBPE5eLE0GDk0R5c6kOlDosr/2N7mbWocAtYbJaj/OmhI
	xyyla1YlBdD2nn5D5N02B1B+K5FhbFjch/3M4CujPhD4XU1/yP+cGI2GSdQRtfck
	BogsKTQTZvUhowe1pQQw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vg8mw8hqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 08:26:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4088QXNh018419
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jan 2024 08:26:33 GMT
Received: from yk-E5440.local (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 8 Jan
 2024 00:26:32 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 05/10] wifi: ath12k: change WLAN_SCAN_PARAMS_MAX_IE_LEN from 256 to 512
Date: Mon, 8 Jan 2024 16:25:47 +0800
Message-ID: <20240108082552.7227-6-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240108082552.7227-1-quic_kangyang@quicinc.com>
References: <20240108082552.7227-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nuxn5RtXaZOcr1mrzYzyDGOiRd4Efn7b
X-Proofpoint-ORIG-GUID: nuxn5RtXaZOcr1mrzYzyDGOiRd4Efn7b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401080070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_002634_960309_3C6037CE 
X-CRM114-Status: GOOD (  11.25  )
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

Mac80211 needs more space for P2P scan ie in P2P mode, 256 is not
enough, resize it to 512.

Also delete the duplicate macro definitions in wmi.h.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index d24471309158..f7edebb10089 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -168,10 +168,6 @@ struct wmi_tlv {
 #define WLAN_SCAN_MAX_HINT_BSSID         10
 #define MAX_RNR_BSS                    5
 
-#define WLAN_SCAN_PARAMS_MAX_SSID    16
-#define WLAN_SCAN_PARAMS_MAX_BSSID   4
-#define WLAN_SCAN_PARAMS_MAX_IE_LEN  256
-
 #define WMI_APPEND_TO_EXISTING_CHAN_LIST_FLAG 1
 
 #define WMI_BA_MODE_BUFFER_SIZE_256  3
@@ -3146,7 +3142,7 @@ struct ath12k_wmi_element_info_arg {
 
 #define WLAN_SCAN_PARAMS_MAX_SSID    16
 #define WLAN_SCAN_PARAMS_MAX_BSSID   4
-#define WLAN_SCAN_PARAMS_MAX_IE_LEN  256
+#define WLAN_SCAN_PARAMS_MAX_IE_LEN  512
 
 /* Values lower than this may be refused by some firmware revisions with a scan
  * completion with a timedout reason.
-- 
2.34.1


