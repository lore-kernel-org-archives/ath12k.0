Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACBDFF8860
	for <ath12k@archiver.kernel.org>; Mon, 27 Apr 2026 05:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uEueTBFLq/dmQ7/anu9wgCNL7Oyi7zZL9qClmu03C5Q=; b=03D4D6MVU4QVKHaRio6ctJ0Lf2
	yaFJrVhuEBQqamu2e6y95TB5rIVufiIbUrjEWQX4pvnRLz0U6lrYpoYD92gtymEkuGiQIkQLd1heT
	sANphRs4EcefjrCFZLjfscB7/Ob7LOLAtPIz9UtKFw4ySLQNzQeiCVGTNeMuOHUAsbh8Ly/D4oYOm
	4l5Szrh8Y5QPH6+cC/BRvg3RmP8KhennaI5bUubVBiOa1E75yomQCS7AY16mSNh5ta0RDDWb/uNmD
	zCTBr2tTmvgmTjXoXKHqQc3nT8RAoD8DzPTQ08mVuTYxmHYPMXUX7rLRIhJkjhgZhftoxrbOC9cuc
	shdCP8yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHEso-0000000GDJZ-10xk;
	Mon, 27 Apr 2026 05:51:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHEsm-0000000GDJ4-1w8C
	for ath12k@lists.infradead.org;
	Mon, 27 Apr 2026 05:51:49 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QCDlda2338955
	for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 05:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uEueTBFLq/dmQ7/anu9wgC
	NL7Oyi7zZL9qClmu03C5Q=; b=hiJoCfaPwc3RqAtNVE+iOzOTX5Wx9HHgIxgoHH
	565qErREU8jULHHUiLzyUxQmewbU/h/+LGPVO+x6gnO6CATzAXuf0WhXb/lzv2/z
	ITwJ4FGp5FO8gdYViSOwQrQvGAHaywXPwW+C0/elGVLbbh+hy/yJoPVwNVBMtYGd
	80mkEEHIFfCP0MAdZnYtDcJ8BsJA9QmtVHkqxxyeLwL34klTEJYWrWwWy3srEcEG
	UJGHVmDGwFrYGYdbqgyPfTZvWD6FwaaS/McHgGDkMmMkmpFEACUtFWghRD1nx6SU
	Jt/JarFteW5UsYhuJh4Kc1WHAlPHps/iWIy4oaNisVLRUhHw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpcdmhn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 05:51:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f220f1dabso7296431b3a.1
        for <ath12k@lists.infradead.org>; Sun, 26 Apr 2026 22:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777269106; x=1777873906; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uEueTBFLq/dmQ7/anu9wgCNL7Oyi7zZL9qClmu03C5Q=;
        b=aImWazGRvD4kOQn9UroQln6jrAVtR1tWuT9XFQTdDkvatZKZlZhAg7UZnPG/rKZZbv
         3z56HIZqHbHKfYQnD3dH0jm6gMvmuxJV2UJy9/+FmXNy/kWjz8LH+YuoN5AEY0Lpi+8V
         oFTd3sLbWHjllmth4TkcwBV5rlGWpV5+m+LNQvAqi4FkOWJ9SUyX1NL/hwjXkj/1zPrz
         k6WecbQyJUoA7WWzv2QFedHjxzhhZ5Gqu3qExWJJJZRYtyGZkVckrebX6fqqli3RMwJQ
         OOFlVPiiRN9qyIm+danpC/YrGK6kreEnSg2iytnNlA2/GTuj2Pv56bKP5E9ZoGCoPQE2
         wmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777269106; x=1777873906;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEueTBFLq/dmQ7/anu9wgCNL7Oyi7zZL9qClmu03C5Q=;
        b=kcWLIMn6w+o0K7IP1vJKn34hFRKvbuSGbBdCmUZ4JbFJJGT6GxRR0qkbWIywQPvUPg
         b6dpdRz4j9UqSIAQJ54Cnvb+2/AcSGTRgrlDkOs8Lq0hFpdhgYaxMhKTHEtdMfzsEl5E
         Kj2/hSDAqGqkD1dCYqnPplm0eM+z0oXiGnV6aqFPQhKTBKj+aNfd+sSig5HKC6eF7Ytd
         3/bY5MghDcK8LM+LzDh8ibi7i66536fUuFxcGpqKW9l23Hewdc9ZYTmEW5oH9LhUJVbW
         Yd2BrF8fATGA/32Y3eKl2hfW6UjJbT508Eg9B/aG9UCR5qEb9WzTHc8ynmnC7TND0czu
         MtfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zd3Izx30h6W8YyzXV7AYnF5TsDq058e53iHvgxPwQ8aAmqr74t+qXfPt+KAStNuhzjwV/7Q8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxnxkP0CWKKhHeI+JUTGTu9cl1Ak2MVylyAEmMbpEvqqHKX4wyt
	YyHxf5nEuyrxoL2fRxmdAWyVFx5gjJKubDspOKjx4LY2bJ9CJ7GH12IASfkImNIMtR8FN4tkI5L
	Wsw3+LO83txLuljuwVLx+fTcEGWiYUCPEiYksolNTJXGgtK7MctYoSCA8YcZ0pOj7
