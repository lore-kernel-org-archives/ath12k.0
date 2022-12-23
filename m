Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C86BC4167B
	for <ath12k@archiver.kernel.org>; Fri, 23 Dec 2022 05:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vl5tlGLsKApVn5dzGnWNF8rWmChj2f3EM7rHILIDNvM=; b=4737uIETTrpPFD
	/sA2d5xGDEd/lUUnQbO5cfs4aBjFxOuI0YnQeW5UIgp1JRxMgukbO0kCbnBlY/YU+rFtJ+FGlS/qt
	PkXS6vxsexQ+7ageHYKrFZA2rXnfRCktgT198bzPsVmWvBOTyVLEqWpV+J7tdUARkv+uw52NxIfdd
	apLEUSjYAp574OmcJPYjn8cFS3g4yRTJNQJoTf5hcQcSm6yBQdUVtpytXb58cfofpXVJ9Mpkb1w62
	BFtggHc2FbWouvXpQOu4p1yiaZvAJLeOZe+nPqr57GGu1oOXCHu6ljkw2m0KFAlBUP49aHMsTWo4m
	0BWgi53NLki8EvXnB2oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8aHP-003jfN-Ev
	for ath12k@archiver.kernel.org; Fri, 23 Dec 2022 05:07:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8aHM-003jbm-NQ
	for ath12k@lists.infradead.org; Fri, 23 Dec 2022 05:07:34 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BN4gYCV007837;
	Fri, 23 Dec 2022 05:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=Da5/YnDi685NImrpSMSnBTYVUbqmoClVbiTSxZTM/jw=;
 b=BiE42uSKBZ/2j+V7KpivWexZdwpHRJsCCDg4VeO/PRiY/Tc1a/a04T1Ijd+XBC1aRuvc
 HxuvGQDYBcI31nBrA8aK2BZa6VG77iII4lMgTu+jd0H0kxPc9qfvFUXbxSgYIVg27nSs
 fS39uCQrQpAkljjvJLuroAl8x1PKwNvYklObhlET0sOmKAuRYxaKDr5Sqp0NB4NnfO0J
 chWBZHzQx0GbT0vEaTQuNvuehg0S5IclcfOAHu3Zh7OisCy/6QvypQQuRKW2fZWX+2fc
 KyNpDEjBJZQp5qFD/zIKqRRSGnJkprTUWBqx6K5MiOp3NeUIX+UV5EGIRDv5e2eDGyKE lQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mmtpfs884-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Dec 2022 05:07:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BN57SEx027201
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Dec 2022 05:07:28 GMT
Received: from dinek-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 22 Dec 2022 21:07:25 -0800
From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
Subject: [PATCH 0/3] Add changes to read caldata from EEPROM
Date: Fri, 23 Dec 2022 10:36:43 +0530
Message-ID: <20221223050646.27785-1-quic_dinek@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rVLuTKI4qEKHHmbtPTWS0nO_MqzviWP7
X-Proofpoint-ORIG-GUID: rVLuTKI4qEKHHmbtPTWS0nO_MqzviWP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-23_02,2022-12-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 mlxlogscore=665 clxscore=1011 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212230044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_210732_940806_3EEB2E92 
X-CRM114-Status: GOOD (  11.77  )
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

Add support to read calibration data from EEPROM.

Dinesh Karthikeyan (3):
  wifi: ath12k: Fix incorrect qmi_file_type enum values
  wifi: ath12k: Add new qmi_bdf_type to handle caldata
  wifi: ath12k: Add support to read EEPROM caldata

 drivers/net/wireless/ath/ath12k/qmi.c | 131 ++++++++++++--------------
 drivers/net/wireless/ath/ath12k/qmi.h |   9 +-
 2 files changed, 66 insertions(+), 74 deletions(-)

-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
