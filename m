Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DE1C6FD1D
	for <ath12k@archiver.kernel.org>; Fri, 17 Mar 2023 06:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aoL1Q73o1b5p2ToX75ErsgX6eEw2gQMvtq1pSdQEyQg=; b=iLGmKropkTFonv
	eyjT9WPaYYsrN+iSSqxhymQSxeHCPvs+J+/ajKAUXY/xEchL4N95wi4N2enKE6fBylLzqpj8KYCex
	EzapJCBJ2wTBgkkPOXh9tAZTdoAg7Q3ada7QnE3ojvZbBjpzCdD05qIuXnI6TkUVuBOll6GdMuFCk
	ZGgK+QHRKzS8X+XzXVVljulKlb672xjibrg/R34jBAf0Wc5Pqt3NhjskQo6oOaVGFqzWmjsA/CVQR
	B4N0GkiaSEemtN3thNRYGOF0fW/MttBF1dhV1/Wmw/N1il75RJu25stxIv7qA7Qsgrne9XffQnGUo
	zwA2RiNqljefLKedu2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd3XC-001CC5-0P
	for ath12k@archiver.kernel.org;
	Fri, 17 Mar 2023 06:25:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd3X8-001CBW-29
	for ath12k@lists.infradead.org;
	Fri, 17 Mar 2023 06:25:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32H6KNhm005650;
	Fri, 17 Mar 2023 06:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=YueGEv/G3INSruoaqcwt7RwXVJ2qJU8PwXFQp9Hjj2Y=;
 b=JwybYraFiztzbEWwXjvWn3djNTga+XxTqYZhOyU2ZMcLFCnjoveGE5sK930o9HCczDhg
 9gdaVKcpLSs0BKYz3GWHM8p2QeiHhJtWHK0e1NkJ2Hvul3cp5IT3QSjSZrzvKlTb1mEG
 IvSemFfgq/2qo3sPh0yOR/VvI7R8tkko7sSpmKaeQ4DJF4QqMZWX7E7JC4Wd3nrOC+qr
 sstAiSjgpF1+p+s+K5wtk/qrMsctmgtSFXAM7qIIeAqfU51u1iEpI7Pyyg4uGSsk1pjA
 tmLUtKo4AXBs3Lhx/IfmTWbjvMDjxAz4WQOUqiAL16pFlsteR9l2vTRRlspJnmnJZpP4 lw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pbpxjvanh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Mar 2023 06:25:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32H6PiCg001869
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Mar 2023 06:25:44 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 16 Mar 2023 23:25:43 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH] wifi: ath12k: Enable IMPS for WCN7850
Date: Fri, 17 Mar 2023 14:25:33 +0800
Message-ID: <20230317062533.18240-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WJRcy3WY-Lm3T5iGIJHokO-k6H89Yrm3
X-Proofpoint-ORIG-GUID: WJRcy3WY-Lm3T5iGIJHokO-k6H89Yrm3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_02,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 adultscore=0 suspectscore=0 mlxlogscore=872 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303170042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_232546_716332_5A86DC03 
X-CRM114-Status: GOOD (  15.08  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

To reduce power consumption, change idle_ps to true to enable
idle mode power save (IMPS) for WCN7850.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index 91d576fd4b0f..1ffac7e3deaa 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -944,7 +944,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.interface_modes = BIT(NL80211_IFTYPE_STATION),
 		.supports_monitor = false,
 
-		.idle_ps = false,
+		.idle_ps = true,
 		.download_calib = false,
 		.supports_suspend = false,
 		.tcl_ring_retry = false,

base-commit: 3df3715e556027e94246b2cb30986563362a65f4
-- 
2.25.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
