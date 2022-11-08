Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF3AC4332F
	for <ath12k@archiver.kernel.org>; Tue,  8 Nov 2022 13:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2OiR3VHowPhRoeH/+54cT8FB1esFPbpJ8zzw1f0bQZs=; b=LATS8WbOYRBoS9
	6PQJOAl7Ki1ztXCno4vzkegBV7sObSBE+jE56VJHNPhf2OC+N3yXxINQb+p/5XYzvzNFmTObR4Fh7
	Ej4cbHcUS31+q3O4LYh+4xSg1zbva834z+NEqioI7wDF95mNYRXyiu7gMXzbbLVBtFgjIEtxG4wOW
	nVo0zCe6WewaW4+5RlsqiYa3S5NuoTqJ7ofEJym7e7RSf1aEWsX8UMlZkHgoFRNwSy75+IUvJsDeN
	2o4magKj6O2sDXBBVWEcIdwqPm81juv8wZd3SnIC+Y+1V41vHHNUOIvE9HEx+augEEMYYBH5Up7FF
	340V8Nr38dwaBSGpzXew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osOdl-005cNS-Gt
	for ath12k@archiver.kernel.org; Tue, 08 Nov 2022 13:27:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osOdi-005cM9-L3
	for ath12k@lists.infradead.org; Tue, 08 Nov 2022 13:27:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3AEFE6155D;
	Tue,  8 Nov 2022 13:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA72C433D6;
	Tue,  8 Nov 2022 13:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667914059;
	bh=uDaE4OLVOMECMlR7iVxh8/EBgnAsH1SSuitfLpP/q4k=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=K2TxuRhu2zOV4fqONOj6ofTM2OuXyxqUirQZgG3ZyCE69UEPTDtcNMe4FeP2pzqri
	 cx/fRf55vrA7KpPD/ULgQuAPr0LYrPv2msh9u2NNbZauTn49HsA0zgIaL97vTfr8DP
	 At/7mD3yPcvflN5POnDvvTvRjp0J5+7seasJnbr3ZmysBgxpQ0dmFp6igRE3jTHjuD
	 p2aIoZjGklwhAEvp/EKEcXg1SY5z8UVFFxBe0QesE84NOvRFL4kFGG/ad49SvNVLDk
	 G4BnL/BTP4et2Ee2TNlOXoC0kJPFDvnJO243zkw/u8BSAy4Vdpkvvrpole6s6E27pP
	 UMmTuG8vAVJLQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>,  <ath12k@lists.infradead.org>
Subject: Re: [PATCH 30/50] wifi: ath12k: add hw.h
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-31-kvalo@kernel.org>
	<9038589b-f2e6-18e5-29f2-f88f19d34a68@quicinc.com>
Date: Tue, 08 Nov 2022 15:27:34 +0200
In-Reply-To: <9038589b-f2e6-18e5-29f2-f88f19d34a68@quicinc.com> (Jeff
	Johnson's message of "Thu, 18 Aug 2022 15:30:13 -0700")
Message-ID: <87r0ydefuh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_052742_745805_0E3A3A5B 
X-CRM114-Status: UNSURE (   8.88  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 8/12/2022 9:09 AM, Kalle Valo wrote:
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>
>> (Patches split into one patch per file for easier review, but the final
>> commit will be one big patch. See the cover letter for more info.)
>>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

[...]

>> +	struct mhi_controller_config *mhi_config;
>
> imo based upon mhi.c review this should be const

I added this to the todo list.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
