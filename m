Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233C4E9462F
	for <ath12k@archiver.kernel.org>; Tue, 10 Feb 2026 03:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ExK72ja4yh8yu/tb5MMW3IlYKu3JA+KhCd2SUHccSVA=; b=sy+j61M1NPYAEeNRIxDSJoVKh9
	lVS/Bhoab3tSIiAxdKXVuT+p9eBPZtBSdBtOjIDOtOMUKeeOqN/BprBbAzygj+e/1FsxAUBdqY0lx
	bPDgRGHz5BWCYRialTTdUwnKfxnGeLeoMqlLpPbYqP8/NKRROkNghWwpu+Q4eHWz3QU7wnGqHQg0k
	3ccpxtOAC39nSeN4ovO5z0oA9WCUnzbPPFsSqfv4VFVxAJs+AfwYfyxeZJNAgoatjB1KlqfjpmG6v
	LLgGpPc3cb69f1IZKSnSdVc91i0xs+VrY2L8QsJXY7Hp4WKx7v+xN6C0Zw6s+YohxQfO1tZUiq7MW
	LR9M4trw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpe6V-0000000GMKI-1Zjc;
	Tue, 10 Feb 2026 03:07:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpe6S-0000000GMJq-1Ic4
	for ath12k@lists.infradead.org;
	Tue, 10 Feb 2026 03:07:53 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619Hifwu3699994
	for <ath12k@lists.infradead.org>; Tue, 10 Feb 2026 03:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ExK72ja4yh8yu/tb5MMW3I
	lYKu3JA+KhCd2SUHccSVA=; b=ojQTTvcUeSzQRAsgLEo5wauOkglUIdH/tPftqe
	as70mtAp7wMEKbYDZ50JEpcjacbGtvX4w2ayZTMWd3Mfhb4lW5bIiXbJKHL1GLh7
	CR4Qd1KpwI/+Rjh1gYmNHoUym9hoyo37088WsO1JpcVL5+7dcI5NBmTBW2wlgAz8
	i9qAwZeabCKsBQFTE4ZpstC/pAOQJ6iPD1kTzPLb2DV4r9h6d/l6LFkscGne3HdJ
	j/gG80qWg2hfqUa7fs9eHykUb3RuyrIN9mklnc7PMr/AqEb4ePlOj1HOCZUN2m1c
	3hQdBLTw2NVxuy99EDmN5n93Pob+LmqnpyVkNVbvbsrZ5VAw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7e4mayts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Feb 2026 03:07:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3545b891dd1so11246272a91.1
        for <ath12k@lists.infradead.org>; Mon, 09 Feb 2026 19:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770692869; x=1771297669; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ExK72ja4yh8yu/tb5MMW3IlYKu3JA+KhCd2SUHccSVA=;
        b=SWbzE6tWscZNYjQ8GED4RMpo0gmgtOYpTsAVJ/1vjxIB21iY0NxkAl/SmqKUTp0aex
         gSwMvYCvJsixvDsJ3+N2PZwDSN0Yc5LUTJhlThgAZjkDgJ0kI+0+pMd9KUl3d0XkPGLa
         /UpMpH3Y8FbTSadhkbd+6d7z8mvjab0qEwnc+MPOKUrVlsyB6Wnr34CkT00BO8/aInVc
         TheWtrjEglXDAXUAmkdYuWDJrYgDV60kFUUUxRx5/I8cxCPxHA1CS/JERNGoKbn2rWGw
         1BKLVtKU9y05DZCRG5A1ubUOJ9CAs1NMrKZ9PS/ngO08cscuyaJWZu8Pc5yMM93CnXkM
         4zjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770692869; x=1771297669;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExK72ja4yh8yu/tb5MMW3IlYKu3JA+KhCd2SUHccSVA=;
        b=aPjvKSvsW++MvfXBPQZgIRWg9+JiGHcOhMmxNiGEoMfKjiF1EvWfZxRdlOcFa1q/6O
         Rifk9J6vXBvEzTxYgxFqePeaaw267hgiNklK/86GF7KVoK3h0o/zanDUB50bwg7Uj1BY
         yhhKyB3RXab7jQuA1IB5/+vJr5YupLV3FOLYOhwpxrCv62nZwvyj/XagDjwO8cSgYZtM
         wWncUra8S6vKCpSYfxgTJx9a3R/PWLABxPzUraOoMsiXY8hmfLwDjO/0bQ5XTZbFiLx0
         s4RQCBgftLmaRAdy/idLxi+GItEqdqHtaSh6GKrNphaQYJVyPMyY85XlXxa4Hd9Uo7Si
         U4dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEEPmmZB2eIlBTH7WR6tHYDBmkVd+RX76U3qp2jVnLrSgvsFYg2fQQdIPWRlch5Eg4M58d1/4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxiZ+aszVn0I/Hwkc6plPdDGt7H8T6g1ORKH7n/VKa6nxI5P6ow
	nz8gIkP5Fbmv7ey3S8rbAslBKerAziHWYNVLVd7tOuSjYhGhFCLBPsm+ohF8eOGqNub5z3c+YhV
	iIsaokQyIKUx2hVO9aMQr0pW4OOsO+/QNGGlhIcQlBntKgKaEfPTO30YpPD5QosvW
