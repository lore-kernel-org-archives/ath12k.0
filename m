Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAEDCCFA1A
	for <ath12k@archiver.kernel.org>; Tue, 11 Nov 2025 15:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DF+eml+FxnCmhnBitbpIPh7T/cAeMOUWivf1+XBICm8=; b=nqXa0mz+ZxptoikPz37Or/3G1Y
	DHVByV3k8HJpjD2YJ/JTWZFzwoxpmLI+4/jwByM11GibPhppcIQmUc12ZReJm1Lb0Xmc5UOYTnv6C
	NdRNTQnA+sUK838HKBbcsSAR+2xkyH10QJVvX3syJB1imKcXLpIT1rRye3BlEUpPjS13uoP0ri27v
	S0NDUyXsaEH4mZwBzZIN7DgJYzOuEPgdA1yBWc3lMH2PqqeVlnR5m/bA8IriuI9cTHowb+NzzMJRD
	+EQ5SLCJh70jOYK2DhEtq23KhZ02zgsm1ldtEzbRTrIYRDIx+4Ar+n1iHkCevS7+KsmLDlcoCKIP4
	XVUtAJbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqHr-00000007Nhj-14Es;
	Tue, 11 Nov 2025 15:28:03 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqHp-00000007NhO-13gl
	for ath12k@lists.infradead.org;
	Tue, 11 Nov 2025 15:28:01 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 0A409A80079
	for <ath12k@lists.infradead.org>; Tue, 11 Nov 2025 15:27:58 +0000 (UTC)
Received: from [192.168.1.23] (unknown [98.97.43.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id C3DEA13C2B0
	for <ath12k@lists.infradead.org>; Tue, 11 Nov 2025 07:27:55 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com C3DEA13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1762874876;
	bh=4OGSR1l0DRxmMxbBg4FjI2Sos3qjkywPs9nO86RFc7Q=;
	h=Date:To:From:Subject:From;
	b=VVRhyXsTe9Zim2mTC1/UcycFyRs0SjrYWb+0tsqJvhRhK6fqop9bPf+MAtaRFlII8
	 HDUy7IiRNG38Q4fcqFMPDZ/GHwsfxIvQlKVFvJy+wKYtBMk8WLNeoiupMpKx6GPr7c
	 OKSb12BVE8SPpHfVJ747IMPZ2SXl7TgQvAd81B0c=
Message-ID: <1891f4e1-1e28-4f30-b48b-fa50210135da@candelatech.com>
Date: Tue, 11 Nov 2025 07:27:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ath12k@lists.infradead.org
Content-Language: en-MW
From: Ben Greear <greearb@candelatech.com>
Subject: ath12k pcie radios with MLO support?
Organization: Candela Technologies
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1762874879-FsKWXOArWwaD
X-PPE-STACK: {"stack":"us5"}
X-MDID-O: us5;ut7;1762874879;FsKWXOArWwaD;<greearb@candelatech.com>;5bad664179c033c86d3002bbc8bae2aa
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_072801_318701_68785B69 
X-CRM114-Status: UNSURE (   5.58  )
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

Hello,

Are there any current radios + software available where one can put
ath12k radios in (mini)pcie slots or similar and use those in x86-64
chassis and provide tri-band MLO?

Last I looked, Compex had some dual-band radios and maybe single-band
6ghz, but I am not sure those can be combined into a tri-band MLO solution?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

