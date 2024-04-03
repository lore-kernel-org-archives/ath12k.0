Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B23CCD128A
	for <ath12k@archiver.kernel.org>; Wed,  3 Apr 2024 10:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eK6fESaW2gt1o5wVhb6uYWMv20izEcS4xDdK3oWkLTQ=; b=iESNO/Ev2Vwy/qZmZBiPA0GTGV
	WTKNFjBzdSzuzclY1xxwFNiCIlpsrctMTm+hkY0soIoyjwHW9YFKhCK+ltgzeibk2dsHwSDPpe07k
	wuOGaPkJuLNrt1z2g0xfLFp+V9XW84QdfpxYFbS4EKY6HezMMWj+lb4OLNORHim6+eQlCC8kBciGg
	gvXmSaiM8h8cRatObqNa0Iq9flgqC38jE+JIEWk2WbZBobiKiCjftxKjtvz9l8+OdocwDxId4uqcs
	1l5uct2jGH1oYmZqZd+1HwW2tJLd5U6s2fylx64/gRFllxs6JLICvmjgFoTGL/ab/OcTF52A827LY
	aBaXYPpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rry0e-0000000FZdY-0aPU
	for ath12k@archiver.kernel.org;
	Wed, 03 Apr 2024 10:38:24 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rry0Y-0000000FZbC-05TV
	for ath12k@lists.infradead.org;
	Wed, 03 Apr 2024 10:38:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 13E1ACE22D7;
	Wed,  3 Apr 2024 10:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F172C43394;
	Wed,  3 Apr 2024 10:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712140695;
	bh=nRxqRG35XPkOm9ujEDT+vmy7suP6a7xyli/k/7DN3Tg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Qwfh1pkAa435kxRTaAYYZfQo1Y4XsW+MhwGNUOyYrbY//z8IzN9yzrGX+EYeqpp2S
	 bHvPem3HjxCDF3LZ5ygn1ITjbOFPNU/E1lwi/VdnCnzAAvcnGz/0HQXZ89PaY7U6bQ
	 WqTDnz27ohJnWRbq6rdLVAs+x0/fw+JIdI7clhIpFD8bjZsi4ICjhjJ6qHmDJpoW0Z
	 Wgb2cDhmc+2axcmdtsg0SMJfKLp6IAO/YcGGGnPoC7MmJOyPOKsvTzZFTqvS/Yl/SY
	 4zbHLCy/x4lowgelWGiFdsp9A1F22CB9vKxvU7Num8nWI/XAdzlGhwVRr3DoCXelyS
	 N/B53805Q77BA==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] [RESEND] wifi: ath12k: refactor the link capable
 flag
References: <20240403042056.1504209-1-quic_periyasa@quicinc.com>
Date: Wed, 03 Apr 2024 13:38:12 +0300
In-Reply-To: <20240403042056.1504209-1-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Wed, 3 Apr 2024 09:50:54 +0530")
Message-ID: <87o7aq68a3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_033818_417798_F7F441FF 
X-CRM114-Status: GOOD (  10.76  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> extend the link capable flag to accommodate inter-device capability.
>
> v2:
>  - Rename the terminology from chip to device
>
> Karthikeyan Periyasamy (2):
>   wifi: ath12k: extend the link capable flag
>   wifi: ath12k: fix link capable flags

Why the resend? I'm not really a fan of these "RESEND" versions. If you
need to resend something simply just increase the version number (in
this case to v3) and explain in the change log why you sent v3. That's a
lot more clear for everyone than having "v2", "v2 RESEND", "v2 RESEND
RESEND" and what not. It's not like we are running out of version
numbers ;)

But no need to resend because of this :)

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

