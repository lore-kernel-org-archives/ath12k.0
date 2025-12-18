Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7134DD68BEA
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 07:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BegzhjLWriYVIS92Z9v7x5mYAjBWqDFsSadktAEMVtw=; b=Opw+bZTDmh1kt612c+jqGm1HtE
	BCBYYHhgR+wDYC4FN2pBFcjSuWPWkVfI/Jx44nfqC8A1NFs9lnBfGnwl0Kq/SMTMYJa+vZPSSHjxJ
	py7LVQrrubl0T0LTzalV67EdCVQRLU8kRYZ4MvpNBclEzlO2LyygyBmq7u0y8dNGZWV799IGrePBI
	MnLWeL9Iwdyv1vSsYZy7XS0XVYurXQHW0eir7hZYi+bw3YgO0wY5KNWeAteYXwJhnaCJYPXdzFY4B
	y/jDGVjnCfQ0rIypFNQyOzaLk/5vfVeqAfU4uyv5oF4T8evhZlu9l1t6wjjokb1QlnD46kZz9eDDn
	JArIaEkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8gq-00000007ycs-0lhA;
	Thu, 18 Dec 2025 07:44:48 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8gn-00000007ybr-4BvD
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 07:44:47 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-42fb03c3cf2so123047f8f.1
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 23:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766043884; x=1766648684; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BegzhjLWriYVIS92Z9v7x5mYAjBWqDFsSadktAEMVtw=;
        b=yBsj7rEpxjusr2FzFJd+k8azEFGtp5+XcfE/gr8jsfGVhxEsXDlSJkc0Mxuvi3V/+k
         GtG/75xXZ//VWaPn+/0zvXpeQMxgfWcMrQXlMED3Sxp4MSLLXVjWT6G4/g7sbXmdUaqU
         aFE3k5ZahvnSOX9qi9Dd8wTWRtv2DPBvX4E4rkx8cSz3vc6qLLywegHqB+roB7gbTatb
         D6U/xtu4XHzNUK3iJfsEe//1jhxgHChwr23vhWL2PqJOEEp0ad2PJXK8oMXhmROPaS4r
         7FAnJqL8CrY3oi3w/3o23Tby33S9H5GJVtoo6sq5M568SCtpNj61cNVJY3dEku5l8tsg
         /puQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766043884; x=1766648684;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BegzhjLWriYVIS92Z9v7x5mYAjBWqDFsSadktAEMVtw=;
        b=aENMSls/yrJ6lj8uL7eH/Du31mIhTETa5w8OliR0sLXE7PR6dxzCcHY2QUSd2ylbBe
         PDSDSfqw4NgzP26YG8cNC2Z2FGF0qhtGrBsJq9VGKfakHruXOMf/P5VlN/TxnBANgZSs
         kmWDlxNMuWGEFSG8C4QxCOszBgtYE+M/SCor9z/e7buyHqZwTxU95GLpjgskGJYU3ztx
         2LFGxq6LjF3IAfigIOblhD9yJHYizWsf9e3EeJt0GeJ92hATcSsZa0oqixA6KhgSD+Jx
         dTEQiW/JTRmtE+PiSe0D3QoUoiChGQKKk+ZsNQGeLwJYCByP8exXTstZVjjICUlOpJaD
         3n7Q==
X-Gm-Message-State: AOJu0YwjWd+e8fei2+OqF0RLBq/CPs5Q398j/2MVoFD1NRd4G73nR3nI
	b8pZxajxlaBWO7afYYgILOB9d1K6al6xe798CD6SnOcdui+EcpOJBNK+pj1vCgnHRGQ=
