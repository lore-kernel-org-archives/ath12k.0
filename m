Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6414BC48BC4
	for <ath12k@archiver.kernel.org>; Wed, 14 Feb 2024 08:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nnvxrNGJaWsOWaQFpgN7z3xJUcAkejxkmRKLOcjd3w=; b=otk0vTBNGiZmyt04vwfVjc6BHH
	qk0hC03TbNWDMmJ4ZaaqoRPIJitK66c16K0k04M2OXkMh63ueEU51cLX71H0kBe/NOp9exb55ufMY
	KFBnVSMvFuTfESls+bi9yIgVp+A778t2q86HIWKbZeeohvgd0gmQW6jWQML3PnmjkTrKHK83Skwg8
	H2ifYsh79pHxBz5XZj8m3djFT/EX0eB95qlmucxC7GNbb7bEsZWTl5Xs6kf1N4+NTivpVYyHmACwA
	WIBQPeZE7uFzk9ICCISBAiunOJ/f2S9kVGXA0n6A/29GdZ5c8tVDQGgrAjg8StioMtmSnRjBECG5F
	9xoQREkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raATS-0000000C819-0T9l
	for ath12k@archiver.kernel.org;
	Wed, 14 Feb 2024 08:18:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raATO-0000000C80o-2Cgw
	for ath12k@lists.infradead.org;
	Wed, 14 Feb 2024 08:18:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3DAC1CE1CAB;
	Wed, 14 Feb 2024 08:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18C2C433F1;
	Wed, 14 Feb 2024 08:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707898707;
	bh=+Oc4d0hrSU+ykNe3Rn2eSnzEHmjg3VroAHmjLC2mChU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Stdh3swJmUwGHg1QtmyaQ5GIJd2kvpc8u2CWKLF+Z+8hjSBatPugQig+Z6ZFjS/ZV
	 s8SEItvAJOq37nigd0g9L6Reag7TMQjIQfLbNacyB/dzog3b64a0BvpQicIIwqEdxn
	 xur5T7okndIBUHMqDYS6/mLd8A5okITmZU/8qVJb8aq8VDLdTER6EWfTlsHzrAaEpE
	 3gUp3wzin860X95myo9Z6W2qU5+m8TfunR6n9ainxcV2oZgyeMKMmpRQA52FFmBxYv
	 lViAPlrKAVT8ZtruEcGSYlgGG7nsw8lojsCyM5V/uEW1g368lIohatFCMRx2YWc38q
	 vkcgi7Lg3H4kQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: remove the unused scan_events from
 ath12k_wmi_scan_req_arg
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240211151104.1951418-1-nico.escande@gmail.com>
References: <20240211151104.1951418-1-nico.escande@gmail.com>
To: Nicolas Escande <nico.escande@gmail.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170789870464.3088943.17592714420741852160.kvalo@kernel.org>
Date: Wed, 14 Feb 2024 08:18:26 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_001830_810125_EA9E52F4 
X-CRM114-Status: UNSURE (   4.79  )
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

Nicolas Escande <nico.escande@gmail.com> wrote:

> As done for ath11k, lets keep on cleaning up struct ath12k_wmi_scan_req_arg by
> removing the unused scan_events. Also remove the underlying union & struct
> construct as it isn't needed anymore. No functionnal changes.
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

f0024c980df2 wifi: ath12k: remove the unused scan_events from ath12k_wmi_scan_req_arg

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240211151104.1951418-1-nico.escande@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


