Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB1DF531F1
	for <ath12k@archiver.kernel.org>; Tue, 14 Apr 2026 06:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jYG1v408quIn73bFq02nBIz5X2VttPYJCXB8qX5Hqt4=; b=V34hu6q/xwESRK9dvkPE3z5S3Q
	WCB+Iy91JPhsR3ZrqbasMk5HpJROX9PTOoVxMKjk0Hcdjsgv63ty5Cw6m5ma+CuRzrPt7bC5931rd
	2DKo5ZYR+vVzdhbpgE5peHUawAO7TJ9yos9NR+SRgnfTlsZcDXECn0R0/5AT5FwPkgsqPuyy1PLip
	1UKglYpXTl3nlYKFyRxpVit/DERmHZALVRp7WgMFMuvUNIukDwRRSZxFjr1BtUNqSYfTnA4tY7nlq
	8b0R5HarIiIxdDnuw+SHLjvbg48K8pLpqPgkbAcXir3/O5kb3YxHNzHlURwQ+0dAFOP/SLv6ifD45
	3RsjptXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXGP-0000000GqIp-3Y3r;
	Tue, 14 Apr 2026 06:28:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXGN-0000000GqI4-0CgZ
	for ath12k@lists.infradead.org;
	Tue, 14 Apr 2026 06:28:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCu3b282234
	for <ath12k@lists.infradead.org>; Tue, 14 Apr 2026 06:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jYG1v408quIn73bFq02nBIz5X2VttPYJCXB
	8qX5Hqt4=; b=ItSn+Gf9cE88mfdYQwG6uHi1cDD2rIvUI2Of5piFSGo38Z/zvLf
	HEmyU5DbguNvPyBz6wCy36JgeESGHE65gtHGd/+nQof9nu9LquAKB6sCpGs6wMkq
	gpywYnKRYk1QJcUGZer5rftY2JxjXvg20Tq5ktOzTTzeg2wyAd68ZiGyZhMFhU7V
	KSmyactZYL0JsWXT83k7UFXFsmSDMnXedZ7jmLjkhMCi0aMN/NUdGy1CmVzQxL0L
	P4tQlCeD56fsMknYjoy+CKLime3Da0tGMVQjI5B25Ft5rOkbvG1sfi31Dzsb+6CK
	OM8nSlcUH7MBeyNKpsR9c+8GkfiZmbDR5HA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vhaxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 14 Apr 2026 06:28:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35fbaada0caso1787024a91.3
        for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 23:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776148120; x=1776752920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jYG1v408quIn73bFq02nBIz5X2VttPYJCXB8qX5Hqt4=;
        b=ZIsns4GrDGxPs0mPmuVOn/VnTRxqlIshx2+W449zPbqRHPKHVSJRZU8gcJXdsutTwD
         B9+JxyKxhnXjmC+7vokjJS0G6l6lFS1WmPLcKql7AZhWfcpOo6AN9R2vIi1MI1JQWEiK
         fP19vPtXwONG+qCiJNoV1gnHa+zObHu4/Bpq9GGSex432kix8tcjVxWco+ilGjVTog8g
         nn9T79c/iD7T+jqBkmKnMLdjyWXIaKpZfSkYy8eF+Vt9FlxKa+EXhq+HLJtPffTsJGgA
         I05OrhWy5gAL6pxJg/2PNxv2DkS4Ex6SJfnqYlpi6n9lh39DsNSlN+pnD89fxPp3payP
         m5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776148120; x=1776752920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYG1v408quIn73bFq02nBIz5X2VttPYJCXB8qX5Hqt4=;
        b=DtlcGWucTpq5jqXyz7Bbxi7QSLzaiVarfOzBVHEa+FmDTnUk6pHyyOo/9Nq3mapbWI
         NEHYRPRMao6rd1enhZAazrx61SOPlMWGnuHayQEaujE+OmrxB77CdLf1T3vjwoARznet
         YtwIEcGTCH5HId41NKxohu6xvbCxg26Qvnu9iyHyOl2Tklpi/nK4SC7B17VjWr9KY0i3
         f0hDrCbVej1Fi6/iCfMaUQDdVi1AgIBhhbMIQq/Fihp/SM5sWEtIhHrBVpPnTNh+95ox
         MR89ClHOH+4H+HMOqKfD4oBolgGATO07kF+Eqe07/3/gvLY6jO7BFJBp8xAodYX0bjKC
         NSXQ==
