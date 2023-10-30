Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C1BC4332F
	for <ath12k@archiver.kernel.org>; Mon, 30 Oct 2023 22:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPkj8nML8TZdOw7fmzfU6HgBiUYCKL/xeR18rJojc/U=; b=ECI3q4c3RBBDe/
	2fOgzItUSOC/H9exAG2Y4MREDyV3pYmScWYujx+DIuJboHjsHFFrxLHt/1bKc1s1RAjSD7+y8G8lM
	F73QTGP3F8/NkJqj0KlGy0DBM0xnAuCDHoqU4WKDukP2Xh/RiFxhb8tnlVxc+6smTVVuj0EnHxs6v
	MKFArEaMYiUS/9TurehU9ntaB7+ZqejIR/WF0JL1Fl2bvT0JnTxCvMdcvk34VjBoNQGPPSlzl9eAM
	eOhEPp3MIdq6goWwDxG3+IxcLcnxcnNFtCQT1Sdyhvac7ZezCm8EAuTZD6jXw4R7wZhDU42cJE8Cf
	L6RfuglNC9J5vVpyn6IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxajU-0048oR-01
	for ath12k@archiver.kernel.org;
	Mon, 30 Oct 2023 22:27:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxajR-0048nM-1h
	for ath12k@lists.infradead.org;
	Mon, 30 Oct 2023 22:27:38 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39ULqTE3027293;
	Mon, 30 Oct 2023 22:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=jXzHCSyj9C0E6i8loryrBAmW6y6X02LfmsWBoLfcjRQ=;
 b=Uv80+PfIfUv8cs+iET9chBHoRWovIqozXJGT3gAeWcxhvMbN50+0pjQW2Eb06jUCZC0h
 c2BTxPkNqlLTbtqUUUU4FIJAM1FdZqZqeFpaICrkwL+lCrZwk401n5cI5ZU79W7rc7J+
 fgvjhKEoYREA3aP4RcKt2WG0/lQbj0IV+ffCnw58zvouBYle5a7hyAQMCg1aSNsvbVOx
 azeJwqVEYJjunfIk1u8OMBNaAqogFnZsJ4xJKgFd/ObbW4cm9CShBOsbx3q6FKmwkRIK
 x1CNAdUKZ+OlhHKqPI2juOe+iPrgcSxZCY9FV1NTm3fcgBib5D1/KlsuOBTjdJFIsgbQ WQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u2dey175h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 22:27:36 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39UMRZbJ021330
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 22:27:35 GMT
Received: from rajkbhag-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 30 Oct 2023 15:27:33 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rajat Soni <quic_rajson@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [PATCH 01/13] wifi: ath12k: Update enum wmi_direct_buffer_module
Date: Tue, 31 Oct 2023 03:56:48 +0530
Message-ID: <20231030222700.18914-2-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231030222700.18914-1-quic_rajkbhag@quicinc.com>
References: <20231030222700.18914-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IwjlGxMzqnrxfOW8SL4HgLWxMRGJrpbG
X-Proofpoint-GUID: IwjlGxMzqnrxfOW8SL4HgLWxMRGJrpbG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=940
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2310240000 definitions=main-2310300176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_152737_678838_356FBD22 
X-CRM114-Status: GOOD (  13.62  )
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

From: Rajat Soni <quic_rajson@quicinc.com>

Currently firmware is sending module id as 2 that is not supported.
This causes functional failure in driver.
Firmware added support for WMI_CONFIG_MODULE_CV_UPLOAD.
Add enum WMI_CONFIG_MODULE_CV_UPLOAD in wmi_direct_buffer_module to
resolve this issue.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 629373d67..8e1eda7aa 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2230,6 +2230,7 @@ enum wmi_beacon_gen_mode {
 enum wmi_direct_buffer_module {
 	WMI_DIRECT_BUF_SPECTRAL = 0,
 	WMI_DIRECT_BUF_CFR = 1,
+	WMI_DIRECT_BUF_CV_UPLOAD = 2,
 
 	/* keep it last */
 	WMI_DIRECT_BUF_MAX
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
