Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8047ECAC5A7
	for <ath12k@archiver.kernel.org>; Tue, 23 Sep 2025 11:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kKVVRWUNzv40XNUMrQ9i6XSS0WnlQkg1bf3gnVBJ3Co=; b=1fc43ju4nSl7Cqk8aVZ+czbz8q
	adXkBJLYhFMJlOTgu5u/jJbGzb9b0FA5rybejp97OJTriR8QwLGKH7e3r2E9ZAVmH+Ko1gYzqH9+S
	lG7PhpUXNGP6Occ7Gia4zE7StON0f+yLtbdi54B9dqUzK+7rtqUK9LuDkAggILBdRFBSstPaC5Lva
	piTDtwXGUFGpHpvk1Zs4plWYgTasmeiyFjg/HT+xW7D9j/2+KPEIwgV+EUJbFmmv3mywvAskujYWo
	Go4na/4ULbURd4IHE1JqzaSz/ZYvRHdA9Ua9I9Zy1uRKkj+H99zJqVZ/oJ1ikflrI7v5ZO1ipdOye
	mImo4P1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v115H-0000000D9cb-0iB1;
	Tue, 23 Sep 2025 11:21:23 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v115F-0000000D9cJ-0OUV
	for ath12k@lists.infradead.org;
	Tue, 23 Sep 2025 11:21:22 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3ee1317b1f7so2701472f8f.2
        for <ath12k@lists.infradead.org>; Tue, 23 Sep 2025 04:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758626479; x=1759231279; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kKVVRWUNzv40XNUMrQ9i6XSS0WnlQkg1bf3gnVBJ3Co=;
        b=bvsmeVq4IZzqzGwn8523oih2UfXZPnkcHqLRxEIDGRK/0aoZO5gGZM3AlTMzakAvkF
         olZT/uGksM+GK/d67BDQtvQ1oibdOPGZaWwvknzwLfix8tWdqyk9fAbEV9Uk7ZA1+tZ2
         e3xkbRr8MHhCnehvzZhgBgppU8cyzIvq6M0XSH+Xp7wu8PLhoDcFJ36aYj7/fMmvn9oD
         IVrxdQobXCNx87W2iXlk0VF6jH3DI8gpWPYqIyYUVgFyIjE/loWXH9+XBR+XvI6gNYTQ
         BHUK105xbqsdEPlDhsCkJ25sL1qTldhAY9Xlai1EZZN0pmDaiLu+DmXDyQ63XNNXRu15
         qtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758626479; x=1759231279;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kKVVRWUNzv40XNUMrQ9i6XSS0WnlQkg1bf3gnVBJ3Co=;
        b=VwDtaGSIMwYglijlaLhjy73212QRqhTOqLown+JdHGnmJ1+rvxM48ckOLFS4VGyoKi
         Q4/9PBBIK3bYwoD2bMIQ+I0a0+KMg5ZdyMW0maiXuaHZhpkn9k8oOTHWENZbTqTQKUfM
         se001UR44W6K2J94fI0QdRgBY2fOLxTJxONdI9YjIZbZC/5HPAO5Cr7MDfkQ3Q14ACZ0
         md6tGUsBECSy3EXSe5A0TP5236vzjM9yeHCcLu6fqMRfEzJ9UoZsu0I5pWMh5iQ/0yCj
         oyTjBn3ek6wwPByvYijBF4YTpFB38KXZ/GtYhDzrnzAT8S4V2+OnfyJzulnYs8AcrHen
         a+ug==
X-Gm-Message-State: AOJu0YxFtU/5i4N7msFnXXgF3lSzPRnvAZpzC/Wjhpp8n8lzWsMYUg/0
	zrfWk3QGz3qUhf7pfwn62p4skcfoGQZ/tDDDQSN0dabTRCaY9ZTfiD1KFJiWqC51bdb2th5Rvjt
	NOZjb
