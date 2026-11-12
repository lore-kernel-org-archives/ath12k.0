Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBD6606A321
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 00:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RZxJvPuM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yd6LVojE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ozi/jJGilFFBpMvx3kOD/uL7Gb1XLAv7dVXo80M+VSY=; b=RZxJvPuMzx6S23d3jCE1hTwyOb
	YANmkgPiNZ/23ybHpcLBLnOLnvW76lMLiWQTVhavf1uzzaZXZn6FWxP7QuScIj6ypejeg+yC/ADzH
	44Jr/Ap5Xb4AUXNWYqjQ8yt1I8cJHihvaL+gcu7J6MZoX/dVHCX4WWuXAFXLtL8uuvEPtECD0cAIN
	F6ppL3iKAOQuGIQ8W8kkAZL4XNMSnDG4EhmILhbchHef5LAxshJiBD/v3vY4akiHUVCIZWcI4Dgf8
	9Rvawwjptugh1YCYIH5wIihu+53lcDIyofirnaC2CqCoLTgUPDOsg5pmzB2MCagQ8jUmf16fenHLF
	DERC+CSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRIZv-00000008Dv9-1xlb;
	Thu, 12 Nov 2026 00:22:11 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRIZt-00000008Dul-1VHv
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 00:22:10 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-7d2dc9a7b52so2077121137.3
        for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 16:22:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794442927; cv=none;
        d=google.com; s=arc-20260327;
        b=Ic1oYrNLJIyArwA922//BY1varl87+zvOkKV0cgt7pPtT/hQccHuR/oFC4+xrr6I0B
         1A3KRrkSLUOBwu8zizIAkZgWSZFqw79KDge0OSKhHJrMVirZIvckvyifL/ejyboWN8VD
         ORihpragXjiENe+jhEmhdBogKVpm6E9gw7D17lk8T5X8J587BaImuroPpZovbU/eSsXF
         56xcsft7/UE+tz6w6+MRjLgQbpA4Mr9Gpr+XVyatX3rYZXB0UzSO6vJ1BxJuUMe5pY+X
         yP28pUnC6X6cmRY00IyogGI0QDf6kBGwBD72oQwGGm+O7f3tiS5yvKRxFg8kVfFvl5Js
         y/Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ozi/jJGilFFBpMvx3kOD/uL7Gb1XLAv7dVXo80M+VSY=;
        fh=WVplFDzMun+ohhlgjYSyNfRQ8dNAhL3B+fX7CYdgxmk=;
        b=DPJssA8+7XycxP8B3nf8aAjSsx/+k50u+whuQxeaeBi//+pqc1Y5rakrZ0w4Fs5Ht4
         dbCDJfGNe4zWwCZpIZLTsHCAy81bx39A4ejH5AfPZN3L3leECvYP+exOk6WL0wlx8FWY
         BsOVOmVQPEVzcTKLP0GvzfTfhY2LtNEnQpShv849nnVSHZDCVKgXM/T/EGk8WcS2CxPy
         kkhtj05+J1x/kQTyQhlhxjnrM0S/AgX18rLk8cnzloealahpiVqIe8254ONI4q+aX9p4
         mrqysRgCPLnmHUaD76/5dz2zMcatrQQZz/8ISQ4yMr/NmTzjOK70bEIcyBLMKx1lEj25
         rONg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794442927; x=1795047727; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ozi/jJGilFFBpMvx3kOD/uL7Gb1XLAv7dVXo80M+VSY=;
        b=Yd6LVojEWjSuENUNLGtGfmpXlgYh5ELf2EBTz7GPHSU9ikKybpxY3pQL6fpwW0wSZG
         arrTkIzaIQVJ9iLvdUPE/xwEoZeU61VkhFUB8Luve4FWT7aJJManlkz7S27mCKx3nqRD
         6/4VfeF4A+UeO0qj/uCpBWlDy103h37jlttfqK8S1YG6gBRkUfMGTMwb2GLF6cKsDYJ6
         M2FJNeGNUDcNV50OZgk6cXIcuwijdbjlBuv4lwbSPSCAI6LnhTzQZoxovU2l4tfzZogy
         wHU7Ga1JRI3D808GFIPh6j1cj++24blk4GBJsYhOR/Niu78ATgBNGM/FiTcG7QOLjSWS
         M3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442927; x=1795047727;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ozi/jJGilFFBpMvx3kOD/uL7Gb1XLAv7dVXo80M+VSY=;
        b=0DpkPRwdxic3LRqTnqipyqqBOCSGpTNLRcjQBhuRq90af1fR9N96EJPjUaLEyDacoT
         LfRSxlHq9UYNmsh8wmEE/DB7sgNBwOgsGSEQmWn/ZsZmW3T9bcrTcbvw5hSD1qqB7P+K
         yBAY8WmO/02bFdW1hQv2d9qIxPatOObAE3gEryTV6iT57q2agLuCjaIhnXz1eScj+LGg
         Ac5k7VGplb3Bb3/7p8zpgfRT2hfEqKSQ/399UpqeIz3JL9SBe+V6/hr+ASWxA/DZs7st
         xDGxAF9FiS2K5EKL4XUb6xhljsZwcQL9qGFga13tgYroyj719CR7+jQvDiDvYmboFrty
         4RyQ==
