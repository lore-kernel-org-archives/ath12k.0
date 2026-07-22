Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8903EC44539
	for <ath12k@archiver.kernel.org>; Wed, 22 Jul 2026 09:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WyHN62RuRdrRHFOMXTSlAjFQ2fpF50vbFaQBoq5Mw/4=; b=y2bIblQIvb/DXN/rEsGwi7YDb/
	TuIQY7yOWWggAHzsM6WIHdvabASxxW/baawPRcZTZuL975gd1zcDdmArOWi3Szttf1cWB2yByom+r
	Vj1Ey6G5CSqIY3p+CZobEoa2Zup6bCwsLaORd3aSGjJSKESwW0JtmFRzQu18jN0jWMTycVCyygwuq
	rpPrns67s1s5/6ys4ZgtE12b8oYzmuUPwZXFF8FrJuTXc9Ddehyn/EwkwkTCY7Crb2x4OTyrrKEE/
	nzgp+SdBM8uNlxQT83Qn4M+/fHScqVwVFdqx0fD7KtntqKpgO8zoSht/8mafE++pP0GPdjufhuSxY
	hDWJKc/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTiy-0000000BTa0-10m3;
	Wed, 22 Jul 2026 09:58:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTiw-0000000BTZT-06wZ
	for ath12k@lists.infradead.org;
	Wed, 22 Jul 2026 09:58:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x4Ya524026
	for <ath12k@lists.infradead.org>; Wed, 22 Jul 2026 09:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WyHN62RuRdrRHFOMXTSlAjFQ2fpF50vbFaQ
	Boq5Mw/4=; b=hwrVs9NHmOUXRPR8x0bYCNuF7OhVIU9QQgE5vtyzEF5nzj/Yrt6
	NA6omqWw2un2ZESHu3XR2MlYhUADlhcCI2cjxXCeI7oV5LO8SKb364Y0tXqRHQa4
	85OkhU1rh1iFx1KTqwIifSpeN2tX75X2ZloKg0Rrpuch0fjtBZpgVouoB751V+fj
	JIeb05au98uCME3vXukJaOZdEVQ95NGnGoIIsivl+aIeK/bjBrxETJc2H+zVYBuO
	69P5esTqascxmVNHesivIIx/DzALwMaq9mjx41CxWgc/8wkhcG15nH9zD1cJWgWJ
	v8igVhdr4P17WFuqIEoDDBfYEbPvA7RNoZw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjrtt0ts5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Jul 2026 09:58:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca860baea9fso21694432a12.2
        for <ath12k@lists.infradead.org>; Wed, 22 Jul 2026 02:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784714324; x=1785319124; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WyHN62RuRdrRHFOMXTSlAjFQ2fpF50vbFaQBoq5Mw/4=;
        b=Cx6dGe6QBx+dRveKPc+n4Cct6FhfNnibqNxpTWxSqhwG4PGVHCAz6H1OJ2igy7ns+l
         O7R+2MaKVQGlJoSEzL1wYB5uZQAnlG1FPcT+BjFNn3bBgZf/5ETcnVu52enTYlSbFWjr
         K8zrDHK5Ts6Zwz5nKIEbLWnOgUOmoXohtk1c03xdtnLB7ptFA8nCCsVrkYCXzkLJhSlH
         cTzRNM+dS74aYG0svPI4i1cblhyJR/HNz2aLQn1jkDPOl8IJgfN3ViIx1TA/hUNWhIm7
         KWcGgXy/WVWqfQRKYNZubaw45uaU32fBR4EpBceiJJDKLV7skeffo1FqOAwQGFd8c7oT
         ZowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784714324; x=1785319124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WyHN62RuRdrRHFOMXTSlAjFQ2fpF50vbFaQBoq5Mw/4=;
        b=PH9dyz1MMlU+6GbZpKFL6b8nyHqktgnzpYLVG715e23yo5jHj+yQnxmonBQpZUL7Zx
         qoht93OC4Sm8grhCld1UU2KorL4+GJAmY6P673Itioi6xIutRFZxqHH0XIjbQxmJLs14
         886nwtZloFGiGuFFAQ82XfxNOFW7RukgzF63ish3a9ODzmQkpkDAcTl5kg99C1/HdeEb
         8zt00i7Nn8dO4pNikMadxyZISrmLdliYPbSwLmmipLZiFlYriJ+XvFcR9K8HLq/5X403
         PUgSya9uIH0ccQYPItUPPQt+HM+8HgQkH28ssrKL91L9mjG9oK3y4/aoDO3CbaFWT4T2
         9nXg==
X-Gm-Message-State: AOJu0YxS1w3omTc7UQVdXzpnIEu01bN9bd2DRQovg0nl5axD30cqAmJT
	2366y96W+EJNatHm6k9ihYxECGrTtj9CdrliJOoMeS6vYBu1w5nbvsygBlsCCSjxGIuooAxX0Gv
	/6YSSpkkpgzndVjWGd7flYVjjfwMjAtfdm2QIn2b3ue51pKiN2oiaRc9J7wuCKUKWJQ6KzkXv
X-Gm-Gg: AR+sD13oGJK6k1YAeBElqH7A0vl2Tzrpi1xYgbSj5ibD6oxpnmEH9v4ZowbkobxN0Mt
	L4pPnkHVIfi3UhsX7Fg8PlhXnmJmUuSRDUA51y94Ukvd2LIXKwT8S6qGKJ76QsZT9XHTBgnLyF1
	GQmEXc5hV+GeguJLEH9+M7gmGZRUSYerKu37sDEajmZVy+itUWhE0QOKd83mOZtCXmCZGMbejsk
	8IYMomy9OwxjNeRxdd7MC65TA1OMcQgBWRgHepOoLy47/sVRpdoM9Q25uQmL/UL/2C3Qlilp6ik
	N2AcF+H0I1Llca3svLv+qUrfnN6pC3sNhAbq7uFiwTlD3NCMHDMW/bKv6+TrIfPamz81XE8DAai
	0RyAm9rlMD7hZM24yUtvK/mWex/jtmOk81GJxd8JeAWn5e5e5cxfsQWinniIiViGeF9EWYwYc2x
	JUiJQEP+p58s8dTuE=
