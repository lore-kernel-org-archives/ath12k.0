Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421D8CD4846
	for <ath12k@archiver.kernel.org>; Tue, 12 May 2026 02:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bLWysuD+JTHP8GAppUvWBnsTI/f5K974IU5qM6OkPC8=; b=gowLcT1nDXDk6if3MsCzJ/QgRd
	mQgi631qkHMBmV9hkDfU20DybS9D6BnSYQFC4zfVlBRJx5eAly6/zlrSCbUbHPQP9qwE6NikzZujc
	kjdrXrhB7R9uwI7cRHmbo/p8Rf+ZtvfdMLxJx36TiQfzyvCOyLsc2gQQ6xXDikqyY/+Dg0FBp6P+M
	YT7Gp68pDkFmPGSuyTPq6y2rSsSOZvp3RBjjHCWIfD78NJ/JTXCXDKzfIjNrh27J8zGtOecRXMgFP
	8phQO8kGAtCRCazhG7dvWUtg3SsVHnThTbI9fHm+Vney1tA9WKqfFzTWMBlDwzGUkIgo3kRj5HFDz
	c2FbDN+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdJV-0000000FJiD-4Bxa;
	Tue, 12 May 2026 02:57:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdJT-0000000FJhW-0ymJ
	for ath12k@lists.infradead.org;
	Tue, 12 May 2026 02:57:40 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK70M72804455
	for <ath12k@lists.infradead.org>; Tue, 12 May 2026 02:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bLWysuD+JTHP8GAppUvWBnsTI/f5K974IU5
	qM6OkPC8=; b=Cu3K0mSNc9zf5yQ4xBmZQXC4mHoKof9GSH/MSyJ6eJBT2SdFTWJ
	FdY5QjANGRLh4WSttJgCcDcbKoNXQ8f5twfBZD8gzXRyVn48ZpPzj+bzJh/dN5z6
	fvMUt9x0Immb04l6pk1oU4jb/oo2U/dbdXIMcZub4/4KSdZAs6Jx5ZL5OucPAOBI
	8qlpWNUKoKyxwfPK9KQdzY+guy2nFUx14KRWLgqpzhoFd1v9XW4GgC3oFEwE7sxD
	CgBASlkpaqqJ6p3IoYitkO4xZYDyPuu+RTH7xFI56mLbRUKdMxJkwZNFATc8xSgh
	s8A5ZD/BqRuQNFkmIu7Y5YvigTqjwBGE7mQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv396mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 12 May 2026 02:57:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9a6d84522so95768085ad.2
        for <ath12k@lists.infradead.org>; Mon, 11 May 2026 19:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778554657; x=1779159457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bLWysuD+JTHP8GAppUvWBnsTI/f5K974IU5qM6OkPC8=;
        b=PlhmTFeCJ4Aba8jvxOZcmstgWzeyW5epjWjAFeux30F2bh4BNywZLZDu7WTQO008u3
         w0rAAaxiJ3DoDOFOfW9QRH1CzaOfuW+4pWiB2vT3+LVsGGCU5/N+c5rhchn05aoPvwT9
         NQ4e/WV/f+6Oa+TLJtdy1Sxiqoh8ZWjcXjTfV7ZykrQTfIVgfyIxRy3W1sx9d4a9qp2C
         tQzOFiJ2ln3w1+Bhscru1IiJjimSnwDjwVdihd1uleE4XW+4KMYSIsdctuUrE4moW/6W
         G1nqeYS3ohn42hbI1Z8SMgpWXvC504O7cWt1JISbWNVoNEcmbo846K9OdPSDsy9fYoki
         UOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778554657; x=1779159457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLWysuD+JTHP8GAppUvWBnsTI/f5K974IU5qM6OkPC8=;
        b=SCMUXo9EI5oBKkwmmM8SKrTLK6ZGQFdTBTw6YcJ94QzyWpD2H4VSCA5066V6IUdRma
         fkSrxYtznBHibHC/FYims62pu5G8eh0qvVNl9V3XS3BTW/FP2WDlfoTrQoQV/DMmiDkS
         H4ig4g5u0OM73pllfr32mpl/3WVF/YPBSAaVmzFgeJg+ohFUI5W/na376VBOALQaSDHv
         ToAre+oRvvWM1kW8znfyyJEFoP7EpNy4nTgEqbqBhNMsUZl88FwPL6JP183rfSvoyCYd
         JoE8tsuI7VaabltscuXY2YEzU6ZWmB0jSt423vY58/9tr5xgIv53tRdh8GnWDIBvRsOF
         1l2A==
