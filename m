Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAF4C55ABF
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 13:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NA8MWFLnRkH6OIWjAyG2+978gj5PqzR5yRejjiikDww=; b=n1HxpanToiYypadz6sRgFbfnrA
	J1Ut7DTleqLghb7NWIcribfZLsPHvYnQP//KnCBjE+p9wIB2roYIUNe3WFnqwcEsYPRZl8rCf6sMc
	k5bsxewzWyk9LexYr1EAjCGZDzXJsTMNRruMS3PEn/39qUhTqYCsmJZ4OoC2d7JIDRqvBIeji+CvU
	FLrFCQZ7EF7hi2hH/ZTEUoOwlLtd1OWHpBE9aI3MLiSOlD2lSQX8PkAbYCdSMh+EU9SeXz1PbwwF2
	tcjsWkVSoSj9TE/59rt8XPj7/r+afETFQiKqyM3+aOLNjyNwe5H+DCTLjTW6KT2TzJdHX0kypT/Ar
	aEXqPrFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry5X-00000005sh6-2r3T;
	Thu, 06 Aug 2026 13:24:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry5U-00000005sfS-3mz4
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 13:24:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nd2X1625673
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 13:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NA8MWFLnRkH
	6OIWjAyG2+978gj5PqzR5yRejjiikDww=; b=bh0ANqBL6VcwqnCj8q3n2peGe+I
	O0njxveBVJO86GtupCXtMynjMEuIQgKSDdwXnWc2XxbDqeOEdtzW2a9i1QEdqGfk
	THAGY1wsyesWPiYtpfRxF88wKRMxYDaOiVJZwIg0fzyQbyN2PqbnfE70kyCx4hXE
	E2Tw7ogF8mbTqlmv6hZh+C2WYj6g+vYiPVBf+WMPk9TKaePZDKjyJ/E9XhNvbjE7
	hei+EkOoCdWcvXINwqA+4EZXyrCqUbdm1pe8c8Zkc0LaCwUN3QeQUDkvbNxERFdM
	V4jz4gE5NZV5a9c9yIOBrNhzJp9PXrH08SHw3Jp96qtAoZwTFb5sStpeq2g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvntnhjme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 13:24:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so3746707b3a.1
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 06:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786022684; x=1786627484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NA8MWFLnRkH6OIWjAyG2+978gj5PqzR5yRejjiikDww=;
        b=cWqI52ZzIl24/p9WXYlWtsFV7sZfkWnVPUIE1MUDoI7vWeEyopdMB3fs36xDJcQK24
         EvJDuSco4232fLsFs6V/w/DZ8hQML2pQHT/ajJzpdr4WTCBP5sGCgCwj4mhaN7Kwyoje
         AcqT4vcUgUZnVjh7SlT055QLrLEpaor4rjAb7ipWEL7neLmnum/LeihCBmOOooaoTUPe
         sfFf905oh4BMtwIvNTILQ9z5l/LXLqioucgdFeyhN/2JH/IUc2Y3pKUFyU99eNsUPcDJ
         3OIV9GJ25k6V1xu2gMWgm83NYxkhJtNeYDHCniGjjN7gtknI9VPsQQ71XGemhfj4hDYa
         9TBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786022684; x=1786627484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NA8MWFLnRkH6OIWjAyG2+978gj5PqzR5yRejjiikDww=;
        b=ec0RwiKXLOsvoizFaC+S9l7brpNiGdN4ujDfH0xPK6ecaDUQDAgx5qScXGpc/X3AEu
         smRQ3nQ2Mz24FHpO8QmAJFZYw4cECL5JNM7F+1m4DQGccOR2AbsxgxH4Zrwv74I84Sgu
         hCKWTQrvdISiwOrTs5GyqTayRgEeq51afaEwHNTJ2lvsyelcp5KU/I8Jm6Y2KQM3bQiq
         b89UBLMZLY2SrNXKPfRlEROurPPMbrDKwyhzTiljIqFGFgoidb0CSsWFsriPjD8hX21j
         s4tFmqxC4xZAEv95aptDS0XNyRcYTK9JxFvcjIbD/aFfjnf8ln3TSYT9iSxbMpnfUpPa
         CDHg==
X-Gm-Message-State: AOJu0YzPoSNU1Vi1Fc+uh5EJ3aLW+7Bg/iID3fu57JL+UpNYyibSyF3g
	noYlrPpjxzVwY1abhw5YiBh8lEK4GjIQgG7MsuWd44Yl5b0DfexsmPN8cMm1iUnjvCnWg9q8I5P
	fJnabzLxDnFPFjs3Mcbid/OwVERVcmpDaAJTR8stMnmqBhVK9JTlSZArQbaiOha+gFmnDGIGY
X-Gm-Gg: AR+sD12Nk+DWJBGJbcnYmAVMxzfFRORhnbpeFeSKgNgHnZeLXXr3DyzdKKmViQ4+hcR
	l/5I8v+0KEUkohwzqF5xvqmgaZqEaFHOXQiuVKdchhRPd1vjLe6WnnlrmEl6PNyyfh2TPoK/ARl
	Fqp0P0obTQig0z+9QxziNygp3SCsOjFML55s5HXaaXOn3Q0wQpJFVl5jLz1ltOE7bJWUP7EgrsK
	0OlAANMekQNHP3UjBzTQmoR1iYtKwetHKBeo4ylDVBBH5vSbN1Btc811BapUaYrTvi+2kvsyjVC
	FELoEM7zoAb4rfx1w4n9DawO5nqm7GFLqhcN9WUddVorZzHQ+V3w5HZb24Kvly5/gEA8Gbm9s6r
	hsyWkVGgiW/GryefZIwpDjghdg3GqLFqbr4KiNsocChF6ZNzL6vqR
