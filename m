Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B081AC3601E
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 15:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXckf7qpqy+iKR9NQcsjI5qxy3oCDe+Reqn+kdgNQRA=; b=pUpwR/qhJ7noy+j+tdttntLeWB
	bQvJL8dEFPj1x+bhEgVCvU7Fff8UFAsoLIlxliuunnn3bjhgd0BXH4pyfW9Q+lYhFXKENiof83uoC
	G+NF6IwnitHHAjsi4brXougr5B2LxjWgK7rKHKFG4H5Rjw5+RkQa3uPs/ehnpzGjXhJKvYDldlO+L
	IXw077rPl8PfMgeZwK+VFDlARKeYrQZIzlzuSDnrGfCLLZ+tAdhU2VqqGVcCgX8BCppnooSNdZcTg
	MzrWsUeBRhe4kYcn3p8v92gOyWJOpCpu149SDGO6mQoFAnzXP7JzGMnosk/aGbTStqf4yyl7/t1KY
	apU0evPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u002j-00000006WNy-1mLG
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 15:30:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzye-00000006Vnv-1Vwm
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 15:26:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532D60R6024515;
	Wed, 2 Apr 2025 15:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RXckf7qpqy+iKR9NQcsjI5qx
	y3oCDe+Reqn+kdgNQRA=; b=mgXBAuIc1weKhls4FQXwLt/mzrLhIItwlm2ys5I0
	KX1uzhZ00Wx6T3CIZ+4XZVGI3yKLNbGJBcvxH+/tgOVWPXc3lYKq3C5CBnn86Reb
	OGODA/h+4gRdlPHQTzVVAnXoZstlQNFWQJzQDQs4JHtPLTW4C4vMtfCHzconFFI3
	ipOGtnNj8ISY65E8/31jm/oe5r9Ubb0AueKbON7N3DT+QuUhgMQSBh6wLcIw982q
	NweNZbGpwp2eY/KHirfLe8t6TcNFsNERSgdU0n7ESgZNSAvGFNO/Vz+lcK6u+8NW
	VnYZcqBqy6TVA+a7if0p+3QymLEHmCDCKVLsZy0rPbO0cQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rbpyvxwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 15:26:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 532FQ3Db013293
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Apr 2025 15:26:03 GMT
Received: from hu-nithp-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 2 Apr 2025 08:26:01 -0700
From: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Nithyanantham Paramasivam
	<quic_nithp@quicinc.com>
Subject: [PATCH ath-next v4 3/3] wifi: ath12k: Enable REO queue lookup table feature on QCN9274
Date: Wed, 2 Apr 2025 20:55:29 +0530
Message-ID: <20250402152529.1649402-4-quic_nithp@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250402152529.1649402-1-quic_nithp@quicinc.com>
References: <20250402152529.1649402-1-quic_nithp@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IBa21SbHH_n4WrDaMkrxUrHrPvQuLEpJ
X-Proofpoint-ORIG-GUID: IBa21SbHH_n4WrDaMkrxUrHrPvQuLEpJ
X-Authority-Analysis: v=2.4 cv=ZNLXmW7b c=1 sm=1 tr=0 ts=67ed570c cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=VG1Z7HIe-OYZGDrRaVgA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=966
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_082604_401986_C5376E8A 
X-CRM114-Status: GOOD (  13.38  )
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

Enable the REO queue lookup table feature for QCN9274 by setting the
reoq_lut_support flag.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index 1d1a59819bbe..20f04f5c6b5b 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -1288,7 +1288,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.download_calib = true,
 		.supports_suspend = false,
 		.tcl_ring_retry = true,
-		.reoq_lut_support = false,
+		.reoq_lut_support = true,
 		.supports_shadow_regs = false,
 
 		.num_tcl_banks = 48,
-- 
2.17.1


