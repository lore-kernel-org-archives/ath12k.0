Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFFCC25B78
	for <ath12k@archiver.kernel.org>; Tue, 14 May 2024 06:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVpNVjXqpwn0X2HzK171L0SVxNtg5Qd71JWHZCkbs6A=; b=3drj8xvZXV6KCfnnDXYSBjPtEY
	IQ9FSCYh6kHf09eQ4BY3IzhnnaYRQDGX1+KybFUGWJWZflCbgckUUyQlV6dHl/570gLk0YpB+CApT
	xeiViLFjTVjWF4tzjIjSk0HV8UGHKXAljuPA1zCPSYcaHieoqh3mMEJqgZdj4cHSWmkX4GosUuY5t
	oIr3BmIKHUxCTRfFm020WWnvc+SVz0eipuALaqW+E8gnAYI3Azljc6Rnm3IL32Niwuo86QShYb/v9
	vQqCvQk39iHyhxtA34pOO36tkbImGAJJ/n3qwaexberBXkczJetYyGkZQXr/bvD8ToqgzqSZYA9bi
	/DQ4L4HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6lkL-0000000F7pS-2Rne
	for ath12k@archiver.kernel.org;
	Tue, 14 May 2024 06:34:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6lkH-0000000F7o8-3I2m
	for ath12k@lists.infradead.org;
	Tue, 14 May 2024 06:34:43 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8sEh024231;
	Tue, 14 May 2024 06:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=dVpNVjXqpwn0X2HzK171L0SVxNtg5Qd71JWHZCkbs6A=; b=h2
	eOcNEHibM5y2/19/OVAULRHMhoN/b8z1k5LJ+N9BJzkeR8xqrvx1APjM40gKQ/rn
	Qd1yax2JCvCFiToSv2UB5vwvJDHli81SA2we7FyS23V2ZgXMlZUstLc1l/5tx54w
	HTSJWsMS9v5uh1EMfzFnJebo1ZzH9cxYxCUdo+QWXIQiBZ8qAbZy026N/KC3bxuS
	dQpTXSh72Sa9VzeDcOw24GxIsi5dlXLLIyQwYPu+J19p6h7Anz/w35GOShZZ1AAn
	aVut7giI+Mtc2+oemYndY4s79wmwW3iOl0vMEVzrlSMW0dwACuUiKneXaEa4auN1
	j+Buui8jMox1i59USe5g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y1ymq5hd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 06:34:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44E6YbA5004395
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 06:34:37 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 May 2024 23:34:35 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH v2 1/2] wifi: ath12k: remove duplicate definition of MAX_RADIOS
Date: Tue, 14 May 2024 12:04:11 +0530
Message-ID: <20240514063412.3483723-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240514063412.3483723-1-quic_periyasa@quicinc.com>
References: <20240514063412.3483723-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ofWoWTgZhBWNpVusjs7V0AAiTsnoY0GT
X-Proofpoint-ORIG-GUID: ofWoWTgZhBWNpVusjs7V0AAiTsnoY0GT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_02,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 mlxlogscore=867 priorityscore=1501 phishscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405140044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_233441_882584_835C7BC7 
X-CRM114-Status: UNSURE (   9.08  )
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
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index c6b7524ce3a0..9e3f9537087d 100644
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


