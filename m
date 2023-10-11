Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EC3CD6E49
	for <ath12k@archiver.kernel.org>; Wed, 11 Oct 2023 08:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=71IKOV7iLAswI+Ny5dFaViJ3DpRSZ91Zu9WxIAhElpA=; b=i/n2BgquoNWONS
	4HbXo3sfqv3zN5ZGPzAVdFGspt8Il94SmmHcEUkyuPX6atAz7/cSnlJKnKiSwD548OvsdkjudnMh7
	gkUQPoEdsLsIZEl8LEW2tIf8Di879ZeYPUDzMazBjn3zMiTxtoACvqtTdqWYiAkgiYLRee75tue0q
	augDXVtudDwyCWjXhj+jZZn1up8Op+NzJCYzHND1ijS5o2ifgeWYWDxMIU2THSoh4ejEhswE2GIGP
	Pdhq/zqTX1X+M/kih6bRnV6O8dUeOIYof7h4CbnHWPtFYINaCqhxjey9CvjyYbP/yTTOQPpRyeD6E
	2SnyP61jhKqBYTZLJFMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqV0P-00FHJR-0i
	for ath12k@archiver.kernel.org;
	Wed, 11 Oct 2023 08:55:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqV0L-00FHIg-2Z
	for ath12k@lists.infradead.org;
	Wed, 11 Oct 2023 08:55:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A67561AE1;
	Wed, 11 Oct 2023 08:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF52C433C7;
	Wed, 11 Oct 2023 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697014544;
	bh=ypmKXRXN1bDbe6BFnY52JOMJEHn4p1Ml9jjg3Cls6yQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=S36I6tTLRNWWOyYJERZnEvDfdRdM5VZ2cY4TzOEtzhPF1BK1XQnusUKKdgYtXNYtF
	 EYOKfZV6P6Y87HZ0Ol7jRG/4flF4wl9ah7+cZQjoctR+qT9L3LLTN+WN8RICEhgCGH
	 G4r8vbPwdi8tm6fEv35Q7FtIy/m68ZfEocHGrQsyxUj5+ZrvFkQN6yOR69hd+ETv+w
	 vik3NwzMmxk7CPqFjrZgYZKQwUh6TwnuCR19sBsk5veZMEf8IZ/NJdwOX8Qukhn5b3
	 MttLjUgBZVrE1ihjmfpoDcvNSGaYtG8+FwQeP8vfVPnG8AiECFVzXiW/IcwHuZr3B5
	 b8JQoJZmsIDKw==
From: Kalle Valo <kvalo@kernel.org>
To: Ma Ke <make_ruc2021@163.com>
Cc: quic_jjohnson@quicinc.com,  ath12k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: call ath12k_mac_fils_discovery() without
 condition
References: <20231011072950.4097927-1-make_ruc2021@163.com>
Date: Wed, 11 Oct 2023 11:55:41 +0300
In-Reply-To: <20231011072950.4097927-1-make_ruc2021@163.com> (Ma Ke's message
	of "Wed, 11 Oct 2023 15:29:50 +0800")
Message-ID: <87mswp4jxu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_015545_880420_B23E1AB3 
X-CRM114-Status: UNSURE (   7.70  )
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

Ma Ke <make_ruc2021@163.com> writes:

> Mac80211 does not set flags BSS_CHANGED_FILS_DISCOVERY and
> BSS_CHANGED_UNSOL_BCAST_PROBE_RESP if there are no updates to
> FILS discovery and unsolicited broadcast probe response transmission
> configurations respectively. This results in the transmissions getting
> stopped during BSS change operations which do not include these
> attributes. Remove the checks for the flags and always send the existing
> configuration to firmware.
>
> Signed-off-by: Ma Ke <make_ruc2021@163.com>

This looks almost identical to Aloka's patch:

wifi: ath12k: call ath12k_mac_fils_discovery() without condition

https://git.kernel.org/netdev/net-next/c/43a10990404f

What's happening here?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
