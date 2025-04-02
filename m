Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B74C36010
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 02:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18Ex138EkfIUKLdaGwIhfHBs9wqFVmZ+17f1exzbNUM=; b=u6vdwwgV8+ys1w9sfRmeDBQOo9
	UmLG3Yv3wphqP/EojmME1220nTFiLjy9CyacwaA3AzfmI2ajz64gGsM4DfBudt5g4Y416LGEnr7o+
	QM/LS0mGR0MPz9n5ZAQKTOEIfpc3rynWTqZ8SzYsK2/deRZUdo8UMwW1EZYdy/NJk17zzZheiKPTY
	7ARlciqn92cm70rRWUYYi1d/K/ms2AceddOUvmLabs8dzXOaqDBQLB4zEteusRRaPLJTiwY/G2cBS
	Iuy3Z1SOFuQIdobkj52peRScUgnuEN4IpzWqq876/XLNATmger66RWtXjDBLQfR7C8+DNuM3qHUUf
	cW1cRrHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzo7U-00000004y13-1JHE
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 02:46:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzo7P-00000004xyc-1liT
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 02:46:20 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53218K3n023292;
	Wed, 2 Apr 2025 02:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	18Ex138EkfIUKLdaGwIhfHBs9wqFVmZ+17f1exzbNUM=; b=nB7Uf2M9OLeGlbJ3
	jZhRg8WuDNiEyN/PHa1aNh3gDJg9Km2ssEfGwC87frZr7R5djDJ5hFRCehl4XB37
	0GKOcOkYapQQJmvszVYGJhBXtDnT1KKl/6Ki847hZgwnOW+sFFaPZn1gsWBu0b9d
	JujTdZvzHrjJJB/nHuAxxB0Zt5WtbB0RuHjZVUHoJG6IT7/YjbKahUJFmFT4lTJA
	1mPXGSilUlZbuHmwr98uN/BoRk7Ts48ZvWhv1baDtHHDAAlERVT24vij8e3wU41/
	X8kphTC5v/G+JSp03Mif8unljZTBFtqHzHEqc0faqJp+77JuRqxsaoQWDfVzBCC3
	myE8sw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ruadr6ec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 02:46:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5322kGkT006122
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Apr 2025 02:46:16 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Apr 2025
 19:46:14 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Date: Wed, 2 Apr 2025 10:45:41 +0800
Subject: [PATCH ath-next 2/9] wifi: ath12k: use fw_features only when it is
 valid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250402-ath12k-wcn7850-mlo-support-v1-2-bad47cf00704@quicinc.com>
References: <20250402-ath12k-wcn7850-mlo-support-v1-0-bad47cf00704@quicinc.com>
In-Reply-To: <20250402-ath12k-wcn7850-mlo-support-v1-0-bad47cf00704@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
	<jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=VI/dn8PX c=1 sm=1 tr=0 ts=67eca4f8 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=aOhJHzjgUxcndhPc63EA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -0LnMFtntGnWKNTKOV-JJCbYrDwuo6y-
X-Proofpoint-GUID: -0LnMFtntGnWKNTKOV-JJCbYrDwuo6y-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_01,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=836 malwarescore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_194619_749904_AF3A92FA 
X-CRM114-Status: GOOD (  16.27  )
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

Currently fw_features is used to check if a specific feature is supported
or not: if the feature bit is set the feature is believed to be supported,
otherwise not supported. Since fw_features is populated only when using
firmware API-2, and by default it is zero, in case of API-1 such as
WCN7850 firmware it is possible that a feature is not enabled by host
while actually firmware supports it.

To avoid this, add a new flag indicating whether fw_features has been ever
populated or not, and only when that flag is true we choose to believe
fw_features. This benefits firmware MLO capability validation in an
upcoming patch.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00209-QCAHKSWPL_SILICONZ-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h | 1 +
 drivers/net/wireless/ath/ath12k/fw.c   | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 4c0bc9647619aeed717034cf0819b7b3db495f30..2a7d7a185aef1052b5644a9181d8a8e31bd25897 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1068,6 +1068,7 @@ struct ath12k_base {
 		size_t m3_len;
 
 		DECLARE_BITMAP(fw_features, ATH12K_FW_FEATURE_COUNT);
+		bool fw_features_valid;
 	} fw;
 
 	const struct hal_rx_ops *hal_rx_ops;
diff --git a/drivers/net/wireless/ath/ath12k/fw.c b/drivers/net/wireless/ath/ath12k/fw.c
index af8b87ca4ccbe748974d17955397b4b23b52e8a8..5ac497f80cad8718fff5979f2a9cdd9116c7d01e 100644
--- a/drivers/net/wireless/ath/ath12k/fw.c
+++ b/drivers/net/wireless/ath/ath12k/fw.c
@@ -99,6 +99,8 @@ static int ath12k_fw_request_firmware_api_n(struct ath12k_base *ab,
 					__set_bit(i, ab->fw.fw_features);
 			}
 
+			ab->fw.fw_features_valid = true;
+
 			ath12k_dbg_dump(ab, ATH12K_DBG_BOOT, "features", "",
 					ab->fw.fw_features,
 					sizeof(ab->fw.fw_features));
@@ -172,5 +174,5 @@ void ath12k_fw_unmap(struct ath12k_base *ab)
 
 bool ath12k_fw_feature_supported(struct ath12k_base *ab, enum ath12k_fw_features feat)
 {
-	return test_bit(feat, ab->fw.fw_features);
+	return ab->fw.fw_features_valid && test_bit(feat, ab->fw.fw_features);
 }

-- 
2.25.1


