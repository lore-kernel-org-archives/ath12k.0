Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08D5C369CF
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 13:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wl2sntL2foeXMHL68yZgS6j+JHjIlWFLQNY02bMKsA0=; b=cCV0k0d3dBoartbkNcZEhBqjOp
	44njbC/n1cEV9+96NpKjJpTjv9LJVnjHEcnfKTGgbcMwo5RXIe8EzpEUnmFwAWpJTfe4diWcmK0JJ
	965+G4xYeTLFGz4zuUjV6NOfPzf+l0wXFrMdwANqNmt4yWHDbTVEPdFO+m+oWC7jQVq1uXU0WvXJc
	XxRjgctRC3nzn0oM6ZZ+v2FAWLGF+i/Yn/iZpot3sYwipvYX5mP2D8lycV9ZWzDRixs3Ja3JPk5Ju
	Ezt4MNULmOjaUEhz66kNE4vxFsF9ZJRCwYs9U6KInkqI9sBFaPGPAwW2iL22hY4D2Gx0eJ1eR7LJS
	CyO3aMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5PAn-0000000D7YW-1ocx;
	Thu, 17 Apr 2025 13:20:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5PAR-0000000D7JT-0nm3;
	Thu, 17 Apr 2025 13:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wl2sntL2foeXMHL68yZgS6j+JHjIlWFLQNY02bMKsA0=; b=ozmVWa1DK6tq0PfXDnCTh3pdeo
	qTfpRew45F8iSCRnYreFmQ5T0IMHIPOmEv4G3Fcllb2PmmIYEeCR8nKCRgsZLCcNGJk43syAezJYD
	3FpSpUgDXRVmiE51OhggEgggeCLvv+81z7OMO12Yubc+hCaXes2Bs+EbrvM5UUPZtAVnYsLTUAtwa
	M4npJb6+4GXHI6lV5OMciCPPdGXHohUkqKYMXyDvIfjSu71fTvuHkN7CMSxKBgxmn5YX3rnPYPEdY
	/6HjxWSExB2P4DcWhfpkJHEPi/cYPVYrwzZo+zBw04pvB3dF8MXhnBcwLUtXn+4ViBG+ntwiAC1YU
	RAWhLywg==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5PAN-0000000AIdJ-40e4;
	Thu, 17 Apr 2025 13:20:33 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744896030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wl2sntL2foeXMHL68yZgS6j+JHjIlWFLQNY02bMKsA0=;
	b=TNMKyZYkQFCGx2hlGy222xN+FSM05lqYzc9pkB40Pkfm4GK62M6Pw+SyfP5vbk5GiGUH0Z
	QfyCYye3jK5B6KULY93cm/HodU8W2ttU0DpwNQIIQLEX7P8mo9o6/dLtlf+f3bRozAm9yE
	KRsyDn649Yds6WaoxiLfb8/N0RAhqooUkSq1L1XEUypxXDi+f8qCY/aI9hkl+f09KwqRgv
	Oh5oC2IBwb7oHqGyGvuhrSXLWdqxCEwt6425X3Al8gOJwuXC+DwDjL8hpFk2seSnYF8wp2
	CSFqc2pbJafDIno01pJJCH8DUCg0SdZhG+k3C/fHx8uPRpAB7gHorUdIJpNdFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744896030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wl2sntL2foeXMHL68yZgS6j+JHjIlWFLQNY02bMKsA0=;
	b=qmZ5eJ2JxK+q0AnKD+06vInxzCTLBW0rJFJbzJHcfKRjvWEPBo9Ljeo8tW5yud7+SCR3Mb
	73wS1UuLpExbkpAA==
Date: Thu, 17 Apr 2025 15:19:10 +0200
Subject: [PATCH ath-next 4/4] wifi: wcn36xx: Don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250417-restricted-pointers-ath-v1-4-4e9a04dbe362@linutronix.de>
References: <20250417-restricted-pointers-ath-v1-0-4e9a04dbe362@linutronix.de>
In-Reply-To: <20250417-restricted-pointers-ath-v1-0-4e9a04dbe362@linutronix.de>
To: Jeff Johnson <jjohnson@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, ath10k@lists.infradead.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
 wcn36xx@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744896028; l=1588;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=OPNAC8Z0G8ITTpc1DdLDRC3Y4E82qIDfQhRitc5zvvE=;
 b=T9JbjQdhxZNU/5ra4J11M4K9RgxRQecAuFkyV/yXCB395zBURy5tiBfy5Y2S/5H8Fwnlxqbzh
 N3oXHE6uPafAuOx65sdfN4UN5MCYPBHgzjjQ0yXzQcuzxd341OlPjft
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_142032_120659_CE26B49A 
X-CRM114-Status: UNSURE (   8.99  )
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

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping looks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.
There are still a few users of %pK left, but these use it through seq_file,
for which its usage is safe.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Acked-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
---
 drivers/net/wireless/ath/wcn36xx/testmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/wcn36xx/testmode.c b/drivers/net/wireless/ath/wcn36xx/testmode.c
index e5142c052985ddf629b93d7b9687e6ba63a48e8b..d7a2a483cbc486308032709a99bba9a52ed0ff59 100644
--- a/drivers/net/wireless/ath/wcn36xx/testmode.c
+++ b/drivers/net/wireless/ath/wcn36xx/testmode.c
@@ -56,7 +56,7 @@ static int wcn36xx_tm_cmd_ptt(struct wcn36xx *wcn, struct ieee80211_vif *vif,
 	msg = buf;
 
 	wcn36xx_dbg(WCN36XX_DBG_TESTMODE,
-		    "testmode cmd wmi msg_id 0x%04X msg_len %d buf %pK buf_len %d\n",
+		    "testmode cmd wmi msg_id 0x%04X msg_len %d buf %p buf_len %d\n",
 		   msg->msg_id, msg->msg_body_length,
 		   buf, buf_len);
 

-- 
2.49.0


