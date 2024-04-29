Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF190C25B10
	for <ath12k@archiver.kernel.org>; Mon, 29 Apr 2024 08:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SE7H9mXaIhRytFS8h5izvWcM9wkUVPXPehHpmWqeXEk=; b=Ek4NaByyBjVjPjbXAZwpjVKw1k
	AdPz9X4a3ZYxj/YSa+X+BQBhZjM4ZrJG2sH6c9eNjQAr+HSyW7VF6gEVc1UPMl8YMhmwz4WEtaKi8
	FEFe0//ZeFph9wWr1g5Nn/x9tKgWc2UQ50lt00B0Kp2nHus43uytynowfYtW66OaKINDYYraUk2S9
	ReyFuIXvAuI67I1itjO22r6uEtmWRhme0yAiu32JapOeZafIiCdDi45zBNW3LNSLE7fuxLnWl0x7r
	EIKWmt/ig2hAY80vVsQHpdT0lFPAyaFR9pGtu2brf8VVAmgWzANMRXTN+PqO/nWOVI/HlyDk6CT3i
	gXjJ3G2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1MAy-00000001vmv-1Vxm
	for ath12k@archiver.kernel.org;
	Mon, 29 Apr 2024 08:15:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1MAv-00000001vlA-0fbV
	for ath12k@lists.infradead.org;
	Mon, 29 Apr 2024 08:15:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43T5RHtq007064;
	Mon, 29 Apr 2024 08:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=SE7H9mX
	aIhRytFS8h5izvWcM9wkUVPXPehHpmWqeXEk=; b=UEDr/0xD9onqYUQvHs7OEd4
	iKdQgW21x3+o1LuGrjmMfAW74id0p4yc5vcDpZHbgXNRrzWoBP4UfGaNJitYhQKT
	sx+vrw8uNhyxSISvSaWBauj5rAl/ilX9uzHBNjmOs0RzvoDEKdZZiPH9vSU5MLTl
	y6Jrbdrc8kIY35E1Mn/dU317eOX6AqrUDkRk7CypAHhH93wGhZJdcfLWlfNB8rft
	aifHCEMbDhl5wHha3CR1PH/pX3pICDeQTtRNn0CXSGmOGnnCgR8NGhuLyifoM+Ge
	8h7eD2RHWumjsDOOGM7LLQtteBsNjAQNtuOH/7MD9RoJsVrNBqQkEhphdrSmC5Q=
	=
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xrthtb1gc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 08:15:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43T8Fjr8028813
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 08:15:45 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 29 Apr 2024 01:15:44 -0700
From: kangyang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 0/5] prepare work for monitor mode on WCN7850
Date: Mon, 29 Apr 2024 16:15:20 +0800
Message-ID: <20240429081525.983-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1UGnbStJvTRukz6ic6r7xl5nTlRD7O5B
X-Proofpoint-GUID: 1UGnbStJvTRukz6ic6r7xl5nTlRD7O5B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_06,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 mlxscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=661 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404290051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_011549_346110_38ED93DD 
X-CRM114-Status: UNSURE (   7.04  )
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

From: Kang Yang <quic_kangyang@quicinc.com>

Preliminary plan:
1. prepare work.
2. bring up monitor mode on WCN7850.
3. add handling of reported TLVs for monitor mode, such as
HAL_PHYRX_GENERIC_U_SIG, HAL_PHYRX_COMMON_USER_INFO. Then can support
parsing EHT information.

This patch-set is only to do some preparation work for monitor mode.

Kang Yang (5):
  wifi: ath12k: remove unused variable monitor_flags
  wifi: ath12k: avoid duplicated vdev stop
  wifi: ath12k: avoid duplicated vdev down
  wifi: ath12k: remove redundant peer delete
  wifi: ath12k: remove invalid peer create logic

 drivers/net/wireless/ath/ath12k/core.h |  5 ----
 drivers/net/wireless/ath/ath12k/mac.c  | 38 ++------------------------
 2 files changed, 3 insertions(+), 40 deletions(-)


base-commit: bf99bc7423e18aa3475ef00a7a6fb773c31ce6df
-- 
2.34.1


