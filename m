Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADF0C43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 18:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVJE7agHkpN36kqdcRJ3f1sEnJQPMFcd6wB57yBRWMo=; b=djpBqA5mWM9Q9sBW5jBC5t5K39
	36iqujsGj1dN8+/fA29ERc7hSNRN8yClkCkNPWqiVMwVEVKvWk4jvNcQD4w30cNatSSbi11LYm770
	sE8EP80DqP2VNi4Yu87msKYHTqJFobd/gddMCBK9aRSo1WyykqbzLEVbE4BdvRGdnTBHH80BmfVHB
	IFcDHkESslby/f7nkGPME89iZwzZwMncaz66mvsSH93l8p6FL+5YJ8EkMmySXDx8SlTFwJbWbMRo6
	6j8HaTQkiUn/UkeRKsfo4uO28HZJZ2Oh7DeMwkvL+IgMNt26+JwvuHzGlQ11pduiijpsSu2ErkY4X
	Ne6QeN0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weGcB-0000000FLRu-20HQ;
	Mon, 29 Jun 2026 18:21:51 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weGc8-0000000FLRT-25kV
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 18:21:49 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-8f032b47e3cso10278706d6.0
        for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 11:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782757307; x=1783362107; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVJE7agHkpN36kqdcRJ3f1sEnJQPMFcd6wB57yBRWMo=;
        b=Cuaf+txIsa4rFgzgb9FPXe/Xvu8LElnHkt3cX8shRzEl1H0poguT7rtMMxC2kKWZL7
         KazLBYfdeO5oDTx9gnRS6mfJjhoONiyzMuLwjsuKq2Lo46JJ42S+VeWdxg2jFZug0u2M
         RKDlQ28s+5+SL57NVbFpYAtOFjeSXe6dm/Zzqisn/EH8t2NhCoAHTCJD8e4ynTrnEd/M
         cQ2XHTWe/rND9QcJnbK5lVndDZMVo+wjdIgHRWvnnyBFO8BU1L7ltaSjs6zJ/QP9DlKa
         bwBl6G7578nEHgaCsYDTNh5pKD2ePRoiTCo4nvJQd2OvnejPWye/vWOv8CxRee+blbXI
         da8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782757307; x=1783362107;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uVJE7agHkpN36kqdcRJ3f1sEnJQPMFcd6wB57yBRWMo=;
        b=IacBg0R2iV0tAu7ekxxRmIl72b2H9b4N85KzgTj36mGViiOeZtDuRiICIHFWsi1+uU
         a2ciQVsEmiszl5zDIvg+FVX0PuvRnCSRqokEL41+XD7jvKw/6y6ZxgdcVXl1RvAZZq+w
         M+f2A7XBSgd682gz9FS3A+RJ4faZrHwp/cWzM6MdNTPklk8UFJ91dB7bgx6Eb0FD700o
         CoJoXWYzJgrpK3qeZQyFkgUxs1lNWULUiJyJgZVvDVuz4WjnhPwQaooV4tk6nKKwEnTI
         ArCVYNYR8qfqfFxsDGl3x9n5AY+vC8W2xuh+Id/wFWiQvE9E0S5BqqsdThD5ef7MQlFD
         3Dig==
X-Forwarded-Encrypted: i=1; AHgh+RomRR7d5EV/7DbZYs7cjoJVhNl75TghTlph+qINyVpxJflT1c5ulqLhgHlNp3+LQYFok7thyB8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1XyGrUmQI3ZmE0jacqcRy2nxnyLOHQ2GdgbS/M6NemU6w9/iL
	KPU2L1nX9b5LuDPI33G5O6juTjsILgqbWoQPAw9NAEGWpnV7/t6nXvqa
X-Gm-Gg: AfdE7ckJpS4GSp4Wj1RNANZ7y8EiU+zfatwY7JS6rw6vDUW/7iB84YAlhFOwdSwfpeO
	h9Fh9BA9ef0LZyZWptDCxbIdSz5LiH1Mr+NqxHSShN4DEZGcNdXiuhD2cN6jO8pJQu4qbnzIQxm
	laTVrMTgkkb5Xly1M75QKd3spYBl+MAgviJMtsbSQMPZkeVdvIIE5NRjBFIJ5uI+Z4QXvM8MPjm
	M4HNqnNCex6ooT+y/WIv440EmlbdAXEcYCyOoz0NGYL5fZrwRb904do9mI6OYMJKO3jyDRgSrSR
	XdY8+u6Penb02BqLYtrhaTThGftB0f25uCochVUo0AxOgoNpfP0QQh+ls0TTWrkj8L2cmj+5qht
	80ID3RzbRulUr15P/NRX/9u72Z94sNZFWP+Spg54vwHf4hurmv4PmuhVVVDEgGf8S9pjCGjIQzX
	en999KBqo3g0YcEnSlModjFMY4SNSPqA0=
