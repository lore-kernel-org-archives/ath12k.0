Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC23CD11C2
	for <ath12k@archiver.kernel.org>; Tue, 19 Mar 2024 15:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azqoIfYGzjCcCpiA6nJtJ14H/EVZZz1/6Gm34PyPAyA=; b=Is0Vv6kz8klCgfG2rNCG9m1xe7
	K5qo2Xhdt/nuOZlUYhysYQwZyfTBhtsQsS3CnIEEy73nEtYjbfY7jvrPGEfHSlcs4z1G2Wc1hKTqi
	hBoqorNA+EKd0C3XyhhP7CDjp/hty3zkUS8eK6D5UitlZdqXhXQ9jcPkdqJQBYANVWVRRhngx4Ikn
	eiurd9Gcpu3vnPneACru75u9rkCL/rdUahgUpVQJ45NKGd93hIc7OuSGnAAX32kox0seUr7RNfXfY
	DZxM5BR5EW203ilM3bAPFeGY+5YZ74TuF/tOhzsLe45dZeZTMI/o+C7cSQAF5xkFV6QjHPmdMkLo1
	EwIR0MIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmbCV-0000000D6wd-2G1Y
	for ath12k@archiver.kernel.org;
	Tue, 19 Mar 2024 15:16:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmbCS-0000000D6vN-37xA
	for ath12k@lists.infradead.org;
	Tue, 19 Mar 2024 15:16:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A15C7CE0C57;
	Tue, 19 Mar 2024 15:16:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1E0C433F1;
	Tue, 19 Mar 2024 15:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710861381;
	bh=azqoIfYGzjCcCpiA6nJtJ14H/EVZZz1/6Gm34PyPAyA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=IK/B6QmoNxUFjJVa9+/IzOb+E6W4x+Poo3X0/tyAcxzYGmT7jBHTq+Nf0mhZIX14Z
	 JtCs5pMRHxqeZJvA/VOxBj7+l6Y3pq/yGxtNaSMchnoujAFKoPdIB9CqgrMiVgAlzS
	 gwkLOB1p4zdRJEAs3934pgGjLWNkeQSlLMGMXql3o6HZIAdnqsAHzs1wTxEpG0DtP6
	 aTSOlU7n5JJWfah2kyuzOywc1exZwRDZ/JSU4jLKVn+e5GLKrrmRHbtJAy6PDaraeW
	 sMsd0ihsl8FDe12Nx/NUAz3AAObycVavNuUVVT34GyDuRFPfp2/fNqW0tQSYDw0ghm
	 0o+o5uO0gtGQA==
From: Kalle Valo <kvalo@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  "Vladimir Mesh."
 <owen.mesh@gmail.com>,  ath12k@lists.infradead.org,  Jeff Johnson
 <jjohnson@kernel.org>
Subject: Re: ath12k: driver does not allow the system to switch to
 suspend/sleep mode
References: <CAHohoUjBQ43aX8qvT6WAK5AK3PnOyU1g3eFLuCL1f-UMjnNnwQ@mail.gmail.com>
	<9dc50652-ac92-4962-b60c-1990c5cece86@quicinc.com>
	<20240319053018.GC52500@thinkpad>
Date: Tue, 19 Mar 2024 17:16:18 +0200
In-Reply-To: <20240319053018.GC52500@thinkpad> (Manivannan Sadhasivam's
	message of "Tue, 19 Mar 2024 11:00:18 +0530")
Message-ID: <87msqub6bh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_081625_390222_CA8C483F 
X-CRM114-Status: GOOD (  14.47  )
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

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> On Mon, Mar 18, 2024 at 08:51:04AM -0700, Jeff Johnson wrote:
>> On 3/18/2024 5:15 AM, Vladimir Mesh. wrote:
>> > Dear Sirs,=C2=A0
>> >=20
>> > I have a problem using ath12k driver with wcn7850=C2=A0adapters.
>> > ath12k driver does not allow the system to switch to suspend/sleep mod=
e.
>> > Please fix it!=C2=A0
>>=20
>> This is a known issue both for ath11k and ath12k
>> https://bugzilla.kernel.org/show_bug.cgi?id=3D214649
>>=20
>> There is already a proposed fix for ath11k that requires changes to other
>> components (MHI & QRTR) that is pending approval from those maintainers:
>> https://lore.kernel.org/ath11k/20240305021320.3367-1-quic_bqiang@quicinc=
.com/
>>=20
>
> Just to clarify. There is no 'pending approval' for MHI/QRTR. Both patche=
s are
> reviewed and pending to get merged.
>
> I will merge the MHI patch once merge window closes. If Kalle wants, we c=
an do
> an immutable branch between mhi and ath11k trees. Otherwise, ath11k patch=
es can
> get merged for 6.11.

A lot of people are waiting for hibernation feature so I really would
prefer to have an immutable branch which could be merged to our ath.git
tree.

> QRTR patch should go through netdev.

I would be faster to apply that patch to ath.git, but I'll discuss with
Jakub about that.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

