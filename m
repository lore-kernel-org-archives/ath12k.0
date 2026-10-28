Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9527A606A323
	for <ath12k@archiver.kernel.org>; Wed, 28 Oct 2026 02:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ap9aDqZ3;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYHlUm+d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:In-Reply-To:From:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NYvMin0g8ymcP0uul+DR8fa2PSRDTRd2iZ1r234Kwqk=; b=Ap9aDqZ3Hd9ERriHAQGaFEcV8J
	wbSOeCe3lo1qqPULh8lkD/2IuAD4TBvF2jUxGMEeXHtUPBAgRZenyaBnZ6XBrIkMdCCQOx/ta8Oay
	hWtQpjQS6/t3luC3akLMkjlDBZmEni7oZA8unsEjZJG5BVL2N6SNVaFjhV6rYxOnElk3E17kx+PLB
	L+9/a9DvgWbiLpCSAIfG9IrFpli9pKjfqc3mVnmHnqcYaXV2/ypi59Eh3nm4gcaHVu5IvFxNMcQyE
	NqLqGsUNt3Q4fyhe4u/YOLp1LymFHfkyoYy3gcJ6ak1D+y40i0sj56bDdyuPj5/GdAeKdFFCJnF05
	mwYS/FWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLtJC-000000065wa-28oz;
	Wed, 28 Oct 2026 02:22:34 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLtJ9-000000065wC-4BQC
	for ath12k@lists.infradead.org;
	Wed, 28 Oct 2026 02:22:33 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c43373ae89aso57546666b.3
        for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 19:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793154149; cv=none;
        d=google.com; s=arc-20260327;
        b=IYZiM6adGRnqWNSh4yBkv3WR4qJBLJDCiLWL0lkHR/kBI0PskYH8beaosPv4j37tKv
         qg7wYFsl2XlHjJN+8HPRx4FhNPu6WLIIHcr0TJ/XSXKAWHtkTOGU357QgKBTNBftueCM
         ZHT/yBULiJvRDxRvoeiFlL1V6gsq2BbOdCKNsd7q+mvz017reDRIG92AMLREY3r+zHYT
         Fn0swaZYSqZ5IRD4OvHg6J3K93FazH48KlmPjoIXS6QGZgt2lvx165fjkjT/dMdv+rRR
         4C4FOR5mZOrdpma5GFzb+Q+Ij9L0zId24zvo8KzNBwhjPuC1HtdkZIMjkVXXKfJJYxNz
         qDgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=NYvMin0g8ymcP0uul+DR8fa2PSRDTRd2iZ1r234Kwqk=;
        fh=7hKVAqRrL42Bi+DxYRgkBFlQMT1v6H5p2DuBFqyK/UA=;
        b=pXUn6zSHni8UgSgLI4WFl0wynahVd6szH+iLRrXF0NBzWKoUjF9pCQXFmFzckSVvPi
         /8WLRqVIINhYEjFsLzdPntYEc/oGQLdT/n7uyoUIbC5Z0ln80RLjDfxCScPiK1hQl831
         TAv+fNFeoh3DgdJJCvbAH5C0j3tgLpQXpWYC5e/6jl35EP/1lEB6xktjdBBI7BQZulRC
         cWHNwX1BwIbZpfUm9oONDOS4KC1x2QOdIdA0yJW41VV/AT944KTvtQKUYw4f40oEEFrd
         hK42AqdLv8Sgm27zrqsaaP+rFZo0DDAjuYL+oGxK2v9PFurZDXXMvqVlC+spVGr08PSp
         F7dQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793154149; x=1793758949; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NYvMin0g8ymcP0uul+DR8fa2PSRDTRd2iZ1r234Kwqk=;
        b=yYHlUm+dXiVugRQJXSI88hXNSmdZMXUv8z4ZNoDgl5itkWXFe6p1h+1EaAUEhAOI1X
         ItX1EoBOI0FManOxTL3OuDVw/IWfXvvvqV1DH4iId1EIHqBT8RJlCgTPzdDaldwCiK4A
         NuOJM6BVx8sSgSAS7mVuF7QKYMSBGfBAsldahgzvTxt+4UPu6eU4NT5F7fYQGhBz78A2
         KkRsV3Hfrk29n/0AxQ9dVPkpY01Lln7WTVFOkySbgqGtzi/bnFRu2LQAz398vunLrkmh
         vEEWUDGLF8Wp9lBWUucTfvQjyJMuFpI3LhngkSE7rs7Zl6lhCgMCIr6wQAzjc5ODVcv+
         M0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793154149; x=1793758949;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NYvMin0g8ymcP0uul+DR8fa2PSRDTRd2iZ1r234Kwqk=;
        b=hsal8ZbkOeMHgfdriemp4IPGkW5IRVDbL4JBvjmKxW1rHViH9ErQESHqq9t+/w6VHq
         yeJHNfhHiih3c47ZpZrrDWWabn7VHjDI9+AhXjciUv5+kJl6qP/OdboAM2BrNcW0/3Rb
         7VdRZw1jhkXJO+hnOlvxOpaGGNKXAURp3EpHsIjn2l8DHnE74ptW7RLtibhbxlZsE83M
         3GXwzMXTa8EGW6rjQSBpkr4MRugQNc62rwPHS33+AEushLUh9Z1RxEmRWcRtAw+i3gay
         l4iDUqLO5P94mWFkI8mKb9my2L3vhMLgQiKa6aAdpDFU+7v08JEcDsVYC1SSaXMy4KDY
         OGww==
