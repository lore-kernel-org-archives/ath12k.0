Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C488AF46442
	for <ath12k@archiver.kernel.org>; Mon, 16 Mar 2026 09:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=52dCtZyqu9l3m55TXZxen6TA8x1kB+1mb1pKORuXfmY=; b=Au1VqZyp2i8EWBimIMqnnf66/8
	fa5zU/VSnHggeabrMO253w5vjsN3xrOEcvZflkg/n2YFoHbhAhuGS5S2p1sc08P/ApPy6Elpq+/NQ
	FtpS3JAMQV6SKCV+tEZt6ffUQxnrPOjM3rdAbY3fIatFDDVWY7Z0seMw4nzmKoRcs5ay0umkkwJ17
	1PaeSk538ffO3iRDIKmeVKldjmJjFgixDOLRp6kin32ky8/jAMObYlSOGHykuVZo88pE/lwsRwaa+
	ZwhNSwUfHacKuBR1UgpN/ASPg0N2gDwK3wyzaq93CXi30IXev1us0BlaglFqeykbpCoTOc7H3Z6Ig
	ixCE11Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24gg-00000003iLK-2Ak8;
	Mon, 16 Mar 2026 09:56:38 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24gd-00000003iKo-3IIX
	for ath12k@lists.infradead.org;
	Mon, 16 Mar 2026 09:56:37 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-5fff77ff69bso851917137.2
        for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 02:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773654993; cv=none;
        d=google.com; s=arc-20240605;
        b=LSfQYt2NsUERvAgAnCFQ7T9f6ECWfGerTcTSyuYGpyt+F+FRyG9aHWeFplK4jjDxIW
         a7IyLi0cq5yJWGL7fLvCZZIsuuj1rxTLQwUuki1QIjQDcjXWQ2rxOJ+iOTH4KiQbSCV0
         vQ4ShY+2JtfLJAqHvPeJ0TXZerR/yym2tw4IPMRH8avujww1XR+tUekAIQzclNcnYh3K
         fhZ/Dn+aAud1okXwf1U0Ud4EzUc6MCqj4YzPDIr3X9fdgm+6b1a419blp8NMqAOYUCBE
         NYXkBiY4EBCNowmPwCpE0Fy1GeCSvFsJl6MGP+l8wOPHKUGQvN9BGnPFWLTocxb147YJ
         2tUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=52dCtZyqu9l3m55TXZxen6TA8x1kB+1mb1pKORuXfmY=;
        fh=emziyvsHIVDpQz2NEU4wWtqdqlGBVHkdsZ2KSiFYoAk=;
        b=Wv2ZRBhwD3ee+3cul7IlCxKAfM7ShjG+CnFsWTUzGjb4NziEhuPJC4VfbeYXwjkG9X
         PtRUJAWhXiUEtKAvl+8CwWexlRVd90sAUFCqOOXUhOL2YT5clFawMAeXo3/NGOaHr81T
         8PIVTD8hTWoXKFAZXyUbSYQocpTvvZkA2NWIw/u7G1Maujq8hvGi9h7O8gMvhn3Uo5zQ
         4qSpB7cAsR1/RY5zHzc5EZbgeFAL0IGdbEbjE43qyXzf6DE+JeGdEAyHXd9lb5Koyzaz
         T5THD+NWUCjXhPk2PB9XF4jnSOJo2IN1gR30gJVNfMJQ+niSJo5iZm0Qx8h1K203Y93d
         PWng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773654993; x=1774259793; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=52dCtZyqu9l3m55TXZxen6TA8x1kB+1mb1pKORuXfmY=;
        b=HifhhbOPEoxAhhIySMPPS6MVRNqFQTGU1kxH7xoUecb59IUSS2xmizJ/zQsuoz5URL
         ZXEVXezBcleb/fhrRC2FVfgTi2fGheDCsA9a7vT8Hm6+05PxMaNIYHRlh5LLrBhbmLSW
         Rb/t8Cp2m4domeSDPMZYplFo9GJqbBLecJJPJfyS7Vp3glLZAckq/OnEw9t5QCSmVaRv
         mL1IWPk3H+VFSj5uHcJ0dc9QRUYY47YrMXUmz54vCP+IbwuHo4jD1tWe1VggkHxuumaK
         4YP3nqyqO2xdA8pjrFmUYx6Ylhxr1+MU7XdQknlOAKpa0tASMHM1slI/YWlZvmB3bE0P
         c1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654993; x=1774259793;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=52dCtZyqu9l3m55TXZxen6TA8x1kB+1mb1pKORuXfmY=;
        b=XArb9wb7EP6MFIHH4dC0toCW7qbQmA23a3W6BMb3jtLP408oSbAdibh1ZDEuOwIhms
         2C0k9E0u6/WRl3f3u2W3W7sAV5Dv9iRkiWO4W69pXqZ35yO4lTW+B3/GpHRLud48qHn1
         gE6KbYCB1mmYCu7/+lFboZtEq2L0o+lpT1P0W30VLtMU9Kkl/l5P8dcDWiSUedI0IUnB
         1nCW3bORrIiHPeZ/8KehlsB+jf9+KjGXBgKdXCuModLm3PQafJuhpsEb74lAQI69njVo
         aeKNwRgaNp2zuBlBxn3bef9B4/kT90tQbne8POoE/Hv1gmFQKDHTgHmqHeDWs4Wa8CeK
         xlvg==
