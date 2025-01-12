Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3403E77188
	for <ath12k@archiver.kernel.org>; Sun, 12 Jan 2025 07:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U6FlXsTcg2w2ONuQekAyiSULXWTW2vZiiLeIiKxognU=; b=4sBL8OlLbTKfz7xt9OUiVWZDEg
	RrqN5NmYq4uxvNQz36md64MTQynEKVsS5GtqapqdIbpomjkqUT2mKpx0c7waIPyH/zzvdtUOsnZDg
	kSnw5jGOcitq+3TKBBGFnpDPk2wE+JxkCQUfV0ekGh/gqs5Jl+SnDLIzlC3fY7ZZ95Gam4ZCK1//5
	nvzbCpg2zJceOT4vuwA02ciGSbYBSllbcNXYL+drSaixkkMuko2rlBSwctwNOc+VLnPR0Hz80EmNY
	J6YwFb8+qexSlZ/eH5VhtSAh8eSkAPkbRF/mVff1zpuuFCdkmiGP/sOgStg4K337+8s7mq2YUEf3Y
	YxC07UYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWsDK-00000002Dby-0J45
	for ath12k@archiver.kernel.org;
	Sun, 12 Jan 2025 07:16:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWsDH-00000002DbF-2V6b
	for ath12k@lists.infradead.org;
	Sun, 12 Jan 2025 07:16:48 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50C78H7T006196;
	Sun, 12 Jan 2025 07:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U6FlXsTcg2w2ONuQekAyiS
	ULXWTW2vZiiLeIiKxognU=; b=SDVmONyJjARcy4xTmHzuk7wxxCw0n/2nUQmfO3
	NDQnAj87Q1OaUqht0d4QTYbeY2xOPgIyDUZjHjxgbJvGa89BfB2Outzpr2Oe7KIc
	xD5PYnkj0saUUcNjdwzBumhsSYWW+tLEzfHZA4EAtiH6YqqCvLDIbh+JYTHOA51A
	wq6iZw0BNfo1vAUThAgNm1+hW6x42HVr9Ky4HPdUPkVV02tfaLjbH1E4iBr5sX8z
	N9AK+lv1wmVSLm1cTWadkZkVMLq2h9nD3lMDBSDiPe4+od9YXpC0VZFJvLL+Wy+a
	PKeTCv3Vr5cXs2NUm5OAjjONInVMLfAtp/itKJEU+Oh+Sfpw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443hjk9pet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jan 2025 07:16:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50C7GjIR022366
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jan 2025 07:16:45 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 11 Jan 2025 23:16:43 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v4 0/4] wifi: ath12k: Fix the static checker warning
Date: Sun, 12 Jan 2025 12:46:26 +0530
Message-ID: <20250112071630.4059410-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CGvhrJP3F5Ixy33Fl6JyMz6Z8JBozM3q
X-Proofpoint-ORIG-GUID: CGvhrJP3F5Ixy33Fl6JyMz6Z8JBozM3q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=472
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501120063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_231647_761611_B8382893 
X-CRM114-Status: UNSURE (   7.58  )
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

This patch series fix the below Smatch static checker warnings

Warnings:
mac.c:10941 ath12k_mac_destroy() error: we previously assumed 'ab' could be null (see line 11348)
mac.c:11007 ath12k_mac_allocate() error: uninitialized symbol 'ab'.
mac.c:11013 ath12k_mac_allocate() error: uninitialized symbol 'ab'.

v4:
 wifi: ath12k: Remove ath12k_get_num_hw() helper function
  - updated copyright
v3:
 wifi: ath12k: Remove ath12k_get_num_hw() helper function
  - Renamed the patch title
  - Removed ath12k_get_num_hw() helper function
v2:
 - Rebased on ToT

Karthikeyan Periyasamy (4):
  wifi: ath12k: Refactor ath12k_hw set helper function argument
  wifi: ath12k: Refactor the ath12k_hw get helper function argument
  wifi: ath12k: Remove ath12k_get_num_hw() helper function
  wifi: ath12k: Fix uninitialized variable access in
    ath12k_mac_allocate() function

 drivers/net/wireless/ath/ath12k/core.c | 22 +++++++-----
 drivers/net/wireless/ath/ath12k/core.h | 15 +++-----
 drivers/net/wireless/ath/ath12k/mac.c  | 49 +++++++++++++++++---------
 3 files changed, 50 insertions(+), 36 deletions(-)


base-commit: 0c5fcd9069dd5f984e39820629acbfbe0f1b4256
-- 
2.34.1


