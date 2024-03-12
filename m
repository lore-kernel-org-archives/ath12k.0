Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32637C54E49
	for <ath12k@archiver.kernel.org>; Tue, 12 Mar 2024 05:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jKsGwHZ3T2U68FtpKdj83eKOSUbUBd7Six3XGd7umtg=; b=WZtHDIcZ2ruSD1mNz+LJ6HT2Z0
	94/K3n/EjLEh7IK3T/UC/LvNh4EfezDEm/P0boGbYlOiO8+cMS1WOuybjIf6OEunnButlkGaUzIe+
	/F+2cORs4QhkC1QLBLpCIwV+D+Mk9A9fuQLZ8QIQv9FuQDTE0ZWHch6dYvKNwyt6idijhpc3sd8/C
	3i1PRwJfewPNuU36xV7sa8Lg7vbUulyhYtwo2ejFQJzVkqrvRx5kcopVTN4uyVdrMQjRLkgA9LDXz
	KdGjMv8gewDzf5IuPqK6yw4Q2xg12VQ8XwwKjX1R3NFqBh4wpGudCnO+C7Y4dWT9fo7yb8TZw46+Y
	kG7LW60w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjuGn-00000004LFk-3nb9
	for ath12k@archiver.kernel.org;
	Tue, 12 Mar 2024 05:01:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjuGl-00000004LAi-1YBx
	for ath12k@lists.infradead.org;
	Tue, 12 Mar 2024 05:01:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42C4lnH3008372;
	Tue, 12 Mar 2024 05:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=jKsGwHZ
	3T2U68FtpKdj83eKOSUbUBd7Six3XGd7umtg=; b=YPZW6JD+Ne9Y58+uN/tWKLq
	U9RofJYOoSxppqDSYLPaQcM1z80aADHNdstz7FdcMoXeM4Zk5ZuPYLlfe9+2knOW
	EVG0ScLzlN/2gdOMqq28F8jBndFMZCHX+TKBxfTxQUYxPmQWDKtNyGoBZJxMshhx
	0iYGV4Lc/RqR1NyWGD98rkxjaGqLHyVr0BvQetBNNpNiQ57tuWJbOe2OWrDcwV6W
	rkWZy27xaVq8A7CYwpRFAsRg0k0MdI7uApgUUISVeAi3RwoN+kb9knZ0x+oDv69+
	X18PtRfgAX3JbLVUrR+uX3ZjVXfoWf+BcgCHKdVfd3Umzr+Y2pf/Dyea4AL4snw=
	=
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wtckh0d8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 05:00:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42C50xRT032032
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 05:00:59 GMT
Received: from Mayan.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 11 Mar 2024 22:00:57 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 0/2] wifi: ath12k: dynamically update puncturing bitmap
Date: Tue, 12 Mar 2024 12:59:45 +0800
Message-ID: <20240312045947.576231-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Pq_4p4v1b-xah5nhuaYFHtjPeWOkWjoy
X-Proofpoint-GUID: Pq_4p4v1b-xah5nhuaYFHtjPeWOkWjoy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_04,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=562
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403120036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_220143_537726_B6FADDE1 
X-CRM114-Status: UNSURE (   6.77  )
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

Dynamically update puncturing bitmap.

Kang Yang (2):
  wifi: mac80211: supplement parsing of puncturing bitmap
  wifi: ath12k: dynamically update puncturing bitmap

 drivers/net/wireless/ath/ath12k/mac.c | 58 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h | 16 ++++++++
 net/mac80211/spectmgmt.c              |  4 ++
 net/mac80211/util.c                   |  2 +
 4 files changed, 80 insertions(+)


base-commit: ffd4e60352172cc167ff74e8bfd8a331a5830013
-- 
2.34.1


