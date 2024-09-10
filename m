Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F05ECE582
	for <ath12k@archiver.kernel.org>; Tue, 10 Sep 2024 09:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+D2N4NNRNCNnzK8mRYnIJP0q1WJ66VO1GMusWXG6K0=; b=PPRb2bNaNQkV0ukEUgUW3mp9wr
	rnpjnsuBgIb2WNdVyEpBqLpUSTtlsyN49/2QLl9OIc/nLxnI+wv9Ehyi+Wx8EE/mr+Z2SxRYDBc32
	wQPSe9FcHxXxL1YDeCLyfIW247J2qB6nKyNhCdKES1pc2xkUPJQbEnVg/dg2vdim89rVY9Kdnz33a
	UotpkkJEcqzoCsp5kxferCQyogLlRwhWb45APYZNMsB5X2E1ZjTfy7zzWUpjGN5O0q2OQEvL7D75Q
	AumzE1nzuJUhEJILmmogwUn8GfSWCeBPo8e6MHYtdoURM72iKbcNKFYdylGwgXy/bRSfiTIoS2XKp
	AWUQAXZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snx6H-0000000504e-37oX
	for ath12k@archiver.kernel.org;
	Tue, 10 Sep 2024 09:23:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snx6D-0000000503j-3OoM;
	Tue, 10 Sep 2024 09:23:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2EA68A443AA;
	Tue, 10 Sep 2024 09:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7670C4CEC3;
	Tue, 10 Sep 2024 09:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725960228;
	bh=tJP9GHCMCIAfr4hsxjN4iN1wAuceXtlv1/bK0SLhwJE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=L9oS43ThCEcb8eQF0g8LE/Fhr0uKEWS3EQtrWaSQKrBQrgxUtjC8QWiMQ+tYTsQu3
	 rurft+KIjLgnVgl4llTBSugBuo26vMMPUPaFoHO59JU8QlV8QmXmgrp7kD2QZ6sUz9
	 ssCYJGNLbdq6dwg/zg6CKQqLviY8/xLoh+ifOh1N3l/WptFOT3+4tmfEG3ttWFTewn
	 pNjB5K6oTFl9Lr/bmIe11L77vll+6GIKNV9Vu8qi4BiNl/MRWUgFARcP+JLzu3OKUo
	 5MqnqnbkoCs5oGScZXXXntKbam8c7vhfgqkyLNbY8G1JAozGG9fdwWcBnNX0Rxi4wy
	 eiZgbVHpErhaA==
From: Kalle Valo <kvalo@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  ath11k@lists.infradead.org,
  ath10k <ath10k@lists.infradead.org>,  ath12k
 <ath12k@lists.infradead.org>,  linux-wireless
 <linux-wireless@vger.kernel.org>, Robert Marko <robert.marko@sartura.hr>
Subject: Re: New staging repos for ath1*k firmware
References: <bac97f31-4a70-4c4c-8179-4ede0b32f869@quicinc.com>
	<CA+HBbNFQ+25u_PK2j3vYtiCZwv+shVAVeAHKqQCwhyCopORt4Q@mail.gmail.com>
	<3772134.MHq7AAxBmi@ripper>
Date: Tue, 10 Sep 2024 12:23:44 +0300
In-Reply-To: <3772134.MHq7AAxBmi@ripper> (Sven Eckelmann's message of "Tue, 10
	Sep 2024 11:00:52 +0200")
Message-ID: <87h6ang8v3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_022349_933557_1ADAF8C4 
X-CRM114-Status: GOOD (  13.13  )
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

Sven Eckelmann <sven@narfation.org> writes:

> On Thursday, 7 March 2024 09:39:26 CEST Robert Marko wrote:
>> Can I please ask for IPQ6018 firmware to be updated to 2.9.0.1 as well?
>> 
>
> I've asked them via their support platform. They closed the ticket after Jeff 
> uploaded the 2.7.0.1 firmware (which was given to him by the firmware team).
>
> I will ask again...
>
> (Btw. thanks to Jeff and Kalle for managing the new firmware repositories - I 
> just hope that you get better input from the firmware teams)

Thanks, this is not easy but we are trying to improve. It's just that
the progress is so slow that it's really frustrating.

As there are so many different branches I have lost track, do you have a
list of missing firmware updates? We could try to push for updates on
our own end as well.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