X-Gm-Message-State: AFq9FYKMB3IyZ1Sibl9epJeGPdjLOCJLdh/Cch8xYxnWGnkhl8e+mlB4
	7+O6FBQhURalT0jF1QgIqXadRUoLammmkUO5uwWfvuJRDRSy0uVg3y29t6lP3Kz6Gv/qN7hJ1yS
	VnvinepKGveEnisgI+igO4JhTazY1p7A=
X-Gm-Gg: AYBFou3lhKcbQl1QVOMFVXNFwaUs7UjOXcLiPAfYgljeeUffbvuJfPuT3FPgqWBOe4n
	1Kn/XXSt50fjb+5G93DrmSjKlX0zQt6hEZCoKJJkBsqCBXfQG3laBSMS+weEAwhGiiO1It0CNsV
	oY+0fCSnn8LHlwK0jJeWoA8LPPLUqSQcRJcOjX/RjMyocNY8AWrD8HVhxgA10K9apmEzyQ42eA/
	45UctJQYQ7Ng4NV0lEDujqk/wT8MnyAqjMwldz/B5TYsOlIAdBmHixfosY19f6hMmMaNv3cbRdq
	B/IT7LxkM548Mqlqf2m1RDSNFWtqcZFKQ8qfpYdMGEieCmwCJVflwSCdUfAwrr92XIyk62s1quf
	T2NbDIQJBhjrISFByvrrZqeYaHD9XckF9KZlWCOzAnkPaJGlOp20Y+z86
X-Received: by 2002:a17:907:d92:b0:c41:26b8:c49c with SMTP id
 a640c23a62f3a-c49bdf0b4aemr67593066b.10.1793154148940; Tue, 27 Oct 2026
 19:22:28 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 11:22:28 +0900
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 11:18:17 +0900
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Wed, 28 Oct 2026 11:17:14 +0900
From: John Macias <dencity7@gmail.com>
In-Reply-To: <CABkEBKZtaWkvxbhnOPBUjbh_iLx-Tyok0PskhduQk4O8qq=NVg@mail.gmail.com>
References: <20261025181955.2089498-1-dencity7@gmail.com> <CABkEBKZtaWkvxbhnOPBUjbh_iLx-Tyok0PskhduQk4O8qq=NVg@mail.gmail.com>
Date: Wed, 28 Oct 2026 11:22:28 +0900
X-Gm-Features: AclHuK_wdqnes8SIaBY8bLjvfS6x7r9wSEy2FronOU5EXeAQCT9oMMUCLEmzc4I
Message-ID: <CA+KzPsoFGBe4PBJgjKQf-u+aeS9ckNALFjEkra_UoddRS1TPVg@mail.gmail.com>
Subject: Re: [RFC PATCH v2] wifi: ath12k: service all RX rings in an interrupt group
To: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	Jeff Johnson <jjohnson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_192232_063176_009A8425 
X-CRM114-Status: UNSURE (   7.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Tamizh,

Thanks for reviewing this. You were right to question the grouping
itself. I am withdrawing this RFC.

The reproducer is downstream only. The submitted base and ath-next at
7b14c8f4a961 have at most one RX ring per interrupt group for QCN9274,
IPQ5332 and WCN7850, and there is no QCN6432 entry in that upstream
source. The downstream QCN6432 mask groups REO rings 2 and 3 together.

Its hybrid bus provides eight DP MSI vectors, with ext group i using
DP vector i % 8. The mask uses groups 0-5; empty groups request no IRQ,
leaving DP vectors 6 and 7 unused. The host programs each ring's MSI
data from its group's vector. Moving ring 3 to group 6 therefore gives
each RX ring its own active vector and NAPI instance while retaining
the original single-ring handler.

That configuration now works on the Slate 7 in a short hardware test.
The tested module was built from the 25 October single-handler source
with only the RX mask changed. All 16 four-second single-flow downloads
completed, at 890-1166 Mb/s; the old mask and original handler completed
9 of 16 in the earlier 25 October test. An eight-stream, twenty-second
download reached 1208 Mb/s, with the slowest stream at 72 Mb/s. All
four REO rings received traffic, and the new DP-group interrupt was
active. No warnings were recorded in the valid runs.

The driver reload also needed a Wi-Fi reload on the Flint peer to bring
the backhaul back, as it did for the installed module. These were short
tests in one session, not a soak or a measurement of CPU time or
locking cost.

Your other points hold for v2 as posted. With two busy rings and a
budget of 1, its fixed descending order serves only the higher ring;
the lower ring received no service over 100 polls in an offline model.
Each rx_process() call also takes srng->lock, and an empty grouped
ring can be visited twice. I have not measured that cost.

For the tested downstream configuration, separating the groups avoids
the need for this RX-handler change. I plan to address the mask there.
If QCN6432 support goes upstream, it should use a suitable per-ring
group configuration rather than inherit this grouped-mask problem.

Thanks,
John