X-Received: by 2002:a05:6a21:4d92:b0:3af:6704:18ca with SMTP id adf61e73a8af0-3c3ad8e8573mr24016146637.35.1784714323914;
        Wed, 22 Jul 2026 02:58:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d92:b0:3af:6704:18ca with SMTP id adf61e73a8af0-3c3ad8e8573mr24016126637.35.1784714323447;
        Wed, 22 Jul 2026 02:58:43 -0700 (PDT)
Received: from hu-hbijlani-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1b99esm7816711eec.3.2026.07.22.02.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:58:43 -0700 (PDT)
From: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
X-Google-Original-From: Harsh Kumar Bijlani <hbijlani@qti.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath12k: Guard dp_peer dereference in ath12k_mac_peer_cleanup_all()
Date: Wed, 22 Jul 2026 15:28:28 +0530
Message-Id: <20260722095828.2930377-1-hbijlani@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JfdcHgL3nRqxkoOBXFg6sto7w97L1bZj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA5NSBTYWx0ZWRfX341JBShSpLJA
 l7VAvjQwJBMl4DX5DE241i+H6mjj/i6zgbkvB+dkNfHvswbtxKw3Hz7Sl83HO0Pwzf2/o+qQC7a
 7fnxUG2bTNwcb25KZ4jjSIC41eqlWdpceM5jBMDaL1AGj10KXO97KHi3uvnzpJDbTqmFba3/1z5
 lQaOe7ZrzEen4SHQeltrpQsJeQtRIQ3z7NpG30Cja51LwAikb7qtCjUoNyakQjcc7I/ksg5VAnv
 mFWTlRhJnleBDvKNakWzquPWfd4mOJrTIw6+x8jIVHgiUGpCVzBcjIeHrefnmVmFycf/KDX1qDa
 nBxNuAY2fThBzDoFQ38PJ/fuoiTlBi3qOHP9TuE0LRbHoooCi5f5ZB9a2eSvCyPGdyaPrL+OYdn
 vauZ9ORyNEgjA0SJ8O7uGAeyqY2RfpOF4Dcq+mW+tEG5wzuqNnTQnBfMdun3jUXjU2duo1FQ/zn
 fcSYsXRMXgR7Z8lz58w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA5NSBTYWx0ZWRfX1phDVOqvRkQf
 CB4j4A3wLE5VkGHiJzHnMSbSZI/Rc51zxCW1pljm4ArUAZxL8ta3MKqkJzmpdtBl/j3eW7zjAFT
 ZZaqpUG9cfHM+mIMWEXqJ9WaXdChHoY=
X-Proofpoint-GUID: JfdcHgL3nRqxkoOBXFg6sto7w97L1bZj
X-Authority-Analysis: v=2.4 cv=V8lNF+ni c=1 sm=1 tr=0 ts=6a609454 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=pHrGrg7HEta1e1VtBTQA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_025846_074563_3E0451A5 
X-CRM114-Status: GOOD (  17.29  )
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

From: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>

In ath12k_mac_peer_cleanup_all(), the code iterates over all
ath12k_dp_link_peer entries in the dp->peers list and performs
datapath peer cleanup. For each peer, it accesses peer->dp_peer
to clear the link_peers[] and dp_peers[] RCU pointers.

However, peer->dp_peer can legitimately be NULL. The
ath12k_dp_link_peer structure is allocated and added to dp->peers
during peer creation (ath12k_peer_create()), but the dp_peer
assignment happens later via ath12k_dp_link_peer_assign(), which
is called only when a valid dp_peer is found or created. If the
peer creation sequence is interrupted, for example, due to a
firmware crash, a race during interface teardown, or a failure
in the HTT peer-map event processing, then a link peer entry can
exist in dp->peers with dp_peer still NULL.

Accessing peer->dp_peer without a NULL check in this path leads
to a NULL pointer dereference kernel crash during the mac cleanup
path, which is invoked on radio stop or firmware recovery.

This is consistent with how the rest of the driver handles this
field: ath12k_dp_link_peer_unassign(), ath12k_dp_peer_cleanup(),
and several other paths all guard access to peer->dp_peer with
an explicit NULL check before dereferencing it.

Fix this by wrapping the dp_peer dereference block inside a
NULL check, mirroring the pattern already used in the same
function for the Rx TID cleanup:

    if (peer->sta && peer->dp_peer)
        ath12k_dp_rx_peer_tid_cleanup(ar, peer);

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 956414b953ec..18c1c809ae4d 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1237,10 +1237,12 @@ void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
 
 		/* cleanup dp peer */
 		spin_lock_bh(&dp_hw->peer_lock);
-		dp_peer = peer->dp_peer;
-		peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
-		rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
-		rcu_assign_pointer(dp_hw->dp_peers[peerid_index], NULL);
+		if (peer->dp_peer) {
+			dp_peer = peer->dp_peer;
+			peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
+			rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
+			rcu_assign_pointer(dp_hw->dp_peers[peerid_index], NULL);
+		}
 		spin_unlock_bh(&dp_hw->peer_lock);
 
 		ath12k_dp_link_peer_rhash_delete(dp, peer);

base-commit: ca27e3c2284a7a43ba390ed5ce0d68b3c869c0ce
-- 
2.34.1


