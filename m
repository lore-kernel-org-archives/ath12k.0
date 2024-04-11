Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41FACD1299
	for <ath12k@archiver.kernel.org>; Thu, 11 Apr 2024 10:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SEQ2sDvh6L2llsMV474uXxQqBZoTB+5NKfjQfUZLgpU=; b=ogBNAbSkMCM4U4yNkhqOjfoYMj
	T0WAbz45xFacYL1jlGU+9Wir51QYTRf3WChVGYM+1imN97ESaZjZyALePwujZC+FOwS2/IBlyPc0Q
	9MlcWM4xwxrx4OtCYRYrjFsNzFhwAwxq43KdfxZmfCug91zH1SQGCTbsuOnixUjqXVDCtosDPWE1H
	fk6+FXFf/vyc1OkMnfHU4zr01MCpqpLpxpuF8GTX6D1DCLreRhjdJFyV2LJTK+kG6q8oAi8HpBFQE
	t0E+JKA+ftFMFyrylCDb7x3jV9GNEeNcNBkIa/CvNOQ7CCTSEfwArQMWnFWS6JFgLN3jRLlkuA/xg
	Jtn/lGEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rura1-0000000BV1V-2aKn
	for ath12k@archiver.kernel.org;
	Thu, 11 Apr 2024 10:22:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rurZx-0000000BUyX-1G7p
	for ath12k@lists.infradead.org;
	Thu, 11 Apr 2024 10:22:52 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43B8McI5019832;
	Thu, 11 Apr 2024 10:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=SEQ2sDv
	h6L2llsMV474uXxQqBZoTB+5NKfjQfUZLgpU=; b=fmNTrwCDTg5/vek4FVAxoPx
	t6WD1rIeEUgmGuiukljhA9hVOvEjxjScGoMLulHK3CJQoz3/ZJlM124FLZTj7tTF
	auQVzwZ8gYW9ON79yeWoVxAGCRL1I/EUwtAUykQ2nMEXJGGYTKo67IGBXfwRaUTT
	UtLPXAclHBDdLEsqKWiOH3MF9LUxviY5CVD1MLBaGs1TDGIO3zoEmA3R8UtxZYu7
	7xIB/dDdzFolEs8I1hxYW6ZxYlp5UYkdzOb3w8x77T8Mtr3Bxg4/flUG3b3k3iot
	6OO2MU3v+OOmkkJnX6HuJoxDZe2i14pO/SlD5w7FzXGHwT9yAnJy8+O2B9pyajA=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xeb628usk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 10:22:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BAMfau019654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 10:22:41 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 11 Apr 2024 03:22:39 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v3 0/4] wifi: ath12k: Refactor hardware cookie conversion
Date: Thu, 11 Apr 2024 15:52:22 +0530
Message-ID: <20240411102226.4045323-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0ZrYmMO7qn87kp6FbcJnWn9rKGvEvvPF
X-Proofpoint-GUID: 0ZrYmMO7qn87kp6FbcJnWn9rKGvEvvPF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=795
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404110074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_032249_482542_A5289AA9 
X-CRM114-Status: UNSURE (   8.21  )
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

Refactor the hardware cokie conversion initialization procedure to
support multi-device MLO.

This change is applicable to all platforms.

v3:
 - Modify the return type of ath12k_dp_cmem_init() to throw error
   and handle the error case in ath12k_dp_cc_init()
v2:
 - Updated the cover letter message
 - Updated the tested tag for WCN7850

Karthikeyan Periyasamy (4):
  wifi: ath12k: avoid redundant code in Rx cookie conversion init
  wifi: ath12k: Refactor the hardware cookie conversion init
  wifi: ath12k: displace the Tx and Rx descriptor in cookie conversion
    table
  wifi: ath12k: Refactor data path cmem init

 drivers/net/wireless/ath/ath12k/dp.c | 79 +++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/dp.h |  3 ++
 2 files changed, 68 insertions(+), 14 deletions(-)


base-commit: 363e7193eaf258fe7f04e8db560bd8a282a12cd9
-- 
2.34.1


