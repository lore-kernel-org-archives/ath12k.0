Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4E6CAC59A
	for <ath12k@archiver.kernel.org>; Wed, 17 Sep 2025 14:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l3qfvUNPeteo77GmcVuR1YeJ3dENcezczqbA/ez+O/I=; b=3F/gS7HJlQPrw/b7bDp3zYIizS
	qJkzsDUifpj6cOqn1Qm7ia325DreoOn9QmxT4k7UrwLQEGsWg7HvYy4BXyNSxfijPM10fKoAYxb63
	hP1ezaxshJps55T5SKbKsYZOu2RhUEicQTzkt9QZ8uPXLyxNHZmXiByaQf+2isgvLsiy2JDeV60Wt
	bzdwtDGoOwhGz/WLEGVQn3b2VvW3zM/W2X/nUeH0MhogcUYYT9dwxkQOZVX7j17HScbSuvJQQ3J7a
	qV6eKkFXyO0PJNRu/s8I2xIHGj4OfHQ22nWetKFp1fLrYPqIxmrDS1VttLtDucTF07pFi9YMV4s8h
	WNEswmcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysqV-0000000C3ox-1IQT;
	Wed, 17 Sep 2025 14:09:19 +0000
Received: from smtp26.services.sfr.fr ([93.17.128.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysqS-0000000C3g2-1cwH
	for ath12k@lists.infradead.org;
	Wed, 17 Sep 2025 14:09:18 +0000
X-mail-filterd: {"version":"1.7.1","queueID":"4cRgcC6kyKz1LQKdF","contextId":
 "b8ab6a9d-f05b-494d-adbf-f9a405892db8"}
Received: from [192.168.19.19] (82-64-187-125.subs.proxad.net [82.64.187.125])
	by msfrf2642.sfr.fr (SMTP Server) with ESMTP id 4cRgcC6kyKz1LQKdF
	for <ath12k@lists.infradead.org>; Wed, 17 Sep 2025 16:08:59 +0200 (CEST)
X-mail-filterd: {"version":"1.7.1","queueID":"4cRgcC5zq3z1LQKdD","contextId":
 "5266ea40-11b5-4c3c-be16-59d52c5198d0"}
X-sfr-mailing: LEGIT
X-sfr-spamrating: 40
X-sfr-spam: not-spam
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sfr.fr; s=202006;
 t=1758118139; h=Date:To:From:Subject; bh=0dibjvUob3YjslVvYBwc+10+JM9/hX2ADMta
  7Risgok=; b=FrAX4lBRgMnMVnxwGkJ/V7aiIsMBWE6t3G+4+ZzS9UwzEv9AbSbpmfF3CB2xX/zu
  UbMR9OL7Q2OsuVBCO25L9pEGqXMW1KR/0oztLRqYAV7j/VAnqDsKAele8aXEq9Utd2AatY901iMM
  b8dN7Gsjjv9TPKQW/fT4gPTBWi8YD0VZLwJnhLNUsHTf2+9J7DFtNS04YyDfQAx96k6KGb3+5dgd
  TBFC1Vq15+Xo5nSaOaswX0oI62uKSw/8e+n7TYQYS+HplJJ2BX8VOHRLl3iVGDCuoFjXbrfLwb6u
  vjohy4ual64KnHSxNj8w5f8GYYMe/L5keuwMbJsqkxuiyoulSg==
Received: from [192.168.19.19] (82-64-187-125.subs.proxad.net [82.64.187.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francis.lebourse@sfr.fr)
	by msfrf2642.sfr.fr (SMTP Server) with ESMTPSA id 4cRgcC5zq3z1LQKdD
	for <ath12k@lists.infradead.org>; Wed, 17 Sep 2025 16:08:57 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (PLAIN) smtp.auth=francis.lebourse@sfr.fr
Message-ID: <c2f59614-c5b3-42f7-8fab-792e49f2e6a6@sfr.fr>
Date: Wed, 17 Sep 2025 16:09:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr, en-US
To: ath12k@lists.infradead.org
From: Francis Le Bourse <francis.lebourse@sfr.fr>
Subject: ath12k firmware for board-id 4102=0x1006
Autocrypt: addr=francis.lebourse@sfr.fr; keydata=
 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
 XDzktHdmllRdUBo3cfP4nA==
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_070917_051016_803B6717 
X-CRM114-Status: UNSURE (   6.17  )
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

Does anyone know if the firmware for board-id 4102 exists and if so 
where ? The driver detects it:

     ath12k_pci 0002:01:00.0: boot using board name 
'bus=pci,qmi-chip-id=0,qmi-board-id=4102'

but it fails to start as there is nothing for it in board-2.bin and 
firmware-2.bin from linux-firmware-20250808.
An old QSDK with a 5.4.213 kernel did contain the required files and the 
board works fine.

