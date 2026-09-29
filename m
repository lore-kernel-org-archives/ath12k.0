Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55266CA5FA7
	for <ath12k@archiver.kernel.org>; Tue, 29 Sep 2026 18:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOwy2R9ycU/4Vrle3YkExgT8YD1TJOiSb3ryhwkzJ5I=; b=jfj4KO5+DwttTdCU+KubbkE4dH
	K/u54xn5eVNmatCX68vncpZzVlBfz8IUiXk75xO/xXCwomXvZ1IqRFcopd7B3UuDtNa1VqnmILJNk
	ylEs1gPMuqvo8h/jm68oTaZzXqQz1xU4IFAcgyHC5zRqPqBZeSVF9gZcMYR0v59Oapi0KMSFyLju1
	gv7Kd/WbzM0MVgMfYhm9qOPkxnVqEHRxygEsjfHw7mxj/hV1eFwF9xU9TX5W8ndKEWp+87pvOcfS3
	nGV0qVRa1S55bAkI8PgDfJXbqZqzXYoAdZK3UMP48It6rnPmqrjlHR8HN4rbKwUwVVMBssKdQzvCR
	6sIiFQUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcv2-00000004JbK-3jds;
	Tue, 29 Sep 2026 18:51:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcv2-00000004JbD-0i25
	for ath12k@lists.infradead.org;
	Tue, 29 Sep 2026 18:51:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 89146436DE;
	Tue, 29 Sep 2026 18:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556101F000FF;
	Tue, 29 Sep 2026 18:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790707871;
	bh=uOwy2R9ycU/4Vrle3YkExgT8YD1TJOiSb3ryhwkzJ5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Tk2XoWIIx0Ha0Yzpc/XL3tHAatTmYDESctgQ6FqkVwiw+S0Q5hFAyVQKa9Ek4KsVK
	 9cHZcM5Jc0IGZIKIbO+bGP8xXSt2sQN98bBsiAu8hLHdJl7Bky/0O0EzyzwCle4xyi
	 THMmznIxEY2C370gkSDhgoVfAJlPGdFkuXoEeu7Wsjmg/e5kO3r9R/m6u5FRKVdPCR
	 sC55ONyyImmw2oHrXdMaxi83fH1eFKtDLH50q7vuC0SflIEqy4P9rTwegfy9fsp1Zu
	 u/bpNZ2gscdP6QmECx+2NZM97r3s/iKxfx41vk7q856WoZsyv9IVtVuQ0LKkfBmJeo
	 +Ed4qyjRMFfaQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_jjohnson@quicinc.com
Subject: Re: [PATCH 6.6.y 0/2] wifi: ath12k: backport CVE-2024-40979 fixes
Date: Tue, 29 Sep 2026 14:50:50 -0400
Message-ID: <2026-09-29-daily-reply-0007-re-ath12k-cve-2024-40979-6-6@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929025856.85683-1-artem@trailofbits.com>
References: <20260929025856.85683-1-artem@trailofbits.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> These patches are a backport for CVE-2024-40979 on 6.6.y.
> The second patch depends on the first, so I kept the upstream ordering
> instead of folding either change into the other.

Queued the pair for 6.6, thanks.

-- 
Thanks,
Sasha