X-Gm-Gg: AY/fxX4b3VMUWUPtulN9Bqhecp10uG7C5xffQgoEjW0+xdwQAoIwGp6r1RGevCpmzPK
	UgtSK5x8iDxU2jENf2lS/mguLKKWBcVl7rcec5B/3Jk7kKB/ddlacd3add3G9l5FL6Ai3XmBLVW
	TJzKm6fvpbwDT2m1wKc7q5T3lYWfoZ0AOrwjTuD3kMAtnEFJWe8/jkFlaI8zpubK8xoly1KahPf
	S5gi4gG/VjS2IZxN1pcxcymo816LYmouBLCZxDu2cp+XEsBDd6Uh8A6WaVXofzaSOyarqUUwK6o
	B//W8L65ll9X6AqGlQHwUarjyI4sn9MzWPhwt53FqkFtkTemyeceNxLoQCWCSfnH5IBrs3MbFW5
	K66s4o5KdBNXFq2tdZUKcJf9xJaEYDUMFh83G/kQ6UbU84PHvIjB9NKOdKMJktsCaP3ZX1tJtuf
	IeLUtRRIrma9pbCH70
X-Google-Smtp-Source: AGHT+IGvyAD7JnvrsUcXQLUfNThSPUEUy1rRYZMtqg4hYCSszKmg4rnGQMiTsb97igx6foLeoD9dJQ==
X-Received: by 2002:a05:6000:178e:b0:430:f449:5f18 with SMTP id ffacd0b85a97d-430f44963b3mr17482589f8f.46.1766043883780;
        Wed, 17 Dec 2025 23:44:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432449986f1sm3450449f8f.29.2025.12.17.23.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 23:44:43 -0800 (PST)
Date: Thu, 18 Dec 2025 10:44:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: Move rx error and defrag functions to
 wifi7 directory
