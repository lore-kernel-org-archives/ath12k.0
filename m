Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF64ACA6002
	for <ath12k@archiver.kernel.org>; Wed,  7 Oct 2026 19:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KayE3/SyjjFQOr44Kz1JboHOCn8bY3ikVmPC3EhEDNM=; b=DU2p55h8b5oJ++d2+MgB6Vqzlo
	JeUP8WJrM6puGPFEhSyPHN/Jba9R58XX5kw+cz/GxcmxTAtfcFepD4/5XLu41mdjKHg0YhZ1S++6j
	PoxHANGldhYBEEUy6Kh2YGTM9gEATS+VqauSnPHr+uq4UR4wb6EyQ3y6ewbNVs+E8yWu/CZFPgE+4
	pZ9DWJpNQ1ayinIUKA3L55S6mvM5qNSd54zZyMKlVdiTtXZ/TxecOefOdk1K+YRCqGkpb1SoVp9xX
	GrghayVO9kcgkxwQo7m7juYWuX6Hu3Yn8kLvD+tkAG3lpSH6zQa4ggV+mWvEmIBq4BSNRzrjpL8U+
	bVRABTTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEXAs-0000000316H-3tY5;
	Wed, 07 Oct 2026 19:19:34 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEXAq-0000000315w-39V2
	for ath12k@lists.infradead.org;
	Wed, 07 Oct 2026 19:19:34 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6aa97edc48cso1501606a12.3
        for <ath12k@lists.infradead.org>; Wed, 07 Oct 2026 12:19:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791400771; cv=none;
        d=google.com; s=arc-20260327;
        b=k0prbkLHcnuV47I0gpdB/PBSA/A4coxBYNdZHReCdOwvU81V11Gcvz+Ib+48a+QJ2Z
         I5goFxTMDkM8NQfe4jib+KE5pXildvpJoKJpOhOydDlRVb8js/C5+mFVUx/5X17R06QZ
         gxAh/ZKVWMpOoKykrTICa/FYMqdBFHetjQkndzbrqtDc9lwI0100ctRJh1EX4p9DCBd0
         H6IdvwbtIT8Sxib7+CfdjoQ0RxIvgsQCFJE84QaOd6U+AL5M2JqmeMm3DiO7GtVZhVbo
         gOiKy78PD+1Ggg+6lQdntFP+CblEesF4kU1pcnJFdG+bds8on74DBgcjW4lz2lgvkZ/w
         6bMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=KayE3/SyjjFQOr44Kz1JboHOCn8bY3ikVmPC3EhEDNM=;
        fh=Wj1P1aJ8t69RK5hEeJLKCQtUFKICWjNl8avssWlh1dQ=;
        b=fI/yw5y98oIRkmDEOXrCNFLIomt+mHs9uybsjydr0tvpe15gnI2MJZou8G48ANqfay
         El2ryUCnqkY+WDpeHGDSrvWZB0IetE/PZpwnHZEn4hNB9itrsJJsmtb0OteG9PTE2Crs
         dD/QWsy6D1PgqoXHU6/+cd049dZjIwLe7R9fQWKoAWTEKKBjSXNOOgNlfV8yPiAsFvdG
         2B8EgYdWvnvkMqVqqY6UEgKglYGHcAfiirHlny1YnXaU0EwTmvSpTY2peAPydOK8430i
         apGQYnsqTe4EzWEW+1fQpWIkwyADyeAjnmz8aRnga5Xi3QiXGmMr9dDpyf+wFimowuqC
         6dHg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791400771; x=1792005571; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KayE3/SyjjFQOr44Kz1JboHOCn8bY3ikVmPC3EhEDNM=;
        b=JLwfUgX2lBRkkqGyOvYmKSRTgNx7Nd2NpSG0QzgxaLBRDkrA3tT8F/dRjOxHtoIAqH
         aZIkrRufzx+TyMuHZ2fP5EWvNyyC1n5jYGWbldDakMyHlGQ7y0vItscCJ6Q/pn7Ou7i/
         2201coGQhKaCabvnjZ0uEBQefUSdg3ZPo54FWKydmVcfT9Ar02OX9H01P+oFNIxU7tkP
         JTQERE0mqc1rqwfIurdamP6eTQW8J9zzWn0Y7ND7mLOKIy9zGuBDM9JgybFZ+QHwKpL2
         szpO8lBXkZnwJ4Z+g9zUh4LnZFKkP6AZE8VK3yUgUAK+v/usuKgwOzCOJ1RtfzkgfvzV
         9hNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791400771; x=1792005571;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KayE3/SyjjFQOr44Kz1JboHOCn8bY3ikVmPC3EhEDNM=;
        b=pezRv6j7w86pmsoSOIuztvxqEN81/N2PzRgzTQMapBr3mJYpSD2J5aF5gpl9VdgnXD
         aR4qnxLdR4Pbf7M45ibvqcoeiJxoYZV9NMTRb67sSjo440S3h/U1oRsKccmhTA/PyZmw
         edtNZF7qtEsL2EvYp0OO1JOprv8Qmltx5ba2ELw0DVIa4eSW1YLGiXDvY14OYwNyq6Nb
         aWQB4jZthl62DhdPG3D1HsCdJ4/T4x6KyzG6mY6cntCzi3aF8Y6qDRJ2KHWExOcjDyCR
         gBuBpgTYmDFw0h6VgPihU1SdN0CKjBfdewGluX3smCYmbrGWizdWo4ANb8Ez8KsivUos
         hPnQ==
