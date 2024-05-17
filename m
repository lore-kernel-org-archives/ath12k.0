Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC38C25B7A
	for <ath12k@archiver.kernel.org>; Fri, 17 May 2024 05:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwxE1sfLhF9yF04JaFzu6Gjd0t8Y/jp3gr+BSTtWWxQ=; b=OEvaYc2c19LrN5fLuhoPiI976g
	y4eNsG4fp6vk/zEv/jsoZE0PWlXDSSspyqdqBhD/SsivvSO3wJpw1EFs068vP4FhVI4oWojVX4YBD
	rYSsnOMHZ0TavcyA11eCoP4llR2vO/SIQx8mvfsM5zf7PX4DMxR8TD142HbWNKRJf2xc1NVk288j9
	SoQRQ+W6bc7G2OU4eCJy4Ze4exLySdwsNQmLcbtne8MhdjrR9mFyLd/whWABbsr5NOU/PGTAHc9Ow
	KOQmzY0gOnZLU4Phek6uOU4vukB/fADmT9gze9WONKYJQbS2Ma0cy7cHFl1Mtux4m6UQvjFUPKUYl
	AiU2hDwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7qDH-00000006rPQ-3JMv
	for ath12k@archiver.kernel.org;
	Fri, 17 May 2024 05:33:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7qDD-00000006rOe-39fF;
	Fri, 17 May 2024 05:33:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 85700CE1987;
	Fri, 17 May 2024 05:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CADAC2BD10;
	Fri, 17 May 2024 05:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715923975;
	bh=gqa8WlcS1NTz0ZQsjr7949ZxTONjClfCieQGw/F7IFc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=p3RMwNV3vjx92tTRehFV6Wv9uc4hoWsV8X3lpoR5M0sYvTjOWjQ5qx6ksgAV05Uyj
	 tmp/nUc8LMM43AYanwoO5GhgljnQCy922ULiB+G5FYyNdmHeCAKAvy8SEou9vpzoZg
	 m7szF/KN9zU7G49wJICp3Vh39Zwmnx5/+R4lRBKWsydKyEv7RzIOD+SatrRxuhmY44
	 Niu0uBszPH2h6+TA9k+ll4KAW4AtATEFUSgcboFJJO2aFp+/SnKVyhXI6dqpT3XVAR
	 MQU9NIt8VCSRv2DP0+hF+KOHm03VUyQUgt9z4jk+PtNUuaRBlV3LzJ4suHV5sBWrpL
	 BiyI4Dorw900w==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k <ath10k@lists.infradead.org>,  ath11k
 <ath11k@lists.infradead.org>,  ath12k <ath12k@lists.infradead.org>,
  linux-wireless <linux-wireless@vger.kernel.org>
Subject: Re: New staging repos for ath1*k firmware
References: <bac97f31-4a70-4c4c-8179-4ede0b32f869@quicinc.com>
Date: Fri, 17 May 2024 08:32:52 +0300
In-Reply-To: <bac97f31-4a70-4c4c-8179-4ede0b32f869@quicinc.com> (Jeff
	Johnson's message of "Wed, 6 Mar 2024 11:23:06 -0800")
Message-ID: <878r09gfzv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_223300_000931_1F35FD9A 
X-CRM114-Status: GOOD (  16.11  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> Historically, prior to being incorporated into the linux-firmware
> project, firmware for kernel.org ath1*k drivers has been first published
> to Kalle's GitHub:
> https://github.com/kvalo/ath10k-firmware
> https://github.com/kvalo/ath11k-firmware
> (ath12k firmware was pushed to the ath11k-firmware repo on a temporary
> basis in anticipation of this move)
>
> But in order to have repos with multiple maintainers, as well as to have
> a hosting platform with more control, we have moved to CodeLinaro:
> https://git.codelinaro.org/clo/ath-firmware/ath10k-firmware
> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware
> https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware
>
> Note that most people should not care about this -- normally you should
> use the firmware that is in the official linux-firmware repo:
> https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/
>
> You should only need to access the staging repos if you need a previous
> version to work around an issue, or if you are testing new firmware that
> is supposed to fix a problem that you've reported.
>
> Please let Kalle & I know if you have any issues with these new repos!

The final reminder that the github.com repositories will be deleted in
two weeks. If someone is still using them switch to the new
git.codelinaro.org location NOW.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

