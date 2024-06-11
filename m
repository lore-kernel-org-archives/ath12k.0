Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60EFC27C65
	for <ath12k@archiver.kernel.org>; Tue, 11 Jun 2024 18:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGLEBRYM0Sk+tKvpBCmKhzR/G/UGY0IkivifHrvSHT0=; b=oUOsEz5rtd5c1U7I7+FMHcuRN8
	QqeWCFwsLqhJlMPnvt8Xqo7mAe0Sbd8+cFvMr4uKhg+wIVEIqRgwfyw97ZDAoDQCwDFaKYJJaoHKQ
	N+i1guPo5/gTXjS9dqx26JFIzIZvvZl06NehsQXgdLYxl+aAxgEh4eGxJPh7B0ltEpAyObdbjfdmw
	df+SV+mkkAX5RxuidLGNZzaqw4nUhSDXp/Pwnx34MLZujGdBznynoiKO5gp02Z6U1EfuQjrCZa2Pf
	f3ANxus1ByuROeZRMhI8pe7VibIAEmThzNlUpBDFaELJt8aSXqd6Cq2IiGaXM6RgvSnfqigNfCt3S
	jVOrse2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH6MO-00000009s0H-1LE7
	for ath12k@archiver.kernel.org;
	Tue, 11 Jun 2024 18:36:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH6MK-00000009rzF-2bRm
	for ath12k@lists.infradead.org;
	Tue, 11 Jun 2024 18:36:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 330EFCE1C63;
	Tue, 11 Jun 2024 18:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926A4C2BD10;
	Tue, 11 Jun 2024 18:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718130997;
	bh=RCKxxHD3IKIUcqSpL8ezjJy6dgyDehoOCjJuNNVeRZA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=PzO3vHSuynXbKjS4nGxQHGJgeRL+FWGRAKMUbpJ9fvw31wWJSmLLr6tx5kj+jIl+r
	 auN4LQObvcL145JY598vE/dGycou8m5cFz1+oUhfMmZXIPuFYre4Bomiu8p+T8P+Ez
	 0yLyH8LSI7Cp9WA788L7l+DUXACGtxNOSw7NYkRwxSzSBDnoQlFwyI4pj/WFaM95PA
	 BxXIk1iC/ohLUuE+SmsfpNSl9FzIUeS2n9NcQ/jWiQAm8PN8ea2fUyzqyIqmqdGDE1
	 58DfJIFX3FQ/wM1i0IG7DHg+enuEaQXBMKgwqZFvjIbycTgxNdZpRNLhKO2bat+X3t
	 slZKVOffEwhtw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: fix ACPI warning when resume
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240531024000.9291-1-quic_bqiang@quicinc.com>
References: <20240531024000.9291-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171813099453.3564613.760110557004474171.kvalo@kernel.org>
Date: Tue, 11 Jun 2024 18:36:36 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_113640_880118_220D00CF 
X-CRM114-Status: UNSURE (   8.73  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> Currently ACPI notification handler is installed when driver loads and only
> gets removed when driver unloads. During resume after firmware is reloaded,
> ath12k tries to install it by default. Since it is installed already, ACPI
> subsystem rejects it and returns an error:
> 
> [   83.094206] ath12k_pci 0000:03:00.0: failed to install DSM notify callback: 7
> 
> Fix it by removing that handler when going to suspend. This also avoid any
> possible ACPI call to firmware before firmware is reloaded/reinitialized.
> 
> Note ab->acpi also needs to be cleared in ath12k_acpi_stop() such that we
> are in a clean state when ACPI structures are reinitialized in
> ath12k_acpi_start().
> 
> Tested-on: WCN7850 HW2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: 576771c9fa21 ("wifi: ath12k: ACPI TAS support")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

8b2a12749b08 wifi: ath12k: fix ACPI warning when resume

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240531024000.9291-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


