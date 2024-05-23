Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EC0C25B75
	for <ath12k@archiver.kernel.org>; Thu, 23 May 2024 15:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SuFhiB3i6/49OtoZgs7gd8xku5X1qyrwkV9WA7KzUCk=; b=07LC8YYQbyorxXIJFz13PKbHXh
	f7cilbeax20VZ19qls4kQN9EuEzIUQQxScxNOSZxUHjP+rbZZvP6+pG9GmGWo//y8ogRoWzcRFbyI
	vMqRn1D/vGg61hc4yatcePA9FcdbalgejYtowk0ysvan3qWa7LBVpIeL0Cm84vOxvkyK1ULi2p/HO
	+eVvTwXu7p7vsN2aSi3+vfaz9Yxr8zHTR29diqInJfC6XJgbv1u6Lla+wxyeHkTAb+gPYomP9bpMp
	ut1O3Ma2r20TiZSKRNWGl7CYbpUHUYyOsie7teDCCBbc9N38rlQHbGyAaMz7ejeGTj/JE4v0wAdqu
	ocFMolmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAAD0-00000006ciH-0fH1
	for ath12k@archiver.kernel.org;
	Thu, 23 May 2024 15:18:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAACw-00000006ch6-2OnH
	for ath12k@lists.infradead.org;
	Thu, 23 May 2024 15:18:20 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NE1F1F010800;
	Thu, 23 May 2024 15:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SuFhiB3i6/49OtoZgs7gd8
	xku5X1qyrwkV9WA7KzUCk=; b=LB1z0fgbbviTMuB9LnzYGWeuemY4up2oO2GTEK
	yp7Bd0gvKMRlQDexAn3ihqgYoZCtEDnm3aPvfugYiTLZcG24302f2UCTYGsCy3Oc
	1nf7PZ5OrWtGKOIKWXM5jPYwFHI+iCuhwdusPS2HYyeK66kou1YgrB9lq2enaN4f
	u9A0tZIbyIiLaUH3YtLv9a7mWBMR4ShATLrHj8WGQt0/I71P2b6jHmV/X8mW47+z
	zywOwFe7tpQ3p5Kly/Qt+3OxUbVTCkkLRIW2LxZr0thYaqtwVHrOeXHjJUBeI0Fa
	zHoB5YbjOshgqiSLxopoqiSh7R+SZrz5erNBB9u2Mla5TCCQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y9xxk1hq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 15:18:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44NFI7la018639
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 15:18:07 GMT
Received: from [169.254.0.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 May
 2024 08:18:06 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Thu, 23 May 2024 08:18:05 -0700
Subject: [PATCH] wifi: ath12k: Fix devmem address prefix when logging
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240523-ox-v1-1-112ae7350059@quicinc.com>
X-B4-Tracking: v=1; b=H4sIACxeT2YC/1WNyw6CMBBFf4XM2ppOi/Gx8j8MizIMMom02gLBE
 P7dws7lSc49d4HEUTjBrVgg8iRJgs+AhwKoc/7JSprMYLQp9cmgCrMic651WTaorYEsviO3Mu+
 RR5W5dolVHZ2nbpu+xI+z6l0aOG56J2kI8btfTriN/uoTKlT20jprrqTR2vtnFBJPRwo9VOu6/
 gC+ic5otQAAAA==
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: frjVlzPF3NT8Ll-dIWl5aK_3ZQdrOUD8
X-Proofpoint-GUID: frjVlzPF3NT8Ll-dIWl5aK_3ZQdrOUD8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_09,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=934 phishscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405230104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_081818_819710_397B2FEE 
X-CRM114-Status: GOOD (  10.84  )
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

Currently when ath12k QMI logging is enabled, messages such as the
following can be logged:

ath12k_pci 0000:03:00.0: devmem [0] start ox113000 size 20480

Replace ox% with 0x% to get a proper hex address prefix:

ath12k_pci 0000:03:00.0: devmem [0] start 0x113000 size 20480

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 5484112859a6..e37c963b6903 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2503,7 +2503,7 @@ static int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
 			ab->qmi.dev_mem[i].size =
 				resp.dev_mem[i].size;
 			ath12k_dbg(ab, ATH12K_DBG_QMI,
-				   "devmem [%d] start ox%llx size %llu\n", i,
+				   "devmem [%d] start 0x%llx size %llu\n", i,
 				   ab->qmi.dev_mem[i].start,
 				   ab->qmi.dev_mem[i].size);
 		}

---
base-commit: 29c73fc794c83505066ee6db893b2a83ac5fac63
change-id: 20240521-ox-c27b044d1032