X-Gm-Message-State: AFq9FYLcYfDcYCVm0jtVPpJpGX+bdLuSG9SDWJV2c69eprJdUNrvTWUg
	CzPJTP0xZApkbjDlDIrqA5J8RvmgQLWgCs90EIwvpjZPKcU354bMjiZu1jK9xJlOI7mj15Amh1j
	NNYGa4Wyc2ZgXvix9GuZM/XiBV2+Z+Z7BpsT6
X-Gm-Gg: AYBFou1b7iDrJLFeCaB65GDX80MF+478UIjNoMSokoU+t8AmKVyfVgZZGCQpT/H76Vu
	7sBpLbbVKr1h3v+0PlbfGGemsXStAYwAjxj3NXlotjehbHFTQFr/bJT1zqSDQnb40yBfJ8KVCxW
	iKBwZHcJmyPhNTXgCix5kCe3jeycTrfRS4n2llP5NX1Rr9SVu0Urn1nuEleGDDERpib5yJ7/TlO
	Gy4zLEM4gz2hWzrBwMJydt/hnJfIY9g0B+1ZBWi3Brss5voMjAKSLGgpyyUa5t1B1XEiX4X3f3C
	Ag0XJZaZ9odC5QycsvcrZ1ieCcABtRzfIJJ84ZC7PeH0DvJxWXbPfA==
X-Received: by 2002:a05:6402:a0ce:b0:6aa:f198:4e39 with SMTP id
 4fb4d7f45d1cf-6aff576f60amr2667054a12.44.1791400770578; Wed, 07 Oct 2026
 12:19:30 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 7 Oct 2026 15:19:29 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 7 Oct 2026 15:19:29 -0400
MIME-Version: 1.0
In-Reply-To: <d9eb2d99-79f5-4e18-8c6d-4877c73cd5c6@oss.qualcomm.com>
References: <CA+KzPsr13czsH=k_UWJqj48C4Vsb-diQ-tiCh7W4XW31E8WzHg@mail.gmail.com>
 <d9eb2d99-79f5-4e18-8c6d-4877c73cd5c6@oss.qualcomm.com>
From: Zephyr Madera <dencity7@gmail.com>
Date: Wed, 7 Oct 2026 15:19:29 -0400
X-Gm-Features: AclHuK_g5qHDRfiZYY84WU4i1SUHzmfE868se7RvisRstKlGrgaT1DZ9gGbbo1U
Message-ID: <CA+KzPsrPsUjqo95wrtvwJOYtdoNBejyzuYk09B71r-rND_D-ww@mail.gmail.com>
Subject: Re: [RFC PATCH] wifi: ath12k: service all RX rings in an interrupt group
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_121932_816518_EF6244E8 
X-CRM114-Status: GOOD (  22.13  )
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

