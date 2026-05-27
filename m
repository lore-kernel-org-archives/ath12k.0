Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70051CD5BD0
	for <ath12k@archiver.kernel.org>; Wed, 27 May 2026 21:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YQOFDEn/esbb8Spr6eRaA0TCzjbs19zP6cHL+qvQg0=; b=NxF2ye5s+jcfJk37jtf5VHx//5
	3TOmBGgq8Ik6wWm9W81mSTtmuvVGJCxN71z7nWW0vHjAchBE5QZZlpJhrHlUbPNTiofi6kTwlYZwM
	XXwpayDQUoZ2iatybb1sV/I0qWgk0+StCqw9NGWByfA7zMxUR1P9ZDEScp7SxDtylN/nV7QNcwKlD
	z3UBLOEqWD1v9Gbbqc8rIf3oCcpnZw7lCYSiHZB9AyeNPgOTVzVsxwnWZxTfKclJUfsqRRAes7KD3
	1Bx0jGHYhbfee8wgQRwsPx1vyacvfXdQjR8d4AxuoqT4MUV40v7lCHcc0WCRZa3nYqQV2Y4WhydbY
	8dOMDd9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSLOB-00000004jwd-3cv7;
	Wed, 27 May 2026 21:02:07 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSLO9-00000004jvi-1IYB
	for ath12k@lists.infradead.org;
	Wed, 27 May 2026 21:02:06 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-9144163319fso1269055785a.2
        for <ath12k@lists.infradead.org>; Wed, 27 May 2026 14:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779915724; x=1780520524; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YQOFDEn/esbb8Spr6eRaA0TCzjbs19zP6cHL+qvQg0=;
        b=VFY+sFA02HajY7xSZ3RN7NjiBU4eakm1lGu3u+1I4z/hUPVeA2oLQux9cXtRkFczDL
         lsAh3ydVVKjMEt6xnMU3EJW463oHENTJgNHylveeNgDJ7Cr9ybWuyx3o/7KR3drplCxD
         +8ujb9ttzvIHjrqXiBVwS2dDmv4ThST5Ine4qGFgeZzbyj/v2XSH+7N9cIe6XkL67Zxa
         EQmYRr7ueGosmTOmys2t3wihyYEA4TBc938kPI5ErAcRyf8CCP2E8s6YHNB9FOyYEDlZ
         Zl6SBsZmh6G8+4y/r0T6iUM8DUMRGfgl1uyzFU9EoTCqtrKVyH8xngQuTiu60ktKJoSb
         Wcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779915724; x=1780520524;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6YQOFDEn/esbb8Spr6eRaA0TCzjbs19zP6cHL+qvQg0=;
        b=nVvYN9w0YZ4recypnUy5bRVCAfPmYoimrgCWWqK6Rb5NjV/R7Qop1zM7Dhkb4+trtz
         KAywTdNNrlKII8Pup5L+FDsY3lL/f3KQemw1HPwDdkBe2G0xnkl/eOsd4pcVvWCQ7e36
         WGobbadcfbep3Fv5Xb3ZQnxV4hLFXR8UvI4ySV61PrvfIycCLFfCSNrDU/j/ATVR/ZKf
         Qac+FNalFiuMZBH3IsIIMJfr5cHmLadsx69X6smHOQjtg6yECIipI4TGDgTJFAt+rfZp
         q92K3fPFYCz1BOQbwdhxDtmZLp/RdMqKDWenE46BRXykq/jxKJJBg4szMMvlbcWU1c+c
         QjMw==
X-Forwarded-Encrypted: i=1; AFNElJ99l5zsKYCAdyzn0alZKZVe8+t3vrdkDGGuLfuPDm1zBH0tpcRZTBkNKZlHrlIIhHo+a3Spd34=@lists.infradead.org
X-Gm-Message-State: AOJu0YzsZv6o18sV1STfbWSHTX9hVvS1eVra7GOmgm1Cf4ihU60gepgb
	34UQSWP7mM+S3VHIUQKqbqRj48CKEzraVQHvr3wVZNrmjqHGg6wezW7s
