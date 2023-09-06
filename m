Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7414FEB8FAD
	for <ath12k@archiver.kernel.org>; Wed,  6 Sep 2023 09:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=70yvSkh11C3hoU729aRchl7icK9AbieiFvnP/aoTCqA=; b=boIjd7cWRERaEU
	Q2tmMZVvcSpzTpEfSdDmMkhsfEcTyTn20VL9LTa75401dcgeyqe1Sxacze4ddkNeCGmf3XnasqRLU
	eMPEgQDbPI+vfZu5lbHy0uIABOMLXSXs9seNl5eXVn5S1aKG/2jMvK3DXpjnR19V+PG+bJz7MHZw5
	yEPCGnUQmO+tkQXCL/bfliqjRR4Vh4HyOqDtCiP+VgFsZFq1Gwe4M9GBrfVgqf2Az719+0wIjF8/9
	MivE3iSF4QxVXS9hdWVvbQxFhVj3aM7afsfBmV0MTumg/3xSpp3XkFWPLnyxsUnWWH/QTvpDU3vfD
	CU0BTnohVb21GuhiJbgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdory-007vVT-09
	for ath12k@archiver.kernel.org;
	Wed, 06 Sep 2023 09:30:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdnvT-007j8i-20
	for ath12k@lists.infradead.org;
	Wed, 06 Sep 2023 08:30:17 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3867IOJZ019186;
	Wed, 6 Sep 2023 08:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=iEnD2Gb25bQMmluR+zMBMJjaPPbd2DrohJ0JmN4U0cY=;
 b=GXLoVD5xXkV/2J+AcJFjykNVMkCg5boI/8tmrIDRp1WzJbhzta2q2vjkVy3h//80vdCv
 o4L0RTLbm1cjzqCzeBxFHOs7tOeXi2JYuTXcCj93EvgCY4fniiTrD+qefQvugIv4crPW
 QXM53wjNooIoQafs+VJ1Rx1Q5O6ForyYJQCAvwnVE5Q0s43YN6hfIwgIh0mkfo3P+JIz
 CapEmlV5XlM5+E0Ntawo21QGfakZ4h6Mssj9CTKEie2Eb2v4+qeV0whlH0j3DMuTJRhC
 NJydwI2eSqsVy+m3Rtht1rhS0s4ncKeFK8p+Ia/jzrQq2ZE0o2S/STO5z1NfYLRx05wc tg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sx0t7tv96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Sep 2023 08:30:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3868UAOS023688
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Sep 2023 08:30:10 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 6 Sep 2023 01:30:06 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH 0/4] wifi: ath12k: add 11d scan offload support and handle country code for WCN7850
Date: Wed, 6 Sep 2023 04:29:44 -0400
Message-ID: <20230906082948.18452-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZGG9liOw5QIZaC9T7VBmm0elMVA-gVZq
X-Proofpoint-ORIG-GUID: ZGG9liOw5QIZaC9T7VBmm0elMVA-gVZq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_01,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=626 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309060070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_013015_827097_A02663CA 
X-CRM114-Status: GOOD (  13.07  )
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
