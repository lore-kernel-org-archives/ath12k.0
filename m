Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BC2C369A1
	for <ath12k@archiver.kernel.org>; Wed,  9 Apr 2025 15:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xvJUBa9jmV/CuWZUZzUVWx0CM4W8MY5+5Y0HMgMjb6c=; b=BiBhm+j3xcFbvEdlXKBBi1oEzN
	Z6eMHrbFPu46UOSxz4YLLU8M0x46oh93wBlbJ00v7w/ZGqhl6sr2MhEA5k562ZK1YQfGAPqcMh3R7
	TJ435jtiVfyVgdsSpV+6yZq1snOymT1krC+Kzog7U1LfrUnwSXAbMwbqY0nxv4YKO3y8iwG8cr1wQ
	6Ke/eA1w9T51y9ghRaEWzJQhBMTdvHUpbG8JXERJA8x9M9i5Pz67YcFuoZ6zMoQhoECf87qbKrKiI
	AqgsecOVDvbI0rGaTMANsxTk31u7eL+lfEyd1kgRSE/qa40lmIHZRXVgX0Hq8MKUS47NGxp6CNGQu
	W12hQhbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XKj-00000007gF4-26w4
	for ath12k@archiver.kernel.org;
	Wed, 09 Apr 2025 15:27:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XHX-00000007fPQ-2c0W
	for ath12k@lists.infradead.org;
	Wed, 09 Apr 2025 15:24:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398ZsoY002292;
	Wed, 9 Apr 2025 15:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xvJUBa9jmV/CuWZUZzUVWx0CM4W8MY5+5Y0
	HMgMjb6c=; b=MCYRLmb7iZca+xMK1u11OO/r6fBaWPopGIjxnR5L3TgRpT+O81E
	HqDZCkcK2be8hm2OhuH8/dYONefQqNiyd1MP4c0uablTdNnrrsBELh+3JDtNKaoX
	kX360JjPJelRyqHy81ivtKlF360xJgwYFWGFH4u6wPDX0svkVNZ0bgTkSwd4D0mK
	FtMmQ17OyEyHQ3LB6Rj77m2Ok0RAyaLtmJX1hFWK7Yyz49FVgFaXmYWr7NlE81n3
	nI4074dNGMoIUQ5YoOoh32R9Xwl9Z2pts8jDEy2BqGlcxdR4ahHL0fx6pHd3b9on
	zgdo4mxMyS2/bolgISwM7pVng+yyM4bOKww==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1kq52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 15:24:01 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 539FNxTR006906;
	Wed, 9 Apr 2025 15:23:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 45ufe9dbt5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 15:23:59 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 539FNw1G006832;
	Wed, 9 Apr 2025 15:23:58 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-rgnanase-blr.qualcomm.com [10.190.106.79])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 539FNwJp006784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 15:23:58 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 2378837)
	id 25F2141051; Wed,  9 Apr 2025 20:53:58 +0530 (+0530)
From: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Fix WMI tag for EHT rate in peer assoc
Date: Wed,  9 Apr 2025 20:53:41 +0530
Message-Id: <20250409152341.944628-1-ramya.gnanasekar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kzdW8fWj1q1pe3o8aDvU5vemOuDAz5kf
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f69112 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=I41XtXC94m2bCSVN2b4A:9
X-Proofpoint-GUID: kzdW8fWj1q1pe3o8aDvU5vemOuDAz5kf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_082403_774543_2E995A4C 
X-CRM114-Status: GOOD (  11.73  )
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

Incorrect WMI tag is used for EHT rate update from host to firmware
while encoding peer assoc WMI.

Correct the WMI tag used for EHT rate update from WMI_TAG_HE_RATE_SET
to the proper tag. This ensures firmware does not mistakenly update HE rate during parsing.

Found during code review. Compile tested only.

Fixes: 5b70ec6036c1 ("wifi: ath12k: add WMI support for EHT peer")
Signed-off-by: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index ad29c4c99dc7..664d03dcc041 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2330,7 +2330,7 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 
 	for (i = 0; i < arg->peer_eht_mcs_count; i++) {
 		eht_mcs = ptr;
-		eht_mcs->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_HE_RATE_SET,
+		eht_mcs->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_EHT_RATE_SET,
 							     sizeof(*eht_mcs));
 
 		eht_mcs->rx_mcs_set = cpu_to_le32(arg->peer_eht_rx_mcs_set[i]);

base-commit: 58b976e4f4b4d727eea27c0e40830853ef7ecf0e
-- 
2.34.1


