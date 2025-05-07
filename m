Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D7BC3ABC0
	for <ath12k@archiver.kernel.org>; Wed,  7 May 2025 17:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=agrYSTseFHfSuTEK3ZGWQ2w7ZU8sPNQ9rkfI2JzqG+k=; b=sLczMeiHhZxLJKJFPG+Ul1P/ug
	oQkUGWi+2RUIMwH0leKGgjWWZ9GgbYDiWRgyFcKAEfEjzE/IAOhSXtHGbnDuiVtdYVJSiZS7yH7P9
	aCbtGehYG2P416NIhOGCAhBX6RnFKqc90Ba7gfATdtILVymI7ds2uE4IrTrMyb4zT80YxH1WneZpL
	/E/yXOUbnULj0bxvKXsh5HIAWM13U4ne6xeeVlVDG6df+8EOHnJLzNfmw8RQNtqW5o9Xks08oefKc
	FXRqEm5bio5/WEYTYwbUC1Rmuilfk40Q8tQlVIFHTbZsFmsr+KGwX8REMM4I5NZHANJmiAZb2enXJ
	bMR6GR4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCimG-0000000GNRd-1sYh;
	Wed, 07 May 2025 17:41:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiJ3-0000000GGGU-1n2P
	for ath12k@lists.infradead.org;
	Wed, 07 May 2025 17:11:42 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547BVQAX018441;
	Wed, 7 May 2025 17:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=agrYSTseFHfSuTEK3ZGWQ2
	w7ZU8sPNQ9rkfI2JzqG+k=; b=M4BY5g45pVgSRzsCYjlQxXfaT50i9hxCC+p3fK
	IKLbQHyaOYGuUY+ew8IKNhMi0oos0pqhZ2k2/iu4UdhFxiTIGXXGt+ZV0rQMEhJO
	3WYDJVTOAs46oYk1h1Gloo/YKPtY/SR+grIQ+mFMjoOP5nbpWiDnhtRcD4HVmbup
	Mz+t8i0vl7xKAllLglkX4ViFhMS1uWMYHuwJBJ3rGFkFtX/uwx3xsFcpa9NlVu64
	Uvnon6dJ5a2qIrzNXg16YooPH4E0oUgCdzvZVbW08FWWW9WROX87F8X3JOVHIK2L
	eWqmyyQdejYGDraXBqlseFzn9HKLmWx9qnBBG43JwQAQ6hzw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5tbehc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 17:11:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 547HBYS9012616
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 17:11:34 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 10:11:31 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Date: Wed, 7 May 2025 22:41:19 +0530
Subject: [PATCH ath-next] wifi: ath12k: fix memory leak in WMI firmware
 stats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-fw-stats-mem-leak-v1-1-8d4d1d8ec0e8@quicinc.com>
X-B4-Tracking: v=1; b=H4sIADaUG2gC/x3MQQrCMBBA0auUWTsQa2OCV5Eu0nRqBm2UzGADp
 Xc3uHyL/3cQKkwCt26HQl8WfueG86mDmEJ+EPLcDL3prbHG4bKhaFDBlVZ8UXhi9G66XvxgrI3
 Quk+hhev/eYegCTNVhfE4fifaDq1tAAAA
X-Change-ID: 20250507-fw-stats-mem-leak-c87b6384055c
To: Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh
	<aditya.kumar.singh@oss.qualcomm.com>,
        Rameshkumar Sundaram
	<rameshkumar.sundaram@oss.qualcomm.com>,
        Mahendran P <quic_mahep@quicinc.com>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        P Praneesh <praneesh.p@oss.qualcomm.com>,
        "Raj Kumar Bhagat" <quic_rajkbhag@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Z0OaoMYWLP7ZoUJGSl0mouhhNMhQqjDG
