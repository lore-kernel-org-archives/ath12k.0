Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDBACD128A
	for <ath12k@archiver.kernel.org>; Tue,  9 Apr 2024 15:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pZFMvaVRGWB4vjflW7fMsGoUjf+JLzocJTgx9Muxa40=; b=u1gFGii6X+pUb6KsKOydsggNf1
	6TEEhi2bU6UY7Q++rJXDJejxSnFnTI3S+JArgecDDoHAcsCVXILv+mF9GBKvK9UlxZhJQPp3xkpJ7
	E5ZNiPCSi+cbeRQKLZFWaMiNmnCdCM0aI6zP1aNd8NjwUZZZDWD82SO2lXA+Td3WO2lcTZNkDdTce
	drNxun5D9yZ8sEdfV2DyXKw6GmTnb5kUBY9Z3LO7CYUKqjNwzv94Y9uwdYtVLh3raCc2aE+w78kAt
	G1dAzjQPIca6e/LTeYD8LzUVznKkzuh9xKM/xwgL6gZ5lwx12CHviSyizgsLQv4H1mN22RltYbRfM
	Yq3GWOKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruDBF-00000002e73-0MoI
	for ath12k@archiver.kernel.org;
	Tue, 09 Apr 2024 15:14:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruDBC-00000002e4C-1LQl
	for ath12k@lists.infradead.org;
	Tue, 09 Apr 2024 15:14:36 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 439ClPPl017090;
	Tue, 9 Apr 2024 15:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=pZFMvaV
	RGWB4vjflW7fMsGoUjf+JLzocJTgx9Muxa40=; b=FEBzemoFiFcnEGE7BPLpFpd
	FyLuQQqv8CppWZVlduk1CKWh59Uqlb3c5if/Gc4yn8g/YGL7ygZyxfGBlRrq/q2Q
	yI09dTtySfd6RikV3V6oUZFX+bwL+/BjgS6jGYWXwUw9OSAzWFQPLh+fpMB260Ou
	h4bF+lDzOsD76wDftfoCzn9PI11qmsbsA6wiSj6HVa4HlesOyxlMQvHIKp4xWWmG
	kCkMhQ76MAtIMzbaD5R/w6XhlxJHeEzIRYiozZzQL74f+zU0gCt68QjCZ4I4HRXx
	RZHbcvo8OF7Z2vxHX9yLgySITb94iIGNwpbMwHq56kprYVJnyfhm3+4MTLELauQ=
	=
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xd4tjrg81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2024 15:14:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 439FEUCU002778
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Apr 2024 15:14:30 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 9 Apr 2024 08:14:28 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v2 0/4] wifi: ath12k: Refactor hardware cookie conversion
Date: Tue, 9 Apr 2024 20:44:11 +0530
Message-ID: <20240409151415.1226109-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rCCzY8aEIdTHqJJdwdlcV5SFIFdENwC0
X-Proofpoint-GUID: rCCzY8aEIdTHqJJdwdlcV5SFIFdENwC0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_10,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 impostorscore=0 mlxlogscore=721 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404090100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_081434_834683_33BFBC2D 
X-CRM114-Status: UNSURE (   7.28  )
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

v2:
 - Updated the cover letter message
 - Updated the tested tag for WCN7850

Karthikeyan Periyasamy (4):
  wifi: ath12k: avoid redundant code in Rx cookie conversion init
  wifi: ath12k: Refactor the hardware cookie conversion init
  wifi: ath12k: displace the Tx and Rx descriptor in cookie conversion
    table
  wifi: ath12k: Refactor data path cmem init

 drivers/net/wireless/ath/ath12k/dp.c | 70 ++++++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/dp.h |  3 ++
 2 files changed, 58 insertions(+), 15 deletions(-)


base-commit: dc410c4accd2fe64479a1f4ebc47ec9cd3928f4a
-- 
2.34.1


