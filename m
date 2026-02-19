Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A19DE9A04F
	for <ath12k@archiver.kernel.org>; Thu, 19 Feb 2026 19:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgCcEQscnC1A0M5Z+eU+ZpUVs4h+tvl5CBYetUBPG/E=; b=CXS4gL6ciqiC8XUw2drlmfEXQW
	vMQUIMTXkBA8pqU9xmpHgX/Lpagt+L24B8QMOa4s3YeDpyN0ukKqMIGEfwlnl+PFf9/jZ+2ZJ0Ew9
	E8IR5jKTFaJXN86vq/KsL08F8Aw3bEEvIl06yrHAq/lqmMPN3jHr4v5f9gdeDanJF8E1y0tPG0hwk
	pDqzmNhp7A+S5hOhU6nGbWdzofw2myZFhQy93La9ukUF/xHJoFP5jd+VOQRSjiqIQAdlagA0KGrfW
	2CbncotptKaYYzkgGja46n48qtMbHbRHk0Kqz245TYdusKfEAsRfGwOhQNpNhpRXRQswKni0jg1W3
	HvAeqwxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9Xh-0000000BpW8-4BUY;
	Thu, 19 Feb 2026 19:18:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9Xg-0000000BpVL-0kYP;
	Thu, 19 Feb 2026 19:18:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0462B60054;
	Thu, 19 Feb 2026 19:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A723C4CEF7;
	Thu, 19 Feb 2026 19:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771528706;
	bh=gvXBwyLFdk3xxBFxRxUSJbv6JkCAypUGLwGbTH/OBCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YXexcDULOjzDtA93bwTJbt66rlxWvePfarSZ7k26QtLaKNqU6T+CWX6UdHtWp/MGT
	 JcUiYSscYQTLtwOQff/J5lt2XrQLKeTnn8c0JZOVNm7fCTF04JAIgkQfAcpINhIain
	 biUi47EYDyxPtJgId52KmRmQtDjrrTULDAlVBtKyzs3pff6p3S+nVUGYICuA3zPyQi
	 Co+HbvuXtvRHZR7AAGU1BgG2134yjsjtv1RVOsqGcJSAvfjhMTtznX6y9MOWztzwst
	 jIw3RTQ817uv4tbW8DZL2Klxn1HR7pt0R3fzYqUByU4AjW6ebXBor+UzYXcnJbwUkd
	 p8z8H3Hov92eQ==
Date: Thu, 19 Feb 2026 13:18:23 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Alexander Wilhelm <alexander.wilhelm@westermo.com>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org, ath12k@lists.infradead.org
Subject: Re: [PATCH 1/2] soc: qcom: qmi: Fix "invalid data length" in encoder
Message-ID: <ke3anvhgm7popzmrh3eg272eczhtcmgtho6trkwleczim23lcd@dnaudbsrslhr>
References: <20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com>
 <20260214-qmi-encode-invalid-length-v1-1-780cb4e98b0f@oss.qualcomm.com>
 <aZLcO4kD5fGtLcGh@FUE-ALEWI-WINX>
 <vexuybqdbf6wx5dxlcdlcy6lwqmxmzonorjn6x5zlzdpxzi3yo@pcqbxitzed2m>
 <608ff2a7-775e-46ae-ba8b-9d9c2f8219bc@oss.qualcomm.com>
 <q2gogah4suu3nftewye2l3iud2nxwdi7ykzqnagnz7npmrurgm@7icn643kozp6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <q2gogah4suu3nftewye2l3iud2nxwdi7ykzqnagnz7npmrurgm@7icn643kozp6>
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

On Wed, Feb 18, 2026 at 12:53:03PM -0600, Bjorn Andersson wrote:
> On Wed, Feb 18, 2026 at 10:00:22AM -0800, Jeff Johnson wrote:
> > On 2/16/2026 7:25 AM, Bjorn Andersson wrote:
> > > It might very well be that the underlying bug is my expectation that
> > > elem_size should be reflected in the struct and not only in the encoded
> > > message, and hence what I wrote in https://github.com/linux-msm/qmic.
> > > Perhaps the length-specifier of an array should always be u32?
> > > 
> > > @Chris, what does the downstream generator produce here?
> > 
> > Is this behavior just constrained to QMI_DATA_LEN TLVs?
> > 
> > I'm looking at downstream Android WLAN code and it has the same discrepancy,
> > so it appears the code generator is always producing a u32 member in the host
> > struct to hold a QMI_DATA_LEN member even though the actual element size as
> > defined in the qmi_elem_info array is either sizeof(u8) or sizeof(u16).
> > 
> > Does this issue get fixed if we change the member in the host struct, i.e. for
> > the issue mentioned (that I chopped off) modify:
> > struct qmi_wlanfw_request_mem_ind_msg_v01 {
> > -	u32 mem_seg_len;
> > +	u8 mem_seg_len;
> > 
> 
> Yes, that would fix the problem.
> 
> But if your elem_info arrays are coming from the downstream tool, then I
> think the correct way to fix this would be to move in the other
> direction and turn some those u8/u16 members elsewhere into u32.
> 
> I have the downstream code generator source here somewhere...
> 

I reviewed the downstream code generator source and documentation.

We do generate tables matching the ath12k c-structures, i.e. variable
length arrays are always prefixed with an uint32_t field - not a
uint8_t or uint16_t based on elem_size.

Looking back at the original implementation of the in-kernel
qmi_encode(), we only read elem_size bytes from the c-structure, but we
do so into the (little-endian) uint32_t on the stack, from which we
encode the message and act upon the result.

In qmi_decode() we decode elem_size bytes from the message into the
(little endian) uint32_t and then write 4 bytes to the c-structure.


The fix would as such seem to be to just update the length fields to be
all uint32_t. The problem I see with this is that qmic [1] is the only
publicly available code generator, and if we change it to always
generate uint32_t length members, we also need to fix the
encoder/decoder in libqrtr [2] - which will be an ABI breaking change.

If we go the other way around, the drawback is that we no longer support
the c-structures generated by the proprietary code generator.

Worth pointing out is that the structure of the c-code is an ABI between
the encoder/decoder, the code generator and the client - it does not
affect the wire format.

[1] https://github.com/linux-msm/qmic
[2] https://github.com/linux-msm/qrtr

Regards,
Bjorn

> Regards,
> Bjorn

