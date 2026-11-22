Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440C9606A320
	for <ath12k@archiver.kernel.org>; Sun, 22 Nov 2026 13:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rjCqiLq3;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=lqYcxfc+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=q/EnDq0cYzj1Unoh1AP9SwyoUO1qaDu53CnMoUXDa1M=; b=rjCqiLq3+OKKkw
	gGHHvjsFcCV/U6tT9ABceM0+uBqpS9l/VZOzjLESynJadmMf2qQwzH2M6Mqyad5Coa25DvEwufQjR
	4uxGkL18DH3EVvtcLCS+LrxMIm/nEifM+8zUzFt/21xV4NmSaOltb62u6a40Em3ykGpG+kxBSOCqV
	xtH2msCGWwkbCwaiMbg4xFyDPYpFQfdT5Ui4CgGfXxpIZQDrAmZqioc31LQl2iBoNPK2TlTdbuOet
	EHo8IFx0Tx8eax4wq+XL5KLbV/CrLjPg2g0BlYRM0To9bDoaSZDzzbm0AwrDDYAXnRPtHjY3omeNB
	9dUbv29N7CV4oMyf8oBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7q5-000000019eH-41gP;
	Sun, 22 Nov 2026 13:42:41 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7pw-000000019Ve-3BJv
	for ath12k@lists.infradead.org;
	Sun, 22 Nov 2026 13:42:35 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c4d581da0aaso310863766b.2
        for <ath12k@lists.infradead.org>; Sun, 22 Nov 2026 05:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795354951; x=1795959751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/EnDq0cYzj1Unoh1AP9SwyoUO1qaDu53CnMoUXDa1M=;
        b=lqYcxfc+Y8nE/W73SJ7QdPix/MPsLDZQyhFiXasDuqF51Da2RTrx0N9eXJFn+6+Rxc
         qYZMGTo017p+SSZ/dJ2+ZeWgpfrGvc4nSHlp8eU6X1x8mf7+4Pse/8AvrP7vuunx5Qgn
         QkngPknJnZs5Q9fuc5L3Gflpix7XxB47W4H41XyUsp7REk4xikJ9tvt7aJC2lTzAYDkU
         CyLsZBr5EYnzAL7AL9k2P6V3mJxkH9LiNYJBfP6mMZAcQhR7RPZrDpoYgDEKp3QTgTHP
         /v9iECcijI3eeEC6CtowZw7GYO3+89lUEjuktdD2G7NUTqGaRvt2jc9dSI9HqxanHwZ8
         uKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354951; x=1795959751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/EnDq0cYzj1Unoh1AP9SwyoUO1qaDu53CnMoUXDa1M=;
        b=e8PWUae8TNoxnPHrr7ArG6wjLzUallvaIqtZzOe4lqLIr48ANvPXLfVbVX14XwuDOG
         MvrC47WHu+Byqo2l4l8lacajDBjqrqZbvG3ACrTHsAUa5yTeFzuIDtjbk0d00IiP0YiJ
         okfn+O10y1cilppaIdCG3vJVvR+eF/IaWZWKDjfDx0qP6binUierac8anxPZwtOFmtk/
         n8zeXkB8xxEyKCCAy7bBZiiYNVuufN6zicmq0jDJN3q+zxR/00cMygDYwhopjAdRAFS3
         CNniO81l21JSkRfQ6NNEEdtG9y3ojQDNDz2yQ0irfk55UJm5Hqe1PsWiPOb4OT7uOA20
         dNTQ==
X-Forwarded-Encrypted: i=1; AL+hErHVpkm8C/4H4cORpdfctjrnZhkuddSYvhKGjJ5zqY3TtZQL/NoTjmGpkDG3JQZfVOL7IZb3Omk=@lists.infradead.org
X-Gm-Message-State: APuU4Z8S+QFDa2diZT5MfQ12RXHdd3grTdOFaNhUYo/NRpJa/AA+BvDl
	Bo5AXbOHeosICql2jURBSCyXZtZG7+OUHDK7dXTNo9dmGcolBZvghEaP0nCR9AjjeQ==