X-Gm-Gg: AeBDieuU3IzKPE3Ve5hkT+wmJdL7rfMX+tBQiiwE3mCdOSFBdgOUlJyNsqxTg21+4CP
	yWQninOA/jvIjDB7uhlN73pf4G/1zaLVA3wWSC6TlAdZnbKz07ffqr9rVw0+U2E6d09m82ZsCWG
	lXcoCzY/XjND0neM//BNc89VftzP6DxnFSC4Hw2DUnajZ5LCKbvaUUxYLt1ieLj/vwRbLtL0NVB
	QB3onSy7Ynavj/pj3XBExoTZJn3lURbpA7c4UceJ2GHDMhwCDS2EDBvFBaGARyEXNwvHJGqpp+f
	LLeV05qLJneepepwKBEmikExmXxS+rLYywv8SnQetVlhglzt30kb00dxhoHs58Uaj9vav2KvXMP
	xMpQvKj8efQGWhz4WPGLAIUvTfUXJQ/YNxS5ISGrbBaSfzcHmRwb4EBMshL4+tdB40ZS7C4Vra+
	9jHF/vRDe8Xw==
X-Received: by 2002:a05:6a00:2d87:b0:82a:ea3:c172 with SMTP id d2e1a72fcca58-82f8c9341f5mr42260557b3a.46.1777269105862;
        Sun, 26 Apr 2026 22:51:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d87:b0:82a:ea3:c172 with SMTP id d2e1a72fcca58-82f8c9341f5mr42260523b3a.46.1777269105335;
        Sun, 26 Apr 2026 22:51:45 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebba485sm38314765b3a.38.2026.04.26.22.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 22:51:44 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 13:51:41 +0800
Subject: [PATCH ath-current] wifi: ath12k: fix peer_id usage in normal RX
 path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-ath12k-fix-peer-id-source-v1-1-b5f701fb8e88@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGz57mkC/42NwQrCMBBEf6Xs2ZQkral48j/EQ5pubNA2NWmDU
 vrvLjl5EJGFhWFm3qwQMTiMcCxWCJhcdH4kIXYFmF6PV2SuIw2SS8VroZieeyFvzLonmxAD2Sz
 6JRhkouZGVlY03UED9aeAlMrsM1CNmSUEHGe4kNm7OPvwyrtJ5MgfE0kwOuIb3tSdVfzkYywfi
 74bPwwlvQxP8gMo+S+gJKDke6uaqhJta78At217AwGtTIsnAQAA