X-Gm-Gg: AZuq6aI18hl9sCpDs1owlnWNZX0INrIM5kTr/3vz0Ob1VJ9UVnXuHuKbhsvRoQzE+i7
	sOzkaDv15qNes0EL8Bc65r2/v8WJ6nVBjSJuF1JfiMWGtotZ0TXvEkod0lYzuJJdUXurQoUortn
	B1h1M2FYrlZRe1nuYvi5W5E8BoApexdAtuMmsf5d/59F4n5ggELfYbjp0GZ9NvfREU06KXibLp0
	FFo0kMKEdErEqp8TVQ3QiGujlhdJPN2br4hKwCoYTSKTmFkoggPL1gRlc0HBiyTPbu7SeJaPSus
	LHhj0ulr1Qu0CDKXwiM6PfHH/ynza0lfpkiQ+fvUkA3s5I/6HUqhmUHPxVxB7KMpP5tklw18sdW
	kABMbWUBgkWa4i4P/AZCfVo4C302Fe1pjwQboPphX6UkOVUjxzFS8zdp7b+U3pFTfCj3JeM9tDt
	0=
X-Received: by 2002:a17:90b:4e90:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-35667d522c9mr652712a91.23.1770692869368;
        Mon, 09 Feb 2026 19:07:49 -0800 (PST)
X-Received: by 2002:a17:90b:4e90:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-35667d522c9mr652695a91.23.1770692868950;
        Mon, 09 Feb 2026 19:07:48 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b30f899csm5180790a91.3.2026.02.09.19.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 19:07:48 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 11:07:31 +0800
Subject: [PATCH ath-current] wifi: ath12k: prepare REO update element only
 for primary link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-ath12k-rxtid-double-free-v1-1-8b523fb2886d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPKgimkC/4WNTQ6CMBCFr0Jm7ZBOkaa68h6GBbSDNCLVthAM4
 e42XMDNS768vw0iB8cRrsUGgRcXnZ8y0KkAM7TTg9HZzCCFVIKkxjYNJJ8Y1uQsWj93I2MfmFH
 qCwnRdTWpCnL9Hbh36zF9h9xCM4fAU4Imm4OLyYfvcbvQEfn/sBASaqOsrelc9VrdfIzlZ25H4
 1+vMgs0+77/ACqBclfUAAAA
