Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281DBCF45D4
	for <ath12k@archiver.kernel.org>; Tue, 13 Jan 2026 01:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ieojKhXThRN+C7P57uEKkfj6UzSQobkcw4rlPKBrjck=; b=GHwTp3fqGHx/HuGhfyZl/oL14H
	JT6J5sfKYySC2FwAdpq3fYWi7iKyy7RgsSKkLn0KPG4Lsd9kAh2+deG5LZ1S4VVPdjL4ycxNZeXpG
	tk/oloauBuR/8btp1Zt6CBumRs4eI0W8rDA0dWUBU+1pTec4T2RYdYlISAE3+ScQgrB2hd2uXdA2k
	YRhYZPafcCWp/AuMgqTPKjXINWHhpcs95iT6V7NaHIRxQpjKL6eebyBCz403XtmwTLehsNdIaHQzH
	QJNZ4YxsXF/lULT3DLfbghMtywF+vq0f/MSBi4ANUmA+xALnuKLTwV8XlOosc/M94wtDxaVu8uXGu
	OScoS7Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfTWR-00000006OgH-3j9O;
	Tue, 13 Jan 2026 01:48:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfTWP-00000006Ofa-1w4V
	for ath12k@lists.infradead.org;
	Tue, 13 Jan 2026 01:48:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CN5T9X177668
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 01:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ieojKhXThRN+C7P57uEKkf
	j6UzSQobkcw4rlPKBrjck=; b=J6KCaHytO3gMTImGn1vGTBcNq2ds3R1/JyY8RQ
	u49tyIENUhpueUfWBFnh4oNEE/4vIw0PijqKdatOo4izhnV/ItChHJsjC12MSQ6d
	JWedw204UZuXJcmfRwIHJG8Gtt0O+k2FoH26H5Q7ED2cD1xevD+SDpo4dn3t6lZx
	tc1f2j6w+7Z+mETiHy9i1o0wyLIxtYZaPPN8jDVv+G/bekhYx64vXO1IEjxIseIN
	p5dgsP/weq3Wn+vm0ux4UbpmaDu4qHbhfbTcwETsGT5crljfxmlAJsYk++vuYWRZ
	25fULjtieUwwzm0k1h5lQRghX08/mtEb9g/z/sCie4ECpf7w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn52f1au0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 01:48:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0a0bad5dfso24183595ad.0
        for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 17:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768268916; x=1768873716; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ieojKhXThRN+C7P57uEKkfj6UzSQobkcw4rlPKBrjck=;
        b=AzTyl+7xiNLCM7juafYkJWqo+FN1gh3pU8hhxTJjk5bos6EZbEJftOliVtxpUl2iIQ
         bvNOJTALYlG1XF/FLdCCddcCSWhbNBDuDx6PDksFi44In2KWCN/pMRYfEQbtFExyr+m8
         WxqydrZycJ1Z0MZkuSGfvXAARL77X1eIk3VQiRAgE+YwalqWHkQnpLfpcJjtr1rzW3qK
         eNTcBv6ZZ1YHjqHlYzh7ZgxX6RMpGUjZ74glWzOrQOqNmMgZApWo733MR5N+BHUYZQq8
         Oha377LHdnl4gqAQnFqTxTwh9ItR5j3ztIHsHyaHD5je/0oyLCwbv5bu7A2di5sl6XKJ
         GoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768268916; x=1768873716;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ieojKhXThRN+C7P57uEKkfj6UzSQobkcw4rlPKBrjck=;
        b=AkruXjjr5AzKs6EvdZh36CRZGNbs5CUmM2SiQkvKRIIo/hOTHrT8GX9I6ZvpAtMHQq
         Bbi9SCU7zyxsDlfem/K2Z1OY06Jz39H/TxfBseBTCZ6i7rvz3LnZMJwgJwyh/JkU6Odb
         QqcqoG/0TFniyFE+kIt7kER4ZoPOpLJDDoNnS4p8dQMN9WbRfRdurgnV12VM1j+y1TD1
         7BQmaPwi61xl4rc/uany585NIeI7Dq+8slu+dbBAZNvTtFsQHJJ5SegZDJK7GM5WfVV5
         fub6SUMbrnQjKdXuNLE5m28eLy9ehCBXcdUCXp9mgn6+uILIo9fa+vmM/EsSkJGdxcDB
         J7rA==
