Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D506C83F3D
	for <ath12k@archiver.kernel.org>; Thu, 17 Jul 2025 17:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIV+P68mmMwEO71bCdnXfkMQUycaueMO8CDJAl4SrLI=; b=Cx8kRzaLpKKye5S26UoelmO7g4
	HJ4C1Go6ioziURR//zb2VbzBRKOjSI87tNy5AYBukR+CJULlByy9QSP5vZfO2leQgnn+37nBi5/9X
	LFty1IPplnOZ/Js/NaCMUJJQYV83eRQu4YhGdNgN/6gfcddqMGC0R06yx3a+Q9P26FaUjWgjaa05s
	ISltkvF/eOXTH0J9qht/L3WTXi9HpZfl1WSobeFJLu9D6ZgnVtwAJ8bi2KjK+KEcdx5eMxCZtqSFC
	zaH/mRW1apybZ+C9k6sgt7QHM2lvTT9fDaXeQ3FQbnPbpI1Zs/wnTr62i2w9Nm6w2Y5k5tIsSJiEg
	lzHE1+bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucSZB-0000000Aoz6-44lC;
	Thu, 17 Jul 2025 17:38:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucSWZ-0000000AoSj-2j5E
	for ath12k@lists.infradead.org;
	Thu, 17 Jul 2025 17:36:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCNLvA032424;
	Thu, 17 Jul 2025 17:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NIV+P68mmMw
	EO71bCdnXfkMQUycaueMO8CDJAl4SrLI=; b=oSyVajk5rsdodl4iQWh5IIe9SyR
	QcUIdwQB58x6WdCcg+n7wcv0Eb6/Re+NixDKVO4xfTBM+4idyJxVRE/FHzXiRWm5
	e0/iNhRIL5liS4eCkOMz+nW4R0OoLXZhqq8uumaEOAZw3L0OeL42WTHlDIZB2+eZ
	Prcp8ChzSaRXSi3H2/08xbukSgu6VACnZd3nVSGw5hl3yzO3vztJp4BguYJW2RYI
	rKdLgq2MfqP3qOalZrLrLY4J306Jw0nDwm1Q2NEpmuJKYby0kLHeeQGSnWtWNefC
	5V38R66ogcS2F5H2sUjvJ3ryZ1VOk7CBFiZpbF1WxBNBLR/ukTXdL2eVE7w==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug388tqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 17:36:02 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56HHZxBg004263;
	Thu, 17 Jul 2025 17:35:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47xuvs3ba1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 17:35:59 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56HHZxFM004257;
	Thu, 17 Jul 2025 17:35:59 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-tamizhr-blr.qualcomm.com [10.190.110.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 56HHZxe3004254
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 17:35:59 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 380741)
	id 57D9641566; Thu, 17 Jul 2025 23:05:58 +0530 (+0530)
From: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
Subject: [PATCH ath-next v2 2/2] wifi: ath12k: Add support to parse max ext2 wmi service bit
Date: Thu, 17 Jul 2025 23:05:39 +0530
Message-Id: <20250717173539.2523396-3-tamizh.raja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717173539.2523396-1-tamizh.raja@oss.qualcomm.com>
References: <20250717173539.2523396-1-tamizh.raja@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE1NSBTYWx0ZWRfX5W0FMaj04KWU
 7w6DmsGCf1kH6JQbbz9ldN3bOPJYV20uHziKIMkbS5Knu6lOzeB4W4Agj3JM7PJDIH1RgMciC92
 4R/+7Y7GlNRkXsP47FHOiuRcDaWb0Kk+zBF8BX8tBtTfIcdu6MvHXxHG2bwSLkBWHO/7R/PtG4B
 JNGEGYExg/+ea3zFi07zc2otMFy6NlJHvyg8u9ilpo03Xy26P95XXD57B+3JYvFkOgzWNJVNq50
 Y+ZcPth4pwjEoT9o8isgjONY0Qzq1JSEkMM+r4WIm3NPFseTILmQMVCJjmei2kufvammQVi3O3l
 tO1L4oarydGCU2ewVCkpeZ6maCF2GYreSXN08JrSSdgUqO2QuyoStYa7Q70TIq1w0JeJMC/zZ7b
 YhpqolbRBdh5BQhpd3n2Jvv0m8TIQZgzYnIb+SothBcroXWVxw42z7071P8zfYDEbnvUVmRx
X-Proofpoint-GUID: aAyzS5vA_5ken4WyiElP3ONj5l7ObU4g
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=68793482 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Krp1D7qZmnOvLDOHkbYA:9
X-Proofpoint-ORIG-GUID: aAyzS5vA_5ken4WyiElP3ONj5l7ObU4g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_103603_804880_C89079F8 
X-CRM114-Status: GOOD (  12.32  )
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

Update the host logic to dynamically parse WMI extended service
bits beyond the current fixed size of 4 * 32 (i.e., 384 bits)
after WMI_MAX_EXT_SERVICE (256).
The current implementation misses service bits advertised beyond this
range, leading to not enabling some of the features supported by firmware.

Implement dynamic length parsing to iterate up to the maximum
service bit index advertised by the firmware.
This ensures all supported features are correctly recognized and enabled.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00217-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 535c9849b98c..a2a493928d08 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -7581,6 +7581,7 @@ static int ath12k_wmi_tlv_services_parser(struct ath12k_base *ab,
 					  void *data)
 {
 	const struct wmi_service_available_event *ev;
+	u16 wmi_ext2_service_words;
 	__le32 *wmi_ext2_service_bitmap;
 	int i, j;
 	u16 expected_len;
@@ -7614,22 +7615,20 @@ static int ath12k_wmi_tlv_services_parser(struct ath12k_base *ab,
 		break;
 	case WMI_TAG_ARRAY_UINT32:
 		wmi_ext2_service_bitmap = (__le32 *)ptr;
+		wmi_ext2_service_words = len / sizeof(u32);
 		for (i = 0, j = WMI_MAX_EXT_SERVICE;
-		     i < WMI_SERVICE_SEGMENT_BM_SIZE32 && j < WMI_MAX_EXT2_SERVICE;
+		     i < wmi_ext2_service_words && j < WMI_MAX_EXT2_SERVICE;
 		     i++) {
 			do {
 				if (__le32_to_cpu(wmi_ext2_service_bitmap[i]) &
 				    BIT(j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32))
 					set_bit(j, ab->wmi_ab.svc_map);
 			} while (++j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32);
+			ath12k_dbg(ab, ATH12K_DBG_WMI,
+				   "wmi_ext2_service bitmap 0x%08x\n",
+				   __le32_to_cpu(wmi_ext2_service_bitmap[i]));
 		}
 
-		ath12k_dbg(ab, ATH12K_DBG_WMI,
-			   "wmi_ext2_service_bitmap 0x%04x 0x%04x 0x%04x 0x%04x",
-			   __le32_to_cpu(wmi_ext2_service_bitmap[0]),
-			   __le32_to_cpu(wmi_ext2_service_bitmap[1]),
-			   __le32_to_cpu(wmi_ext2_service_bitmap[2]),
-			   __le32_to_cpu(wmi_ext2_service_bitmap[3]));
 		break;
 	}
 	return 0;
-- 
2.34.1