X-Change-ID: 20260128-ath12k-rxtid-double-free-289100bb5163
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: nk06ZFJN_FDoRkJB1UVisPex6jFrvFzh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDAyNCBTYWx0ZWRfXwjCCrj28vwDo
 qyjEUMEoBMQV1nTWhO2zF9B37eMjsCWVUKZXhvHTD6TaNnOip0qffL+x89N2WchPLolua22QMNV
 QxDnaDU3CDnIxyM3FnfrFxKoTp2oiPOeJ5fEysoXZOS3XDK8LMHr94BPCe4x44X9tZ0k7ILkRzk
 bxsSc0QduSmyZnoXsbcQucIeRe9rRV0LQvX6NBWtu0VPkGxVGgwXdFBlSEBke6EHJTZWcgEarPC
 nRNCocK41kCdhyEwVJ3j69309dTORN6c0qg1WSFqhf3cO8DU/lfrtYTNYY7LiV91SvKjeUuMCKm
 jH5k4AFlOCxy4Jcp4URG03UDnqhR5IASPtMJxpAfUGnMJsisQGGzjMP1gnChZ8ZkS9131tfYXms
 cFLfUaqNnYkD/M2VwYu5nOL14IGju37Ilc8og/4oAOkM73kUVH9SgvIDvfzOQ3Pd8bNiiqAPhHA
 W7dDfrGOlG1oY06RKcg==
X-Proofpoint-ORIG-GUID: nk06ZFJN_FDoRkJB1UVisPex6jFrvFzh
X-Authority-Analysis: v=2.4 cv=WecBqkhX c=1 sm=1 tr=0 ts=698aa106 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z60ED8iFgELaZGRuqMgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_190752_366542_F2898DCE 
X-CRM114-Status: GOOD (  15.20  )
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

Commit [1] introduces dp->reo_cmd_update_rx_queue_list for the purpose
of tracking all pending REO queue flush commands. The helper
ath12k_dp_prepare_reo_update_elem() allocates an element and populates
it with REO queue information, then add it to the list. The element would
be helpful during clean up stage to finally unmap/free the corresponding
REO queue buffer.

In MLO scenarios with more than one links, for non dp_primary_link_only
chips like WCN7850, that helper is called for each link peer. This
results in multiple elements added to the list but all of them pointing
to the same REO queue buffer. Consequently the same buffer gets
unmap/freed multiple times:

BUG kmalloc-2k (Tainted: G    B   W  O       ): Object already free
-----------------------------------------------------------------------------
Allocated in ath12k_wifi7_dp_rx_assign_reoq+0xce/0x280 [ath12k_wifi7] age=7436 cpu=10 pid=16130
 __kmalloc_noprof
 ath12k_wifi7_dp_rx_assign_reoq
 ath12k_dp_rx_peer_tid_setup
 ath12k_dp_peer_setup
 ath12k_mac_station_add
 ath12k_mac_op_sta_state
 [...]
Freed in ath12k_dp_rx_tid_cleanup.part.0+0x25/0x40 [ath12k] age=1 cpu=27 pid=16137
 kfree
 ath12k_dp_rx_tid_cleanup.part.0
 ath12k_dp_rx_reo_cmd_list_cleanup
 ath12k_dp_cmn_device_deinit
 ath12k_core_stop
 ath12k_core_hw_group_cleanup
 ath12k_pci_remove

Fix this by allowing list addition for primary link only. Note
dp_primary_link_only chips like QCN9274 are not affected by this change,
because that's what they were doing in the first place.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Fixes: 3bf2e57e7d6c ("wifi: ath12k: Add Retry Mechanism for REO RX Queue Update Failures") # [1]
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221011
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index a32ee9f8061a..6995de7761df 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -565,6 +565,9 @@ static int ath12k_dp_prepare_reo_update_elem(struct ath12k_dp *dp,
 
 	lockdep_assert_held(&dp->dp_lock);
 
+	if (!peer->primary_link)
+		return 0;
+
 	elem = kzalloc(sizeof(*elem), GFP_ATOMIC);
 	if (!elem)
 		return -ENOMEM;

---
base-commit: d9a2be2d72d4f9035f0334e0ff49180fe9df6e52
change-id: 20260128-ath12k-rxtid-double-free-289100bb5163

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


