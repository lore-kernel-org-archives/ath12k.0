Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC51606CEC2
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 17:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A7Peec/s;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oPN/Yfqa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P7U+PpugZaoiRZ3RSWfO6SRjEMCP3t2/Q0growSjEko=; b=A7Peec/sfsAOfh
	RGTyPn6dUA9obLlr4SOzQWuct/zoGHEFQaDRqbt/R7DTe+o/1XilDzrn8jywZrdg0meL7LAAAMiDC
	wrV69m8A7iALS83lge8a0c/ccAgPskCHENzp4Ab072Sva4IyiE9Q29VnxDBbLvD8HvvbHrWKJ50Nc
	295bcJuqXRIByqERJKlEAqy/kjAbL42xp0bnQI5DHuW7iSp5Ee8jrhaxMZCGrr0E0T632DdJAy+7f
	57tDkuzb4q4pj75Kg/oR35XXZEtNrKonAN68KwILlOWC9s881eSzrHK5PF1cqSM/aJFhxZ0Yuv64P
	c2/K8hdDXI0W4WhoElnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNw2m-0000000HUrC-2yco;
	Mon, 02 Nov 2026 17:42:04 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNw2i-0000000HUpy-2UQl
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 17:42:03 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48df8fe8513so2840258f8f.0
        for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 09:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641319; x=1794246119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7U+PpugZaoiRZ3RSWfO6SRjEMCP3t2/Q0growSjEko=;
        b=oPN/YfqaG8zU3EQEwkukL3gsmXYIakmANsObcFqQLCVCot/I+VZulBjQ7CVhlSCqP6
         y9CZPmTflgGcFn889ZzMcnsQBmleSvlMlAluNJXObRaVz8z7IH/+IgDBoNSq6h+MutSd
         c5gLiYPvSzyRLFiHP0nzj4eVIWr5EpFcioIexpf1XLv8B+4LOk0M79roBRGGs9CNXLFN
         P2rNqa5CGQpLz3XSi/vGESd+19oRLEeWx30H2rPE56n72ODdlYicWTirSC/HJp1QstxZ
         5gyOKcowEunTifyh0yFVApg00h4b61UAjlP4oEKKbdkS9E1gqwOi4K+7I+UiF/P6PsDT
         LQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641319; x=1794246119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P7U+PpugZaoiRZ3RSWfO6SRjEMCP3t2/Q0growSjEko=;
        b=B7YRVlVAilFP67CSv017h49iZ/ulVdg8QawGZH9TwjFyggXIqJ1VG9S5wBuJMTbGU6
         oCxdO6jsobM2+XDHq8nTl/bO6I6mAghNAmZMtj6npLkXv5K4iaiIZa+HK2l4vNx5wf/+
         A/PUCkD/OZTM4oZu/q0kYNdmPsIEVhEY8Y/dEcXVGglw4xf6VvVr7vVWWcBIBaRJaX4a
         PXjXFqy9r+iZ88XWm/sMsUekkYy+/JjXqQJ7Ddw1eHsZjlfuMZgbC0AaxVXc+9CJtmrl
         xsi9UXOa5zTucwiM6pzB+TZ6nMNk1Oi/YL0n8N11tnwxklFluc5oHTs8kNUDCnIDldju
         ZcNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbRd77b+0zc/9lpcbQHeFm94RZvL8SAirC/mi2sQm32QDRfJheAty/VSmnMySdumreypMsCuw=@lists.infradead.org
X-Gm-Message-State: APuU4Z9MbzH+YlpXcdOro3XtWdzhUBGflzc3SIcAQzfRUGGWuaq4tmSE
	cMLabT/6uQHUKnkugGuv9aVR7wzIYU0glDE1zMG1qsdaVzO32cDiV7LzifN0iY/SAmp+sg==