X-Forwarded-Encrypted: i=1; AJvYcCW0nk0/QN8L02/hu7HSs8MbASWlF1OMN+KtI5uxQ8QS5OL8GR4M2/veY6u7n2jG/8/HSGgbu7E=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVsKHaaq6VRZ7uHABSLxbZ46bA/cPGhfZw/GRFsoHiB0ChFzIk
	s3oZj+7OiK9mkYYtcukWPZK42KiNR09Gl+QtEo9YnqSFq7DJsSl8mZQ9mMhlezEd+HinwIQF0gb
	LNCpjmz4be0C9OSD8zwtF7isi9dkjIN01j9LbLdxMsSbcjACI+6hJIAKjBVDB0+Bb
X-Gm-Gg: AY/fxX6iPNtHBCTk6Vz0jO5hcfinExDx/bA+wb9On5bMZZEIHoMP1vIYT/T65mOJ9uO
	P6McN0mQSIbkjCqCZt9PqghHrS6C85pc7IsLAGqKJ0IiZKqm/WvZ2h/mBIFoxxxKyF92fjJGSFX
	inCIvnigHNw6HhsDGZdSL7p8lMgIw1e39GShL029gjlzVjifthPIA4G27+U3SakEX3cl1CICvBz
	apK+osqrOJUJgNLLhaywReKn+DmhUuKQ+BJx4PYdWSEUxmYJrm5+rz3Omtg8xatDyDJ9TLbh2n/
	Y1xi9Vdi8gcN7O5csflRVqcGE2444LNqUlgW3pIl7mBXWMXmGY1N+61fG+S/zrXMRRZWzs/Wy1V
	k+WHL9gKwBgM5pqM8fTYViP1Z19O5AMr2P8/JdkqSy07HTth23UCAKEJBvwpK0PQ=
X-Received: by 2002:a17:903:2f4e:b0:2a0:9656:a218 with SMTP id d9443c01a7336-2a3ee48ac03mr163903005ad.28.1768268916125;
        Mon, 12 Jan 2026 17:48:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGidp+jBRgz04GYtZ8OmOSzsrb7r1m0eGD1vcWUi69Yfc67hjnqFvny2Z5ls9GvPewXDay40A==
X-Received: by 2002:a17:903:2f4e:b0:2a0:9656:a218 with SMTP id d9443c01a7336-2a3ee48ac03mr163902875ad.28.1768268915641;
        Mon, 12 Jan 2026 17:48:35 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd4be5sm187290185ad.99.2026.01.12.17.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 17:48:35 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 09:48:11 +0800
Subject: [PATCH ath-current] wifi: ath12k: fix dead lock while flushing
 management frames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-ath12k-fix-dead-lock-while-flushing-v1-1-9713621f3a0f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFqkZWkC/5WOQQ6CMBBFr0K6dkhbQKgr72FclDLQBmi1BdQQ7
 m7DyoUL3Uzy83/em5UE9AYDOSUr8biYYJyNgR0SorS0HYJpYiac8iNlVICcNOM9tOYJDcoGBqd
 6eGgzILTDHLSxHQiZN1WNQmGtSCTdPMb9brmQCAA1e492ItdYahMm51/7BwvbJ3/JFgYMqqzNs
 yKjpajE2YWQ3mc5KDeOaTy7ZuEfaMZ/Q/OIbus8pwXlgpflF/S2bW+U62c+RQEAAA==
