Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6D4C636CC
	for <ath12k@archiver.kernel.org>; Thu, 16 Feb 2023 09:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h4+9RPISFYcHytfypJSnRnk6HxO6SwvP+MxYHFgon2Q=; b=M37PXmPNL3cVsW
	qrLcA2yGH8LkB0nVL9uLuwsI0YX0VA33ZvQcGzNJMNh7PqHMo5LPTtuxdFlH66ckB0aI+I1v1r8bP
	qscDCxulM2L7jJurcej1cKBXtDDdQwmWtZ+ZWh94bmL5ffvlPPQ2r1Q1cgFape3WPnOqJmdKx6lyQ
	97IesmarPFHcCaUZPbG3sNQzxYm90J1N8FkwSTLvaZQw1LcDRPvzw7H4ljMd14yYZSEQUtSRp6HWD
	XGGmkAfZnN1FrB93SPcDQQZQCAU9zjOw7U3+P4IDzg9UV4mAUrM6y6vUlsoX3e1ynw4PXOj8+t2pn
	PB63EJ1eCtmO5IZvw+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSb18-009Pz6-PB
	for ath12k@archiver.kernel.org; Thu, 16 Feb 2023 09:57:30 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSb14-009Pv3-5x
	for ath12k@lists.infradead.org; Thu, 16 Feb 2023 09:57:27 +0000
Received: by mail-ej1-x62b.google.com with SMTP id mc25so3717631ejb.13
        for <ath12k@lists.infradead.org>; Thu, 16 Feb 2023 01:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fz2oGvM8i41Dv7hw1tN4UNzul1huldJ7Myijqf/euac=;
        b=JEFc/BiEBbcTWyNiVA6TNG9dUByMnEGv92rkt3KNiLAvjIH2WO1c7/wBwIsZBaRt88
         63bSFW+K48GGehJw0eMjrX78VV+Vd99hDs5CEGDBA9jnVd+Lsqo5rZkbrmaGbuJpNTzU
         nQOwL0v7C1h/0N3/kqGXvyemEC6VJ+XIP8VFyKjm7/R/Rs+7d/M0DxeafEM4DAaW8Rkt
         K8zQqHFPRsnBC1vic7KDCikPGqey7Ku11J/F9EZ4wg3Fvk16K4nWy4L/pz1Vv0DYdqc+
         Jf4wPw4a/k+dponl67Cc/COydWIHBRrRrUtscy4WzhwbfgzmJrifqpk14ujVRsFO8uZX
         /KDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fz2oGvM8i41Dv7hw1tN4UNzul1huldJ7Myijqf/euac=;
        b=3Jk2nr21pbyAGEFAG2rgrleliVdZjlP7o25fiSmxe8RsSNkblrKGYunmGIgWa2dDl0
         4mVvUknwkwMtw5t8DFG5GyD0EQ/ii+xGMNKl7yhmQI1Nov2Zi0gcoaypdH3iSC7kdTf3
         cRxWzZivD3dw0p5GHOWxKApe68u8i7Vl9bXztaaKh3oi+0H4aHWOCEC6X6OZT10YMEHa
         lddMvpJrMiWO0IlADCXZ63QmZrfgigdRb9FpFMJp6EQRcvU09UBwanMOwZDPSVTONrsm
         zH7PngFOL2szs4wiUOEManpX40kxA262jk2DbMQXschg7EZGda6ZQyi7LnsBpzl53h9N
         D+Bg==
X-Gm-Message-State: AO0yUKXWdL1nE9MKxk1u7F5OKHESbk83V+Ky+a1WbkVmGIck9doseaqU
	GOsUo2sbomb4a2M0+GAfVYBRdSBFVH0=
