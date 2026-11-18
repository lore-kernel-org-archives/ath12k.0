Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06F060A2609
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 08:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wChjnzpe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Q60VeFwF;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i37Fqcqr;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=klO4XnHJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=; b=wChjnzpe0yvyiB
	lP8aomfgTm5yjBjIX6FKyG6GprI9+pqqq8FTW/nC4FS1rSFLIJ20ropyN6UDAtBMPCnvOKZr/la8b
	gna8HzUAKjgx+57VOumkExRph1fM+4JcOlhNoueFYr0woLs2jguF1t3WJFeQowFpqg6AWQPk97RMb
	Awy2N9bNMSotw5Ow/Q61uknfjS54YHT/dyvjjJcM4h6b9CTADtZpx8cX9Ml/WMhQmY2KbZrxnFMLl
	MlNZXgVBO5qwgTexxQmT1J7shFpq0Io/hSHwNvmsvIc7RJAew9Yqug7CsLJgJJ43cSjjtE3S3oKn/
	D1YeJ3mSHUne368iQrFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaqj-00000008974-13qi;
	Wed, 18 Nov 2026 08:17:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaqh-0000000893B-2Bet
	for ath12k@bombadil.infradead.org;
	Wed, 18 Nov 2026 08:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=; b=Q60VeFwF6hQSwWMrQSYSvLiiuA
	Beh2UH1ivDYB5Vf3MyFaD0DufmJe0odeVKP4FcUH7QFqzXxtz8ZCdcUeQNibhOQ6sBP0RLbHM+Xrf
	/Nv133tqDbk7GqwrVWNNoEOgDLxhygtfDWzN41TGXLhgNxYamV/xdoNCeKVcShasK2XtPbQd3Bn/T
	DH3XxZdItcVntTYEsk2Gm74tOlOq3hFilW211cC2ajWkvyeDcHmlrw+zB79VIJ2YFbfZLPxLOTw1h
	VKGIMaQZQWEvi9Fd/mqBb0nG5lwkjE3Tsa6EqFXIafKDBbzuFQ+dlUUhWFJNaTe0T+awqstzUT3Fh
	NjyhD9wg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaqZ-0000000BJ0g-3qQx
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 08:16:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Ux9j1959809
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=; b=i37Fqcqr0WtKm1La
	dCTCT8Q8n9GLoaab3+q9uT7sbKLcrOEZiKgW5mGoBoPWE53ksCBnAK69W8bU5Ffr
	zik154VIWhmqetbNcC09qOrkMhOv+enxhywW0B4CLNbNeS4zAH3ZsILH/dFv/OqM
	vNi7jwugqr9VuLLr/oGInFgcswoHhixpoVkVeQIK7DSNNsS+LT19SFrZ2onZsA41
	pRY7UX+TE6NJbmahpIVzvkCboy12o/SYjitHGvSR545i08N0x4V0Jjoxp+69NrIY
	I5jGg62mE3/gHFepn08/5hU9Q3g7JtaE/VBLCzrMx73jdaQ9vHXklEIEcJEX5vXP
	3HpHRg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hyuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:16:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so619826a91.2
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 00:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989805; x=1795594605; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=klO4XnHJqw/YJPgEuUJLSktnxUvttIQR6dwVebAo8pmP5Bo3bANm8HwKYLcupETzye
         V0VYnbI9PIosvl5yrtczccbKoqAqfUxyQMH4bmYCTk6hD4l5ruucpT/4FFg7gBeM62uu
         JYH9c781CmzkRe1t2SrR3wVI3DH0606xYVFn+DC+tUdxbe6HjEc+JAIAD4gEK56swk3S
         3gQy/y959OELku+Ei6mfry3EhnluXTPmqq0Rxl0mPLiVkO91URyhW9VLUbJNtFuSFpSa
         rJLM15tuwyYc/hZCYbzsyvoTFzpqCbWuDqF4dGlAbe1PuyBfywyE7KGLFirB5lY761Qx
         ZPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989805; x=1795594605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=GsEJ7G6e5S9h4wQ0T9h08/Fkoh0ENkkjc5r7n2NcNPdqAb5PovOSOhbs2nXxLwj9Zc
         cyYHm1EMVGJpOJCMhvwrulvR+h/qukE7tcI4U5e6tf5NJdHvjIGsGD0NNLxGHLunj9x5
         3Vla44papBRIJZAFmjETct29ljoygJ8Cz5YRq7CX4YnHplWfACtH2YqTNXMYYKc4f3e4
         J9x0orMV5F9H9fphJxQ+xLBvfgOXyZV0K8OxLt6KF3zzy/DaJFo4YJ7/8yaAcPP7akwe
         DgTBk9Fh4AjRcuYf5YuELfTirCEVdRWWTI4ZIpfVZcqSdMqdLNhS8NHtwJaOXjQ1XSiP
         VFKA==
