Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E29E7717D
	for <ath12k@archiver.kernel.org>; Wed, 11 Dec 2024 07:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GI0ehieZ5hJe9ZDp/eyPFqyzUwkw4AtDuisXijJ5H78=; b=rO7Lb6kQnoq2gOF2frdv4siIQq
	EEHWuEam7K42rqRXmhLiiGj4wQ6Ty4+2he5w6Y58MamKsC+vo//GJZ/wEPNKG3JuBY+keUzYDSRqJ
	31C6Fe91yMbKHhF4xpDcQ1d0sNvrgkU0LeM2mLA+u32eT36BYZmw247WKiILbAivhWlhuX67VVp+S
	kRAd/IR3V8rstFlB5ec0M4iUKNMEXWn1Mao9lsVe7EV8RzLDqmDUyl7JI1t8hlqtzEES/vPa72p2K
	BWqVlguFbjQ/17iShLo3qGuVNWhPWP1Ba4xdpUpEJb8u1iEBx2z/RiYPI+l74PweMypiTSw/bVkG9
	fF9/vVKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLHG5-0000000E4WS-25hp
	for ath12k@archiver.kernel.org;
	Wed, 11 Dec 2024 07:35:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLHG2-0000000E4VU-146f
	for ath12k@lists.infradead.org;
	Wed, 11 Dec 2024 07:35:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A43F5C01DB;
	Wed, 11 Dec 2024 07:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD58C4CED2;
	Wed, 11 Dec 2024 07:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733902540;
	bh=py87pas2cGq5UWcav2sXK2+B6kLSq6nozxEXlUk3+lo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=t7R2qvzCnqAKGVcUtm0Prkssq4sJdk14WpvunKgZ/Sfwg726mouddN+z1jbS6hJBB
	 JmPFEwSl9ULlaMVItClVv2KrAsJLujc5G0g0LU+nfbkP5LdQKafpN02GfYRe6G0IHj
	 z/EpsPqyyYfK3BGaGO+NJN7rVBshmZn7BemtNg/wgV8BHmsPMeJkwnbeBOZ7rUk6fQ
	 rXpmo4eo3DWhlgd3iXZgS2MC/5Gj3pe5ytw0qMAXN7rlvEAcGscvQGgOltn2c+ujnO
	 AKu/6XITI6YKHhX5+Qo9enZlbfr4wzfTT32DOJ/gz/UABy6C+W7A0SYYHeQO2yHdrM
	 rAi6oVF+cDUtw==
From: Kalle Valo <kvalo@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Gregoire <gregoire.s93@live.fr>,  Baochen Qiang
 <quic_bqiang@quicinc.com>,  ath12k@lists.infradead.org
Subject: Re: WCN7850 disconnects and reconnects in a loop
References: <AS8P190MB12051DDBD84CD88E71C40AD7873F2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
	<Z1hOweEsmXrIZByQ@hovoldconsulting.com>
Date: Wed, 11 Dec 2024 09:35:37 +0200
In-Reply-To: <Z1hOweEsmXrIZByQ@hovoldconsulting.com> (Johan Hovold's message
	of "Tue, 10 Dec 2024 15:22:57 +0100")
Message-ID: <87wmg6r7sm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_233542_331018_5A520846 
X-CRM114-Status: GOOD (  16.87  )
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

Johan Hovold <johan@kernel.org> writes:

> On Mon, Apr 01, 2024 at 11:56:39AM +0200, Gregoire wrote:
>
>> I have a QCNCM865 card with a WCN7850 chipset. I'm running Arch Linux 
>> version 6.9.0-rc2-1-mainline.
>> 
>> I'm experiencing difficulty connecting to any Wi-Fi network; the device 
>> connects and reconnects almost immediately.
>> 
>> Here's a gist containing some logs from dmesg and journalctl related to iwd.
>> 
>> https://gist.github.com/GreyXor/5e6dc8e610a00c8aab37a1251d36dbc1
>
> I'm seeing iwd repeatedly failing to connect with reason
> PREV_AUTH_NOT_VALID with WCN7850 on the Lenovo ThinkPad T14s (and the
> Snapdragon X1E CRD reference design).
>
> I first noticed this with 6.10 when starting to work on the Qualcomm X
> Elite platform, but never got around to investigating it. I've confirmed
> that the issue is still there with 6.13-rc1 and that adding
> ControlPortOverNL80211=false allows iwd to connect.
>
> Looking at Gregoire's logs now, it looks like the deauthentication
> reason is different:
>
> 	(Reason: 7=CLASS3_FRAME_FROM_NONASSOC_STA)
>
> instead of
>
> 	(Reason: 2=PREV_AUTH_NOT_VALID)
>
> but the same control port workaround allows iwd to connect.

Is there a bugzilla report about this? Unfortunately I have not been
able to follow bugzilla lately due to MLO work but it would be still
good to file this (if that's not done already).

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