X-Gm-Message-State: AOJu0Yw1FGeyhUJ/r97oE3IzVLzM3ETZQxgsDKIZO5hcdp/mjPSYP/eS
	It8t1Trx2V1cFupcmqlfYxiUW9UsFrRgFEt7LHwRD6tg4ggoxaPOhq/wtwBuEyQTKt1QMxqeFNn
	cLnVGxuz4Q63gbDHlZumKJAjkIE+YJchVQprLK2a9HQ==
X-Gm-Gg: ATEYQzwPrqXNcx+JJ0uXxzZ01yWzkI6A4o5af+6lyMBwk3BFrOhP0poy6sYF3NMzop4
	ecKRZsxZG0JyhyEXcJWxK5EWRQr2GQhzENddgZ9KjCOPgBV/k1R5qEs6310fXxuNRYmre1lHDX0
	Bt0mmE4Xy/+R//uhjRC2H0a/Efz47KdJf2XtHhUWg6MkfirENrLwxL++2qqEHr/fD1HuHB2efEx
	vfVPcLkER/f7FRSLf6eP+pFi1LypYXhc1Mo8o2F26DouefPQp6DtK6/ElR6Jt9BN0Go0AqfPaF5
	OEviBRH0
X-Received: by 2002:a05:6102:e10:b0:5fe:49f:e89d with SMTP id
 ada2fe7eead31-6020e5ebcb7mr4468330137.36.1773654993053; Mon, 16 Mar 2026
 02:56:33 -0700 (PDT)
MIME-Version: 1.0
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Mon, 16 Mar 2026 17:56:08 +0800
X-Gm-Features: AaiRm50PH6XFv6ici8F5QUZzuRArrjsCikJJPMQndak7EEFrFAiAg_m7ucCj5Kg
Message-ID: <CAH2e8h59Sj=9p5N1NFSXu=nXQ1pGRmPd5k4kHpTye4aG4E1Jpg@mail.gmail.com>
Subject: support for WCN7880/WCN7881?
To: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>, jeff.johnson@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_025635_828742_52130B92 
X-CRM114-Status: UNSURE (   3.37  )
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

Hi,

WCN7860/WCN7861 can be found in some devices equipped with sm8750 or
sm8850/kaanapali chipsets. Is there any progress to support it?

Best wishes,
Pengyu

