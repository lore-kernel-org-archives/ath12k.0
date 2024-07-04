Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EBDC30653
	for <ath12k@archiver.kernel.org>; Thu,  4 Jul 2024 07:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fpf6ldYby2oCoSpJ7VUUZlSNSzrqGhya2sV4U4VfUks=; b=bCVq31eO4HSekKjb8nDS13g6pD
	bpj4ohXsReRBkG9BA4jgR7FdVAVEsPkClv282Ui0TSIogu+Q7kC9Kk5rG84frWCkiEdoFcRwqGkew
	zGh+oWomYH6JQ1Qf7MaqycSP8BNVGIqRTHYNzEzPfdL3pFYREu4G4jyECLOrSMcHkMiGyWTIZsLUL
	YIjZsX7GknIyLnlkL4R2Lr7ZyN0HseI2luQTzrw7DhxCJWdsU46hVYKKcyl2ErcHAPNQUNRgjusNt
	Q7++0exAaWLTeyU8WpF+azK9bXhalCsxEycZ26roAyy7FdfciB6cBMgzrnovHJwI2HG1chNnvpH7j
	gJcqRT2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPGa0-0000000CPrC-1L9b
	for ath12k@archiver.kernel.org;
	Thu, 04 Jul 2024 07:08:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPGZw-0000000CPqP-3Dw7;
	Thu, 04 Jul 2024 07:08:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46456ZYP028782;
	Thu, 4 Jul 2024 07:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Fpf6ldYby2oCoSpJ7VUUZl
	SNSzrqGhya2sV4U4VfUks=; b=nzHX7g+dgU62/ej0wCzQbhqdghk4+3IxKEdyFB
	zIB9lQJ81JQGQbrqb7ppXF3Pqgx5sBwhyBR9iikxaXcU82TYrGD2RynLoQvwU8Bo
	LAcwO3RknCWrtTtzvKP4+udrfz2F9mjCqApxYbm1pWadAXCMEey8CSlnnqSWLPVZ
	351F4vh6M+I6vcO+eL0GESCDZlMUB/TOgBFTc9V65Dj3DJ+qyycddN3/NNFj5sUz
	slg61+KDrJaU5Z1u/kTPc39/GIhCrkNn5ZVGwpnGayg++/uR8ncCqdXyeB3FnABy
	wR8S4hSbG/oJA/GjForVSBqsM+rzmnN5KIyRhg19j7eUjcjA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 404kctmwh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 07:08:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46478Q5l016437
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Jul 2024 07:08:26 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 4 Jul 2024 00:08:24 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 0/2] wifi: ath: fix array out-of-bound access in SoC stats
Date: Thu, 4 Jul 2024 12:38:09 +0530
Message-ID: <20240704070811.4186543-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d-jJzWX5qH7e9uVzJSUxK4yHCwdnoHyK
X-Proofpoint-ORIG-GUID: d-jJzWX5qH7e9uVzJSUxK4yHCwdnoHyK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_18,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxlogscore=542 priorityscore=1501 impostorscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407040050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_000828_922967_E70C9F1E 
X-CRM114-Status: UNSURE (   9.67  )
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

Currently, hal_reo_error access lead to array out-of-bound issue. Fix this
issue by modifying the Rx data path handler to use the ring ID directly
instead of the SRNG ring ID.

Karthikeyan Periyasamy (2):
  wifi: ath12k: fix array out-of-bound access in SoC stats
  wifi: ath11k: fix array out-of-bound access in SoC stats

 drivers/net/wireless/ath/ath11k/dp_rx.c | 2 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


base-commit: 73adcb561600d84aa21e06486766ca0ce64fc5a6
-- 
2.34.1


