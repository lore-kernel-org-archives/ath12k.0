Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB33C44501
	for <ath12k@archiver.kernel.org>; Thu, 16 Jul 2026 01:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qa1jVvwlc7r54xvKrbPUREgWGYwQxqIPvdAwkkBI+/w=; b=kSC0Fr4Qh/vKuDYXHoQ0/0kT5h
	fKqbuhhrooXeSV3OlUTfT9p+zy2fAdtT4INxPD/Zd2wNUX0oVPw/bA3GsSGXwdI/QPv8wOx0+gBfI
	Y9uopEP7LB5qy/ppmNOmK6xyViB1h89ox6a3yBc3YA61ABIOPHpWi8gN+IM8RFdviRQrxtgT8wLeq
	TnovrkJJ5veUnmxaKLMl6z0S1WkzXZu+nsLSwd5QHyKdpJPgt9JuRp/uxILCyXr6Uh21YaIC3Ft91
	W46ZGKJZ82hVvPkUisadvP1vVdYM2NHJiAOKmnE7kCMEloxt9eHAbf46zTU/niOBbLt6s3C2EDFAK
	+lXtQZgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkBEM-0000000GDkB-1IY9;
	Thu, 16 Jul 2026 01:49:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkBEJ-0000000GDjL-1Huc
	for ath12k@lists.infradead.org;
	Thu, 16 Jul 2026 01:49:40 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G0XoO81226913
	for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 01:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qa1jVvwlc7r54xvKrbPUREgW
	GYwQxqIPvdAwkkBI+/w=; b=bwFLpkhDGO0sp66+VGtYuwpMm1DkFrtzvaZd9Mqv
	xCugxOxtySxzLl3g98ke0kbwal8P9/Kcz3HcKHD98TVw0FSO28926z4atwlDAilQ
	dhPy8ZdrB35lf9QMQ5TOg9wkCWZP0eLKpms+OlzFnJH7wvtghwAEvh5W6kkbckv2
	BYwpThJ22ufruy42bTqwpIkWhUD2IlFKSVu3M/oRCDvY1mzfRr9g7Ts1nt8sSuGZ
	OcUdfDomZNKcsjgNPg7vIyug1WALPYZ3GXx5HI6Lu+CQgkAOSMM5CzT9HsmA88kq
	WzMZ2GuYqjSILovfAD44a4MSbRaxLyvetIMw1soDcRXXYQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feeg1hgd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 01:49:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-387087245e4so1811522a91.0
        for <ath12k@lists.infradead.org>; Wed, 15 Jul 2026 18:49:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784166570; cv=none;
        d=google.com; s=arc-20260327;
        b=O2m/ahoQveJH4r1GLIcgi9axL5M9j5Z0dHdkibuDPeSaKsIW57ykddJBp6p/jMaL4E
         /1xg+WOikOcUyaTtXhTU6doNP94grohbPoesuOQYqIAI8LPuIShz5JUCTsawR09s56Vx
         zwA7kSm8gYy7HiBr2pyEhPziF8Y+De7QJBIEjMwlhi/Ql+tYzRN0obtfd7k6/h+VGZGm
         VS4HD8rXLqoDXeJ0U011AxzrakQ6ErDFy3kdizVIiPRVwS5HnVUOq1sgSoJxmuutJLqs
         dy8SIpvMWCwdFJpiVtw1cYpq1HthAn6BqbcgmPFIiSifQrMVu5W2bbtJN7MOhleP7qd4
         apnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qa1jVvwlc7r54xvKrbPUREgWGYwQxqIPvdAwkkBI+/w=;
        fh=BvlbWxMg6uhYwJesGCBeCCd/ka6hgHu1P1CEL/r6fbU=;
        b=RRzEyaMCzkMjI5Yuqu+oNe8qwMqLAd7XCyS7Q4UNN5ejsGS3pEH25rTF5cRk7NTFxL
         d1Bi4RZk345TPy2MJwsLLt31MgK55GTxSsbBUjjVqbxRftFhB1+mcwCnEuguSr4eWRVn
         twX7Ebur2bzAw8bQZiUimuLz+EHSL5eHiwjJ3cQL3+3BCUEJF9uESGEHRyHelrVX6YXk
         bMNpRs9/4HdUB9PuP/aYTJXxAE3TXEPWNZDWSWQn24DOaAdZbb36qOUofFMc9fY3CbcT
         0z0bxQ/HevUf2nOfNVIJuJ5wDxTS0KaNk7ftglbY4iob04N+RISHf/0eM9TKSqxR8rPY
         cScQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784166570; x=1784771370; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qa1jVvwlc7r54xvKrbPUREgWGYwQxqIPvdAwkkBI+/w=;
        b=Yyx4Aycy8AslBUMc2kmOhmy1updkEWfLiiNGMKEms8lXorgbdYEIsqttwaOFzbOYuG
         E93hl8j2nhmjt1zh3qOyeiBGZRbZKY07GAfQ6S60wtgoaXaRpJMg6lZoUfZmAqrDDyAt
         XpfnUSNt8px7FWve/Gvvtez9HP4hz5b1j4FcfCAp7sLhCUqGoXZmtSUOVgJxghHp79F3
         J81+ffqAvF191dZOTIBOjQ4dc/JG8E3jr8wq9h+6NwZtYQIwStWpTC9njQRwGcyjJyjs
         2JZvok3Gva8upNBxR+NyXtUSKtK40TDRgB0MjirkemYgO+rDa/8i8z+p8REOvlUkC4iZ
         aDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784166570; x=1784771370;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qa1jVvwlc7r54xvKrbPUREgWGYwQxqIPvdAwkkBI+/w=;
        b=RWZCEiYqcK8nHAu8kOPPLFJljXTw15Vm9KkccJBbC0wtNRv9tmjFS1kXp3exFmFFuw
         LmCLeK+kcYJ6P2t7Nb6RtqsldwDoXOglRdNnQZ6Hnz+ykP+YBt0tfNZ7JqzNWUW6Z607
         FF+K5YyLz9jT87LQl0lRDkRNnyd7nkZKd0dVDQhdbKyhasy3k4iBEVa1xpAGYwNFUDIa
         jVR8ncyH/6StgeAJZbGZfCPuTdA0OuJHRMHCzkiJXL4PKa+NNS4F9BZfWsCCpwZZOb/r
         CdpI+GuWXNv45Jkdtqzac6uzIV8oaCKlmG7o40CdJhUEQQLLxwRzCbq5NActB/Xka/1G
         bB0A==