X-Google-Smtp-Source: AK7set+2R0bTy0igOLoz1o5HGe+KPnNj1dFjt3Yol0KHOkorf5dwqgZ+9ErGdqK9+4yRt1RKs3GGzQ==
X-Received: by 2002:a17:907:2c65:b0:883:b1b4:e798 with SMTP id ib5-20020a1709072c6500b00883b1b4e798mr4894208ejc.10.1676541439181;
        Thu, 16 Feb 2023 01:57:19 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u19-20020a170906c41300b008b1350e815csm592261ejz.84.2023.02.16.01.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:57:18 -0800 (PST)
Date: Thu, 16 Feb 2023 12:57:03 +0300
From: Dan Carpenter <error27@gmail.com>
To: quic_kvalo@quicinc.com
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices
Message-ID: <Y+3971ZN/61V8gLb@kili>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_015726_280863_C43A29F3 
X-CRM114-Status: UNSURE (   8.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hello Kalle Valo,

The patch d889913205cf: "wifi: ath12k: driver for Qualcomm Wi-Fi 7
devices" from Nov 28, 2022, leads to the following Smatch static
checker warning:

drivers/net/wireless/ath/ath12k/dp_rx.c:3254 ath12k_dp_rx_frag_h_mpdu() warn: missing error code here? 'ath12k_peer_find_by_id()' failed. 'ret' = '0'
drivers/net/wireless/ath/ath12k/dp_rx.c:3260 ath12k_dp_rx_frag_h_mpdu() warn: missing error code here? 'ath12k_dp_rx_h_defrag()' failed. 'ret' = '0'
drivers/net/wireless/ath/ath12k/dp_rx.c:3266 ath12k_dp_rx_frag_h_mpdu() warn: missing error code here? 'ath12k_dp_rx_h_defrag_reo_reinject()' failed. 'ret' = '0'

drivers/net/wireless/ath/ath12k/dp_rx.c
    3161 static int ath12k_dp_rx_frag_h_mpdu(struct ath12k *ar,
    3162                                     struct sk_buff *msdu,
    3163                                     struct hal_reo_dest_ring *ring_desc)
    3164 {
    3165         struct ath12k_base *ab = ar->ab;
    3166         struct hal_rx_desc *rx_desc;
    3167         struct ath12k_peer *peer;
    3168         struct ath12k_dp_rx_tid *rx_tid;
    3169         struct sk_buff *defrag_skb = NULL;
    3170         u32 peer_id;
    3171         u16 seqno, frag_no;
    3172         u8 tid;
    3173         int ret = 0;
    3174         bool more_frags;
    3175 
    3176         rx_desc = (struct hal_rx_desc *)msdu->data;
    3177         peer_id = ath12k_dp_rx_h_peer_id(ab, rx_desc);
    3178         tid = ath12k_dp_rx_h_tid(ab, rx_desc);
    3179         seqno = ath12k_dp_rx_h_seq_no(ab, rx_desc);
    3180         frag_no = ath12k_dp_rx_h_frag_no(ab, msdu);
    3181         more_frags = ath12k_dp_rx_h_more_frags(ab, msdu);
    3182 
    3183         if (!ath12k_dp_rx_h_seq_ctrl_valid(ab, rx_desc) ||
    3184             !ath12k_dp_rx_h_fc_valid(ab, rx_desc) ||
    3185             tid > IEEE80211_NUM_TIDS)
    3186                 return -EINVAL;
    3187 
    3188         /* received unfragmented packet in reo
    3189          * exception ring, this shouldn't happen
    3190          * as these packets typically come from
    3191          * reo2sw srngs.
    3192          */
    3193         if (WARN_ON_ONCE(!frag_no && !more_frags))
    3194                 return -EINVAL;
    3195 
    3196         spin_lock_bh(&ab->base_lock);
    3197         peer = ath12k_peer_find_by_id(ab, peer_id);
    3198         if (!peer) {
    3199                 ath12k_warn(ab, "failed to find the peer to de-fragment received fragment peer_id %d\n",
    3200                             peer_id);
    3201                 ret = -ENOENT;
    3202                 goto out_unlock;
    3203         }
    3204         rx_tid = &peer->rx_tid[tid];
    3205 
    3206         if ((!skb_queue_empty(&rx_tid->rx_frags) && seqno != rx_tid->cur_sn) ||
    3207             skb_queue_empty(&rx_tid->rx_frags)) {
    3208                 /* Flush stored fragments and start a new sequence */
    3209                 ath12k_dp_rx_frags_cleanup(rx_tid, true);
    3210                 rx_tid->cur_sn = seqno;
    3211         }
    3212 
    3213         if (rx_tid->rx_frag_bitmap & BIT(frag_no)) {
    3214                 /* Fragment already present */
    3215                 ret = -EINVAL;
    3216                 goto out_unlock;
    3217         }
    3218 
    3219         if (frag_no > __fls(rx_tid->rx_frag_bitmap))
    3220                 __skb_queue_tail(&rx_tid->rx_frags, msdu);
    3221         else
    3222                 ath12k_dp_rx_h_sort_frags(ab, &rx_tid->rx_frags, msdu);
    3223 
    3224         rx_tid->rx_frag_bitmap |= BIT(frag_no);
    3225         if (!more_frags)
    3226                 rx_tid->last_frag_no = frag_no;
    3227 
    3228         if (frag_no == 0) {
    3229                 rx_tid->dst_ring_desc = kmemdup(ring_desc,
    3230                                                 sizeof(*rx_tid->dst_ring_desc),
    3231                                                 GFP_ATOMIC);
    3232                 if (!rx_tid->dst_ring_desc) {
    3233                         ret = -ENOMEM;
    3234                         goto out_unlock;
    3235                 }
    3236         } else {
    3237                 ath12k_dp_rx_link_desc_return(ab, ring_desc,
    3238                                               HAL_WBM_REL_BM_ACT_PUT_IN_IDLE);
    3239         }
    3240 
    3241         if (!rx_tid->last_frag_no ||
    3242             rx_tid->rx_frag_bitmap != GENMASK(rx_tid->last_frag_no, 0)) {
    3243                 mod_timer(&rx_tid->frag_timer, jiffies +
    3244                                                ATH12K_DP_RX_FRAGMENT_TIMEOUT_MS);

error code?

    3245                 goto out_unlock;
    3246         }
    3247 
    3248         spin_unlock_bh(&ab->base_lock);
    3249         del_timer_sync(&rx_tid->frag_timer);
    3250         spin_lock_bh(&ab->base_lock);
    3251 
    3252         peer = ath12k_peer_find_by_id(ab, peer_id);
    3253         if (!peer)
--> 3254                 goto err_frags_cleanup;

here?

    3255 
    3256         if (!ath12k_dp_rx_h_defrag_validate_incr_pn(ar, rx_tid))
    3257                 goto err_frags_cleanup;

This definitely looks like an error path.  Similar warning
in ath12k_reg_chan_list_event().

drivers/net/wireless/ath/ath12k/wmi.c:5195 ath12k_reg_chan_list_event() warn: missing error code here? 'ath12k_reg_build_regd()' failed. 'ret' = '0'

    3258 
    3259         if (ath12k_dp_rx_h_defrag(ar, peer, rx_tid, &defrag_skb))
    3260                 goto err_frags_cleanup;
    3261 
    3262         if (!defrag_skb)
    3263                 goto err_frags_cleanup;
    3264 
    3265         if (ath12k_dp_rx_h_defrag_reo_reinject(ar, rx_tid, defrag_skb))
    3266                 goto err_frags_cleanup;
    3267 
    3268         ath12k_dp_rx_frags_cleanup(rx_tid, false);
    3269         goto out_unlock;
    3270 
    3271 err_frags_cleanup:
    3272         dev_kfree_skb_any(defrag_skb);
    3273         ath12k_dp_rx_frags_cleanup(rx_tid, true);
    3274 out_unlock:
    3275         spin_unlock_bh(&ab->base_lock);
    3276         return ret;
    3277 }

regards,
dan carpenter

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