Thanks for clarifying the need for QCN and WCN coverage. I understand
the concern about changing a shared datapath.

I have access to QCN-based hardware, but no WCN7850 device. Could you
clarify the minimum testing you would need for this particular RX-ring
change?

Since the initial submission, I have checked the patch against ath.git
main at 17e4b9ea527b6c9491bed60f646bb2eff7d8db7b. The baseline and
patched x86_64 driver builds pass, along with source-matched
regression fixtures covering multiple rings, a single ring, an empty
mask and shared-budget handling. These are compilation and
host-fixture results, not a substitute for hardware testing.

In particular:

- Which QCN/WCN receive-path differences or failure cases should the
tests exercise?
- What traffic tests, operating modes, duration and instrumentation
would provide sufficient coverage?
- Is there a preferred firmware version or kernel baseline for that testing?
- Could a maintainer or community member with WCN7850 hardware help
test the patch and provide the appropriate testing attribution?
- Can source review continue while that hardware coverage is arranged,
with the limitation stated explicitly?

I can document the testing performed on the hardware available to me
and provide the focused patch and reproduction details. I want to meet
the acceptance criteria without claiming coverage I cannot verify.

Thanks,
John

On Mon, 05 Oct 2026 19:15:52 -0700, Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
> On 10/5/2026 5:48 PM, John wrote:
> > An RX interrupt group may select multiple receive rings. The Wi-Fi 7
> > handler currently services only the highest set bit, even when the NAPI
> > budget has room for work from another selected ring. Walk all selected
> > bits and retain the shared budget and existing early-exit behavior.
> >
> > On a locally adapted GL-BE3600/QCN6432, group 5 selects bits 2 and 3. A
> > host regression built from the actual RX block completes 3 of 6 queued
> > packets before the fix and 6 of 6 after it. Single-ring, empty-mask and
> > two-poll budget cases pass. Descending priority is unchanged; this does
> > not establish fairness under sustained traffic.
>
> see:
> https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/submittingpatches.html#tested-on-tag
>
> For a datapath change I'd need Tested-on: tags from both WCN and
> QCN chipsets since they have different requirements.
>
> >
> > Signed-off-by: John <dencity7@gmail.com>
>
> See:
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
>
> >
> > ---
> > RFC validation and limits:
> >
> > Source applicability and the host regression were checked against
> > backports 7.2 plus the 230 wireless patches from perceival/openwrt-flint3
> > commit 2365932733ca8ec3b346621d9cec2eb3df3b2cf3. The new patch applies
> > with zero fuzz. The same source-block regression and exact patch
> > application also pass against official ath.git main at
> > 388d3c42e8aba1cfc3c6d2c52877a46d8cf740db (zero fuzz). No full module
> > build or hardware test was performed against either current revision.
> >
> > Historical tests on Linux 6.18.39 with local backports 7.2-rc4/QCN6432
> > changes passed DHCP, DNS, 32 UDP flows and about 181 seconds of traffic
> > after reboot. These are bounded observations, not throughput or long-term
> > stability qualification. The contribution was developed with AI assistance.
>
> see:
> https://docs.kernel.org/process/coding-assistants.html#attribution
>
> >
> > --- a/drivers/net/wireless/ath/ath12k/wifi7/dp.c
> > +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp.c
> > @@ -52,8 +52,10 @@
> >  			goto done;
> >  	}
> >
> > -	if (dp->hw_params->ring_mask->rx[grp_id]) {
> > -		i = fls(dp->hw_params->ring_mask->rx[grp_id]) - 1;
> > +	ring_mask = dp->hw_params->ring_mask->rx[grp_id];
> > +	while (ring_mask) {
> > +		i = fls(ring_mask) - 1;
> > +		ring_mask &= ~BIT(i);
> >  		work_done = ath12k_wifi7_dp_rx_process(dp, i, napi, budget);
> >  		budget -= work_done;
> >  		tot_work_done += work_done;

