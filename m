Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387F9C4725D
	for <ath12k@archiver.kernel.org>; Mon, 22 Jan 2024 08:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QHi93VmVVIBnqsqe+B/ofcwI5xBCxvtR69nYUIfnCQs=; b=HV+HCp9bHxvdqvbZoCZLZSjOPZ
	RX+suJOgS7fwK8eppmE+xdVLxruUw2jtHly7N1qDzNI29IOBS+goEI6I0tyIqcxJLfEcX2HX8r6yx
	nkNsSDApOHzsDtWf3fgynqnlOyJSC4SeS9QQgscBmkZjdHRkdSpXhDoaLSfYsTQJiP+CFTt6pq1xY
	aHvjG9D9kV5kL7Psqwl/CTlvRua0VB9LipwCX56GB2zPySkR0CTAyOl5SuVTCXqb+j5ieI64dC/xm
	hMHMCPjVl+fxkbEDSP4sXTCrhhWwQx14qLxFXaUkfVqEU1qkl+22SykXaZGewogmlU1bvdMaIX7LG
	zTsZDFtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRq4O-00B9PE-2i
	for ath12k@archiver.kernel.org;
	Mon, 22 Jan 2024 08:54:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRq4I-00B9Mn-26
	for ath12k@lists.infradead.org;
	Mon, 22 Jan 2024 08:54:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40M8QC23022007;
	Mon, 22 Jan 2024 08:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=QHi93Vm
	VVIBnqsqe+B/ofcwI5xBCxvtR69nYUIfnCQs=; b=InQ7zlst45hgojJzmd98yrO
	uxdeuyvPgkPI+6M8b0KQ4A/f55MYqLiywNYl7Qo7e+MGGjF9XTmz6EdZzf0ywOng
	99YfkfKGCu6jwES/ZDU4BppfbSe87zONiuL1A8aLDF2sPuaMbSw9GcFwuwx/Tvhv
	wa7pirnHIgx8sPnN2aCASwLRKaR2t0tCKG7U0b59gMnlcH6F3sHgigh5hg2uiOlW
	laOeajy8aYJDO8dJPbiLWpjqDC8xHYPzBDnUioICch0B+LYCmc8AlYE6ziX7OEl/
	aBGiXawH6wtaqs76s/cpnGXYsYFsTEj5QJer5ow9/VN3alZkhXHSbyJxlQMVHQQ=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vsmuag1pk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 08:54:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40M8s7bO022526
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 08:54:07 GMT
Received: from lingbok-Latitude-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 22 Jan 2024 00:54:06 -0800
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH v2 0/2] wifi: ath12k: add processing for TWT enable/disable event
Date: Mon, 22 Jan 2024 03:53:34 -0500
Message-ID: <20240122085336.3985-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iHbBweQraIZHumy2M9fa0sQf88zCLLxo
X-Proofpoint-ORIG-GUID: iHbBweQraIZHumy2M9fa0sQf88zCLLxo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-21_04,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=439 mlxscore=0
 clxscore=1011 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401220062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_005410_824859_3D2C8C77 
X-CRM114-Status: UNSURE (   9.16  )
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

This patch set is used for processing TWT enable/disable event. It can be
more convenient to debug TWT.

The patches work with WCN7850 and QCN9274.

v2:
1.Change the call way of ath12k_wmi_tlv_parse_alloc() based on 
wifi: ath12k: refactor ath12k_wmi_tlv_parse_alloc()

Lingbo Kong (2):
  wifi: ath12k: add processing for TWT enable event
  wifi: ath12k: add processing for TWT disable event

 drivers/net/wireless/ath/ath12k/wmi.c | 70 ++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h | 10 ++++
 2 files changed, 78 insertions(+), 2 deletions(-)


base-commit: 8ff464a183f92836d7fd99edceef50a89d8ea797
-- 
2.34.1


