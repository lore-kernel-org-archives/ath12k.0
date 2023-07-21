Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F83CC0015E
	for <ath12k@archiver.kernel.org>; Fri, 21 Jul 2023 05:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e4ExipWb1gMXrewqeVS2Jb6HcZrd5hOuHtSYmgDBmZo=; b=3RuA+qmmV2UTTG
	TtCM+grwft4teWXGevR5kk4TmbBHj/6qk3XDzZgT3VNPuWUsLV8Z/P2AFIIbTnXAqZdvZppuqN8v8
	Y0ZYxNtrolPp7KHi90DDIdvrUWWUsCOOX9DSJMlPYMLxwiRXhUf6bURcNzECFWZRFU9fN5AO7tnNh
	UsXOO413MFXm9SeA1rb1VSUh5pxhOiK3OiLZcqMUDyuP8XFN+eqoVXCklQRDWCj+fEh4F24O/mOQr
	9Iei5M4OUdxAAmZ8jsUz9fvsEJ78GQPI+nEhQOND43JLTBjThH4CBIwkTQJBQ9cmCrHBPGNSOYU4w
	AADbirqM4/Q6e0bFLHMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMj4z-00CyI4-2q
	for ath12k@archiver.kernel.org;
	Fri, 21 Jul 2023 05:53:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMj4w-00CyGJ-2E
	for ath12k@lists.infradead.org;
	Fri, 21 Jul 2023 05:53:28 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36L5TuIP017823;
	Fri, 21 Jul 2023 05:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=ZcklBnkdW6IClXUd1leKPU+5yt3YcsSG6TSic81OuZU=;
 b=cRi/9dmQeYHb+KrYVKkrr4s+F/IDw0pGqwkovaZeds8fTvmTDF77FeJ8MepQ3nyMblnv
 8XlO6rNhyh4UeS0hfFhVm08aK5ZAe8Cj1GLRQRsgNXt9ZWg3jA1qttBP0tVmGJ6NTzUG
 UhR22voic+8J+VXSIyzlrJnurVLGTYBALNV0SKQbGbUr3Xd0fGwAUtzHCajwqQc0LlQu
 PQpKRRjCxIVL4s3yTgW3Q+ra4Anjuf3x+Xk9a1eKntK1ywzydKqxzmIQZOw8WKNX3IEn
 zxxyai5zAqwooMVNia4KD58zm+DHt5Cf0Y6KrZm7HdlDxzR6vV16M2VAkkNDJwoCXBnF Zg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ryb0411tk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 05:53:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36L5rKw4007911
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 05:53:20 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 20 Jul 2023 22:53:19 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v2 0/3]  wifi: ath12k: add support device recovery for WCN7850
Date: Fri, 21 Jul 2023 01:53:02 -0400
Message-ID: <20230721055305.20420-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VD3JWJ_9Wqj0sIq4CRF3NbOGw21rI0ri
X-Proofpoint-ORIG-GUID: VD3JWJ_9Wqj0sIq4CRF3NbOGw21rI0ri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-21_02,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=639 adultscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307210052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_225326_757121_7F028707 
X-CRM114-Status: GOOD (  12.88  )
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

Add support for device recovery, e.g. firmware crashed.

depends on MHI patch which has applied to mhi-next:
[PATCH v4] bus: mhi: host: Skip MHI reset if device is in RDDM
https://lore.kernel.org/all/1684390959-17836-1-git-send-email-quic_qianyu@quicinc.com/

v2: change subject and commit log of "wifi: ath12k: configure RDDM size to MHI for device recovery"

Wen Gong (3):
  wifi: ath12k: configure RDDM size to MHI for device recovery
  wifi: ath12k: add ath12k_qmi_free_resource() for recovery
  wifi: ath12k: fix invalid m3 buffer address

 drivers/net/wireless/ath/ath12k/core.c | 1 +
 drivers/net/wireless/ath/ath12k/hw.c   | 3 +++
 drivers/net/wireless/ath/ath12k/hw.h   | 1 +
 drivers/net/wireless/ath/ath12k/mhi.c  | 1 +
 drivers/net/wireless/ath/ath12k/qmi.c  | 7 +++++++
 drivers/net/wireless/ath/ath12k/qmi.h  | 1 +
 6 files changed, 14 insertions(+)


base-commit: b21fe5be53eb873c02e7479372726c8aeed171e3
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