X-Gm-Gg: Acq92OGyXQdpYCw2rYyWXEREuF2lWOVZYl4JiGNZ4WZ7bfyFBsLvTzoRqFShBtRRhUD
	xmY6Y2sdGPor3qw6uh3dkrkUCF26oWQLUgc5o1RpSfj0sqtjp4wjvNvjtmR/tlxORGdwCpzN3Ze
	UBs3Jg1p94K4iebAxm7gpw9wsmxLEGXeOaev9cBOXehtCyEiTyAuto6PpbYugJPvsG6/s3mkkKt
	9ncDSP4lb0nHuTmCJ6fQ+8Rd5dVbzPz8Lh0qfcHu8qHcb/R27kdqWJSqpfroRejFC676C0akmMT
	ojXDIapQN+zrhiLfrCOo1e+AAcvNiJTQvzNnzv+eN4G++jwPXy2GCTQ3Sjmtk8Fod59kfz7kBhm
	P3LroF3vL0irmGXPQ++/Aw3tEjWBitSJqaO0JthmXm6Po0o9KLl08aDfYnKxqMx3xQ7O98nq8PM
	2PMS2AZdS8k/g2sIc+JULZxKqpZ2UKAinsio2NM2S2S+taN5z66JbXdsw2/EmcViYRnCdWAHDQn
	Q+KCaenhHr/9OH02mr5RH1URtHpRRuWQAWxUSvAUJSPNWnUM/OCuzNwtLmtjQ==
X-Received: by 2002:a05:620a:1d0d:b0:90c:9b5f:84f5 with SMTP id af79cd13be357-914b46ca130mr3452925485a.6.1779915723821;
        Wed, 27 May 2026 14:02:03 -0700 (PDT)
Received: from smtpclient.apple ([2601:19b:4200:392f:e976:246b:e928:1bf7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f8706968sm578168685a.17.2026.05.27.14.02.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2026 14:02:02 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH 1/1] wifi: ath12k: support calibration-variant from device
 tree
From: Andrew LaMarche <andrewjlamarche@gmail.com>
In-Reply-To: <dc8c9c9c-dc85-40dd-9313-845a808a35f4@oss.qualcomm.com>
Date: Wed, 27 May 2026 17:01:51 -0400
Cc: Jeff Johnson <jjohnson@kernel.org>,
 linux-wireless@vger.kernel.org,
 ath12k@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3B9D1FBE-37D0-4902-8C0C-8AB57C1310A5@gmail.com>
References: <20260131003222.2011259-1-andrewjlamarche@gmail.com>
 <A2E3AAE1-1A80-4265-9497-0C95C3308CD7@gmail.com>
 <dc8c9c9c-dc85-40dd-9313-845a808a35f4@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_140205_386746_68302828 
X-CRM114-Status: GOOD (  11.24  )
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

Ack on the deprecation of qcom,ath12k-calibration-variant in favor of =
the
generic qcom,calibration-variant.=20

However, drivers/net/wireless/ath/ath12k/core.c still misses the logic =
to=20
actually load in the BDF, which this patch also accomplishes. I don=E2=80=99=
t see that
in the Qualcomm-authored series you linked. Perhaps a v2 to address =
this?

Andrew

> On May 27, 2026, at 3:52=E2=80=AFPM, Jeff Johnson =
<jeff.johnson@oss.qualcomm.com> wrote:
>=20
> On 5/27/2026 9:12 AM, Andrew LaMarche wrote:
>> Hi,
>>=20
>> A kind ping here. I=E2=80=99m not sure why this functionality is =
missing in the first place, but it is needed for loading caldata from =
the device tree.
>=20
> Your patch duplicates functionality in the Qualcomm authored series:
> https://msgid.link/20250228184214.337119-1-quic_rajkbhag@quicinc.com
>=20
> And note the upstream device bindings for ath10k and ath11k only =
support the
> generic binding qcom,calibration-variant.
>=20
> There are no longer any generation-specific bindings, see:
> =
https://msgid.link/20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89=
c53@linaro.org
>=20
> /jeff


