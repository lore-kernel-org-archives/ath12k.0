Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C00C25B75
	for <ath12k@archiver.kernel.org>; Thu, 16 May 2024 02:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MJft9FvIBqGBBJP6BCddWa2Bjnq+mBWbVZRdd8qhDh4=; b=Q6tWvSx7qLl0jUPce924oYEYj/
	VXvs0LqKWYAUTpIngjkJEaaTVEXv6f4dZbgaLXdSJrYUFRSqe/IZLAusFeEFv4Ir07H2ba+CWdBxO
	LHPEQhCcGNKYQX4q2VLI1CjP1ex53sHcDHSDpouQpx7s10WrZILz8FwVjHaC0DfbGMKKJibEuTAdn
	nJXPFrInsBMJ2usuvPFQ+41TSeQJm94qTMFqreNsO0jdA8QFLhHKnhqfuxYpZcjrlLGviB81yjyQ8
	w2CEB3t7AgZdbkrswYU3yZ2gdwhjy5xjD14Tl1BI4tNjzUQjTso/q2wP9krhBkDEc6XsMC97osGC9
	9hOhdCew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7QiE-00000003SAn-0tiC
	for ath12k@archiver.kernel.org;
	Thu, 16 May 2024 02:19:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7QiA-00000003S70-2ySm
	for ath12k@lists.infradead.org;
	Thu, 16 May 2024 02:19:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44FJY8oA027363;
	Thu, 16 May 2024 02:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=MJft9Fv
	IBqGBBJP6BCddWa2Bjnq+mBWbVZRdd8qhDh4=; b=nLtKFNRL8ze7WzZiRkAKnkT
	XXU6RoT7NPpmnCKA0K6SLx6hLaTX0NnJwX5yor/TMovM+sLqN9lXVW6VWbI6Rfjp
	O7VIJN/QtDeXRMSIqWR2Y1BwV90+YKfelfwgU6ba3InuCeezIEhTNf5SUSWS4eZ9
	vqO4s+8mCuk5TEFb/PfXB1PlzgnJxiQLR64p9GQzTyghJgNZAFrA0UbwqWxjdtik
	j5VJTCaGkiTAtqEMEFW6fLyKrDjYBX8Ex0bg6GXndqldrz3GFALuszeTSc/yb9MG
	K8vwuawuXbzk7DeYeb62njfc5CkME61pC6MAmAwqd0t+PWUM4V70fswGQchkZug=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y42kvw229-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 02:19:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44G2J69S029415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 02:19:06 GMT
Received: from lingbok-Birman-PHX.lan (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 19:19:04 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH 0/2] wifi: mac80211: fix some issues about Spatial Reuse IE
Date: Thu, 16 May 2024 10:18:52 +0800
Message-ID: <20240516021854.5682-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gq7qkbAXzeohu-LEOReaehc_5SBwJnDM
X-Proofpoint-ORIG-GUID: gq7qkbAXzeohu-LEOReaehc_5SBwJnDM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_01,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxlogscore=914 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_191914_904262_008F897C 
X-CRM114-Status: UNSURE (   9.66  )
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

Currently, the way to check the size of Spatial Reuse IE data and parse
Spatial Reuse Parameter Set element are incorrect. Besides, some members of
struct ieee80211_he_obss_pd are not assigned.

To address these issues, change the way of checking the size of the Spatial
Reuse IE data and parse Spatial Reuse Parameter Set elements in order.

Lingbo Kong (2):
  wifi: mac80211: fix the issue that checks the size of Spatial Reuse IE
    data
  wifi: mac80211: correctly parse Spatial Reuse Parameter Set element

 net/mac80211/he.c    | 10 ++++++++--
 net/mac80211/parse.c |  2 +-
 2 files changed, 9 insertions(+), 3 deletions(-)


base-commit: 5b501f801ab443046d5c31881bba21350396e5c5
-- 
2.34.1


