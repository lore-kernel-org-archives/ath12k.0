Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D950CC25B10
	for <ath12k@archiver.kernel.org>; Fri, 10 May 2024 11:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeCycFZzsz04oR1HTjPx8CMZPqo4EYEIPF+5vMoHzms=; b=pQf0w1qbK3yiNUTECvkSxwLLES
	S8s2ZXtUPEyTw5cxRddyuNAzowrqe01v/pdlz82tQv2DBVaaarCxrhe4m+uqSVmCfJc+MBFlrPSrm
	q9VcLtxaXmhpppuRjAmbZ4qDjEbmhAICq2AX9bI7zcGZgKPhmTFSMgATUA8leWOEZr2hfn6TSazAr
	o/1ugTI4d33t210cINr9/yV5xhfj1n22l1bTz0f4F414bp5fM8Olv/G+Y1dApcs33dEoaqA01POi2
	KvFUYxSdpN3/xnM29E3uc3nBi4usi9MtBUE46ktgL7oMhiNxhT7/fyMXlNgRgujK3eTbAhMuPJtH6
	E0Yv6TfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5OPw-000000053OB-42Lq
	for ath12k@archiver.kernel.org;
	Fri, 10 May 2024 11:28:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5OPf-000000053A4-3Zyc
	for ath12k@lists.infradead.org;
	Fri, 10 May 2024 11:27:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B59261EDB;
	Fri, 10 May 2024 11:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B50C4AF10;
	Fri, 10 May 2024 11:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715340463;
	bh=gF+sa+/XGxSbfjHvq4RInnphfam85m2+QW7/nTCMInA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Jgparnqhpv3MxZBblsyAQYByv5KNh1CBCWb/rJgXzSrwDxrjt+tnJFxaMO5cPgUnL
	 Gor6V8a6TElsmmWpx078XjawHwdOiqx7RC04+KFIZeo8NIJT2NJeWImIISpJBpqtpL
	 iNdn9YkIz+m2r45hRMsTTUkZDjRC6mU/c19ONAxCYhlxFT0IBg1dEbCGBinQdRljtG
	 2+y4h1ijEcJfHGLal2ngOdHCC4eL86IxPDwk6jEfE4MXT5KXFFI1hfPOwwbBSTPeWW
	 TVOW61iTGvQ/eGz2pD45D9LZ2K9cAq/Jf80/OEkm+xZS6OUeKkepqtal+CpQWmDk8v
	 y3XzFxYvO1FvA==
From: Kalle Valo <kvalo@kernel.org>
To: kangyang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2] wifi: ath12k: remove redundant peer delete for WCN7850
References: <20240510111238.1113-1-quic_kangyang@quicinc.com>
Date: Fri, 10 May 2024 14:27:40 +0300
In-Reply-To: <20240510111238.1113-1-quic_kangyang@quicinc.com> (kangyang's
	message of "Fri, 10 May 2024 19:12:38 +0800")
Message-ID: <87fruplxeb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_042743_968427_C77C0FC4 
X-CRM114-Status: UNSURE (   6.12  )
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

kangyang <quic_kangyang@quicinc.com> writes:

> From: Kang Yang <quic_kangyang@quicinc.com>

Please fix your git config, it looks your name in email From header is
formatted wrong:

From: kangyang <quic_kangyang@quicinc.com>

https://lore.kernel.org/ath12k/20240510111238.1113-1-quic_kangyang@quicinc.com/raw

I guess it should be like this:

From: Kang Yang <quic_kangyang@quicinc.com>

Though I'm not sure what kind of formatting you prefer, please just pick
one and use it consistently :) No need to resend because of this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

