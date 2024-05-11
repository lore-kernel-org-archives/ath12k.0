Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAA9C04FFE
	for <ath12k@archiver.kernel.org>; Sat, 11 May 2024 09:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3w0xYADpxO0pAxrl0r2NQfZ2oscqn+f4hbm7xi0MJzw=; b=GdYTsrT2qD4OQGL6rv0mfWmqNC
	vsQfNRm6qIF0u1vY/iNZJUETn2WU9tTXv8ZmhzHmAclshnnoSwSSyAlM6iQgXXRhAwtnAHRb2m4Fr
	e+Rqzv41qV80ELKoDhyUh9tth7f33mELR5iwlSFwT/KDI6mjvuaJ6YLLKP8ZbYT+Z17CCyh5i2k/R
	hj/sRzIB58kCMdD5JXFlOi6SuSrAqEN9mPVaQvYmawZTEvtucS6S5okkM01uoBmomGmtmZA/Q6Qs4
	DuS9Mk8HW/jdJFxTDQdBkF5Haes+nZPGRpFzTtoZvCigZ7n9haxSbz/VzP2JaD+m7KnrBP7j3L4ZO
	/hLtK1fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5jNr-00000007erG-0Eo9
	for ath12k@archiver.kernel.org;
	Sat, 11 May 2024 09:51:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5jNn-00000007eqk-1nuC
	for ath12k@lists.infradead.org;
	Sat, 11 May 2024 09:51:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44B9XGhh009139;
	Sat, 11 May 2024 09:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=3w0xYAD
	pxO0pAxrl0r2NQfZ2oscqn+f4hbm7xi0MJzw=; b=eGZvbPU7PKNwr6HbBewwBMx
	SJFPqGeuFjTeIQBffKkPaRRzQVUtprW4gT4WZYNDLMD1e4J9g6wz/5pMQIiUMss4
	yX4FF9KJgkeejwgAQe5CF4ADmeuHHxMe7kQdB1zLUUE3Rku916kLUVf+ZN28juyZ
	Dm4cR+5SsbrWiV6sFibq53EorV7z92o9UblvKV5nUrS6dGpsGPssUH9bKZnL6GHS
	jEnj/jsRIFrkJl0p+6UhceRcSmBEH4433fD5c/6edY8aIA9Yew5kTXqk7OKL33pH
	W/6oP828e0E2VUthE3z0c38OxJBactNNZhhmG7kwRi7XdrdXVuxjroqp1ChdWwA=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y1yp58feu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 May 2024 09:51:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44B9p6bb002266
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 May 2024 09:51:06 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 11 May 2024 02:51:05 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH] wifi: ath12k: fix Smatch warnings on ath12k_core_suspend()
Date: Sat, 11 May 2024 17:50:45 +0800
Message-ID: <20240511095045.9623-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Uhzpv4uZ31nH2gkbkSFZyxaiX19UhPIA
X-Proofpoint-ORIG-GUID: Uhzpv4uZ31nH2gkbkSFZyxaiX19UhPIA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-11_04,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405110072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240511_025111_847290_B663B3A7 
X-CRM114-Status: GOOD (  13.81  )
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

Smatch is throwing below warning:

Commit 692921ead832 ("wifi: ath12k: flush all packets before
suspend") leads to the following Smatch static checker warning:

	drivers/net/wireless/ath/ath12k/core.c:58 ath12k_core_suspend()
	warn: sleeping in atomic context

and also gives the reason:

drivers/net/wireless/ath/ath12k/core.c
    48         int ret, i;
    49
    50         if (!ab->hw_params->supports_suspend)
    51                 return -EOPNOTSUPP;
    52
    53         rcu_read_lock();
               ^^^^^^^^^^^^^^^
Disables preemption.

    54         for (i = 0; i < ab->num_radios; i++) {
    55                 ar = ath12k_mac_get_ar_by_pdev_id(ab, i);
    56                 if (!ar)
    57                         continue;
--> 58                 ret = ath12k_mac_wait_tx_complete(ar);
                                        ^^^^^^^
Sleeping in atomic context.

    59                 if (ret) {
    60                         ath12k_warn(ab, "failed to wait tx complete: %d\n", ret);
    61                         rcu_read_unlock();
    62                         return ret;
    63                 }
    64         }
    65         rcu_read_unlock();

But it is weird that no warning on this in run time even with
CONFIG_DEBUG_ATOMIC_SLEEP=y. With some debug it is found that this is
because: when system goes to suspend, ath12k_mac_op_stop() gets called
where then in ath12k_mac_stop() ab->pdevs_active[ar->pdev_idx] is cleared.
This results in ath12k_mac_get_ar_by_pdev_id() always returning a NULL ar,
and thereby ath12k_mac_wait_tx_complete() never gets a chance to run.

Fix it by retrieving ar directly from ab->pdevs[].ar instead of using
ath12k_mac_get_ar_by_pdev_id(). Since ab->pdevs[].ar is set at boot time
and won't get cleared when suspend, ath12k_mac_wait_tx_complete() won't
be skipped. In addition, with ath12k_mac_get_ar_by_pdev_id() removed,
rcu_read_lock()/unlock() are not needed any more, so remove them. This
also fixes the warning above.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Fixes: 692921ead832 ("wifi: ath12k: flush all packets before suspend")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/ath12k/7a96ca11-80b5-4751-8cfc-fa637f3aa63a@moroto.mountain/
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 9482d5db71e7..e7f628e935e4 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -50,19 +50,16 @@ int ath12k_core_suspend(struct ath12k_base *ab)
 	if (!ab->hw_params->supports_suspend)
 		return -EOPNOTSUPP;
 
-	rcu_read_lock();
 	for (i = 0; i < ab->num_radios; i++) {
-		ar = ath12k_mac_get_ar_by_pdev_id(ab, i);
+		ar = ab->pdevs[i].ar;
 		if (!ar)
 			continue;
 		ret = ath12k_mac_wait_tx_complete(ar);
 		if (ret) {
 			ath12k_warn(ab, "failed to wait tx complete: %d\n", ret);
-			rcu_read_unlock();
 			return ret;
 		}
 	}
-	rcu_read_unlock();
 
 	/* PM framework skips suspend_late/resume_early callbacks
 	 * if other devices report errors in their suspend callbacks.

base-commit: 1025c616ee13372f3803b158abb1d87ef368ae3d
-- 
2.25.1