Message-ID: <aUOw53SELnCtkzkW@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_234446_070918_3DC1852D 
X-CRM114-Status: UNSURE (   7.63  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Moving stuff makes it show up as a new error.  :/

Hello Pavankumar Nandeshwar,

Commit 6b4954d3f000 ("wifi: ath12k: Move rx error and defrag
functions to wifi7 directory") from Aug 28, 2025 (linux-next), leads
to the following Smatch static checker warning:

	drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c:1242 ath12k_wifi7_dp_rx_frag_h_mpdu()
	warn: missing error code here? 'ath12k_wifi7_dp_rx_h_defrag()' failed. 'ret' = '0'

drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
    1135 static int ath12k_wifi7_dp_rx_frag_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
    1136                                           struct sk_buff *msdu,
    1137                                           struct hal_reo_dest_ring *ring_desc,
    1138                                           struct hal_rx_desc_data *rx_info)
    1139 {
    1140         struct ath12k_dp *dp = dp_pdev->dp;
    1141         struct ath12k_hal *hal = dp->hal;
    1142         struct ath12k_base *ab = dp->ab;
    1143         struct ath12k_dp_peer *peer;
    1144         struct ath12k_dp_rx_tid *rx_tid;
    1145         struct sk_buff *defrag_skb = NULL;
    1146         u32 peer_id = rx_info->peer_id;
    1147         u16 seqno, frag_no;
    1148         u8 tid = rx_info->tid;
    1149         int ret = 0;
    1150         bool more_frags;
    1151         enum hal_encrypt_type enctype = rx_info->enctype;
    1152 
    1153         frag_no = ath12k_dp_rx_h_frag_no(hal, msdu);
    1154         more_frags = ath12k_dp_rx_h_more_frags(hal, msdu);
    1155         seqno = rx_info->seq_no;
    1156 
    1157         if (!rx_info->seq_ctl_valid || !rx_info->fc_valid ||
    1158             tid > IEEE80211_NUM_TIDS)
    1159                 return -EINVAL;
    1160 
    1161         /* received unfragmented packet in reo
    1162          * exception ring, this shouldn't happen
    1163          * as these packets typically come from
    1164          * reo2sw srngs.
    1165          */
    1166         if (WARN_ON_ONCE(!frag_no && !more_frags))
    1167                 return -EINVAL;
    1168 
    1169         spin_lock_bh(&dp->dp_lock);
    1170         peer = ath12k_dp_peer_find_by_peerid(dp_pdev, peer_id);
    1171         if (!peer) {
    1172                 ath12k_warn(ab, "failed to find the peer to de-fragment received fragment peer_id %d\n",
    1173                             peer_id);
    1174                 ret = -ENOENT;
    1175                 goto out_unlock;
    1176         }
    1177 
    1178         if (!peer->dp_setup_done) {
    1179                 ath12k_warn(ab, "The peer %pM [%d] has uninitialized datapath\n",
    1180                             peer->addr, peer_id);
    1181                 ret = -ENOENT;
    1182                 goto out_unlock;
    1183         }
    1184 
    1185         rx_tid = &peer->rx_tid[tid];
    1186 
    1187         if ((!skb_queue_empty(&rx_tid->rx_frags) && seqno != rx_tid->cur_sn) ||
    1188             skb_queue_empty(&rx_tid->rx_frags)) {
    1189                 /* Flush stored fragments and start a new sequence */
    1190                 ath12k_wifi7_dp_rx_frags_cleanup(rx_tid, true);
    1191                 rx_tid->cur_sn = seqno;
    1192         }
    1193 
    1194         if (rx_tid->rx_frag_bitmap & BIT(frag_no)) {
    1195                 /* Fragment already present */
    1196                 ret = -EINVAL;
    1197                 goto out_unlock;
    1198         }
    1199 
    1200         if ((!rx_tid->rx_frag_bitmap || frag_no > __fls(rx_tid->rx_frag_bitmap)))
    1201                 __skb_queue_tail(&rx_tid->rx_frags, msdu);
    1202         else
    1203                 ath12k_dp_rx_h_sort_frags(hal, &rx_tid->rx_frags, msdu);
    1204 
    1205         rx_tid->rx_frag_bitmap |= BIT(frag_no);
    1206         if (!more_frags)
    1207                 rx_tid->last_frag_no = frag_no;
    1208 
    1209         if (frag_no == 0) {
    1210                 rx_tid->dst_ring_desc = kmemdup(ring_desc,
    1211                                                 sizeof(*rx_tid->dst_ring_desc),
    1212                                                 GFP_ATOMIC);
    1213                 if (!rx_tid->dst_ring_desc) {
    1214                         ret = -ENOMEM;
    1215                         goto out_unlock;
    1216                 }
    1217         } else {
    1218                 ath12k_wifi7_dp_rx_link_desc_return(dp, &ring_desc->buf_addr_info,
    1219                                                     HAL_WBM_REL_BM_ACT_PUT_IN_IDLE);
    1220         }
    1221 
    1222         if (!rx_tid->last_frag_no ||
    1223             rx_tid->rx_frag_bitmap != GENMASK(rx_tid->last_frag_no, 0)) {
    1224                 mod_timer(&rx_tid->frag_timer, jiffies +
    1225                                                ATH12K_DP_RX_FRAGMENT_TIMEOUT_MS);
    1226                 goto out_unlock;

error code?

    1227         }
    1228 
    1229         spin_unlock_bh(&dp->dp_lock);
    1230         timer_delete_sync(&rx_tid->frag_timer);
    1231         spin_lock_bh(&dp->dp_lock);
    1232 
    1233         peer = ath12k_dp_peer_find_by_peerid(dp_pdev, peer_id);
    1234         if (!peer)
    1235                 goto err_frags_cleanup;

here too

    1236 
    1237         if (!ath12k_wifi7_dp_rx_h_defrag_validate_incr_pn(dp_pdev, rx_tid, enctype))
    1238                 goto err_frags_cleanup;

and here

    1239 
    1240         if (ath12k_wifi7_dp_rx_h_defrag(dp_pdev, peer, rx_tid, &defrag_skb,
    1241                                         enctype, rx_info))
--> 1242                 goto err_frags_cleanup;

here

    1243 
    1244         if (!defrag_skb)
    1245                 goto err_frags_cleanup;

here

    1246 
    1247         if (ath12k_wifi7_dp_rx_h_defrag_reo_reinject(dp, rx_tid, defrag_skb))
    1248                 goto err_frags_cleanup;

err

    1249 
    1250         ath12k_wifi7_dp_rx_frags_cleanup(rx_tid, false);
    1251         goto out_unlock;
    1252 
    1253 err_frags_cleanup:
    1254         dev_kfree_skb_any(defrag_skb);
    1255         ath12k_wifi7_dp_rx_frags_cleanup(rx_tid, true);
    1256 out_unlock:
    1257         spin_unlock_bh(&dp->dp_lock);
    1258         return ret;
    1259 }

regards,
dan carpenter

