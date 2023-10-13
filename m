Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB19BCDB47E
	for <ath12k@archiver.kernel.org>; Fri, 13 Oct 2023 14:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:MIME-Version:Message-ID:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7hTAqW3pyaLooIPPUjtpLnJ0dLDGjbBOhluDF2f67Ak=; b=feG0VSTaFKqOd8
	XHVYY081TinydkxxCOT0lma3pVzSKRTxr/Cor33ZaawjAjc5xcRkl7rNREKRZ6xQAxl7WK3/s97Vj
	bOH6s6BENHGan4fOTdedX2yX59jtbxldpapo3kpcSXuGM+jvpPf9tieYhOgfaR1zNFwI/eWZ2U7Wj
	s/uprVeErUp0WSzarOPKdVP1EYdUQcMSeHl/WgI7Hw8na0EJjY/b7SyPKLBVtzczF7tce21w+2vkI
	LwbCvltxc0f65qvn80gP9DETK8d0pelNKrv4mIGrsFFz0rUrPVlU4v3y+P/sQBaFAjZP9P9GGnjMa
	k/ejByRD3XTMzzXGMp2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrJ5l-003aMK-1l
	for ath12k@archiver.kernel.org;
	Fri, 13 Oct 2023 14:24:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrJ5g-003aIR-15;
	Fri, 13 Oct 2023 14:24:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39DAuaAC013450;
	Fri, 13 Oct 2023 14:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=L8NexJFtiBE32UC3WUV4sNP/C/3qdQ5NgLrpJU2Wo7E=;
 b=Z21KcenVdRDEmv2SFtWN27J/c66AzKpLLsoSRcqXTzK90JLiM5Jn214l96h9FUMQ500x
 uJfPK6wFAH6tLrhQq+c3lv8U9xHB/fNKbqtvrMQd/B8VFMRVUhlECX63x0VDo6Rw7NVb
 HFtx58uhrKQdp42GX6o36VCbRyn++0Hwe8KLxA0U1NyyfOg6icawExZbkvqs4++vN+9p
 vsSvT07sxT6GbF8HnkgVifvLUErrGmaE8DVxTwp44FVGIHlpFYqFR9p6GNOYpxfn+8ei
 27fHTXSxwYoOD+oopNerBrNDVR03GgCQgLWLvg1zg6Ryn+4MbFH8uOFRmR86sLYswOjf Jg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tq2xqgk7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 14:24:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39DEO9JB008645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 14:24:09 GMT
Received: from hu-jjohnson-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 13 Oct 2023 07:24:09 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH 0/2] wifi: ath: Remove ath*_base::bd_api
Date: Fri, 13 Oct 2023 07:24:07 -0700
Message-ID: <20231013-ath11k_bd_api-v1-0-3fefe4629706@quicinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAdTKWUC/3XMQQ6CMBCF4auQWVvTAYvgynsYQtqh2omRYotEQ
 3p3K3uX/0vet0K0gW2EU7FCsAtH9mMO3BVATo83K3jIDaUsK5SIQs8O8d6bodcTC90S1sfGHsg
 Q5M8U7JXfm3fpcjuOsw+fjV/wt/6TFhRSSFOqpq6UUa06P19MPNKe/AO6lNIX4kEM66wAAAA=
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ath12k@lists.infradead.org>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rJuZxbGD7o1tr1XBWnhU_s4pSqlahjML
X-Proofpoint-GUID: rJuZxbGD7o1tr1XBWnhU_s4pSqlahjML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_05,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=465 suspectscore=0 spamscore=0 clxscore=1015 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310130120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_072436_508703_FD76584B 
X-CRM114-Status: GOOD (  11.06  )
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

Both ath11k and ath12k inherited the bd_api member in their struct
ath*_base.  In ath10k this member is accessed from both
ath10k_core_fetch_board_file() and ath10k_debug_print_board_info(), so
it is justified. However, in ath11k and ath12k, this member is only
used within a single function, so it is not justified in those
drivers.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
Jeff Johnson (2):
      wifi: ath11k: Remove ath11k_base::bd_api
      wifi: ath12k: Remove ath12k_base::bd_api

 drivers/net/wireless/ath/ath11k/core.c | 7 ++++---
 drivers/net/wireless/ath/ath11k/core.h | 1 -
 drivers/net/wireless/ath/ath12k/core.c | 7 ++++---
 drivers/net/wireless/ath/ath12k/core.h | 1 -
 4 files changed, 8 insertions(+), 8 deletions(-)
---
base-commit: 13556aef0bdc0e98df7b6bf2e10d706c59dce6f4
change-id: 20231011-ath11k_bd_api-a9c1678e4cbc


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