X-Gm-Message-State: AOJu0YzuqR+rSidScYGE9rmuKNwuuX6bz2Hkh4B81GjlbAphfLLQ5D6x
	LbdmY1Kq+qOdBIzn8Ijy4xV0b5+Avo3xLe1jiojdLIcI1vRPV8sDHL+P5RK5kyzFDQpd7264v5/
	NmFEOZhEqFfKz0Ssj3Xp6alHkvYouLe7lQXVLBblFEg9eO8pI2J/LwWrWjG2XRawyLfCkQ9hl
X-Gm-Gg: AeBDiesFgOoDqkbqUxH0415knh7/qHJC0u7bmJKizrCJ+SBIE8N9wK2TnqvFz8gEtbZ
	1dKr/vv5zQb9VXMYSEe7BWSwM+aLIr1/F7XqLMcMzq1lQqHrFs7ibioGIXTCj8CXkG93VDF20mo
	GMKJUu5lXqyFFoehCIKX6vcAX1UDLNi+CYZamY/+3KNKkidQFja6DGWzUuC0w867GYgfoQ6E4vC
	mqzwJi/3UzqVzfd1CMcho44Xx8tRf19heleAvdHAK8BYmz2LZMuxqHbb/cR5MPk6Kt5QFUBjJZV
	OD8nWP9dwZVJnGAi6XplcyyR7TG1BTc0m/egY8b7KrjANowMFFWBQcbaIp3IIkfKldiCo/B2jBv
	sdfX5gcgraXFSkqMQ4ZjUtT79XCCVprb9DCeYmSPMxpJ9fh5bF1dHxtKE+k3jk+adqkqpXOpYCP
	o0MsKNU+Sc7naN4NtEDn8PN4sVwsp4BwU5a0UvN3WZo0ZyQtDB+88mw9M=
X-Received: by 2002:a17:90a:fc4e:b0:35f:bddd:3860 with SMTP id 98e67ed59e1d1-35fbddd407fmr4921844a91.6.1776148119774;
        Mon, 13 Apr 2026 23:28:39 -0700 (PDT)
X-Received: by 2002:a17:90a:fc4e:b0:35f:bddd:3860 with SMTP id 98e67ed59e1d1-35fbddd407fmr4921818a91.6.1776148119223;
        Mon, 13 Apr 2026 23:28:39 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fc6e3fc21sm993564a91.1.2026.04.13.23.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:28:38 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Fix invalid IRQ requests during AHB probe
Date: Tue, 14 Apr 2026 11:58:29 +0530
Message-Id: <20260414062829.2371761-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DiyzpX4XVwFCZe30FeU2rDo7lY1r4GW0
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69ddde99 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VOb1adjnMac3WpnspdkA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: DiyzpX4XVwFCZe30FeU2rDo7lY1r4GW0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA1OCBTYWx0ZWRfX7yUWG1TpWGRR
 CJh/F+uGdo6i+5T9qYOR8B3qSnbwUcMIzeN+SE8tCPK1hDiggZfyDRbiSGpikfKtt/s/oHrxj0R
 69H0Mwf+0N0drOxZJTJBgtMCp1Y3Z4SuFnXYyt6fVFp9Gw2iF0cWidwWPVzxcDU2ZlK0vWIeSkG
 lbxAFkAWfc4Lw5iZFoCvjzJd8UTcmDjOCpLBIjm0aCMe37kKP4mIwHglzxu5iDvhCy1Sg8zBHMe
 rB2QUpIIuPcUqbadP1uDZWZ9gtF3FLQewIQX75+SygrZtUJHpeszbnf/NBTcwJqD3519FIgfoyT
 htCO1QD2Lev5vRxT8wtL7KvKup+PcGSUMrLfZUArdc1QQOvZ7tRcITba3kDPwMZ/6onbYH1e6zX
 yHYWyLJsZpOfnhXEtZwa4pBhAMMJuRAOD7ab16r8O5RZYO3Xjy4vZ81X6CKpQGAu0NnDhEUTR4+
 RYN7BBJr23RHCOcYkiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_232843_353766_1F2CA893 