X-Gm-Message-State: AOJu0YyC9GuV1dhHoa1ncTm2VwzcM5DhfE3OiKVKZQD+L8W9rpD9q2Ds
	lxyjY8RbapNbhI3drqUeV6W90+Ci7V6tAmvMAvvAmJz/iV4rSdv+IkoSChYOdOz8diU7DMBz/WO
	SyXDh1ih4ZJZgB5hXcj5ZHKpeEJ0o6OawZMNxZhLXyuZRVu49VDdu9TuBLeGQPfpz
X-Gm-Gg: Acq92OFPL2SHvcP2nILLrh0sCk3yHHpOnuUjmSzj+z4yqnTC3ZV3NU7Fgr76FxxCVEp
	UiQ6XcVchX5LbggeTenSj9TwLiplbSMnGYtsDIQ1F9yRFgvWstv+LDNLKWbZLBragielJ7kAy7y
	y1VddWWCkg5V25n0G0LKz0rkS7SuxzJ/qqlav15VB1V2Kv8IZyrmys/zBOF1Nunc59snc24BK5O
	cgShjxLgE6EFW1Hc2j3yYcgC6fXNQnc1dh+nqHs/a4bi8gTLB1r7blgq/EYG5X85b7Co6RS8J5w
	ro+9j+Z8xeV1vl5fibY8HzWrufBcftVq+FScCN4FqYS/mD125djckIGT/UvXIbtttvqlo+iThFZ
	g/s6gHt8Ai4f8c7FvOI3fb421xkXLgayMSf1f9Lt1nulzww2BDmU4rtflTCtAcQN6NYrxVqTFXW
	HC8T/HuAFcXQ==
X-Received: by 2002:a17:903:988:b0:2b2:6b58:9317 with SMTP id d9443c01a7336-2bc7ac6a996mr138787995ad.39.1778554656976;
        Mon, 11 May 2026 19:57:36 -0700 (PDT)
X-Received: by 2002:a17:903:988:b0:2b2:6b58:9317 with SMTP id d9443c01a7336-2bc7ac6a996mr138787555ad.39.1778554656454;
        Mon, 11 May 2026 19:57:36 -0700 (PDT)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e3571dsm116711225ad.42.2026.05.11.19.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 19:57:36 -0700 (PDT)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath12k: allow peer_id 0 in dp peer lookup
Date: Tue, 12 May 2026 10:57:32 +0800
Message-Id: <20260512025732.1297849-1-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAyNSBTYWx0ZWRfX07yXN2o82N+W
 PIrKUK433Z10VUVWLiSq/Tll86gLU+HG0KK0FaM+iufrNz24V8AUo/oUQhGIjUKodHkNLIWcnat
 pIGdK3hz0Qj2mUCLP0twWlvpcknuomd/yE5WFBc3nGYlp0KPkrAgoyOQaIwTizoH0yjrDeJUTp3
 KDumzibFXJ7i1A4EiBNA6IwXURrhF7nnWFMAnKgvjrU7IJ9Ek8Imsu4QBv8qI3Zn6AQfl86YqYw
 4yiPHXkgPmfM1ecVvNuBQu+bznE/F9U1RfeFeQpPi0OKu1Iur3KyOrjmDQoymaAOdLpEi8Yw47n
 XJNm5W0sXlaqP7EFfNGnIAeGLIjWbg4B6rouJGJ2njCW+X0/byZtXUda1Iyf1HcU5ehHIFJ6bG7
 7VGxBqaHnx/UA+GnNUTRTh8mCsXyQ2ePWxMPcF0fD6q+k1uxL2UwxuM1q67DyQ/OGf/93XWEYmA
 WrNiO2YtPXjsfdlUNpg==