X-Change-ID: 20260109-ath12k-fix-dead-lock-while-flushing-9a4d8be9cebc
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDAxMyBTYWx0ZWRfX7aehYvgdZskc
 wKfrdE8GJlfSoxTiJkNLnyvcflGn+WWA0VX/vm+GO2u7O0GboXTAj+soektVUFhWuHkDuA1mWwJ
 N+7/AuOwdDWolLx2lWYxIcYjbiG5qcm4O2SK7LOM5MTj9ThzYLGiKypEZSpJTipxhqclJXR6aKp
 fWhL7+g5B6XT345SP2OrQBcCp70rzTRT/SdoZkn3HHfIvv1YnFXwJ0B7Xq7QqxdW+ajdx+eLZDS
 jNLs2o9KKwz6Y8SOnFfDGv2wCFwGHLlQT4x0fFDOCsCFNBuqEz5g8rXI9o71OiUQUBQ4r/zlKoF
 4J81dg1fCSKiY9wLZGGoWNgVOp9qZlsrS4VqwIXYAQSD1fQ5bWmLvWtgQQ1Mz+f09pkQBspfmp+
 uHNhVhRuEjx+XKAeaH0BIiZibJQOnsWl7mosZ27LYl4xD45dJyp+vaEaM9caUVAl2OpC8uncMd5
 Bdrk+/AF7AG1kiU07cw==
X-Authority-Analysis: v=2.4 cv=TcCbdBQh c=1 sm=1 tr=0 ts=6965a474 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=P_pM7coAr74OfPD3JcoA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 5EBeqgjBrFVxYFSjTahAlU7MY95xnG9o
X-Proofpoint-ORIG-GUID: 5EBeqgjBrFVxYFSjTahAlU7MY95xnG9o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_174837_506992_A178B9DF 
X-CRM114-Status: GOOD (  14.52  )
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

Commit [1] converted the management transmission work item into a
wiphy work. Since a wiphy work can only run under wiphy lock
protection, a race condition happens in below scenario:

1. a management frame is queued for transmission.
2. ath12k_mac_op_flush() gets called to flush pending frames associated
   with the hardware (i.e, vif being NULL). Then in ath12k_mac_flush()
   the process waits for the transmission done.
3. Since wiphy lock has been taken by the flush process, the transmission
   work item has no chance to run, hence the dead lock.

From user view, this dead lock results in below issue:

 wlp8s0: authenticate with xxxxxx (local address=xxxxxx)
 wlp8s0: send auth to xxxxxx (try 1/3)
 wlp8s0: authenticate with xxxxxx (local address=xxxxxx)
 wlp8s0: send auth to xxxxxx (try 1/3)
 wlp8s0: authenticated
 wlp8s0: associate with xxxxxx (try 1/3)
 wlp8s0: aborting association with xxxxxx by local choice (Reason: 3=DEAUTH_LEAVING)
 ath12k_pci 0000:08:00.0: failed to flush mgmt transmit queue, mgmt pkts pending 1

The dead lock can be avoided by invoking wiphy_work_flush() to proactively
run the queued work item. Note actually it is already present in
ath12k_mac_op_flush(), however it does not protect the case where vif
being NULL. Hence move it ahead to cover this case as well.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Fixes: 56dcbf0b5207 ("wifi: ath12k: convert struct ath12k::wmi_mgmt_tx_work to struct wiphy_work") # [1]
Reported-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220959
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2f4daee9e2f0..7481f64f6937 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -12214,6 +12214,9 @@ void ath12k_mac_op_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	if (drop)
 		return;
 
+	for_each_ar(ah, ar, i)
+		wiphy_work_flush(hw->wiphy, &ar->wmi_mgmt_tx_work);
+
 	/* vif can be NULL when flush() is considered for hw */
 	if (!vif) {
 		for_each_ar(ah, ar, i)
@@ -12221,9 +12224,6 @@ void ath12k_mac_op_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		return;
 	}
 
-	for_each_ar(ah, ar, i)
-		wiphy_work_flush(hw->wiphy, &ar->wmi_mgmt_tx_work);
-
 	ahvif = ath12k_vif_to_ahvif(vif);
 	links = ahvif->links_map;
 	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {

---
base-commit: e33fc1c6d54ee1569a57255e11c2978ba9a42ffc
change-id: 20260109-ath12k-fix-dead-lock-while-flushing-9a4d8be9cebc

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


