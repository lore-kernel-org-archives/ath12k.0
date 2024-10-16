Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DF5D2A52F
	for <ath12k@archiver.kernel.org>; Wed, 16 Oct 2024 16:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:CC:To:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CBvnqpDxgBvTqanvD/cUWBTJeOUGKK44XBIn5Lz9+tc=; b=bLp5i/qSZ4M4hTBuAhAFJSWTfG
	f44BMQaTOc23aodBA3h6zhS8TFBIy+ad86qcuYUOe5UruZMM+6Ar6uPEgntJRb1BlQ7JrdZwGlKFN
	RaSimScpL+AJvkQJg4ty1UlUWfodydvAiCUGwpd8eLJjczCIt248DNE7mUQYugFgvwVmbrOtnYdEa
	8v+f8kUbXLMphfIcjpAniiebcm6HYXExOCjBcpda7LbreA/Z/mfUxecll+sqUs2w+jxCNLjl5h5iG
	q8PKvAztBAyrZBDOR+iNXpXYJ2oA3zIywd1dwvKGwy3+v1gp203mwEm/oPK/VVUmafSnhauYkGHNd
	Rqq7iUlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t16lG-0000000COcb-2lmg
	for ath12k@archiver.kernel.org;
	Wed, 16 Oct 2024 16:20:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t16lC-0000000CObo-3ODu;
	Wed, 16 Oct 2024 16:20:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GG57s8020259;
	Wed, 16 Oct 2024 16:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CBvnqpDxgBvTqanvD/cUWB
	TJeOUGKK44XBIn5Lz9+tc=; b=Bm9T3XehQps/qLR1L/x60JdBrC9yhDKOlG3P3w
	ocI7KcpMFBHrDKflfyVYtBcExv3wMhkG3v1hzEmVvFG9WJ6EkXYWbOA0/nmQTNgp
	NM1zlWBerf/np86hKd6TPezspGy08zHttHvrIRjpuEpDv1u535ucmhqyHJpGV9rF
	9AVKFDz0bQvDYkYKscK1F4dcQQIn1zuiYXVmEtf4gnyZ2EtAksNKAp7UsgGi/Psn
	zIzIWm+RPOsZzcEJ6PLhlf5NLp3QB0WSGqoTCAhYZUu82u76+uFz8xOClInFFl7y
	CCu4b84v8v4F1wJujrwx6Gjev44SLjLBxSOw7rksw4xxqISw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429t5kmcwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 16:20:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49GGKT9w004632
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 16:20:29 GMT
Received: from [10.48.241.64] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Oct
 2024 09:20:29 -0700
Message-ID: <0ea819f9-d563-46c1-9a68-3800c81565dd@quicinc.com>
Date: Wed, 16 Oct 2024 09:20:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
To: <linux-wireless@vger.kernel.org>
CC: <ath10k@lists.infradead.org>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>, <quic_jjohnson@quicinc.com>,
        <quic_kvalo@quicinc.com>
Subject: pull-request: ath-current-20241016
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FTfBsfP4HxitA9rBLVQ834n4EaXpKw8r
X-Proofpoint-GUID: FTfBsfP4HxitA9rBLVQ834n4EaXpKw8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0 mlxlogscore=877
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410160103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_092030_889812_0F7EA3A9 
X-CRM114-Status: UNSURE (   6.68  )
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

The following changes since commit 2f833e8948d6c88a3a257d4e426c9897b4907d5a:

  Revert "wifi: ath11k: support hibernation" (2024-09-02 19:33:00 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20241016

for you to fetch changes up to befd716ed429b26eca7abde95da6195c548470de:

  wifi: ath11k: Fix invalid ring usage in full monitor mode (2024-10-16 07:30:31 -0700)

----------------------------------------------------------------
ath.git patches for v6.12-rc4

Fix two instances of memory leaks, one in ath10k and one in ath11k.

----------------------------------------------------------------
Manikanta Pubbisetty (1):
      wifi: ath10k: Fix memory leak in management tx

Remi Pommarel (1):
      wifi: ath11k: Fix invalid ring usage in full monitor mode

 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 7 ++++++-
 drivers/net/wireless/ath/ath10k/wmi.c     | 2 ++
 drivers/net/wireless/ath/ath11k/dp_rx.c   | 7 +++++--
 3 files changed, 13 insertions(+), 3 deletions(-)