X-Received: by 2002:a05:6a00:a90e:b0:842:614e:cc94 with SMTP id d2e1a72fcca58-84f2e0555b3mr17026921b3a.26.1786022683548;
        Thu, 06 Aug 2026 06:24:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:a90e:b0:842:614e:cc94 with SMTP id d2e1a72fcca58-84f2e0555b3mr17026859b3a.26.1786022683137;
        Thu, 06 Aug 2026 06:24:43 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b785dsm1411637b3a.36.2026.08.06.06.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 06:24:42 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v2 2/8] wifi: ath12k: rename wbm_status to htt_status in HTT TX completion
Date: Thu,  6 Aug 2026 18:54:21 +0530
Message-Id: <20260806132427.3704828-3-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
References: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEwNSBTYWx0ZWRfX9gSzbmevOv2p
 c6NECKezduYE2tF74VC2Xcj2Q4OhvgDJ0OQ3QRjckrYRlE+Jfjr1mYoYsAdCphA2CkeSG8ok0Yt
 ZABpP84kv61sPht3Tkp4/BNF5FDxpKag79tXFFV0zF1vtqKRH+sD/QCuIxiibzp+K+hhHGFxIVt
 1V9vZVyiWL4+o0m0MG6LmmyS7AaMG701psaUZoQF88nOo/T86n47ojzMTz/wjtDGVtGfikKwnlX
 Eebp81fiyX3TUeGzzw3ykQ2t4yVcAuUdXnSNtpIBUTmT+kKL3yXMeRWjwH5jD8hWvNRdn4FyHBp
 n9quLN+hiHD99ba3/usbQBke0ocXVJwuTBctzYPAsii01UkrfLucQRZupxopv4eyAod5cqSBjEi
 pspxeBElmhrANCWq/ovqIA0GiDGyTl9rozra6HYFeKrOOCVJhJ7cmf/v7OTCp+O7qSB6MsojsgG
 SJWzuedoWFcQI5Ane9Q==
X-Proofpoint-ORIG-GUID: kBOk4GM9E2yOMboolpKWhZiEbjfkVSYX
X-Proofpoint-GUID: kBOk4GM9E2yOMboolpKWhZiEbjfkVSYX
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a748b1c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=RuwI03aZ9ZQFnXGR-2kA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEwNSBTYWx0ZWRfX4aozJKL8eOdg
 Z7f1TNe8sCg+0I9p1lB0q5j6ZPmOMYT5JRIGoSOFzwAyUBswW6jkC4UPDIWnBuMFHS2Dho2xiRt
 LpK72MH7qnA6lQdKW6LApq+PJVI5uyg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_062444_958597_C13016CF 
X-CRM114-Status: GOOD (  12.03  )
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

From: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>

The variable wbm_status in ath12k_dp_tx_process_htt_tx_complete()
holds a value from the HTT TX WBM completion status field, not a
generic WBM status. Rename it to htt_status to accurately reflect
the field origin and improve code clarity.

Also fix ts.acked assignment inside the HAL_WBM_REL_HTT_TX_COMP_STATUS_OK
case to use true directly since the condition is always true within
that case branch.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index 632230e77802..d46a3d14f018 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -575,21 +575,21 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_dp *dp, void *desc,
 {
 	struct htt_tx_wbm_completion *status_desc;
 	struct ath12k_dp_htt_wbm_tx_status ts = {};
-	enum hal_wbm_htt_tx_comp_status wbm_status;
+	enum hal_wbm_htt_tx_comp_status htt_status;
 	u16 peer_id;
 
 	status_desc = desc;
 
-	wbm_status = le32_get_bits(status_desc->info0,
+	htt_status = le32_get_bits(status_desc->info0,
 				   HTT_TX_WBM_COMP_INFO0_STATUS);
-	if (likely(wbm_status < MAX_FW_TX_STATUS))
-		dp->device_stats.fw_tx_status[wbm_status]++;
+	if (likely(htt_status < MAX_FW_TX_STATUS))
+		dp->device_stats.fw_tx_status[htt_status]++;
 	else
 		WARN_ON_ONCE(1);
 
-	switch (wbm_status) {
+	switch (htt_status) {
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_OK:
-		ts.acked = (wbm_status == HAL_WBM_REL_HTT_TX_COMP_STATUS_OK);
+		ts.acked = true;
 		ts.ack_rssi = le32_get_bits(status_desc->info2,
 					    HTT_TX_WBM_COMP_INFO2_ACK_RSSI);
 
@@ -611,7 +611,7 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_dp *dp, void *desc,
 		 */
 		break;
 	default:
-		ath12k_warn(dp->ab, "Unknown htt wbm tx status %d\n", wbm_status);
+		ath12k_warn(dp->ab, "Unknown htt tx status %d\n", htt_status);
 		break;
 	}
 }
-- 
2.34.1


