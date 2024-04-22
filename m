Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B521C4345F
	for <ath12k@archiver.kernel.org>; Mon, 22 Apr 2024 07:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnYQ3RPMH+5kzmpx+wPw6hKyry8my9zlf8oaKHJWBfQ=; b=q9CLnUTZPYbiVTeY2EYfCrH4nS
	7XqzfqVnfH7/H2khJdhHD9Hm07uqUvHUO8vsHCeQSsT1ZaB26Djp0YZrEUHOk5NaftV3GaG5PFJaF
	4Ei0XtPN+h7dFRTvFm04W+kT2haSUNSdn8TX5YRdiAN6P+jujDcBZ8hmE/iMBhgwYCgcP4GoqkHpB
	uKJX2lPKQF72C97qvOo2SQJD3cHTvWcF+duoVv7o+iw+hAyWzxYI2COQTiPDVcM8V1qRy0xTEIcAe
	esOaPk30VFkeu1lwpgNn/3Z+ikwxCXBfhM2NvVX9eI2YYaSXjdLsCgrYApjrCNRIuQ9YMz4pDrJXg
	oGW8YWAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rynwP-0000000COuV-0wi0
	for ath12k@archiver.kernel.org;
	Mon, 22 Apr 2024 07:18:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rynue-0000000CNu1-19vn
	for ath12k@lists.infradead.org;
	Mon, 22 Apr 2024 07:16:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4DFE1CE0A0F;
	Mon, 22 Apr 2024 07:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76923C113CC;
	Mon, 22 Apr 2024 07:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713770185;
	bh=J7dZFmAv+93dDhYolGELXJSEN4VNpt23HfVHjyK8Bpw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KMT2N4++JFVKNhBitPPrb8AqxqRXWUTzWYA5vL4rZjV3MDh44/9207CQBiQ6PGtbx
	 PzbU43dywqTwTDoIFZw22MoXM1jDb0P4nav1SxiM1DbJeIyJAu7cTM5Tvt0fCiKFYZ
	 d/NB/9AXnUgFuj17RQ2Sh2+OuIy1Xzw+aOGvVwx8X7Sl1BxkoNnT/Ua4aSsvl6jvm7
	 yV/iVZCpzYeKvVyQW7bEAi5iUiNd0VrQulRRdbYuy5JM1e+iJ4w+D2l15sXHubXzY9
	 7fBATMWlZ4ENOsJ95/R0N5bg2pUgmXatrTs6XCC6bF/ovg0ZUgWB8QM3NJqEhP/GYQ
	 dvz+cY7tGOnfA==
From: Kalle Valo <kvalo@kernel.org>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  Jeff Johnson <quic_jjohnson@quicinc.com>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v8 0/4] wifi: ath12k: ACPI support
References: <91cbda07-0b93-4e0b-adaa-cd9b078a91b8@quicinc.com>
	<be016fbf-0198-4fe1-84f8-cfb0bf00dc4b@quicinc.com>
Date: Mon, 22 Apr 2024 10:16:22 +0300
In-Reply-To: <be016fbf-0198-4fe1-84f8-cfb0bf00dc4b@quicinc.com> (Lingbo Kong's
	message of "Fri, 19 Apr 2024 17:39:32 +0800")
Message-ID: <877cgpx3y1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_001628_933676_4D971B17 
X-CRM114-Status: GOOD (  14.75  )
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

Lingbo Kong <quic_lingbok@quicinc.com> writes:

> On 2024/4/19 14:30, Lingbo Kong wrote:
>>  > -------- Forwarded Message --------
>>  > Subject: Re: [PATCH v8 0/4] wifi: ath12k: ACPI support
>>  > Date: Fri, 19 Apr 2024 07:16:07 +0300
>>  > From: Kalle Valo <kvalo@kernel.org>
>>  > To: Jeff Johnson <quic_jjohnson@quicinc.com>
>>  > CC: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
>>  >
>>  > Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>>  >
>>  > > On 4/18/2024 9:20 AM, Kalle Valo wrote:
>>  > >
>>  > >> From: Kalle Valo <quic_kvalo@quicinc.com>
>>  > >>
>>  > >> Through reading ACPI tables, implement Time-Average-SAR(TAS), BIOS
>>  > >> SAR, configuration of CCA threshold and band edge channel power
>>  > functionalities.
>>  > >> This is enabled only on WCN7850.
>>  > >>
>>  > >> TODO:
>>  > >>
>>  > >> * test with ACPI support in hardware (I don't have such hardware),
>>  > especially
>>  > >>=C2=A0=C2=A0 suspend and hibernation
>>  >
>>  > [...]
>>  >
>>  > > I can verify this doesn't crash my system, but apparently my ACPI
>>  > > doesn't have the underlying settings, so cannot verify actual
>>  > > functionality
>>  >
>>  > Thanks for testing. I hope Lingbo has a device with proper ACPI
>> settings.
>>  >
>> yes, I'll apply these patch then test it.
>>=20
>
> Hi, kalle, i've applied this patchset, set ACPI correctly, then ACPI's
> functionality is right.

Nice, thanks for testing.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

