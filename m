Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969FDC25B10
	for <ath12k@archiver.kernel.org>; Sat, 11 May 2024 01:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpyLqTpPlHfvZEwBRs8+SAav5nklc3P+DJ1j4q3G2JU=; b=lLrLQ9gXc2wjvDn3mLJCRZ33fw
	pJqfBRyLbL5Sqzgc2clI/bV2mykGJ/3cSf4J3YYjIP0yxiGlsZsZc1xubW/HINAisUWJXl1lxttCN
	kmc8Zrj680nvJMA81TvOWJSyii9/B10kWWGOtxluumSM6/IZKcL6gfCDMnfcph2BBjfaQBY/Rrqdo
	qC+vHkC+sLL1sZXwmsJ4oxLyg8o4dNnmWDhLEZwZUQNLuFqfAGSiZQgCiBIHZkOobill9DiZZAgHO
	YMaID7ii7zzDx0VaAbNg4DE/AxJPTFRImKEQgPdlp5Ry2LId5McFWjWWOhpkAg4DDLIwRhFawbao3
	0Ozbdg3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5bff-0000000712g-0vd1
	for ath12k@archiver.kernel.org;
	Sat, 11 May 2024 01:37:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5bfb-0000000711f-16p9
	for ath12k@lists.infradead.org;
	Sat, 11 May 2024 01:37:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44AEEWP1028446;
	Sat, 11 May 2024 01:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=tpyLqTpPlHfvZEwBRs8+SAav5nklc3P+DJ1j4q3G2JU=; b=Dm
	T+TjbB1kALgK4lVyQPxsikRIVQIB5ZtF3o8B0aSGyEI2fPs9q6F+KNXS5S3Y0NMB
	YwzpOAt0iNQ5Xg2Yg+1vB4IHOSha3aIqnTITNvNEmFseM0sNvfeAzxbGF+SFYWEK
	sH9QcKGIxNmGuvUuIjIa9L9g1PMBIjckyfA+6fS1jyI4MJsvJNpkI405iF5Frs7I
	D3i4yT5CoRaUIvEpOLN6T0B9teT5CQltzE7FJCEpK0IkGvFurr45+KFGpQXw0VpL
	1RiJ5LFOb5z2bfyjJWGDqlTVNuqBy+t5R8hoHAp/W54tQxd+dLhEci/3Qe4PQtID
	CXkbL91iciegYwCWul8Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w0tuyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 May 2024 01:37:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44B1b1L6032583
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 May 2024 01:37:01 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 10 May 2024 18:36:59 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 1/2] wifi: ath12k: remove duplicate definition of MAX_RADIOS
Date: Sat, 11 May 2024 07:06:43 +0530
Message-ID: <20240511013644.3103905-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240511013644.3103905-1-quic_periyasa@quicinc.com>
References: <20240511013644.3103905-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FyAbmyUdXfAvJG0_aCG-q3iGbwx708Fa
X-Proofpoint-ORIG-GUID: FyAbmyUdXfAvJG0_aCG-q3iGbwx708Fa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_18,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=856 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405110010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_183703_439704_D8FF3777 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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

Remove the duplicate definition of MAX_RADIOS from the core header file.

No functional changes, compile tested only.

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index bb6c1b562baf..345d47fe63ff 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -180,8 +180,6 @@ struct ath12k_he {
 	u32 heop_param;
 };
 
-#define MAX_RADIOS 3
-
 enum {
 	WMI_HOST_TP_SCALE_MAX   = 0,
 	WMI_HOST_TP_SCALE_50    = 1,
-- 
2.34.1


