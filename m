Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F22C87FCC
	for <ath12k@archiver.kernel.org>; Sun, 27 Jul 2025 16:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFOzUj9K5sz2AyUXU0YQv0swbqE5NNAXVR7EWOuA31c=; b=d5Iful1OHpsfFXvt+IuwitmfgR
	tjFcwOHaTARWSoJN/HrLvMPm5KYtnFxeE5GCXupA09rtL6e8dJ0K5LGy2exhJTVb++Qs02WI5NUmy
	HzZS237/IQiPEQkXwXns0XOUbFukga2HPGsLOWhgschCRkUj0P77uruEzeFqBaNwl6t7JJok4NQLT
	oZb4Xxm+WhxI1CXib8+c9TE5Pi8n3sAE4Qe7Fi9d9vwgCYtAGS0f3cdyaDhBJV/z6742ZEytXCL5o
	uPh8MmW20XDsuKjMJf2SIbo6pMl3GEuEH57bbsS4FmjloH7JaVAU2Ikk92kbHjeso0dWj7E3by8OQ
	bf+6Yu2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug3zV-0000000CuCr-1HZQ;
	Sun, 27 Jul 2025 16:12:49 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug3zS-0000000CuCT-2XfE
	for ath12k@lists.infradead.org;
	Sun, 27 Jul 2025 16:12:47 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-61539e2065dso445793a12.1
        for <ath12k@lists.infradead.org>; Sun, 27 Jul 2025 09:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753632764; x=1754237564; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DFOzUj9K5sz2AyUXU0YQv0swbqE5NNAXVR7EWOuA31c=;
        b=ci2GWP21WpXG/uhFW8CPYOnYv5wlOYDTh59t9KI5Fmma0TeW72DpXLmphbR4n/4ZhT
         4THSxmpV//KYi102YymH69vTXQZ+FL9scpMJSdEveon6TUZCCHX7KAn5Bg4CZhnbKwbp
         dj2M6mogS9DAn0knxstc9hLlQy14L9/rotimzbjryEWT1bZ6QbfjCX8Jn2dcQ0nvzNEf
         +J99WpC+Y8ttxadpWGoXg9REwisWEPd+GE9ao0OYu4vp3i2h9cuGrI/IIKxU4OOlnpP9
         67KIl7/57u/kwIRBxJLW2kZPqNoW6r084WGxwcDXKkYTiLFIiafd6F/98UVVVujNmsgE
         uycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753632764; x=1754237564;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFOzUj9K5sz2AyUXU0YQv0swbqE5NNAXVR7EWOuA31c=;
        b=bQ7lvo8MlF/Gl1SkPl65piTonlD2fumr1yAsfnBK6SZRIIjIFEFiD8Z0JOr1BkW+JJ
         Y4OXUwgggJM0zNcDKPeKy8Rr4NijG1xJhCp8YWDuBrieuDmjUX2b5brsyjlJf2DHKgwr
         oX4vm59HhovlZbQieoYlg485UMB3t3GgeRC5yG8AuOiZVEL1Q2bX8kFG8ilTlmyTNx8m
         sJF0+tLf5CClfla04ksIl/NMmQ0Qr1gUFwgt2krKEdjZzBRtAa/C491Knu9rFkTF/wQf
         3DUbk8t9w9arHinUpSAMBsXRo+VxCoIcXegXkzHjjTCD+z/mz234130HraE0FBaywzQ4
         C/FQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+gRK4JmSRggA/v5wvv3mSo3JdL8/iMtvVKsHdqaDl10/8gwhp6XQXVxWXmq9DgtKjzaZ8Cw0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIae5SkfhXHvl28iWJA3BO/XFRmr8wlMq77QaldlKvuR+qZbDN
	qX/w53qeSfsCXpQEindWzUdCY0FYDBLBTsUhOe3RXtQWqwKsfu3yjj5PSqOSpnsjNmIiWHZUvXa
	Hd4R+ln5fGYeRIGZuQDzNwCU7Zw2zFVo=
X-Gm-Gg: ASbGncvqN/IBZfJRa48utM5yndBWZcK8IM3hjtfN445z3nVWAptp5blSgfH9bS/KM6D
	/ytWtB4VsuyKccwwRAf5lyKkqnPZurUm1f3sAr4ZC0JcKCU2urluzXlgh3Lu1waFdoyXGisSZiS
	g0Qnoj7uICLNVD+/sY91vUuYHeGxTj2EQc9JtIl+DqW+Y+YbCdzsnueBPtC7Qsr31kLK9f8aAwT
	I5Cqg==
X-Google-Smtp-Source: AGHT+IGm5oJzXS1VTNxMFbpMraezq4mknIPV6KXIGvaUrUwahRYJxZJl9clULU2n4xwGWn/Ra+UYw+5hvCzryqbbQYc=
X-Received: by 2002:a17:907:9623:b0:ae3:c777:6e5e with SMTP id
 a640c23a62f3a-af61df52d26mr1030351566b.19.1753632764316; Sun, 27 Jul 2025
 09:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAPDiVH8gaBH6o_OY-zUWYpDbj5mhiqmofKGb71gLgHOi4vA=Vw@mail.gmail.com>
 <0ba2176e-3339-4a8b-850a-ca5643939c8b@oss.qualcomm.com> <fd3bd8b1-4108-445a-b65f-4769d73e6e63@arm.com>
 <4a13d862-1bbb-4a98-bc1d-219bf78f7c0d@amd.com> <CAPDiVH-kVCUY8DKexT9OqAZsvkZ5_CGo8d8nENYA-kD=s_x8wA@mail.gmail.com>
 <e008afed-819d-43eb-8895-2c7aaf24ec13@oss.qualcomm.com> <CAPDiVH-xPDmx-KQx7YJY=7+kwJNbGY-rEu-w+cz18p=kjnKFsw@mail.gmail.com>
 <979be2a9-9d0b-4382-8519-2f6fbcac5375@oss.qualcomm.com> <CAPDiVH9Fi3Rw4K4npHMAEcOPMj=iFMEJOyhn5cRaq3+9kBYNZA@mail.gmail.com>
In-Reply-To: <CAPDiVH9Fi3Rw4K4npHMAEcOPMj=iFMEJOyhn5cRaq3+9kBYNZA@mail.gmail.com>
From: Matt Mower <mowerm@gmail.com>
Date: Sun, 27 Jul 2025 09:12:32 -0700
X-Gm-Features: Ac12FXwBICgNG1gWDdZiWG0w1xg4GvfxWwSPgdsBoA9_Nhz0K07_JUa8-TYNFHU
Message-ID: <CAPDiVH_-=DzPjyjDo34-0HG20feiGfrM4eOpkPt6bavrw2qWaA@mail.gmail.com>
Subject: Re: ath12k_pci errors and loss of connectivity in 6.12.y branch
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Vasant Hegde <vasant.hegde@amd.com>, Robin Murphy <robin.murphy@arm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, will@kernel.org, joro@8bytes.org, 
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
	1107521@bugs.debian.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_091246_642649_5BDA6ED8 
X-CRM114-Status: UNSURE (   5.41  )
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

Baochen - aside from finding a commit where stability disappears (from
my last message, stability is achieved when I cherry pick "wifi:
ath12k: modify ath12k_mac_op_bss_info_changed() for MLO"), is there
any other debugging information I can provide? You mentioned that
firmware is a likely culprit; would it help to get a dump from the
ATH12K_COREDUMP feature (commit "wifi: ath12k: Add firmware coredump
collection support")? If so, could you give me a hint about how to
generate the dump and where to find it?