X-Received: by 2002:a05:6214:84ce:b0:8e9:f62b:bee4 with SMTP id 6a1803df08f44-8f1bc39795emr6357056d6.52.1782757306440;
        Mon, 29 Jun 2026 11:21:46 -0700 (PDT)
Received: from smtpclient.apple ([2601:19b:4200:392f::192])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f1a338c6easm4349756d6.17.2026.06.29.11.21.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2026 11:21:46 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH 1/1] wifi: ath12k: support calibration-variant from device
 tree
From: Andrew LaMarche <andrewjlamarche@gmail.com>
In-Reply-To: <rh6uz6bqetobowyrist7hhytdu32v2azvuambenyzofur3tjyj@wghfgwtmjj53>
Date: Mon, 29 Jun 2026 14:21:35 -0400
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Jeff Johnson <jjohnson@kernel.org>,
 linux-wireless@vger.kernel.org,
 ath12k@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <78CFA317-FE31-46EC-8AF7-D2BA989D8B0B@gmail.com>
References: <20260131003222.2011259-1-andrewjlamarche@gmail.com>
 <A2E3AAE1-1A80-4265-9497-0C95C3308CD7@gmail.com>
 <dc8c9c9c-dc85-40dd-9313-845a808a35f4@oss.qualcomm.com>
 <3B9D1FBE-37D0-4902-8C0C-8AB57C1310A5@gmail.com>
 <23fr45actdrqt6rp6fozcaugyk3egs5zm7imschl7gyuuj6cme@3pvdhqv7xvkq>
 <rh6uz6bqetobowyrist7hhytdu32v2azvuambenyzofur3tjyj@wghfgwtmjj53>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_112148_544355_40D13972 
X-CRM114-Status: GOOD (  20.58  )
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

I will prepare v2 this week.

> On Jun 29, 2026, at 4:21=E2=80=AFAM, Ernest Van Hoecke =
<ernestvanhoecke@gmail.com> wrote:
>=20
> On Mon, Jun 15, 2026 at 03:36:50PM +0200, Ernest Van Hoecke wrote:
>> On Wed, May 27, 2026 at 05:01:51PM -0400, Andrew LaMarche wrote:
>>> Ack on the deprecation of qcom,ath12k-calibration-variant in favor =
of the
>>> generic qcom,calibration-variant.=20
>>>=20
>>> However, drivers/net/wireless/ath/ath12k/core.c still misses the =
logic to=20
>>> actually load in the BDF, which this patch also accomplishes. I =
don=E2=80=99t see that
>>> in the Qualcomm-authored series you linked. Perhaps a v2 to address =
this?
>>>=20
>>> Andrew
>>>=20
>>>> On May 27, 2026, at 3:52=E2=80=AFPM, Jeff Johnson =
<jeff.johnson@oss.qualcomm.com> wrote:
>>>>=20
>>>> On 5/27/2026 9:12 AM, Andrew LaMarche wrote:
>>>>> Hi,
>>>>>=20
>>>>> A kind ping here. I=E2=80=99m not sure why this functionality is =
missing in the first place, but it is needed for loading caldata from =
the device tree.
>>>>=20
>>>> Your patch duplicates functionality in the Qualcomm authored =
series:
>>>> =
https://msgid.link/20250228184214.337119-1-quic_rajkbhag@quicinc.com
>>>>=20
>>>> And note the upstream device bindings for ath10k and ath11k only =
support the
>>>> generic binding qcom,calibration-variant.
>>>>=20
>>>> There are no longer any generation-specific bindings, see:
>>>> =
https://msgid.link/20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89=
c53@linaro.org
>>>>=20
>>>> /jeff
>>>=20
>>=20
>> Hi Jeff,
>> Hi Andrew,
>>=20
>> We also need this functionality, and as Andrew noted, the patch =
series
>> from Qualcomm does not actually address this.
>>=20
>> I believe some confusion arose because the patch series mentions the
>> "qcom,calibration-variant" DT property, but it does nothing to =
implement
>> this in the driver. In that series it only exists within a schema =
file:
>> Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
>>=20
>> Our need for this property was previously discussed here, and for now =
I
>> don't see a way forward without it:
>> =
https://lore.kernel.org/all/77vowy4ax4cl6dlc45i2q3fjmwn3q676wqghq267tmbix7=
773b@27h5t66mflur/
>>=20
>> Thanks a lot for your work here.
>>=20
>> Best regards,
>> Ernest
>>=20
>=20
> Hi Andrew,
>=20
> Are you planning to send a v2 of this?
>=20
> If not, I'm considering sending a version of this with the
> qcom,calibration-variant binding to move this forward.
>=20
> Thanks for your work here!
>=20
> Kind regards,
> Ernest
>=20