X-Gm-Gg: AZFdTZdIhHndODXVybGcYFXgzwrYOpQ/JoKcUcY7iyJJ8P9Ixz+uGdSE1QhJ5EJIpAa
	G6KWzpnHjO9AegdYNt9SJ/BQz0KPH+7tyK0ckoaX16Ju0hNbjwN5oedpCfrBbpkZ2Ch9QxIKPYQ
	nWe5KrO30mpe7R6y83ZxrMqxSBIgpJ9pamkj7I8ZJOg/cqjlVCZWlr/eqvjwMMvEZa1h6DfUjov
	2z6kYlzoI+nJHrEq/ATNYDjiNWCapSgtKmbYLmr/NPdN4GXNYT+ad36OBj4fjGWDCr6Wzki7jCs
	1GhtCh8pq1UZy4KzKCaUI6tVULSfzmXs+rZEq58DfydHQnSQ7M4QsjJG5fk2C/piJpzL6d6u5Iq
	b4mQ39aGL4raqf+YPeEJwGK02cOJCoYg32JG4gLW9F2ncMp9hpJc3Xb5yq1n3gKjZzHpcyaSE6P
	Qeo+3I6LI4OxnPqU7ulVk5wJGYzhTS+h52PPiOjbHkl1JBMS9fs1pCuB5VT4KysS7RMCmikpHAA
	YTdPFuN9g5VS3CXd7J1C/waAwlYkSLgFqp/Rx42S7Bmwg6k2hhmz7Z0NW0w9S5cTOfl/3iMlJG3
	XRXuJ/4n8CV2wNUBadQO72kSnwMF3zsjNBbwozxnb6fOG6mXQg8di0p1DBg4wNi3Xt9NkWEf5BA
	dEhanUfnCuOnbrY1I+gdluwByA9j7XyjAZZnJgvGNb52nyEPdMW1fCFmEuEnBCFgetqHIAMo19G
	H9syFosrnIo//rivXSHk5ECIUO2d+x4UaqyKudQcCtAp5CHmb8zMJjHzQiJbpsk4QOlkPBubrDX
	6JrZ2vztpR5gNgxelu5kf+O633gTQYs9RP9BtmLOsnlNKyEwsL9w3iQ2GFmqNyJtDLd5h85E8mc
	YokEA5pa6I/PoCA07nE5YH01zIALq+V8pnTIF2Y1ciEaippGP+OQof8=
X-Received: by 2002:a17:907:3e1c:b0:c51:53bb:8d70 with SMTP id a640c23a62f3a-c5153bb8ed8mr418956066b.16.1795354950990;
        Sun, 22 Nov 2026 05:42:30 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24712e3000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4712:e300::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010bcsm326020566b.1.2026.11.22.05.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:42:29 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 3/4] wifi: ath11k: pass the TID of a received 802.3 frame to mac80211
Date: Sun, 22 Nov 2026 14:42:27 +0100
Message-ID: <20261122134228.956044-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122134228.956044-1-julius@bairaktaris.de>
References: <20261122134228.956044-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_054232_825135_485F1DD5 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k_dp_rx_deliver_msdu() delivers frames with Ethernet decap as
RX_FLAG_8023, and mac80211 counted all of them on TID 0. Pass the TID
the driver already took from the REO or MPDU start descriptor into
rxcb->tid.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a5..7235399c5b39 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2493,6 +2493,7 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 
 	rx_status = IEEE80211_SKB_RXCB(msdu);
 	*rx_status = *status;
+	rx_status->tid = min_t(u8, rxcb->tid, IEEE80211_NUM_TIDS);
 
 	/* TODO: trace rx packet */
 
-- 
2.53.0