X-Authority-Analysis: v=2.4 cv=Kvp9H2WN c=1 sm=1 tr=0 ts=6a029722 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=657lBeYTMEBjGhVbk1cA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: rhV-JMyg22ij5rj8sFY3SzZuaU0UrAS8
X-Proofpoint-GUID: rhV-JMyg22ij5rj8sFY3SzZuaU0UrAS8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_195739_400995_9179A288 
X-CRM114-Status: GOOD (  14.14  )
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

For some chipsets, firmware can report HTT_T2H_MSG_TYPE_PEER_MAP2 with
peer_id 0 as a valid value for mapping ath12k_dp_link_peer to
ath12k_dp_peer.

ath12k_dp_peer_find_by_peerid() currently treats peer_id 0 as invalid.
When firmware assigns peer_id 0, peer lookup fails. As a result,
DHCP OFFER packets are dropped in __ieee80211_rx_handle_packet()
because pubsta is NULL.

ath12k_dp_rx_deliver_msdu() <- rx_info->peer_id 0
  ath12k_dp_peer_find_by_peerid -> peer NULL
  ieee80211_rx_napi <- pubsta NULL
    ieee80211_rx_list
      __ieee80211_rx_handle_packet <- pubsta NULL, skb undelivered

The following error in the TX completion path is caused by the same issue:

ath12k_wifi7_pci 0000:04:00.0: dp_tx: failed to find the peer with peer_id 0

The error message is triggered by:
ath12k_wifi7_dp_tx_complete_msdu
  ath12k_dp_link_peer_find_by_peerid <- ts->peer_id 0
    ath12k_dp_peer_find_by_peerid -> peer NULL

ath12k_dp_tx_htt_tx_complete_buf
  ath12k_dp_link_peer_find_by_peerid <- peer_id 0
    ath12k_dp_peer_find_by_peerid -> peer NULL

Fix this by allowing peer_id 0 in ath12k_dp_peer_find_by_peerid() and
rejecting only values >= ATH12K_DP_PEER_ID_INVALID.

Also update peer_id 0 handling in monitor path:
Always call ath12k_dp_link_peer_find_by_peerid() in
ath12k_dp_rx_h_find_link_peer() to fetch the peer, including when
peer_id is 0.
Always store peer_id in ppdu_info->peer_id in
ath12k_wifi7_dp_mon_rx_parse_status_tlv(), including peer_id 0.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_peer.c      | 2 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c        | 3 +--
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c | 3 +--
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index a1100782d45e..47d009a0d61f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -419,7 +419,7 @@ struct ath12k_dp_peer *ath12k_dp_peer_find_by_peerid(struct ath12k_pdev_dp *dp_p
 	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
 			 "ath12k dp peer find by peerid index called without rcu lock");
 
-	if (!peer_id || peer_id >= ATH12K_DP_PEER_ID_INVALID)
+	if (peer_id >= ATH12K_DP_PEER_ID_INVALID)
 		return NULL;
 
 	index = ath12k_dp_peer_get_peerid_index(dp, peer_id);
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index cae00e0539df..bc7889826e50 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1194,8 +1194,7 @@ ath12k_dp_rx_h_find_link_peer(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *ms
 
 	lockdep_assert_held(&dp->dp_lock);
 
-	if (rxcb->peer_id)
-		peer = ath12k_dp_link_peer_find_by_peerid(dp_pdev, rxcb->peer_id);
+	peer = ath12k_dp_link_peer_find_by_peerid(dp_pdev, rxcb->peer_id);
 
 	if (peer)
 		return peer;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
index 77f5d23be78d..7dd4a49d64d5 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
@@ -1779,8 +1779,7 @@ ath12k_wifi7_dp_mon_rx_parse_status_tlv(struct ath12k_pdev_dp *dp_pdev,
 
 		info[1] = __le32_to_cpu(mpdu_start->info1);
 		peer_id = u32_get_bits(info[1], HAL_RX_MPDU_START_INFO1_PEERID);
-		if (peer_id)
-			ppdu_info->peer_id = peer_id;
+		ppdu_info->peer_id = peer_id;
 
 		ppdu_info->mpdu_len += u32_get_bits(info[1],
 						    HAL_RX_MPDU_START_INFO2_MPDU_LEN);

base-commit: e12d2d3983acb150fd987d19ec6a2a530da110df
-- 
2.25.1


