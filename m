Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1A5C4167B
	for <ath12k@archiver.kernel.org>; Wed, 29 Nov 2023 11:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7v9Turz8U/GP4Ipk1dQ2Q5GhQII7ws+b/QbxGTj2Fl8=; b=QM4psES1eEpYQcOhm9voFSVf6q
	ejK/hFmIUW7nswvAcCNVAQDb1qM4afulAyb099KjfVIBCeZUaL8hARkL43RQTKhMgSTXqCVMs2po1
	MXMdDSdH028w0ECV/NTp85aiWgdOKJipJdtGINzkkI1bpBdML4TclrisfW4YoZ+4dGMHui9ujdMGd
	3Z+L2bzk7wliQbvm3ELRY7fUKNSwYtBIdu9Wq+0xLkQF3WJHqSBu+efMyftOKUdV5trbSmhshyk9E
	uUlKTFkMt6ZRwlKhrEkqp81ZRvO12CcpcJqtzmbqgPKfCvMJpERZKIGEJTlgUkBgz2XuRpQZyo/le
	Fvw0IRJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Ii8-0085Xl-2h
	for ath12k@archiver.kernel.org;
	Wed, 29 Nov 2023 11:26:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Ii6-0085Vv-0U
	for ath12k@lists.infradead.org;
	Wed, 29 Nov 2023 11:26:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96C4C61AAD;
	Wed, 29 Nov 2023 11:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8A4C433C8;
	Wed, 29 Nov 2023 11:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701257189;
	bh=C2g/NoIOeJ82J2MCFOfvwn8dCdNu1Honw/rWebiTskM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=IX8gLQWyt9mzZHtGiOkC0ikLxq4s02xI23hf1qNGl+1WpvXy7tuLeNA349EXa70rK
	 nXO8pO7j/ugs7wrHNvOXAUvgMkTn7PNqF/46cZJVePcrVJAj5Kh/e8pC1fqavw1ujH
	 ukpfqb3ysB0bcqvBY1W3mj1YfaOceGb+zoBXP2UKpynUFDM/aso30/oG7kepfCIob3
	 FdDABbCCmU2WnYMM6xYCFiaca5WWHPibY8V7HjLGNQcN8LrXB/rx89pEPaK0K0J3DT
	 GP2PCFvvrIdao1K33XYZcVk2uDHepn9hMUQAceoowTPFGThYd4JuB35ZCD/Ov9/X/G
	 RRDTKLzaXcVow==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath12k: fix the error handler of rfkill config
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231111040107.18708-1-quic_periyasa@quicinc.com>
References: <20231111040107.18708-1-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170125718623.1070846.8149698389070338560.kvalo@kernel.org>
Date: Wed, 29 Nov 2023 11:26:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_032630_238419_4972D7B5 
X-CRM114-Status: UNSURE (   8.44  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> wrote:

> When the core rfkill config throws error, it should free the
> allocated resources. Currently it is not freeing the core pdev
> create resources. Avoid this issue by calling the core pdev
> destroy in the error handler of core rfkill config.
> 
> Found this issue in the code review and it is compile tested only.
> 
> Fixes: 004ccbc0dd49 ("wifi: ath12k: add support for hardware rfkill for WCN7850")
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

898d8b3e1414 wifi: ath12k: fix the error handler of rfkill config

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231111040107.18708-1-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


