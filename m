Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167E7E77198
	for <ath12k@archiver.kernel.org>; Fri,  3 Jan 2025 06:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JREXPsweAlWueab1yk2YBeIRMFolEv3FytRE2SSiyRw=; b=WWfYqvU486xHdpZkLoPgqPd1TH
	lnb5uqlBbCdYFPfaJzkOVMqO6RTKTnQPvQBl21CdSmy8d8XEI55p4joSx2hKjRf6PKQ6AfoxoXBbP
	Owe4687HX8S+UclZ1y/HEOJTedQexHseeTu137quu4OALA1QdiWst+8HotPdDcv+xAIQQ93Ea+bi8
	9CityqpaC6f6Y3w+q9ZaMk3LSTYzICRgd4UAr7NQGWIxSov/chmH8Y4wts0AUaFr6dLgeN55Vbf0i
	4nShtWxnmpi2r3scrJUPt732ML9ffKjlQqlAKWe/rBejSEFkbbiH4/5HZojbu0ZL49QCsFx1VwMPY
	/uXFaGiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTb3i-0000000CC1R-39fF
	for ath12k@archiver.kernel.org;
	Fri, 03 Jan 2025 06:21:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTb3g-0000000CC0N-0W5J
	for ath12k@lists.infradead.org;
	Fri, 03 Jan 2025 06:21:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502G1Mia001677;
	Fri, 3 Jan 2025 06:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JREXPsweAlWueab1yk2YBe
	IRMFolEv3FytRE2SSiyRw=; b=PGTlobeQFKFPY36qHkGdS7+cAm0FQ5HeH1lDzR
	VEJc0s/DaOMLPJZBIDB8Z3xG3YFUZiB0mf3ANJNFQbqQV+Kmxegm2YuUAhKaDzkY
	+CsRVb6o3mLsLn0bJ/ABLnWD1fObrVnWefVoIcMleaCnqKhGZVAmOoh/KhtfwRty
	PQchSgbMl/RV8GT3AX21MIEqOBYBxVpLmL1keYhXTmeMiWMZGn+DHEKMdIPxezra
	qmC8kDE3dSyb6jfObWxv3pQD6mi3dzbh5V2Vq0ZNAIOldQxlJZYiRbpMmI/apE5X
	vlW+NdMNBWY5njNtfn5OVzCIQvTzEgU/nVM2vkvNXnVfETNg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43wrefj8e9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 06:21:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5036L5Zp009866
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 06:21:05 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 2 Jan 2025 22:21:03 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v5 0/3] wifi: ath12k: monitor mode cleanup and state handling
Date: Fri, 3 Jan 2025 14:20:38 +0800
Message-ID: <20250103062041.1857-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: C_sJO1K29vK4_SOIhbr-wVgAwFWURNJv
X-Proofpoint-ORIG-GUID: C_sJO1K29vK4_SOIhbr-wVgAwFWURNJv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 mlxlogscore=682 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_222120_273857_B8A1375A 
X-CRM114-Status: UNSURE (   8.49  )
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

This patch-set do some cleanup and handle state variables correctly for
monitor mode.

Note: The quantity of this patch set was 11 in the previous version. 8
of them were merged:
https://patchwork.kernel.org/project/linux-wireless/cover/20241022110831.974-1-quic_kangyang@quicinc.com/

v5: rebase on tag: ath/main(ath-202412191756).
v4: rebase on tag: ath/main(ath-202410161539).
v3: rebase on tag: ath/main(ath-202410111606).
v2: rebase on tag: ath-202410072115.

Kang Yang (3):
  wifi: ath12k: optimize storage size for struct ath12k
  wifi: ath12k: properly handling the state variables of monitor mode
  wifi: ath12k: delete mon reap timer

 drivers/net/wireless/ath/ath12k/core.c |  5 +++++
 drivers/net/wireless/ath/ath12k/core.h | 25 +++++++++++------------
 drivers/net/wireless/ath/ath12k/dp.c   | 28 --------------------------
 drivers/net/wireless/ath/ath12k/mac.c  | 11 ++++++++++
 4 files changed, 28 insertions(+), 41 deletions(-)


base-commit: 09fa3b6974a1245ddd0751747609431494ba5b4f
-- 
2.34.1


