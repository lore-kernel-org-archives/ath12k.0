Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F89C54E69
	for <ath12k@archiver.kernel.org>; Thu, 14 Mar 2024 22:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1cRCI2TQl2E06OSsyRtxrdsvwE91Cf5bQYoFPWyo4E=; b=J9gySBKpHzjrRw1eY4zRFJQBtK
	xot8xJRw/3WRddbU+4x71mvSD9fYAbF3KrDgrrV5c1yAy4EA4ZbpI9J0zcbqsWV3TDadBPgXxPdww
	SVUzi/Mjm3py9YhCRrqdTOCr8fIxMYhUiOq6/hQp8yl2w3f0n0JSz79MS0QJDbnc0tdWfNbwWfNDW
	0lcbWHL7kCDZZqaAqm5oxXDrSXcwYy70QFmlIQQrNsoElm8I0simEMgpnobVsrEzv2py8kNwy7BLY
	66cnNIqwI899fU020Lkl6PBJ82IHpaL1ofaly1USLyfeghfhyG+nwLxEO/GSBPCw924OwWHEAYvvf
	LgvIPFSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rktYA-0000000Fq9w-30Po
	for ath12k@archiver.kernel.org;
	Thu, 14 Mar 2024 22:27:46 +0000
Received: from mail.kaechele.ca ([2607:5300:60:7a38::25:1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rktY5-0000000Fq8T-2Hul;
	Thu, 14 Mar 2024 22:27:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 28650C005F;
	Thu, 14 Mar 2024 18:27:33 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1710455262; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=l1cRCI2TQl2E06OSsyRtxrdsvwE91Cf5bQYoFPWyo4E=;
	b=lQkgvg/PB+EdEmzpxMq+fIlWl6rJ6NWKM0OPcF9Akv7UBMcfOynJhFDp52c20fMaGvAR2y
	owWLGJ6YcjOmbGhQXfuZixLWrzks2nYpNyC6/TXiFuMM4m1/bXeV7yzifrLQpxu8XEdT3g
	gQ0WqGDRmFAhvRwKcPepF1mm2mmPOhI=
Message-ID: <96597f1d-5072-4915-be5a-e685dc85614a@kaechele.ca>
Date: Thu, 14 Mar 2024 18:27:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New staging repos for ath1*k firmware
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Sebastian Gottschall <s.gottschall@dd-wrt.com>, Kalle Valo
 <kvalo@kernel.org>, Robert Marko <robert.marko@sartura.hr>
Cc: ath10k <ath10k@lists.infradead.org>, ath11k <ath11k@lists.infradead.org>,
 ath12k <ath12k@lists.infradead.org>,
 linux-wireless <linux-wireless@vger.kernel.org>
References: <bac97f31-4a70-4c4c-8179-4ede0b32f869@quicinc.com>
 <CA+HBbNFQ+25u_PK2j3vYtiCZwv+shVAVeAHKqQCwhyCopORt4Q@mail.gmail.com>
 <874jdigf76.fsf@kernel.org> <3b57d932-0848-40f4-ab2d-a8d4afe11df1@dd-wrt.com>
 <e1c3ba7e-b358-42a3-a8db-f9c098132350@quicinc.com>
Content-Language: en-US
From: Felix Kaechele <felix@kaechele.ca>
In-Reply-To: <e1c3ba7e-b358-42a3-a8db-f9c098132350@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_152741_812340_B49B5CFC 
X-CRM114-Status: GOOD (  10.20  )
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

Hi Jeff,

On 2024-03-13 15:32, Jeff Johnson wrote:

> Kalle & I are just the conduit, but I've relayed this thread to the folks
> responsible for feeding us the firmware releases.

Thank you for providing that service to the community. It's much 
appreciated.

Is there a chance you could ask the team for the most recent firmware 
for QCA9379 hw1.0 SDIO (Naples)? Branch name would be WLAN.NPL.
There are currently no public releases of this firmware outside of 
what's included in the vendor blobs from some Android devices.
I'm still doing some testing on the patch I sent to support this card on 
February 28 to this list and I'd like to see if some of the issues I'm 
seeing might be a firmware issue.

Thanks!

Regards,
Felix

