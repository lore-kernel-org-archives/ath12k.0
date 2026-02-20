Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685A2E9A049
	for <ath12k@archiver.kernel.org>; Fri, 20 Feb 2026 03:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBCVCITHSPHOtdPeXeQFYR0LVpn/8nDrkgwjl8SXPCA=; b=TP31o09Ia/2DRgaA7FQfsIHi24
	xZ/98YyzawI+GC+q9PlE4Xd6gAXp2Qtp6Axj+OUTSMYrvVT85F+0O9/1Hfm1KIhsOTLDJ8Uoscq8M
	F0rl+bZcfOh5meATli5Cc5ZwnJeJdIe0MkbXjx9jIOCHeAZCn854fXNJgXjN0nLUf71ABgA5LyIAJ
	HCYQgKtQlp9IWfkDWdiOUXqt725Gu93pwNxOQ/iKW6tims/zA9BFQ7oXD1rJ/ehQBfDTBkYQFuXFJ
	XwkUn/5gUcTTRexVIOGfDjuKaCWcX15ovB5ruPLzq9y6CNEyKwyzYew+3seTb/QVL2XDlZ/SvjVd6
	jKbPJpuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtH4d-0000000D9mC-2PJb;
	Fri, 20 Feb 2026 03:20:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtH4a-0000000D9ld-3GS1;
	Fri, 20 Feb 2026 03:20:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F4B540670;
	Fri, 20 Feb 2026 03:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 938E0C4CEF7;
	Fri, 20 Feb 2026 03:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771557652;
	bh=wgWPPCRutcpO0Vhe/8Eobv+T7qlKLjGdFeswF+1azuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WTJJkWdwSDM3vKCDuXGH7+QA7AxvOe4/p4VvANZJGC1UXLvxckICmzFt1ZsiEmlgP
	 MqvGYf/lrB5t0UnDAUrz4B6LwFK/8DZaCy7Ci63LpyUE8ESBH70GxDhq7OZYSdHKG9
	 fvLtjZgnUCseWLjoB+PgbE4XHIOTBOA6CjQGO5+RwZWYCuQ6LpEQVetCmzg4i7ieta
	 VlJ3zicDCTHQJRRdW4m2wzDy7/TEbEh+Z2/6houW6nc8Ja1gYmGrwP42KkwmYJ/TrM
	 TpdPUk7fZAiGYeHxYtTgAUEnGY+/Yj/35XpVnYmMWQgtMQaBx/guFVhJrgEZRovJXQ
	 sgHkhwHnXdYGg==
Date: Thu, 19 Feb 2026 21:20:49 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Alexander Wilhelm <alexander.wilhelm@westermo.com>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org, ath12k@lists.infradead.org
Subject: Re: [PATCH 1/2] soc: qcom: qmi: Fix "invalid data length" in encoder
Message-ID: <jys6bzcbdl5wly255nlcyjqrq4tehxpez2ydybm4ae7dalqxmq@s3xcuzy7ckqa>
References: <20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com>
 <20260214-qmi-encode-invalid-length-v1-1-780cb4e98b0f@oss.qualcomm.com>
 <aZLcO4kD5fGtLcGh@FUE-ALEWI-WINX>
 <vexuybqdbf6wx5dxlcdlcy6lwqmxmzonorjn6x5zlzdpxzi3yo@pcqbxitzed2m>
 <608ff2a7-775e-46ae-ba8b-9d9c2f8219bc@oss.qualcomm.com>
 <q2gogah4suu3nftewye2l3iud2nxwdi7ykzqnagnz7npmrurgm@7icn643kozp6>
 <ke3anvhgm7popzmrh3eg272eczhtcmgtho6trkwleczim23lcd@dnaudbsrslhr>
 <1ad37b2f-5f3c-493e-ba3c-fec1a0377767@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ad37b2f-5f3c-493e-ba3c-fec1a0377767@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_192056_880542_B9535A20 
X-CRM114-Status: GOOD (  32.47  )
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

On Thu, Feb 19, 2026 at 01:25:36PM -0800, Jeff Johnson wrote:
> On 2/19/2026 11:18 AM, Bjorn Andersson wrote:
> > I reviewed the downstream code generator source and documentation.
> > 
> > We do generate tables matching the ath12k c-structures, i.e. variable
> > length arrays are always prefixed with an uint32_t field - not a
> > uint8_t or uint16_t based on elem_size.
> > 
> > Looking back at the original implementation of the in-kernel
> > qmi_encode(), we only read elem_size bytes from the c-structure, but we
> > do so into the (little-endian) uint32_t on the stack, from which we
> > encode the message and act upon the result.
> > 
> > In qmi_decode() we decode elem_size bytes from the message into the
> > (little endian) uint32_t and then write 4 bytes to the c-structure.
> > 
> > 
> > The fix would as such seem to be to just update the length fields to be
> > all uint32_t. The problem I see with this is that qmic [1] is the only
> > publicly available code generator, and if we change it to always
> > generate uint32_t length members, we also need to fix the
> > encoder/decoder in libqrtr [2] - which will be an ABI breaking change.
> 
> And IMO that is a deal breaker since it would break the interface with all
> existing legacy firmware.
> 

No, the firwmare-facing encoded length in the messages are currently all
little-endian elem_sized, and this would be unchanged. It's merely a
question about the ABI between code generator, encoder/decoder, and the
client code.

> > 
> > If we go the other way around, the drawback is that we no longer support
> > the c-structures generated by the proprietary code generator.
> > 
> > Worth pointing out is that the structure of the c-code is an ABI between
> > the encoder/decoder, the code generator and the client - it does not
> > affect the wire format.
> > 
> > [1] https://github.com/linux-msm/qmic
> > [2] https://github.com/linux-msm/qrtr
> 
> Going back to the original implementation that reads and writes a u32 on the
> stack, can we stick with that but add endian logic that correctly converts
> between u32 host endian on the stack and either u8 or u16 little endian in the
> messages? Is this specific to QMI_DATA_LEN TLVs?
> 

I gave it some more thought, and discussed a bit with Chris Lew.

If we change qmic to produce uint32_t length entries and align the
in-kernel interfaces to use 32-bit lengths the kernel works fine - and
thanks to Alexander's work, should support both endianes (will double
check).

For the userspace library, the decoder already writes 32-bit fields
(into the u8/u16...) so the situation for currently generated c-structs
will be unchanged and it will be correct for 32-bit fields.

The encoder is reading u8/u16 from the c-struct and encodes this. Just
as with the structs in athNNk, we can change them to 32-bit without
impacting the encoder; as long as we don't change the encoder...
The only problem I think we have left is that we can't fix the userspace
encoder - as this would be incompatible with current clients (u8/u16
can't be read as u32).


I'll take another pass tomorrow, to review this, review Alexander's work
once more, and prepare some patches.

Regards,
Bjorn