X-Change-ID: 20260416-ath12k-fix-peer-id-source-140c23f17d8a
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2MCBTYWx0ZWRfX0uUZIwykrNXr
 YFeKtmPtWivt6Ltf52oprn7omBlTFg7uavJePT4yUEsf+ZyKmCfUiCX3zlywFAkKTi1qNrpzrYI
 piAH/hH0a0zbQhMVBIxdmrgYT0osHUUD7rYpCsNLGcwLLu8+Nk38fZGSL+C3KpzgPHcf3gW5qIZ
 uST5TK3gnPuZh4ZdCLqpRXtIDOoZ/PYEMiGGeAZYawwUYhrDURso4a8hMvO0/rGHSng0YZO35mN
 AHWqBP6lZ2TcUV1Bu7WiL6QBYiLoAHCVdhayyctJKJ9GCUDJ2oMCY6HTUygAZYsHuhhvDUgS+e9
 x0l5AAirb9Nbj1CjctbTgz3MdZZDYHTSWylFudJlFVY4IA3cq8v1ux+0+v6Y8VY6ihvRe8rfpCe
 2boBmmsosxTrrkt2/QtaAQrEVRw+6XXmn0S36Y8y8vMR1VawKX/oE47lcyllhQDTfSJZZeV+KbZ
 mkcLrXcgt8EmFfdACMw==
X-Authority-Analysis: v=2.4 cv=N5IZ0W9B c=1 sm=1 tr=0 ts=69eef972 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Vb8Ow2E4jlE5h5wCsiUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: etD6MzFTHlp7I2P05OW5elZD7_QubWcl
X-Proofpoint-GUID: etD6MzFTHlp7I2P05OW5elZD7_QubWcl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_225148_601405_A9601193 
X-CRM114-Status: GOOD (  13.85  )
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

ath12k_dp_rx_deliver_msdu() currently uses hal_rx_desc_data::peer_id
parsed from mpdu_start descriptor to do peer lookup. However In an A-MSDU
aggregation scenario, hardware only populates mpdu_start descriptor for
the first sub-msdu, but not the following ones. In that case peer_id could
be invalid, leading to peer lookup failure:

ath12k_wifi7_pci 0000:06:00.0: rx skb 00000000c391c041 len 1532 peer (null) 0 ucast sn 0 eht320 rate_idx 12 vht_nss 2 freq 6105 band 3 flag 0x40d1a fcs-err 0 mic-err 0 amsdu-more 0

As a result pubsta is NULL and parts of ieee80211_rx_status structure are
left uninitialized, which may cause unexpected behavior.

Fix it by switching the normal RX path to use ath12k_skb_rxcb::peer_id
which is parsed from REO ring's rx_mpdu_desc and is always valid.

hal_rx_desc_data::peer_id is still used in
ath12k_wifi7_dp_rx_frag_h_mpdu(), which is safe since A-MSDU
aggregation does not occur for fragmented frames. Similarly,
ath12k_skb_rxcb::peer_id may be overwritten by hal_rx_desc_data::peer_id
in ath12k_wifi7_dp_rx_h_mpdu(), which only handles non-aggregated
multicast/broadcast traffic.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Fixes: 11157e0910fd ("wifi: ath12k: Use ath12k_dp_peer in per packet Tx & Rx paths")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 25557dea5826..b108ccd0f637 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1340,7 +1340,7 @@ void ath12k_dp_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev, struct napi_struc
 	bool is_mcbc = rxcb->is_mcbc;
 	bool is_eapol = rxcb->is_eapol;
 
-	peer = ath12k_dp_peer_find_by_peerid(dp_pdev, rx_info->peer_id);
+	peer = ath12k_dp_peer_find_by_peerid(dp_pdev, rxcb->peer_id);
 
 	pubsta = peer ? peer->sta : NULL;
 

---
base-commit: 7aa24d964a04648b547197c22364e2b76aec096e
change-id: 20260416-ath12k-fix-peer-id-source-140c23f17d8a

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