X-Proofpoint-GUID: Z0OaoMYWLP7ZoUJGSl0mouhhNMhQqjDG
X-Authority-Analysis: v=2.4 cv=doXbC0g4 c=1 sm=1 tr=0 ts=681b9447 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=owKwsHGNvYRs9xEUnEQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE1OSBTYWx0ZWRfX2jRu4vIzDDP+
 Jt5w0Y+Wk8vkZzEJAPjdihuGhuiZCRoXpM0imtMyJsGCkp4N7RwkX3zmaWKDTUhKvFo4UmfwNYt
 yZhdVDDxAjnQoQEModd2T3Q7MgHlVEleZbRnPZFYCFHmSde+I1x+yX3Xokr7NUwfL2MS/vZGS7o
 5CzHi+NtyG+xR9TLEuyR3dECoOAnDBkY/i/inRgv42rwYyVA+If1sg4+HYzt2R15v575QDztcSA
 V7Etd5qsqrzM8wqDlI9Zyin4+q+H9HqbburWoc0d+Rc1unmZDlGv7AGQ3Ioel33gQ4x7RRKlRZ+
 F7xKruxgZJ6xFgynIL2FQqfCdkmUn8NjF4itiGuRzzcsx7oruWpcLpPemB6R69A+cV4kwdo4a/C
 V0M6U9hkrOXspYLIUnSKXKWM+hdk7aEn/kMvTbTPQyVINIMZWNogFxpN87oLCw9VUpT/zQQ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_05,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_101141_601702_DF1068F8 
X-CRM114-Status: UNSURE (   8.55  )
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

From: P Praneesh <praneesh.p@oss.qualcomm.com>

Memory allocated for firmware pdev, vdev and beacon statistics
are not released during rmmod. Below kmemleak trace is seen for this
memory leak:

unreferenced object 0xffff8e76aebdfa00 (size 256):
  comm "softirq", pid 0, jiffies 4299272453
  hex dump (first 32 bytes):
    28 19 71 c3 76 8e ff ff 28 19 71 c3 76 8e ff ff  (.q.v...(.q.v...
    9f ff ff ff f4 d4 03 00 aa 88 09 00 bd 40 23 00  .............@#.
  backtrace (crc dfe1b440):
    __kmalloc_cache_noprof+0x2b0/0x370
    ath12k_wmi_tlv_fw_stats_data_parse.isra.0+0x44e/0x730 [ath12k]
    ath12k_wmi_tlv_iter+0x5e/0x140 [ath12k]
    ath12k_update_stats_event+0x85/0x300 [ath12k]
    ath12k_wmi_op_rx+0x624/0xd70 [ath12k]
    ath12k_htc_rx_completion_handler+0x1f4/0x330 [ath12k]
    ath12k_ce_recv_process_cb+0x218/0x300 [ath12k]
    ath12k_pci_ce_workqueue+0x1b/0x30 [ath12k]
    process_one_work+0x219/0x680
    bh_worker+0x198/0x1f0
    tasklet_action+0x13/0x30
    handle_softirqs+0xca/0x460
    __irq_exit_rcu+0xbe/0x110
    irq_exit_rcu+0x9/0x30
    common_interrupt+0xa7/0xc0
    asm_common_interrupt+0x26/0x40

Fix this by calling ath12k_fw_stats_reset() before hardware unregister.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Fixes: b8a0d83fe4c7 ("wifi: ath12k: move firmware stats out of debugfs")
Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4dae941c9615cf19e6cc2ed1bd72a6bf1cb812ca..5a14e4241e25d40173a7315f4407826ec412fe59 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11374,6 +11374,7 @@ static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
 	for_each_ar(ah, ar, i) {
 		cancel_work_sync(&ar->regd_update_work);
 		ath12k_debugfs_unregister(ar);
+		ath12k_fw_stats_reset(ar);
 	}
 
 	ieee80211_unregister_hw(hw);

---
base-commit: 21346cd925c2567d5f56cdb1421c94815ac10221
change-id: 20250507-fw-stats-mem-leak-c87b6384055c