X-Forwarded-Encrypted: i=1; AL+hErHLhMlrxDZpGiPS1oHHziUL+N8pctY+N0rZzVXp7hBgT8FOHivy+mCBfATohrE/vSkDQyoDnLc=@lists.infradead.org
X-Gm-Message-State: APuU4Z+wWQ4uVd7cRMKnui+4UBkfiqus1XinjvWMAYWzFuNxdGNinsqA
	mm6sZstAEtHAtd5p8MuhcqO4KJuy/SJzTLT1v0D41d07/xTLOc67t9J/rDGqMLUCvJxRVvPJ1MO
	eg0LOSHoC6XcqioPlCPBYYXT0EDoJ70gVq5GEPPFF1tYgohNR57apmH16r6iU0J09fznvNM67
X-Gm-Gg: AZFdTZfMgma71wF/gISMB351CyUSQ8kzrnqgxEmf2h7P/ZTYs4QqUgQ4+oUGOT7JhR5
	KxsGiVDcqVhX7avtERwCNfW4HMQWpbrvHQZs3FThHbFrUVKRQFmgciUSe9vnY/3drhVs7UlEdWD
	DcaTZ+LMKnd6Bg1bWMAeEb5GbUlnnz9cBwQBlJe/ReSYi+eMhEjXSvfk16GGfFW7Fvg3CtL4yVI
	v/UmR+GeUBpP+tTmZbIoCOsJU+YvHC6zfmaPd1EqkiS8l1bPxONBTkRPTfE5+EIU9Kb4JEJz4if
	YjsipmuVyj5Zl25uPLCjQ4qtEOe4HOFzoEJFzBcSd20SS+PmikjIZsv8RKuliv2oz6WaCXQj4ma
	SmdYzFinAsOooVijIZbZi2RqxCPIxwq7HQ/Yf657wFUnPlJCFPt/WajfYgrCVaxgkTlUuu4fKOe
	joSvrIeFrvalzK5W/wuWZiJu4c3JJ7poBFU7UIdsm/Anshb1rbaX/ImjyVmzNLh+rTRu24pxuNE
	w==
X-Received: by 2002:a17:90b:1b12:b0:3b3:ab74:cc9b with SMTP id 98e67ed59e1d1-3b3d04dd0bdmr2115721a91.0.1794989804474;
        Wed, 18 Nov 2026 00:16:44 -0800 (PST)
X-Received: by 2002:a17:90b:1b12:b0:3b3:ab74:cc9b with SMTP id 98e67ed59e1d1-3b3d04dd0bdmr2115693a91.0.1794989803982;
        Wed, 18 Nov 2026 00:16:43 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:43 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:37 +0530
Subject: [PATCH ath-next v3 14/15] wifi: ath12k: add and hook Wi-Fi 8
 mac80211 ops skeleton for QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-14-9875d2a3953f@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd5eed cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qlncVs5R31ZIVvcfge8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: GigcKSnKcGHDB4bXZPCtoZ7PPca5rc-N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX6qE6w0gITPIv
 ju5H75og/O3jYuMboSOFBoGQ40iplj21n58O9TrPglZu9EmV8Z4qHSdGQqBneLhMUEeS8PImwad
 toj6ssZ0qLktbd+bpVPNyBC4UUNwabdJPnDa30FHbT1tu8VRCvmp2z74LZOkHjgqh0HJhswkn6W
 Ecbh3+zzhV1LGXZm93+uFmdulI8WXVMEfRO+Nr5nEpdsMA45ULYVN1ORVI2GvusHhFmmC+3Ntfe
 8vVmIqZ4qHWftDEc+nJiskYXnGBLHtQ6wiyrMiZ8dzZCVPPCIMfLYcpSMQ1RtMudRoA8T/CxmiS
 LAGSYpAUPLLg+ARsoWYG1wHFUV0s/4mmZxwOcBZ4Dinm3Nni/oE6MBWTUsTbuuZpQukw89pNqTL
 amoHzz2CS6bfh0TX1gcjrwJMSqL0aukfJxBLno7k4sreu9pVPCxwrwGMWQ+Z1QrqvHA9T+m/kRR
 aK6UJJHPH3mHrNw6ZmQ==
X-Proofpoint-GUID: GigcKSnKcGHDB4bXZPCtoZ7PPca5rc-N
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX1ffbHppkI59q
 B1oX8XDe7m4HjmNCmdvvlyJwMTYTRS6RjroKGlYjIG8aif9Xa7GduvQsD3lXDFJOfUMcXqWLSvA
 PyR9ss/tB43grTtF27mSfROLqZV20d0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_081652_836851_AB11E4AB 
X-CRM114-Status: GOOD (  12.72  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement an ieee80211_ops skeleton for QCN9575.

Add ath12k_ops_wifi8 in wifi8/hw.c as a dedicated Wi-Fi 8 ieee80211_ops
table. Introduce a stub Wi-Fi 8 TX callback (ath12k_wifi8_mac_op_tx) and
reuse existing common ath12k_mac_op_* callbacks for all remaining mac80211
operations. Hook ath12k_ops_wifi8 in ath12k_wifi8_hw_init() so Wi-Fi 8
devices use the dedicated ops instance. The stub TX callback is a
placeholder; a follow-up patch implements the QCN9575-specific TX path.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/hw.c | 70 ++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 92c897de16f4..30188f4fae02 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -10,8 +10,11 @@
 #include "../core.h"
 #include "../ce.h"
 #include "../debug.h"
+#include "../debugfs.h"
+#include "../debugfs_sta.h"
 #include "../hw.h"
 #include "../mhi.h"
+#include "../testmode.h"
 #include "ce.h"
 #include "hal.h"
 #include "hw.h"
@@ -152,6 +155,72 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	},
 };
 