X-Gm-Gg: AYBFou0DPiYzSCNe5YFH5Ry86qD0WJfmamSGk9RBuRpG8T6xrX8F2WwtTQXbN25Bctf
	hE0wnrUzZHyNvtQGXiMq9fJPgcQU/dfDM07Ynx8AyDNm4KuvP84710OnGaJ82D2QIKaTszZDdIn
	7wrpCoKWiGyG9zxFPo4C8sguJbzYSbQ1dxDQjIfQB1TnWCuBoFEcw45sVsKBep4DY6e699onebC
	0H62JmNJTqGmHTs+hU7+Rc8u54PpCiGUcKzWAlADhdKYm5RleW16yBnDTaYT/hWybFalaMR3v/d
	UI6cPbs/5p8UYqPhjS1OTu7IGqVrU/Rra+kBIfKGVqUwlRrnF8cDRSZngi712WpSvikIyMGwCfj
	HFjcZxv6Q11fBW31PQQNfymAA//t8GYKgAtjz1+rmm55HoIt0zPq0HQpHPM9yclduA/CLRJ/tca
	DjM5b/WXq+pVOUrSPyluSlyryifwZe1lF3W4VPhRC/OiLub995pcE81hmaANZwRPRiUks875DOW
	G2SvghWoS7tEz9+jB2AeQKjg6qg66lilduupJ9gl931kNEQNboJrmGWDpN7YZb4EYnrwxkyEp4Y
	QKEFJdCeclEbcGiE010Ij+eDgTtu72z9QIEC44R1FA+dSKKCnZgSxVa7mq4vqQ44qzWn0vm7iRw
	yOQ3bKUUNKzjq8yHeZNEyslhU6/Ri1thiGzS3qvvTbqjIAK/2iNxbblRJ69IWbuJIjncfG82hHm
	Aax913c3PDNImyC8qHCAolwIOZyN2fgZa0
X-Received: by 2002:a5d:5e90:0:b0:48e:2bf4:e7f1 with SMTP id ffacd0b85a97d-48e6e518492mr24296986f8f.39.1793641318418;
        Mon, 02 Nov 2026 09:41:58 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (158-199.dsl.iskon.hr. [89.164.158.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23534081f8f.7.2026.11.02.09.41.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 09:41:57 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH ath-next 1/3] wifi: ath12k: allocate the AFC memory region requested by firmware
Date: Mon,  2 Nov 2026 18:41:36 +0100
Message-ID: <20261102174136.37406-1-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <98f13907-fe0a-4a8c-8ac9-3be40edcaff5@oss.qualcomm.com>
References: <20261030220824.915760-1-gsustek@gmail.com> <20261030220824.915760-2-gsustek@gmail.com> <98f13907-fe0a-4a8c-8ac9-3be40edcaff5@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_094200_647053_23589F53 
X-CRM114-Status: GOOD (  15.06  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/2/2026 4:06 PM, Rameshkumar Sundaram wrote:
> In that case, shouldn't chunk->size be cleared when no memory is
> allocated, or should the response only contain the chunks that were
> actually allocated and assigned by host ? (see
> ath12k_qmi_assign_target_mem_chunk() which updates ab->qmi.mem_seg_count)
>
> Allocating AFC_REGION_TYPE while AFC itself is not supported by the host
> looks wrong to me.

Agreed, thanks. The comment above the switch already says that the host
does not allocate memory for regions it does not support, and v1 went
against that.

v2 will not allocate the region. It names the type, answers it with
address 0 and size 0, so the firmware no longer holds an AFC region at
bus address 0, and logs this at debug level instead of warning.

I prefer clearing the size over leaving the segment out, for three
reasons:

- The firmware already treats a region with size 0 as not provided, so
  the answer has a defined meaning. A response with fewer segments than
  requested is not something I could verify for the PCI firmware.
- It stays a local change in the existing switch case.
- Compacting target_mem[] in the PCI path would shift the indices that
  ath12k_qmi_alloc_chunk() uses to reuse memory after firmware recovery
  (prev_type/prev_size), and the free path walks mem_seg_count. That
  needs extra care to avoid stale or doubly freed entries.

Tested with WLAN.WBE.1.6-01243 on two QCN9274 boards: the firmware sends
the memory ready indication right after the response, reaches firmware
ready, and both radios come up and serve clients, with no firmware
crash. The AHB path already drops unknown types instead, so if you want
both paths to behave the same way, I can follow that in the PCI path.

v2 changes only type 10. The default branch for other unsupported types
stays as it is, because this firmware requests no other one.

Goran

