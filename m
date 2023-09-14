Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C46BEDE99D
	for <ath12k@archiver.kernel.org>; Thu, 14 Sep 2023 09:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VLSQr1dKNd412gl54N1Z6KG48HRkILK7B0cymPtVLzY=; b=xPnbUkxdFNZYXL
	YZRsU7eVEyiv9ApSAxJRttsn2DygIRpugBWMuwbLLTTg0+dv4w0Ynp1G3M84FRcyxVmorw99NYkQO
	fYLksB9lZ/OCs3cIrXPivwikOg9j73bJh9jLwKToKgcTKcg8PTQW0p5XNzUfbam6ZIwbmtu6jbUHW
	F3JzjctnnWPDfkCfMcwQdBYwdRavg7e1PNilZ8qze9OB3WvjCrN/hox7LS4b8ED10zCeimEwkN7CD
	DKaJaAdkq0crwH32vKkhilV55/y0g2PHU41lrnKG384+yQgs9P1saR/YztlBZylMHxXDGKJg2+e0w
	TIRpAMRjv7ym7RkHHP2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgiKa-007npw-2i
	for ath12k@archiver.kernel.org;
	Thu, 14 Sep 2023 09:08:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgiKX-007np5-1j
	for ath12k@lists.infradead.org;
	Thu, 14 Sep 2023 09:08:10 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38E7sb4j007867;
	Thu, 14 Sep 2023 09:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=eZ1ib4AcYbH+yG2b+X4LpEAJJzSFbX7AX1tg7HNj/Mg=;
 b=W27WYenUNNuNphfWKw9uyx7ep2afe5uNEwxsxj8As3uBjkuN1uvWYOMm1roBYfq8xg16
 U8JjPn9/x4/92A5C00MPIE93DfKePHnvwsMQhU1kbNFm3a469sEwWBlRnBeNc11PF8e0
 z2KxcwyApmkV0D6h/5Ake6pQ/FuMutDymgcAg86MrZOuRYMzrrhRgaSNv+iCuoh9ns13
 CCk1RYcdbkhUomQOTh26dUs44m7bmV+ZBkn4I95K6AAbGM7bYuffNO+5CBMC3oRZfcjU
 bbc3lgYpBqiI/25lbxxuyY1GN3/lDYv+MGPkX6QNFb5Doj99MdOpFD5+nP7vS6UC6W32 wQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t3x6mr5y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 09:08:05 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38E984NX018133
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 09:08:04 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Thu, 14 Sep 2023 02:08:03 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>, <quic_wgong@quicinc.com>
Subject: [PATCH v2 0/4] wifi: ath12k: add 11d scan offload support and handle country code for WCN7850
Date: Thu, 14 Sep 2023 05:07:42 -0400
Message-ID: <20230914090746.23560-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NUOOu6JXmfyc98ezbHi1Y12YAbo6ctiH
X-Proofpoint-ORIG-GUID: NUOOu6JXmfyc98ezbHi1Y12YAbo6ctiH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_07,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=695 malwarescore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309140078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_020809_576064_08D36B84 
X-CRM114-Status: GOOD (  13.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

v2: change per Jeff.
    1. change alpha2 length from 3 to 2.
    2. change wmi_11d_new_cc_ev to wmi_11d_new_cc_event.

Add handler to send WMI_SET_CURRENT_COUNTRY_CMDID which is needed for 
11d scan offload to firmware. And add support for 11d scan offload for 
WCN7850.

Also fix firmware crash for country code set for WCN7850 and store country
code for device recovery for WCN7850.

Wen Gong (4):
  wifi: ath12k: add configure country code for WCN7850
  wifi: ath12k: add 11d scan offload support
  wifi: ath12k: avoid firmware crash when reg set for WCN7850
  wifi: ath12k: store and send country code to firmware after recovery

 drivers/net/wireless/ath/ath12k/core.c |  36 ++++-
 drivers/net/wireless/ath/ath12k/core.h |  17 +++
 drivers/net/wireless/ath/ath12k/hw.c   |   3 +
 drivers/net/wireless/ath/ath12k/hw.h   |   1 +
 drivers/net/wireless/ath/ath12k/mac.c  | 178 ++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/mac.h  |   7 +
 drivers/net/wireless/ath/ath12k/reg.c  |  67 ++++++++--
 drivers/net/wireless/ath/ath12k/reg.h  |   3 +-
 drivers/net/wireless/ath/ath12k/wmi.c  | 159 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h  |  38 ++++++
 10 files changed, 489 insertions(+), 20 deletions(-)


base-commit: 3f257461ab0ab19806bae2bfde4c3cd88dbf050e
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
