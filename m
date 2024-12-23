Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52A3E7718B
	for <ath12k@archiver.kernel.org>; Mon, 23 Dec 2024 16:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/XSNYODY+Vqtrgdh3Hv94whQ4qyzy25uWL/29oGKgoU=; b=SzNj85AIiyMMZq
	k/3z+j4LQmRIGpW2OkCxKQ32/81cQWLrq0uNzoGdmPYcfXUGx23NmkOLeCn7o0c41323izApk01mB
	a2Who4UJEDRo/o0CcBX1vvEC3BxSikrIiQRAW7pe/T9fLNzVswWxkeDBkDoFJEo0STP1IMVepLn6k
	yqYgrqxo6cnYlO6AW2niGkH7HXfd5U7zHqg5CgcM0lofahQpx94lO3il2fyCTQGUmtY+37KSdfarh
	exqKHX7SftZnJ5OdI4v1knnlZIioasARvy0y8f2X87fqT6fq00lK1jzKGCHtqwGu6GeTYcibpRqWW
	LbZDqjEx4NWQI2OFI2XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlGT-0000000AOPw-20TZ
	for ath12k@archiver.kernel.org;
	Mon, 23 Dec 2024 16:26:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlBp-0000000ANRG-3ZdM
	for ath12k@lists.infradead.org;
	Mon, 23 Dec 2024 16:21:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNCudEw002191;
	Mon, 23 Dec 2024 16:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/XSNYODY+Vqtrgdh3Hv94w
	hQ4qyzy25uWL/29oGKgoU=; b=Qjlv+YvYoP+EWeivMXVSSNTjPjEFzpXViS586o
	rv/krUF5xUoelBjqYPeM+Num7TbNFQmnFsO0cs98hz3dNHXvOC/gwVMTnGfDTsf4
	jfM9g3pXZE6YVykK7IWlN2bVHYuqBR7x+lsAzLzhgizNSAAhay1tcLuoEHiRqZa9
	vhRm2j7V5ipYNxN/QIRfQk1G/3yHKYqF02rF2FV04AYB71xnc6KB6YmAaqffcXb2
	DzhRfwd8WT8BkasOlmomlEbAVcXH303oN2rjav76d0+1zjjbsqAgQ8KPR9ST5h00
	nAfIuV1ZkfnHpiw2EPLoZ2Kvk8Kuzm6/kOeltxGINHLQ3T6w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q8ah8tqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 16:21:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNGLmVN011372
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 16:21:48 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Dec 2024 08:21:46 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Subject: [PATCH 0/4] wifi: ath12k: add MLO CSA support
Date: Mon, 23 Dec 2024 21:51:35 +0530
Message-ID: <20241223-ath12k_mlo_csa-v1-0-78b6d7515568@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABCOaWcC/x3M0QqDMAxA0V+RPFswcWWwXxGRqHEN26w0Mjak/
 77Ox/Nw7wEmScXgVh2Q5K2mcS3AuoIp8HoXp3MxUEMXJLw63gPSY3g94zAZu9aPs0fixrNAibY
 ki37OYdcXB7U9pu//n3P+Ac4aeSRvAAAA
X-Change-ID: 20241217-ath12k_mlo_csa-35bd512a05ae
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2U75hCg3LIE3fkwJHpJL4ulhp0djN0eh
X-Proofpoint-ORIG-GUID: 2U75hCg3LIE3fkwJHpJL4ulhp0djN0eh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=738
 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_082154_072307_8223EFC7 
X-CRM114-Status: UNSURE (   9.89  )
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

Patch 1 and 2 are pre-req fixes (applies to non-MLO as well)

Patch 3 basically uses arvif->link_id to enable MLO for CSA while adding
support to update counters throughout the CSA time.

Patch 4 fixes a potential problem seen when medium is busy. Again this
applies to both MLO and non-MLO. But this is exposed only when Patch 3 is
there.

---
Aditya Kumar Singh (4):
      wifi: ath12k: update beacon template function to use arvif structure
      wifi: ath12k: fix handling of CSA offsets in beacon template command
      wifi: ath12k: update the latest CSA counter
      wifi: ath12k: prevent CSA counter to reach 0 and hit WARN_ON_ONCE

 drivers/net/wireless/ath/ath12k/core.h |  2 ++
 drivers/net/wireless/ath/ath12k/mac.c  |  7 ++--
 drivers/net/wireless/ath/ath12k/mac.h  |  1 +
 drivers/net/wireless/ath/ath12k/wmi.c  | 61 +++++++++++++++++++++++++++-------
 drivers/net/wireless/ath/ath12k/wmi.h  |  2 +-
 5 files changed, 56 insertions(+), 17 deletions(-)
---
base-commit: 09fa3b6974a1245ddd0751747609431494ba5b4f
change-id: 20241217-ath12k_mlo_csa-35bd512a05ae