+static void ath12k_wifi8_mac_op_tx(struct ieee80211_hw *hw,
+				   struct ieee80211_tx_control *control,
+				   struct sk_buff *skb)
+{
+	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+
+	__ath12k_warn(ah->dev, "wifi8: tx stub is a placeholder, dropping frame\n");
+	ieee80211_free_txskb(hw, skb);
+}
+
+static const struct ieee80211_ops ath12k_ops_wifi8 = {
+	.tx				= ath12k_wifi8_mac_op_tx,
+	.wake_tx_queue			= ieee80211_handle_wake_tx_queue,
+	.start				= ath12k_mac_op_start,
+	.stop				= ath12k_mac_op_stop,
+	.reconfig_complete		= ath12k_mac_op_reconfig_complete,
+	.add_interface			= ath12k_mac_op_add_interface,
+	.remove_interface		= ath12k_mac_op_remove_interface,
+	.update_vif_offload		= ath12k_mac_op_update_vif_offload,
+	.link_info_changed		= ath12k_mac_op_link_info_changed,
+	.vif_cfg_changed		= ath12k_mac_op_vif_cfg_changed,
+	.change_vif_links		= ath12k_mac_op_change_vif_links,
+	.configure_filter		= ath12k_mac_op_configure_filter,
+	.hw_scan			= ath12k_mac_op_hw_scan,
+	.cancel_hw_scan			= ath12k_mac_op_cancel_hw_scan,
+	.set_key			= ath12k_mac_op_set_key,
+	.set_rekey_data			= ath12k_mac_op_set_rekey_data,
+	.sta_state			= ath12k_mac_op_sta_state,
+	.sta_set_txpwr			= ath12k_mac_op_sta_set_txpwr,
+	.link_sta_rc_update		= ath12k_mac_op_link_sta_rc_update,
+	.conf_tx			= ath12k_mac_op_conf_tx,
+	.set_antenna			= ath12k_mac_op_set_antenna,
+	.get_antenna			= ath12k_mac_op_get_antenna,
+	.ampdu_action			= ath12k_mac_op_ampdu_action,
+	.add_chanctx			= ath12k_mac_op_add_chanctx,
+	.remove_chanctx			= ath12k_mac_op_remove_chanctx,
+	.change_chanctx			= ath12k_mac_op_change_chanctx,
+	.assign_vif_chanctx		= ath12k_mac_op_assign_vif_chanctx,
+	.unassign_vif_chanctx		= ath12k_mac_op_unassign_vif_chanctx,
+	.switch_vif_chanctx		= ath12k_mac_op_switch_vif_chanctx,
+	.get_txpower			= ath12k_mac_op_get_txpower,
+	.set_rts_threshold		= ath12k_mac_op_set_rts_threshold,
+	.set_frag_threshold		= ath12k_mac_op_set_frag_threshold,
+	.set_bitrate_mask		= ath12k_mac_op_set_bitrate_mask,
+	.get_survey			= ath12k_mac_op_get_survey,
+	.flush				= ath12k_mac_op_flush,
+	.sta_statistics			= ath12k_mac_op_sta_statistics,
+	.link_sta_statistics		= ath12k_mac_op_link_sta_statistics,
+	.remain_on_channel		= ath12k_mac_op_remain_on_channel,
+	.cancel_remain_on_channel	= ath12k_mac_op_cancel_remain_on_channel,
+	.change_sta_links		= ath12k_mac_op_change_sta_links,
+	.can_activate_links		= ath12k_mac_op_can_activate_links,
+#ifdef CONFIG_PM
+	.suspend			= ath12k_wow_op_suspend,
+	.resume				= ath12k_wow_op_resume,
+	.set_wakeup			= ath12k_wow_op_set_wakeup,
+#endif
+#ifdef CONFIG_ATH12K_DEBUGFS
+	.vif_add_debugfs		= ath12k_debugfs_op_vif_add,
+#endif
+	CFG80211_TESTMODE_CMD(ath12k_tm_cmd)
+#ifdef CONFIG_ATH12K_DEBUGFS
+	.link_sta_add_debugfs		= ath12k_debugfs_link_sta_op_add,
+#endif
+};
+
 int ath12k_wifi8_hw_init(struct ath12k_base *ab)
 {
 	const struct ath12k_hw_params *hw_params = NULL;
@@ -171,6 +240,7 @@ int ath12k_wifi8_hw_init(struct ath12k_base *ab)
 	}
 
 	ab->hw_params = hw_params;
+	ab->ath12k_ops = &ath12k_ops_wifi8;
 
 	ath12k_wifi8_hal_init(ab);
 

-- 
2.34.1


