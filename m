Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A799C25B77
	for <ath12k@archiver.kernel.org>; Thu, 16 May 2024 00:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=biYqAP8dnIMsicL5QWkwCWLjwqsW9s+ULU8BCvd3pDc=; b=jWDL23ThymZiACVm15jxt02gvB
	Jr/m+3QUpXHzYGuRTKEZxQ3twXXw/Iu2KgrIL8KUSxhTwF1KDS6C24WFbU9hstmvIfJxIzWzKlI/h
	8z/rGXaOkFak7UT+bGNeN+hHIiP1voi24bRX8KyVbARtxkje8aI+rfWQ/ezxWdShVTpvL8OweidKD
	mS/+0Web0NaTXADxMQ9NdOk6D5KEMImYxPPsq1aNY20ljKLgE0C4vRNc9dKm3Zm6rKIpJQrxSV8tT
	o6ahe3PbSQLDZWXo7y7OyI/5hFj+PTlCShKLWMAO+32cC4PLiOGfhA7uuNxXQqz6T1Uq0s0L651c+
	0g0v7cZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Ofg-00000003Dx5-0B2R
	for ath12k@archiver.kernel.org;
	Thu, 16 May 2024 00:08:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Ofd-00000003Dw0-2bF0
	for ath12k@lists.infradead.org;
	Thu, 16 May 2024 00:08:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44FKFrJY027342;
	Thu, 16 May 2024 00:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=biYqAP8
	dnIMsicL5QWkwCWLjwqsW9s+ULU8BCvd3pDc=; b=bbpQrJkwOc560tx7mDzUTz6
	ucen+vw1Q8k9mDq/kPRvUTSFSiGn7mLGzWZIGU4IGYSSDfBvKZtjaFjFVbDRVhoC
	roL4aJk5KR2Yq/8U2tPZuiYoiGU/iVy4FN3cSNpUt52FFsZj/Qf90xr1zHsblFae
	/5ZDv0LktZNtmOY6zvP7zbJd+tFOnFZKTcwyA4m+lT2fES6C8BECu0IP1xeqtJ7e
	HXO/FCfIwILtUPn9dQnkJCbss9Lij2dJMWQRZvxz6b1JTp/ONkBA0b/pQ3b2y8CA
	RKBGJqmiMeHxuA8TH7Rg6xfG+brrA+7UW7UHgbeYE2UttEpxyTdq6akXk+lyXaQ=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y42kvvvdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 00:08:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44G08Pj8005254
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 00:08:25 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 17:08:23 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 0/2] wifi: ath12k: Refactor Rx descriptor buffer CMEM
Date: Thu, 16 May 2024 05:38:05 +0530
Message-ID: <20240516000807.1704913-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9Q2r5AHiJfV8rs7FAK2EuamuYcaUUvJg
X-Proofpoint-ORIG-GUID: 9Q2r5AHiJfV8rs7FAK2EuamuYcaUUvJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_14,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=4 suspectscore=0 malwarescore=0
 mlxlogscore=139 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=4 adultscore=0 mlxscore=4 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_170829_803656_4E939CC4 
X-CRM114-Status: UNSURE (   6.71  )
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

Refactor Rx descriptor buffer configuration to scalable for inter device
Multi-link operation.

Karthikeyan Periyasamy (2):
  wifi: ath12k: Refactor Rx descriptor CMEM configuration
  wifi: ath12k: improve the rx descriptor error information

 drivers/net/wireless/ath/ath12k/dp.c    | 11 ++++++++---
 drivers/net/wireless/ath/ath12k/dp.h    |  1 +
 drivers/net/wireless/ath/ath12k/dp_rx.c |  7 ++++---
 3 files changed, 13 insertions(+), 6 deletions(-)


base-commit: 5b501f801ab443046d5c31881bba21350396e5c5
-- 
2.34.1