X-Forwarded-Encrypted: i=1; AHgh+RrwI3UGX31usVZiEQb7oDNL2nsH2rosNCaJ08Wrxl4Rio0VLpza2TkXWn2QDEj7lBR7wIRmnJI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwk56AU/DuxKJPmihZLaNMfxyKrACYdqre3WT5Iudj8iaJYwX9
	muNe4GqfHvWalP9keTbfFiYgob1LRMj+GpkavL9NFfAlDDav1i5jhG26LIKGu+yoTWq9pm+mwAY
	BKqM8iMLueqrQW8IPZrvKejBpvv+9+ZtvyKJudjmhokqgBgbyH0vZqY00OumQO0CaLq6W8+NeU3
	Tvr76qezTZnh4dznWp0nhGaZ5w9V5xq/GJE2S/h4Tdmegri7w=
X-Gm-Gg: AfdE7cnIdR9dNqbP0OL716FNGLOnEToG//EGnmvlxip+TljAuTNClivzAuqAbqgNCeX
	JjPnCvQpM+ijEJQ40Ddfd6dG2ETfcKpOppS3fhVqhqLBrF1ZVyHLOEkN0n5l6NaNxcGElqip3j1
	yRDMKcqj2VHkJMj49CzhNOtvWbzXix53++3fkqVEPHJ8VEGQLptO6y1ahtjTBNRUb49DHNpFtRe
	dLL8DA8exIXCEIHFTs=