X-Forwarded-Encrypted: i=1; AL+hErFnVy3rf6Z8/bIg7GT7fo+pUgSgaiVHhJg9cIa/NOXCyxDdNYHNwAubO8EO7XbCmnfGGXdkKb0=@lists.infradead.org
X-Gm-Message-State: APuU4Z+m+M+MQ6livOxgAkCZGtvsARqQtT57/QwYWhUgH4WQjjLhX+AD
	+pwgIXwZNMzt0jQWR/977bdERH0bl/VnLadZv36qDHfUREAcw1IUFMD6lP6bF3C40GxM1M0TxUg
	bWvWbZMfI7sOxmXCgJAkZj4Vv8QFb048=
X-Gm-Gg: AYBFou3fhT0fTFOvDxeBT/XSE7wIdeg8XDyHKy0redE7UboshLfNSqUCWIQrOK4jhQp
	UG9VI4FnwWrktmK13jQSIlnkKN61ciFzOmBINBshc5+Cw1figLgrY9DtCRoSfXrhs14bYJKDyrL
	yW1JAOY+RVkxlN4g/B5A4U+DuI/lHC79xI1pJFs4+7xN50w75/7a2NZhTF4rG9x8LRVhdSOiGAS
	JWctycWRLJN3mxmpGdPPEKF4RX8t2F0PcBZrFutGkChKH2w4HzM+Pvtq352VL+93TG123kQiQO8
	9sSEJXKR2O8Hc2YuCJaC+ZyMm+5wvZwSw8vdM9fPwAYn25D11JFqCiHX8c7bA+vLo7OaM6ayAKs
	RJkOmJHCUm/vGyRBOUoTmh7MCWfx6WEq1RoAU06bT8Bkwuj94DweN1ukZJbMoPHfxLwvj59RS+F
	TjZR5t5Md8pYOXrl3s
X-Received: by 2002:a05:6102:6052:b0:7c1:62d2:e18a with SMTP id
 ada2fe7eead31-7d4fb2b00b5mr1487732137.16.1794442927584; Wed, 11 Nov 2026
 16:22:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111-ath12k-sta-vdev-start-once-v1-1-a01ed78d5460@gmail.com>
In-Reply-To: <20261111-ath12k-sta-vdev-start-once-v1-1-a01ed78d5460@gmail.com>
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Wed, 11 Nov 2026 18:21:56 -0600
X-Gm-Features: AclHuK9XczOR4dhNeekHBYBO-ZYIGUvSQou0O_2Aj7mVpoHb3t7HKJ4KtEblBJc
Message-ID: <CAKobHXBJ68qUT5vSPmY3stt1Cfc=toMvGyWUBW7mwfAbfVBTgA@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: stop a running station vdev before
 starting it again
To: jjohnson@kernel.org, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, 
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>, Kang Yang <kang.yang@oss.qualcomm.com>, 
	Birk Skyum <birk.skyum@pm.me>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_162209_429053_74A01508 
X-CRM114-Status: UNSURE (   8.25  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 11:53 AM Christopher Griffin wrote:
> On ath-next this exact patch is compile-tested
> only (x86_64, W=1, with and without [2]).

Since sending, the exact pair, [2] and then this patch, has run on the
same station: the ath12k source of Ubuntu's 7.3.0-1004-oem kernel with
both applied (offsets only), WCN7850 with WLAN.HMT.1.1.c7-00108,
against the same EHT 320 MHz AP.

The test was 13 connections alternating between EHT and HE
(disable_eht=1), then 20 EHT reconnects. With the unpatched driver the
13 connections alone gave 34 timeouts, each station query then taking
3 seconds and reporting no signal. With the two patches there was no
timeout, every station query returned a signal value in about 10 ms,
and the kernel log had no warnings. Tracing showed start, stop and
start for each HE connection, the stop coming from the new path in
ath12k_mac_vdev_start(), one start for each EHT connection, no
restarts, and one stop for each disconnect.

This test and note were run and written with Claude, an AI coding
assistant.