X-CRM114-Status: GOOD (  14.22  )
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

ath12k_ahb_config_ext_irq() iterates over ATH12K_EXT_IRQ_NUM_MAX (16)
entries while checking TX ring masks, but the tcl_to_wbm_rbm_map array
contains only DP_TCL_NUM_RING_MAX (4) valid elements.

When the iterator (j) is greater than or equal to DP_TCL_NUM_RING_MAX,
it accesses tcl_to_wbm_rbm_map[j] out of bounds. This results in
reading uninitialized memory for wbm_ring_num, causing the driver to
evaluate incorrect BIT() conditions and request IRQs for rings that do
not have an assigned interrupt line or device tree entry.

This leads to request_irq() failures with -ENXIO or -EINVAL during
ath12k AHB probe.

Fix this by splitting the loop into two separate loops: one iterating
over DP_TCL_NUM_RING_MAX for TX ring, and another iterating over
ATH12K_EXT_IRQ_NUM_MAX for remaining IRQ entries.
Also add a bounds check for num_irq.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Fixes: 6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 2dcf0a52e4c1..30733a244454 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -583,31 +583,36 @@ static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
 		netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
 			       ath12k_ahb_ext_grp_napi_poll);
 
-		for (j = 0; j < ATH12K_EXT_IRQ_NUM_MAX; j++) {
-			/* For TX ring, ensure that the ring mask and the
-			 * tcl_to_wbm_rbm_map point to the same ring number.
-			 */
+		for (j = 0; j < DP_TCL_NUM_RING_MAX; j++) {
 			if (ring_mask->tx[i] &
-			    BIT(ab->hal.tcl_to_wbm_rbm_map[j].wbm_ring_num)) {
+			    BIT(ab->hal.tcl_to_wbm_rbm_map[j].wbm_ring_num) &&
+			    num_irq < ATH12K_EXT_IRQ_NUM_MAX) {
 				irq_grp->irqs[num_irq++] =
 					wbm2host_tx_completions_ring1 - j;
 			}
+		}
 
-			if (ring_mask->rx[i] & BIT(j)) {
+		for (j = 0; j < ATH12K_EXT_IRQ_NUM_MAX; j++) {
+			if (ring_mask->rx[i] & BIT(j) &&
+			    num_irq < ATH12K_EXT_IRQ_NUM_MAX) {
 				irq_grp->irqs[num_irq++] =
 					reo2host_destination_ring1 - j;
 			}
 
-			if (ring_mask->rx_err[i] & BIT(j))
+			if (ring_mask->rx_err[i] & BIT(j) &&
+			    num_irq < ATH12K_EXT_IRQ_NUM_MAX)
 				irq_grp->irqs[num_irq++] = reo2host_exception;
 
-			if (ring_mask->rx_wbm_rel[i] & BIT(j))
+			if (ring_mask->rx_wbm_rel[i] & BIT(j) &&
+			    num_irq < ATH12K_EXT_IRQ_NUM_MAX)
 				irq_grp->irqs[num_irq++] = wbm2host_rx_release;
 
-			if (ring_mask->reo_status[i] & BIT(j))
+			if (ring_mask->reo_status[i] & BIT(j) &&
+			    num_irq < ATH12K_EXT_IRQ_NUM_MAX)
 				irq_grp->irqs[num_irq++] = reo2host_status;
 
-			if (ring_mask->rx_mon_dest[i] & BIT(j))
+			if (ring_mask->rx_mon_dest[i] & BIT(j) &&
+			    num_irq < ATH12K_EXT_IRQ_NUM_MAX)
 				irq_grp->irqs[num_irq++] =
 					rxdma2host_monitor_destination_mac1;
 		}

base-commit: e6630ad4c58f89ba72e64fca5989ecf1e06319c9
-- 
2.34.1


