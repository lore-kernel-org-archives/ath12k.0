Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63BCC433FE
	for <ath12k@archiver.kernel.org>; Fri, 21 Oct 2022 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jyhW5BORzX2GwwMNvDMqnvsBfxiNMuZZHkuLzIaNmoE=; b=mIcJJIc+9wrlj+
	holXPJEo4yJ55fszzz0VcrAv3hfZ34T8JEC23HrwM1BzeiEBVA7hCncmUbYhscfVuX3lk+jS74/er
	H8SthZqy/ecFsmZhuTfGGgx+t2kLLMpL5H0ls6J5sRw7UQfWBpprKXTz9uCvIMf+oaNFDQMQvZ43r
	AK668uci38BE0HhDm9FE2nCWdkAkcxu0qMBukaJJJl7uCvWQMXxoRuWmNxok+/YeAUt2SCS/9uVoH
	H/9lSVaj9sTYmNrdYtrkrnYHR+pRLnBGDhHSSWZVMSmYgUW/1O7vhLfQkSfPr8iYVVIdAavyYwA9H
	5R1k/iJoNKqq0o8hYo6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnRv-006Nfz-4p
	for ath12k@archiver.kernel.org; Fri, 21 Oct 2022 08:32:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnRq-006NdD-Mi
	for ath12k@lists.infradead.org; Fri, 21 Oct 2022 08:32:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6521C61DF4;
	Fri, 21 Oct 2022 08:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72460C433D6;
	Fri, 21 Oct 2022 08:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666341129;
	bh=DmHWC++gP2rCYs1bP6ciQXbsn2q9U2LCgCYB8RYFUf4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=uizwqBAyMda1rf1B2MSz3uBAbKJSInfjWkC3A5tvTy4jgBeRtNQ1tkbCeS4K3j1t+
	 OtmNr4y9ddCqP5HFsTkMZrjnhBff4Vx4vG2sVGwb4di2NHn92XL5mhko/sjPZYuRfL
	 80olcipls/UyGzRtMYDEIOyMUyjDpuzVTHEyW1N/EPk7Z0OLv68kj/iiP2U1Y8DwEo
	 HUAp8JAe2GTYMxTDNttbYvf7lXmIJJVz1/v+wW7TwVInCaBKu+GFMcseX3R+NNMmCP
	 atTy0ymIPEC1cMc4r1wdVYu3SLrOcVCXfCi99rKVL1eBl4DCO8uA8aJ3C8ly4l1x2U
	 cjNG7Lt+N1UnA==
From: Kalle Valo <kvalo@kernel.org>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,  "ath12k\@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: Re: [PATCH 05/50] wifi: ath12k: add core.c
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-6-kvalo@kernel.org>
	<6cce0974d5bb40c2a2a40b4abeb41e74@realtek.com>
Date: Fri, 21 Oct 2022 11:32:04 +0300
In-Reply-To: <6cce0974d5bb40c2a2a40b4abeb41e74@realtek.com> (Ping-Ke Shih's
	message of "Tue, 13 Sep 2022 06:18:01 +0000")
Message-ID: <87a65plgqj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_013210_871435_280F650E 
X-CRM114-Status: UNSURE (   9.17  )
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

Ping-Ke Shih <pkshih@realtek.com> writes:

>> -----Original Message-----
>> From: Kalle Valo <kvalo@kernel.org>
>> Sent: Saturday, August 13, 2022 12:09 AM
>> To: linux-wireless@vger.kernel.org
>> Cc: ath12k@lists.infradead.org
>> Subject: [PATCH 05/50] wifi: ath12k: add core.c
>> 
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>> 
>> (Patches split into one patch per file for easier review, but the final
>> commit will be one big patch. See the cover letter for more info.)
>> 
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

[...]

>> +MODULE_DESCRIPTION("Core module for Qualcomm Atheros 802.11be
>> wireless LAN cards.");
>> +MODULE_LICENSE("Dual BSD/GPL");
>
> // SPDX-License-Identifier: BSD-3-Clause-Clear
>
> Out of curiosity, SPDX license and MODULE_LICENSE() are different. 
> Could I know the rules?

The rules are in linux/module.h:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/module.h#n185

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