X-Received: by 2002:a17:90b:3bd0:b0:36b:9323:c726 with SMTP id 98e67ed59e1d1-38dc77ec3f6mr13642869a91.4.1784166569610;
        Wed, 15 Jul 2026 18:49:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3bd0:b0:36b:9323:c726 with SMTP id
 98e67ed59e1d1-38dc77ec3f6mr13642848a91.4.1784166569134; Wed, 15 Jul 2026
 18:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260715125017.277242-1-jtornosm@redhat.com> <20260715125017.277242-3-jtornosm@redhat.com>
In-Reply-To: <20260715125017.277242-3-jtornosm@redhat.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 07:19:17 +0530
X-Gm-Features: AUfX_mzcv6sf1IfdrSAmX-JluVOmlIR9QE6B2uqgl3rt1pJlfmU8M8nrlTnuAAg
Message-ID: <CABkEBKbcQYvMMRUmVgv+GyG8eNiot0acJ13Xy2236zqqr2cnXw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] wifi: ath11k: implement custom wake_tx_queue with
 flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAxNSBTYWx0ZWRfX2dLYbqE8Z8cP
 U0WdbgZ/+daCZncv4VdyUqgQvLdkY/fsx9E35TvXs8R/5dPKK34jNtBXC2iFOW5xeGPRCvJbbmr
 GCjoxgGz1cKLYVIC81NnjWuaB2JiQPE9PM4FzgrKNaM2arKViQpAmDSLx3u3ZKdlr/jItAO8RfM
 uPSsx820E5jymv3k7PM5AnQ8nNEvfeNaTT+XCoMvS5B31hZYElPCTNk3TD/L9syQdGRzAgslGTV
 16MMN2BEwlZzYGy8f/2Df33BxIns5K9IZuB0KGZ7lgPS3QBZYH31RMM7cQoV81HgI6TnOSD82UP
 9NIzdh3feng4/aRtWJdiyYQrh9RL5Qil7lxxGTwHJuGHaeRQWfJvzza53ZVvkLTbU+0Jwz54n6M
 vdt31Oq1kCXqa3bESY6j1uHWtDYXy1lT7DIOX+JTjoT3CslInhgZKrbzx8CQdbRFpoyt59sDDpm
 Wfbiu0O4pBKRqX/wJDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAxNSBTYWx0ZWRfX6H/qE+NLicl5
 Oa9eF2K8yDEhbDfWWVuhZtI/Y7+zOlN2sqaLJNMKfP8sHTkm0Bnhw07e8VqW7gbMIyWOSuUrSfI
 NzMP+QE8CESCOcVugBqV/Xio+Hz9kOE=
X-Proofpoint-GUID: u_2X3dYzYVc_Eo3eiHX6w8oULMRbu3zv
X-Proofpoint-ORIG-GUID: u_2X3dYzYVc_Eo3eiHX6w8oULMRbu3zv
X-Authority-Analysis: v=2.4 cv=SsOgLvO0 c=1 sm=1 tr=0 ts=6a5838af cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=1RTVyt60vU6GMwtd-eQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_184939_459115_46CBCEE8 
X-CRM114-Status: GOOD (  23.78  )
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

