Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83487C54E68
	for <ath12k@archiver.kernel.org>; Wed, 20 Mar 2024 01:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nEJmj18XBa24x5VfgAFgprFQ0bBg/35sYVnmhcBb258=; b=HuqHl11yBB3Umg04Y4C354TYZ7
	TTRWbEZPDsWu4eaf+bvhq/DFobSdQryHBn77ppwaKA/rx4FjOWG4A8Epcr6d3sGO1hgHRS9Zc3xgK
	DVVba5HNryEaQoG5ge1HfZxdXTdvSzvM9/RaU7hBJmuyROoyrXDx+9mg5E7Ro18NymRwmnm+qQ5Ki
	MkDP1bS05cVwiVS8/GaYJYoyA7hgyQqhFK9z0fskcNIqUD9BebfqvmYT22uWftjxmxy/iOu+fQj6A
	2yixcusR1VjeWXQvIGmeadh2tLE+B5tFrLy3z2DejnqgD9EmL7mHWiCEOUKU8vkPm7nYV996hD3p4
	kPGvWvmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmkPe-0000000Er5Q-3aq7
	for ath12k@archiver.kernel.org;
	Wed, 20 Mar 2024 01:06:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmkPb-0000000Er49-0KGF
	for ath12k@lists.infradead.org;
	Wed, 20 Mar 2024 01:06:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42K0wcS2021648;
	Wed, 20 Mar 2024 01:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=nEJmj18
	XBa24x5VfgAFgprFQ0bBg/35sYVnmhcBb258=; b=flx46Y2rpx5Ya+DBZbj7ICM
	2qu90fDpw/aanq+O13gAjd6wU+zzfK1LueLBuWp6NFdlK5vMgWiGUhJL0TUfhN7Q
	yZRKUCFNqWEoIeaX5gxEdXSEVcDkSOhYanvirr87CvRqKTzJGOhrfiF9kBVoXzCC
	tnZwqBH7jtnvPyLi18lNfD56S9l0J5w9+5FFLrySKcw0Q10ehAXhkb0Z4tgEAaB/
	gQLVj8lrUhYxJc4ipovi2XG30KMqhGCkUr4MrOQFnr4HnWTBdSsAVHLCpF1MEnml
	PDSk6dyLYtJzBechHzQyRtMjIG4uNBPxJBITgKK57JUFeTeludpTOK3mMuXKOXQ=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wy553jfgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 01:06:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42K16WQv025531
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 01:06:32 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 19 Mar 2024 18:06:30 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v2 0/3] wifi: ath12k: Optimize the lock contention in Rx data path
Date: Wed, 20 Mar 2024 06:36:12 +0530
Message-ID: <20240320010615.91331-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r8b5o8mj1CEcgPIORVIW1sA61POuA2rP
X-Proofpoint-ORIG-GUID: r8b5o8mj1CEcgPIORVIW1sA61POuA2rP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_10,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 mlxscore=1 impostorscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 spamscore=1 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 mlxlogscore=226 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403200006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_180635_284073_126E9947 
X-CRM114-Status: UNSURE (   8.37  )
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

Refactor the Rxdma replenish procedure and avoid the Rx descriptor used
list to reduce the lock contention in Rx data path.

v2:
  - updated the improvement details in the commit message

Karthikeyan Periyasamy (3):
  wifi: ath12k: Refactor Rxdma buffer replinish argument
  wifi: ath12k: Optimize the lock contention of used list in Rx data
    path
  wifi: ath12k: Refactor error handler of Rxdma replenish

 drivers/net/wireless/ath/ath12k/dp.c    |  31 ++++--
 drivers/net/wireless/ath/ath12k/dp.h    |   5 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c | 140 +++++++++++++++---------
 drivers/net/wireless/ath/ath12k/dp_rx.h |   1 +
 4 files changed, 113 insertions(+), 64 deletions(-)


base-commit: a2a4cf3541db8066af7e6d4eb6e9e6445f6d9658
-- 
2.34.1