X-Gm-Gg: ASbGnctdIVeKEOu0mOI1jmakjk65t79BfQOOMuE5pzxJEan09dWJM8NDOnfRKHc2QR5
	xLn/XMoLD189cYvWfGtzi1qbgse4WDCfsSRljP0lCuYNcoa473OcDfjXDBeZv2b66kOI0QMVdpJ
	Cs/T8pyMpuZhY9n8nnZM4ugRixbIxgBJMw5nXACfpjHvc/I1d23wxrNyZ7HAlEwTV3IZ8Q/ykyd
	VVg6rvQq9/BzWZWAj3oIvcxBltgeGfl3RG1STF3my3Gt9rRVnObgYu9gPblYDwbuqYLmo0oJU4V
	QUBgQMd04Ducami2qo3jMkqeoxZohCcbFxS3cdKG7S6u5j9upkOpgvgDaxuUW0Lqp1Om2W5fxb1
	iuq1xvkNoXNC+ghdGdsHWV16NA77JXbykXtn3trA=
X-Google-Smtp-Source: AGHT+IHs5oTgcyF8wx+eFxa67QpO0v5jeDbfuZbra8vtgmGsN7VahILgCPo+ypN7PnVJgA0J+7TYCg==
X-Received: by 2002:a05:6000:1a8c:b0:3f1:ee44:8bf6 with SMTP id ffacd0b85a97d-405cb7bb760mr1817722f8f.51.1758626478950;
        Tue, 23 Sep 2025 04:21:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee07412111sm23297230f8f.28.2025.09.23.04.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:21:18 -0700 (PDT)
Date: Tue, 23 Sep 2025 14:21:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: Extend beacon miss handling for MLO
 non-AP STA
Message-ID: <aNKCq7AiPb_1z3ig@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_042121_153927_39D48DFE 
X-CRM114-Status: UNSURE (   5.40  )
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

Hello Maharaja Kennadyrajan,

Commit dcdb05a43df9 ("wifi: ath12k: Extend beacon miss handling for
MLO non-AP STA") from Aug 12, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/net/wireless/ath/ath12k/wmi.c:7344 ath12k_peer_sta_kickout_event()
	error: uninitialized symbol 'link_id'.

drivers/net/wireless/ath/ath12k/wmi.c
    7305 static void ath12k_peer_sta_kickout_event(struct ath12k_base *ab, struct sk_buff *skb)
    7306 {
    7307         struct wmi_peer_sta_kickout_arg arg = {};
    7308         struct ath12k_link_vif *arvif;
    7309         struct ieee80211_sta *sta;
    7310         struct ath12k_peer *peer;
    7311         unsigned int link_id;
    7312         struct ath12k *ar;
    7313 
    7314         if (ath12k_pull_peer_sta_kickout_ev(ab, skb, &arg) != 0) {
    7315                 ath12k_warn(ab, "failed to extract peer sta kickout event");
    7316                 return;
    7317         }
    7318 
    7319         rcu_read_lock();
    7320 
    7321         spin_lock_bh(&ab->base_lock);
    7322 
    7323         peer = ath12k_peer_find_by_addr(ab, arg.mac_addr);
    7324 
    7325         if (!peer) {
    7326                 ath12k_warn(ab, "peer not found %pM\n",
    7327                             arg.mac_addr);
    7328                 goto exit;
    7329         }
    7330 
    7331         arvif = ath12k_mac_get_arvif_by_vdev_id(ab, peer->vdev_id);
    7332         if (!arvif) {
    7333                 ath12k_warn(ab, "invalid vdev id in peer sta kickout ev %d",
    7334                             peer->vdev_id);
    7335                 goto exit;
    7336         }
    7337 
    7338         ar = arvif->ar;
    7339 
    7340         if (peer->mlo) {
    7341                 sta = ieee80211_find_sta_by_link_addrs(ath12k_ar_to_hw(ar),
    7342                                                        arg.mac_addr,
    7343                                                        NULL, &link_id);

link_id is uninitialized on error.

--> 7344                 if (peer->link_id != link_id) {
                                              ^^^^^^^

    7345                         ath12k_warn(ab,
    7346                                     "Spurious quick kickout for MLO STA %pM with invalid link_id, peer: %d, sta: %d\n",
    7347                                     arg.mac_addr, peer->link_id, link_id);
    7348                         goto exit;

regards,
dan carpenter

