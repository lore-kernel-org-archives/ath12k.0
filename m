Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E47CC7EE2A
	for <ath12k@archiver.kernel.org>; Mon,  5 Jun 2023 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2kNSw92jqRrU9DA7KWIYfg4Q+H/1GJy56bIElaoudhU=; b=LwqVtjb4Ln14kg
	obGkEVGDnwrUCLTgJ2XKaJW7utsSi8ADBHASs0VHGUOPKBdreB4APoJu9DatN0JujkufdQOocsITM
	p4tsiIF4dkVZTtUbNkNd+/KdIZGoIIVcLMzZ44uMyLJ1ntnzOgxAlJsfXAAOMjAvwP7/3Md7RcUEC
	ddOKIPdKDtXbmxhmbkM/Wjpn4AEglzReR5rZVIQIpUQveW9Y3WouFfpS4BlkCrb3P9CAyaH6KD4L4
	qfYSxtS089oJ38ofGqSTxA5k55qlDPet+mh3lpGlfccmvXgtydFVZf7KRFh9dY73ljB8DrnimKLe1
	1dMAuqOK46QpznKvoHyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q699m-00FP5q-35
	for ath12k@archiver.kernel.org;
	Mon, 05 Jun 2023 12:17:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q699h-00FP3O-23
	for ath12k@lists.infradead.org;
	Mon, 05 Jun 2023 12:17:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 355BsZR8004582;
	Mon, 5 Jun 2023 12:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=D2jb3XKo2Xdn8s0gNnkJG4pXYovddMU9CCDV3GVtO7k=;
 b=IUnH/EkPXjC/o6v1dcA5kAuOTlGupnk+TVaqqT+1ftiKqsiuyatb8+L4vHDhy/Ps0z3r
 swCoT99O6BS4rQhV8YDKqzuSbHh0NCW8w992nXpja3bgXToIGbF3KsH2Lawb4G9TeaIJ
 e2ERAk86SKPbY/esVQKIxPDFZHXfpAc0NXP3tEVbiHnJhbk8HYAeBo6hQBatR2ptDlu8
 sEV/UY0LUzjrNCbJ55cKxRPjRy3/Z/LAFbDD3uZj22uqkglkQTHVlMQko0MSF1G8o2M5
 pdGY+LdlOVl99dQF7cHVRTxkUwHlsAw9GvJ3NG/HSakBkQcjE81y/uXNWMgjbBlO+46R CA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r1ckb0bdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 12:17:43 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 355CHg7I015683
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 Jun 2023 12:17:42 GMT
Received: from aarasahu-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 5 Jun 2023 05:17:40 -0700
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
Subject: [PATCH 0/3] Enable TKIP when using encapsulation offloading
Date: Mon, 5 Jun 2023 17:47:19 +0530
Message-ID: <20230605121722.20797-1-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aiUB-uedeHOIc5MDh9ZpE4Qe_Hrga-Gl
X-Proofpoint-GUID: aiUB-uedeHOIc5MDh9ZpE4Qe_Hrga-Gl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-03_08,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 phishscore=0 impostorscore=0 clxscore=1011 suspectscore=0 mlxlogscore=552
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306050109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_051749_813924_B9DEF696 
X-CRM114-Status: GOOD (  12.83  )
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

TKIP was disabled on encap offload mode since if TKIP MIC error
reporting is not capable by the driver using encap offload mode,
then TKIP countermeasures would not work.

Enabling back TKIP bring-up in encap offload mode to leave the
control with the driver to disable hw encap when it is not capable
of TKIP MIC error reporting.

Sathishkumar Muruganandam (2):
  wifi: mac80211: Fix tkip encrypted packet transmission path
  wifi: ath11k: add 802.3 undecap support to fix TKIP MIC error
    reporting

Thiraviyam Mariyappan (1):
  wifi: ath11k: Fix tkip encryption traffic failure

 drivers/net/wireless/ath/ath11k/core.h  |  2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c | 54 ++++++++++++++++++++++---
 net/mac80211/tx.c                       |  3 +-
 3 files changed, 50 insertions(+), 9 deletions(-)

-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
