Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DC5C10F1A
	for <ath12k@archiver.kernel.org>; Tue,  7 May 2024 10:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2NT70dhSukPljfhPus/vxVmQC+n8ULc4SuqqzTbXseE=; b=H7jj2AqQ8leNkju1rIoG2j0Kv5
	Eep/XpruoDx3nA7PjSUdzwy0IiveF+IBfyz4YgU3mccrv1hQjZyuG4IumF8/UNsnNBPoO1iRZ50jG
	LzuHsAfUaQS2NJLF8pgQx0tqRafecb+Rnc6DQIc2xX359cfjJQuS4LJ9MrvdyzkFOSLeOVRKTeVfN
	hQPu173N4c2YV96f6+ntEKTgtcfJj95vKej8rPd8C1nAjoaVVoHGJwzJu7jM4gewHQBXKVfGESZdv
	J8b0LccVhsx6dzklD8V+2uroXJuAEeInS8QUB2hUo6ItbMOoHuI0Nq9p7OYz3Tox6ml5pNj0fS3ku
	rvdokt/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4HuL-0000000AVHQ-3Vi2
	for ath12k@archiver.kernel.org;
	Tue, 07 May 2024 10:18:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4HuI-0000000AVG1-0rAE
	for ath12k@lists.infradead.org;
	Tue, 07 May 2024 10:18:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 967B0CE1263;
	Tue,  7 May 2024 10:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D69ECC2BBFC;
	Tue,  7 May 2024 10:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715077121;
	bh=H9Ov+02Db9ZsbaLN5N5fV/vO7IHWQQc9uE2lzc5cVUo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=rIyH0Lfs/fwGgwZSDIeeBhAR8TdqwGoj5t3vHJPTzx9PxSUn+HSjkSsGQwZAkaEP3
	 5kimOsi0l0MnEdtFfpIx7swqYTYRTMOF7g+OFjJbKmIaBfQBb+vR4xpmzBCYDdWn82
	 OA9gSWDnROo9kf1VtKDBrqFUvICfjCcdxFkcV16MTBjldauuJDTT6ZKmDVhUIlI/uj
	 xvqmm3NzMN3GJcNEMAZAbdxggJuCAKSEJDo7RK1JXd09FTk3uDNvmwfb7RtEWE1duc
	 FpM7JzVhW3SZ7vYxJhnUkFUsIohVjTDrViTVGBauyJ8+EbmBSTIkAphejooUpSwtej
	 M7MdDQlpoBULw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/5] wifi: ath12k: remove unused variable monitor_flags
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240429081525.983-2-quic_kangyang@quicinc.com>
References: <20240429081525.983-2-quic_kangyang@quicinc.com>
To: kangyang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_kangyang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171507711881.3827098.17675343914805366101.kvalo@kernel.org>
Date: Tue,  7 May 2024 10:18:40 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_031846_519862_904C66D9 
X-CRM114-Status: UNSURE (   7.00  )
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

kangyang <quic_kangyang@quicinc.com> wrote:

> monitor_flags is defined in struct ath12k. Although it is changed in
> some places, but it is not actually used.
> 
> So remove related code.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

4 patches applied to ath-next branch of ath.git, thanks.

782615f280ce wifi: ath12k: remove unused variable monitor_flags
3b0989e925f3 wifi: ath12k: avoid duplicated vdev stop
f40aaca07bf7 wifi: ath12k: avoid duplicated vdev down
efd920f48d1f wifi: ath12k: remove invalid peer create logic

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240429081525.983-2-quic_kangyang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


