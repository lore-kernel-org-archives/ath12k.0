Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E6DC48BC4
	for <ath12k@archiver.kernel.org>; Fri, 23 Feb 2024 05:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mV/2TiuFRKoqYy+l9ovdEcmeodlyGe2KgMowwS7SSDw=; b=HMtNXAlpONQRB5wX4v1EjKp/Pn
	CdE9CKgOFgh4D9gyWIiR3f0L0MraN8ujhb7nV9cH0AG5z0oD7+bKWxno4uVOTAG3nwDLLtG9yYKEO
	8hFeWnHxD2tUCXEP0BAonJD6iAtGT6S5raZOaEPe00jGphS/TaZjicPWHcdGwnRt570ihCTQBjhSp
	7idB1uZ2hcrnCfOSLRvspWHCakcYreuScY0HE6m5zbM9rEMPJPOLgbpazUo+w5Ckw0zpt9JqueAso
	V/dGNRljE3wVnjopiKPACF6jQrt1tGeSELRczI7NJxPNJim5kjbewPkxvaRhBvTFn1gGilJXj5/QL
	4xobQFRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdONS-000000083Cl-1AjJ
	for ath12k@archiver.kernel.org;
	Fri, 23 Feb 2024 05:45:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdON8-0000000839B-3ZUJ
	for ath12k@lists.infradead.org;
	Fri, 23 Feb 2024 05:45:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41N4I1ui008028;
	Fri, 23 Feb 2024 05:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=mV/2Tiu
	FRKoqYy+l9ovdEcmeodlyGe2KgMowwS7SSDw=; b=ndZsELO9d7l/a3vn/PMNUJ4
	QTVN/XSuXfRRlcDegBGdMOkXBi7kwn4t1YsnosjWakNKERJqWRtGfZYoucWIKXTr
	SBItE96QKkdRWramhPXzGugbwmwR2iEifsZBYP8jT3eXxWTYmlhSSgGXIVatw8jT
	zbmxPD2+OMMNc7we3atU7/lzjLt3ShluXo6cs2jeO+QhZ+jhjWmXDBztuMgmYSat
	IQUI80fulerhCrpEGbGjpZ3LL2tcdx1n4Ah1jXZvHWTJn/Vuzt66WBqzE1sl2W1K
	AjO07wZ7x6BLdtK8a0J5XwVtAmgZhZg6eETLd4Byao+/cNnbCmYO0orG8xulJSQ=
	=
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3weedkrv04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 05:45:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41N5jKQJ000565
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 05:45:20 GMT
Received: from Mayan.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 22 Feb 2024 21:45:19 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH] wifi: ath12k: add rcu lock for ath12k_wmi_p2p_noa_event()
Date: Fri, 23 Feb 2024 13:45:05 +0800
Message-ID: <20240223054505.438839-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VaYCnJsUS-jNWWvqIvmBiXxbxkn8LyLt
X-Proofpoint-GUID: VaYCnJsUS-jNWWvqIvmBiXxbxkn8LyLt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=788
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402230037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_214523_946811_9A809048 
X-CRM114-Status: GOOD (  12.45  )
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

Warning will appear when running P2P GO:

WARNING: suspicious RCU usage
drivers/net/wireless/ath/ath12k/mac.c:583 suspicious rcu_dereference_check() usage!
other info that might help us debug this:
rcu_scheduler_active = 2, debug_locks = 1
no locks held by swapper/0/0.
stack backtrace:
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.8.0-rc4-wt-ath+ #4
Call Trace:
 <IRQ>
 dump_stack_lvl+0x82/0xa0
 dump_stack+0x14/0x20
 lockdep_rcu_suspicious+0x214/0x3b0
 ath12k_mac_get_ar_by_vdev_id+0x192/0x220 [ath12k]
 ath12k_wmi_op_rx+0x2d7/0x1b40 [ath12k]

ath12k_mac_get_ar_by_vdev_id() requires its callers to have called
rcu_read_lock(), but in ath12k_wmi_p2p_noa_event() it is called without
doing so, and hence the warning was triggered.

Add rcu_read_lock() and rcu_read_unlock() to avoid warning.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: 9411eecb60cb ("wifi: ath12k: implement handling of P2P NoA event")
Reported-by: Kalle Valo <quic_kvalo@quicinc.com>
Closes: https://lore.kernel.org/linux-wireless/87o7cusyvw.fsf@kernel.org/
Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 838161dd9098..9d69a1769926 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6736,18 +6736,21 @@ static int ath12k_wmi_p2p_noa_event(struct ath12k_base *ab,
 		   "wmi tlv p2p noa vdev_id %i descriptors %u\n",
 		   vdev_id, le32_get_bits(noa->noa_attr, WMI_P2P_NOA_INFO_DESC_NUM));
 
+	rcu_read_lock();
 	ar = ath12k_mac_get_ar_by_vdev_id(ab, vdev_id);
 	if (!ar) {
 		ath12k_warn(ab, "invalid vdev id %d in P2P NoA event\n",
 			    vdev_id);
 		ret = -EINVAL;
-		goto out;
+		goto unlock;
 	}
 
 	ath12k_p2p_noa_update_by_vdev_id(ar, vdev_id, noa);
 
 	ret = 0;
 
+unlock:
+	rcu_read_unlock();
 out:
 	kfree(tb);
 	return ret;

base-commit: 707e306f3573fa321ae197d77366578e4566cff5
-- 
2.34.1