....
>
>  drivers/net/wireless/ath/ath11k/dp.c  |  1 +
>  drivers/net/wireless/ath/ath11k/dp.h  |  2 +
>  drivers/net/wireless/ath/ath11k/mac.c | 60 ++++++++++++++++++++++++++-
>  3 files changed, 62 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
> index f389b97acbdd..2e5978ec2b05 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.c
> +++ b/drivers/net/wireless/ath/ath11k/dp.c
> @@ -1087,6 +1087,7 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
>         for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
>                 idr_init(&dp->tx_ring[i].txbuf_idr);
>                 spin_lock_init(&dp->tx_ring[i].tx_idr_lock);
> +               spin_lock_init(&dp->tx_ring[i].wake_tx_lock);
>                 dp->tx_ring[i].tcl_data_ring_id = i;
>
>                 dp->tx_ring[i].tx_status_head = 0;
> diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
> index 84f66839f0c6..6d99501aa269 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.h
> +++ b/drivers/net/wireless/ath/ath11k/dp.h
> @@ -87,6 +87,8 @@ struct dp_tx_ring {
>         struct idr txbuf_idr;
>         /* Protects txbuf_idr and num_pending */
>         spinlock_t tx_idr_lock;
> +       /* Serializes wake_tx_queue operations for this ring */
> +       spinlock_t wake_tx_lock;
>         struct hal_wbm_release_ring *tx_status;
>         int tx_status_head;
>         int tx_status_tail;
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 2d55cdc4d165..046cefd53178 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -10065,9 +10065,67 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
>         return ret;
>  }
>
> +static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
> +                                       struct ieee80211_txq *txq)
> +{
> +       struct ieee80211_tx_control control = {
> +               .sta = txq->sta,
> +       };
> +       const struct sk_buff *peek_skb;
> +       struct ath11k *ar = hw->priv;
> +       struct dp_tx_ring *tx_ring;
> +       struct hal_srng *tcl_ring;
> +       struct sk_buff *skb;
> +       u32 ring_selector;
> +       int num_free;
> +       u8 ring_id;
> +
> +       if (!ar)
> +               return;
> +
> +       while (1) {
> +               if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH,
> +                                     &ar->ab->dev_flags)))
> +                       break;
> +
> +               peek_skb = ieee80211_tx_peek(hw, txq);

in ieee80211_tx_peek() acquires fq->lock, peeks at the skb, releases
the lock, then returns the pointer.
Between spin_unlock_bh(&fq->lock) and using the pointer for
ring_selector. The same skb can also be returned for
the another CPU which calls this function. This may cause use after a
free scenario.

> +               if (!peek_skb)
> +                       break;
> +
> +               ring_selector = ar->ab->hw_params.hw_ops->get_ring_selector(
> +                                       (struct sk_buff *)peek_skb);
> +               ring_id = ring_selector %
> +                         ar->ab->hw_params.hal_params->num_tx_rings;
> +
> +               tx_ring = &ar->ab->dp.tx_ring[ring_id];
> +               tcl_ring = &ar->ab->hal.srng_list[tx_ring->tcl_data_ring.ring_id];
> +
> +               spin_lock_bh(&tx_ring->wake_tx_lock);
> +
> +               spin_lock(&tcl_ring->lock);
> +               num_free = ath11k_hal_srng_src_num_free(ar->ab, tcl_ring, true);
> +               spin_unlock(&tcl_ring->lock);
> +
> +               if (num_free == 0) {
> +                       spin_unlock_bh(&tx_ring->wake_tx_lock);
> +                       break;
> +               }
> +
> +               skb = ieee80211_tx_dequeue(hw, txq);
> +               if (!skb) {
> +                       spin_unlock_bh(&tx_ring->wake_tx_lock);
> +                       break;
> +               }
> +
> +               ath11k_mac_op_tx(hw, &control, skb);
> +
> +               spin_unlock_bh(&tx_ring->wake_tx_lock);
> +       }
> +}
> +
>  static const struct ieee80211_ops ath11k_ops = {
>         .tx                             = ath11k_mac_op_tx,
> -       .wake_tx_queue                  = ieee80211_handle_wake_tx_queue,
> +       .wake_tx_queue                  = ath11k_mac_op_wake_tx_queue,
>         .start                          = ath11k_mac_op_start,
>         .stop                           = ath11k_mac_op_stop,
>         .reconfig_complete              = ath11k_mac_op_reconfig_complete,
> --
> 2.54.0
>
>


-- 
- Tamizh.

